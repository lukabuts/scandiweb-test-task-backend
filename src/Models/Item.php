<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Item extends Model
{
    protected $table = 'items';
    protected $fillable = [];
    public $incrementing = false;
    protected $keyType = 'string';

    public function attribute(): BelongsToMany
    {
        return $this->belongsToMany(Attribute::class, 'attribute_item', 'item_id', 'attribute_id');
    }
}
