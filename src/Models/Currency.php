<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Currency extends Model
{
    protected $table = 'currencies';
    protected $fillable = [];
    public $timestamps = false;

    public function prices(): HasMany
    {
        return $this->hasMany(Price::class);
    }

    public function orders(): HasMany
    {
        return $this->hasMany(Order::class);
    }
}
