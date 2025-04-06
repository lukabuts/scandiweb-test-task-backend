<?php

namespace App\GraphQL;

use App\GraphQL\Types\AttributeCategoryType;
use App\GraphQL\Types\AttributeType;
use App\GraphQL\Types\BrandType;
use App\GraphQL\Types\CategoryType;
use App\GraphQL\Types\CurrencyType;
use App\GraphQL\Types\ItemsType;
use App\GraphQL\Types\OrderAttributeItemType;
use App\GraphQL\Types\OrderMutationType;
use App\GraphQL\Types\PriceType;
use App\GraphQL\Types\ProductType;

class Types
{
    private static array $types = [];

    public static function category(): CategoryType
    {
        return self::$types['category'] ??= new CategoryType();
    }

    public static function product(): ProductType
    {
        return self::$types['product'] ??= new ProductType();
    }

    public static function brand(): BrandType
    {
        return self::$types['brand'] ??= new BrandType();
    }

    public static function item(): ItemsType
    {
        return self::$types['item'] ??= new ItemsType();
    }
    
    public static function attribute(): AttributeType
    {
        return self::$types['attribute'] ??= new AttributeType();
    }

    public static function price(): PriceType
    {
        return self::$types['price'] ??= new PriceType();
    }

    public static function currency(): CurrencyType
    {
        return self::$types['currency'] ??= new CurrencyType();
    }

    public static function attributeCategory(): AttributeCategoryType
    {
        return self::$types['attributeCategory'] ??= new AttributeCategoryType();
    }

    public static function orderMutation(): OrderMutationType
    {
        return self::$types['orderMutation'] ??= new OrderMutationType();
    }
}
