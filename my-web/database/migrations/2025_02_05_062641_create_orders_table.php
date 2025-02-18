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
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users', 'id')->index();
            $table->string('no_receipt');
            $table->integer('total_price');
            $table->date('date');
            $table->tinyInteger('status');
            $table->timestamps();
        });

        Schema::create('pivot_order_menu', function (Blueprint $table) {
            $table->id();
            $table->foreignId('order_id')->constrained('orders', 'id')->onDelete('cascade');
            $table->foreignId('menu_id')->constrained('menus', 'id')->onDelete('cascade');
            $table->integer('quantity');
            $table->json('topping');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pivot_order_menu');
        Schema::dropIfExists('orders');
    }
};
