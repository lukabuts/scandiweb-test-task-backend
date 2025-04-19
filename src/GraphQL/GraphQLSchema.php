<?php

namespace App\GraphQL;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;
use GraphQL\Type\Schema;
use App\GraphQL\Resolvers\CategoryResolver;
use App\GraphQL\Resolvers\OrderResolver;
use App\GraphQL\Resolvers\ProductResolver;
use GraphQL\Type\Definition\InputObjectType;

class GraphQLSchema
{
    public static function create(): Schema
    {
        $queryType = new ObjectType([
            'name' => 'Query',
            'fields' => [
                'categories' => [
                    'type' => Type::listOf(Types::category()),
                    'resolve' => fn ($root, $args) => (new CategoryResolver())->resolveCategories($root, $args),
                ],

                'products' => [
                    'type' => Type::listOf(Types::product()),
                    'args' => [
                        'category_name' => Type::string()
                    ],
                    'resolve' => fn ($root, $args) => (new ProductResolver())->resolveProducts($root, $args),
                ],

                'product' => [
                    'type' => Types::product(),
                    'args' => [
                        'id' => Type::nonNull(Type::string())
                    ],
                    'resolve' => fn ($root, $args) => (new ProductResolver())->resolveProduct($root, $args),
                ],
            ],
        ]);

        $mutationType = new ObjectType([
            'name' => 'Mutation',
            'fields' => [
                'placeOrder' => [
                    'type' => Types::orderMutation(),
                    'args' => [
                        'products' => Type::listOf(Type::nonNull(new InputObjectType([
                            'name' => 'OrderProductInput',
                            'fields' => [
                                'product_id' => Type::nonNull(Type::string()),
                                'attributes' => Type::listOf(Type::nonNull(new InputObjectType([
                                    'name' => 'AttributeItemInput',
                                    'fields' => [
                                        'attribute_id' => Type::nonNull(Type::id()),
                                        'item_id' => Type::nonNull(Type::string()),
                                    ],
                                ]))),
                                'quantity' => Type::nonNull(Type::int()),
                            ]
                        ]))),
                    ],
                    'resolve' => fn ($root, $args) => (new OrderResolver())->placeOrder($root, $args),
                ],
            ],
        ]);



        return new Schema([
            'query' => $queryType,
            'mutation' => $mutationType,
        ]);
    }
}
