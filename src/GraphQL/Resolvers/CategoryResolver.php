<?php

namespace App\GraphQL\Resolvers;

use App\Models\Category;

class CategoryResolver
{
    public static function resolveCategories()
    {
        return Category::all();
    }

    public static function getProducts($root)
    {
        return $root->products;
    }
}
