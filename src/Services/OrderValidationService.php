<?php

namespace App\Services;

use App\Helpers\MessageResponse;
use App\Models\Product;
use App\Models\Attribute;

class OrderValidationService
{
    // Standardized error response format for validation failures
    private function validationError(string $product_id, string $message): array
    {
        return MessageResponse::create(false, "Product '$product_id' validation failed: $message");
    }

    public function validateProductAttributeItem(string $product_id, array $attributes, int $quantity): array
    {
        $product = Product::find($product_id);

        // Check if product exists
        if (!$product) {
            return $this->validationError($product_id, "Not found.");
        }

        // Check if product is in stock
        if (!$product->in_stock) {
            return $this->validationError($product_id, "Product is out of stock.");
        }

        $attribute_ids = array_column($attributes, 'attribute_id');
        $item_ids = array_column($attributes, 'item_id');

        // Ensure quantity is valid
        if ($quantity <= 0) {
            return $this->validationError($product_id, "Quantity must be at least 1.");
        }

        $productAttributes = $product->attributes->pluck('id')->toArray();

        // Ensure the correct number of attributes are provided
        if (count(array_unique($attribute_ids)) !== count($productAttributes)) {
            return $this->validationError($product_id, "Invalid number of attributes.");
        }

        $attributesMap = Attribute::whereIn('id', $attribute_ids)->get()->keyBy('id');

        foreach ($attributesMap as $attribute) {
            if (!$attribute) {
                return $this->validationError($product_id, "Attribute not found.");
            }

            // Ensure the attribute belongs to the selected product
            if (!in_array($attribute->id, $productAttributes)) {
                return $this->validationError($product_id, "Invalid attribute selection.");
            }

            // Ensure the selected items exist for the given attribute
            if (!$attribute->items()->whereIn('id', $item_ids)->exists()) {
                return $this->validationError($product_id, "Invalid item selection.");
            }
        }

        return MessageResponse::create(true, "Product '$product_id' passed validation.");
    }
}
