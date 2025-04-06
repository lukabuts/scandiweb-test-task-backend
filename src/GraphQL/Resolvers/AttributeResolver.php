<?php

namespace App\GraphQL\Resolvers;

use App\Models\Attribute;

class AttributeResolver
{
    public static function getType($root)
    {
        return $root->type;
    }

    public static function getItems($root)
    {
        return $root->items;
    }
}
