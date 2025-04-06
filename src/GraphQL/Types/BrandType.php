<?php

namespace App\GraphQL\Types;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;

class BrandType extends ObjectType
{
    public function __construct()
    {
        parent::__construct([
            'name' => 'Brand',
            'fields' => [
                'id' => Type::int(),
                'name' => Type::string(),
            ],
        ]);
    }
}
