<?php

namespace App\GraphQL\Types;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;
use App\GraphQL\Resolvers\AttributeResolver;
use App\GraphQL\Types;

class AttributeType extends ObjectType
{
    public function __construct()
    {
        parent::__construct([
            'name' => 'Attribute',
            'fields' => [
                'id' => Type::int(),
                'name' => Type::string(),
                'type' => [
                    'type' => Types::attributeCategory(),
                    'resolve' => fn ($root) => (new AttributeResolver())->getType($root),
                ],
                'items' => [
                    'type' => Type::listOf(Types::item()),
                    'resolve' => fn ($root) => (new AttributeResolver())->getItems($root),
                ],
            ],
        ]);
    }
}
