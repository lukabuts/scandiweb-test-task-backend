<?php

namespace App\GraphQL\Types;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;
use App\GraphQL\Resolvers\CategoryResolver;
use App\GraphQL\Types;

;
class CategoryType extends ObjectType
{
    public function __construct()
    {
        parent::__construct([
            'name' => 'Category',
            'fields' => function () {
                return [
                    'id' => Type::int(),
                    'name' => Type::string(),
                    'products' => [
                        'type' => Type::listOf(Types::product()),
                        'resolve' => fn ($root) => (new CategoryResolver())->getProducts($root),
                    ],
                ];
            },
        ]);
    }
}
