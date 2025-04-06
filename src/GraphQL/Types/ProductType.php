<?php

namespace App\GraphQL\Types;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;
use App\GraphQL\Resolvers\ProductResolver;
use App\GraphQL\Types;

class ProductType extends ObjectType
{
    public function __construct()
    {
        parent::__construct([
            'name' => 'Product',
            'fields' => [
                'id' =>  Type::string(),
                'name' =>  Type::string(),
                'in_stock' => Type::boolean(),
                'gallery' => Type::listOf(Type::string()),
                'description' => Type::string(),
                'brand' => [
                    'type' => Types::brand(),
                    'resolve' => fn ($root) => (new ProductResolver())->getBrand($root),
                ],
                'category' => [
                    'type' => Types::category(),
                    'resolve' => fn ($root) => (new ProductResolver())->getCategory($root),
                ],
                'attributes' => [
                    'type' => Type::listOf(Types::attribute()),
                    'resolve' => fn ($root) => (new ProductResolver())->getAttributes($root),
                ],
                'prices' => [
                    'type' => Type::listOf(Types::price()),
                    'resolve' => fn ($root) => (new ProductResolver())->getPrices($root),
                ],
            ],
        ]);
    }
}
