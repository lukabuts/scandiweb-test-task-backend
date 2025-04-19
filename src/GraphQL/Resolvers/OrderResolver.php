<?php

namespace App\GraphQL\Resolvers;

use App\Helpers\MessageResponse;
use App\Models\Order;
use App\Models\Product;
use App\Services\OrderValidationService;
use Exception;

class OrderResolver
{
    public function __construct(
        private OrderValidationService $validationService = new OrderValidationService()
    ) {
    }

    public function placeOrder($root, $args)
    {
        try {
            $seenProducts = [];

            foreach ($args['products'] as $product) {
                // Extract product arguments
                $product_id = $product['product_id'];
                $attributes = $product['attributes'];
                $quantity = $product['quantity'];

                // Check for duplicate products
                $attributesKey = collect($attributes)->sortBy('attribute_id')->pluck('item_id')->join('-');
                $uniqueKey = "$product_id-$attributesKey";

                if (isset($seenProducts[$uniqueKey])) {
                    return MessageResponse::create(
                        false,
                        "Duplicate product found: $product_id" . ($attributes ? " with attributes $attributesKey" : "")
                    );
                }

                $seenProducts[$uniqueKey] = true;

                // Validate product attributes
                $validationResult = $this->validationService->validateProductAttributeItem(
                    $product_id,
                    $attributes,
                    $quantity,
                );

                if (!$validationResult['success']) {
                    return $validationResult;
                }

                $product_price = Product::find($product_id)->prices->first();

                $total_price = round($product_price->amount * $quantity, 2);

                // Create a new order instance
                $order = new Order([
                    'product_id' => $product_id,
                    'quantity' => $quantity,
                    'total_price' => $total_price,
                    'currency_id' => $product_price->currency_id,
                ]);

                // Save order
                if (!$order->save()) {
                    return [
                        'success' => false,
                        'message' => 'Failed to place the order. Please try again later.',
                    ];
                }

                // Attach product attributes
                foreach ($attributes as $attribute) {
                    $order->attributes()->attach($attribute['attribute_id'], [
                        'item_id' => $attribute['item_id'],
                    ]);
                }
            }


            return MessageResponse::create(
                true,
                "Order placed successfully."
            );
        } catch (Exception $e) {
            return MessageResponse::create(
                false,
                "An error occurred while placing the order: " . $e->getMessage()
            );
        }
    }
}
