<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('menus', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('category');
            $table->integer('price');
            $table->string('description');
            $table->string('image')->nullable();
        });

        Schema::create('toppings', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->integer('price');
        });

        Schema::create('pivot_menus_toppings', function (Blueprint $table) {
            $table->id();
            $table->foreignId('menu_id')->constrained('menus', 'id')->onDelete('cascade');
            $table->foreignId('topping_id')->constrained('toppings', 'id')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('menus');
        Schema::dropIfExists('toppings');
        Schema::dropIfExists('pivot_menus_toppings');
    }
};
