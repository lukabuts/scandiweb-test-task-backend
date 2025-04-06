<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class AttributeCategory extends Model
{
    protected $table = 'attribute_types';
    protected $fillable = [];

    public function attributes(): HasMany
    {
        return $this->hasMany(Attribute::class);
    }
}
