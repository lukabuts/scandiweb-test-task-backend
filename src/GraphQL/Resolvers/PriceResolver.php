<?php

namespace App\GraphQL\Resolvers;

use App\Models\Price;

class PriceResolver
{
    public static function getCurrency($root)
    {
        return $root->currency;
    }
}
