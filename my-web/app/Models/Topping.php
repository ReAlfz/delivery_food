<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Topping extends Model
{
    public function getMenuForTopping()
    {
        return $this->belongsToMany(Menu::class, 'pivot_menus_toppings');
    }
}
