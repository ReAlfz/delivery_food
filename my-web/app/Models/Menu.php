<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Menu extends Model
{
    public function getToppingForMenu()
    {
        return $this->belongsToMany(Topping::class, 'pivot_menus_toppings');
    }
}
