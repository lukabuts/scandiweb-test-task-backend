<?php

namespace App\GraphQL\Types;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;
use App\GraphQL\Resolvers\PriceResolver;
use App\GraphQL\Types;

class PriceType extends ObjectType
{
    public function __construct()
    {
        parent::__construct([
            'name' => 'Price',
            'fields' => [
                'id' => Type::int(),
                'amount' => Type::float(),
                'currency' => [
                    'type' => Types::currency(),
                    'resolve' => fn ($root) => (new PriceResolver())->getCurrency($root),
                ],
            ],
        ]);
    }
}
