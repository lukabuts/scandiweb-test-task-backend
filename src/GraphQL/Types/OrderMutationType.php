<?php

namespace App\GraphQL\Types;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;

class OrderMutationType extends ObjectType
{
    public function __construct()
    {
        parent::__construct([
            'name' => 'OrderMutation',
            'fields' => [
                'success' => Type::boolean(),
                'message' => Type::string(),
            ],
        ]);
    }
}
