<?php

namespace App\GraphQL\Types;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;

class ItemsType extends ObjectType
{
    public function __construct()
    {
        parent::__construct([
            'name' => 'Item',
            'fields' => [
                'id' => Type::string(),
                'value' => Type::string(),
                'display_value' => Type::string(),
            ],
        ]);
    }
}
