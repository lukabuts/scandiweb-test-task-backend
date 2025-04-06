<?php

namespace App\GraphQL\Types;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;

class AttributeCategoryType extends ObjectType
{
    public function __construct()
    {
        parent::__construct([
            'name' => 'AttributeCategory',
            'fields' => [
                'id' => Type::int(),
                'name' => Type::string(),
            ],
        ]);
    }
}
