<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Model;

class Attribute extends Model
{
    protected $table = 'attributes';
    protected $fillable = [];

    public $incrementing = false;
    protected $keyType = 'string';

    public function products(): BelongsToMany
    {
        return $this->belongsToMany(Product::class);
    }

    public function type(): BelongsTo
    {
        return $this->belongsTo(AttributeCategory::class);
    }

    public function items(): BelongsToMany
    {
        return $this->belongsToMany(Item::class, 'attribute_item', 'attribute_id', 'item_id');
    }

    public function orders(): BelongsToMany
    {
        return $this->belongsToMany(Order::class, 'attribute_order')
            ->withPivot('item_id');
    }
}
