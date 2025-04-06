<?php

namespace App\GraphQL\Resolvers;

use App\Models\Product;

class ProductResolver
{

    public static function resolveProducts($root, $args)
    {
        if (isset($args['category_name']) && $args['category_name'] !== 'all') {
            return Product::whereHas('category', function ($query) use ($args) {
                $query->where('name', $args['category_name']);
            })->get();
        }
        return Product::all();
    }

    public static function resolveProduct($root, $args)
    {
        return Product::find($args['id']);
    }

    public static function getBrand($root)
    {
        return $root->brand;
    }

    public static function getCategory($root)
    {
        return $root->category;
    }

    public static function getAttributes($root)
    {
        return $root->attributes;
    }

    public static function getPrices($root)
    {
        return $root->prices;
    }
}
