<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Product extends Model
{
    protected $table = 'products';
    protected $fillable = [];

    protected $casts = [
        'inStock' => 'boolean',
        'gallery' => 'array',
    ];
    
    public $incrementing = false;
    protected $keyType = 'string';

    public function attributes(): BelongsToMany
    {
        return $this->belongsToMany(Attribute::class);
    }

    public function prices(): HasMany
    {
        return $this->hasMany(Price::class);
    }

    public function category(): BelongsTo
    {
        return $this->belongsTo(Category::class);
    }

    public function brand(): BelongsTo
    {
        return $this->belongsTo(Brand::class);
    }

    public function orders(): HasMany
    {
        return $this->hasMany(Order::class);
    }
}
