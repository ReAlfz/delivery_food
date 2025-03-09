<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PivotOrderMenu extends Model
{
    protected $table = 'pivot_order_menu';
    protected $cast = ['topping' => 'array'];
    protected $fillable = [
        'order_id',
        'menu_id',
        'quantity',
        'note',
        'topping',
    ];

    public function getDataMenuForOrder()
    {
        return $this->belongsTo(Menu::class, 'menu_id');
    }
}
