<?php

use App\Http\Controllers\Api\V1\AuthController;
use App\Http\Controllers\Api\V1\MenuController;
use App\Http\Controllers\Api\V1\OrderController;
use Illuminate\Support\Facades\Route;

Route::prefix('v1')->group(function () {
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/login', [AuthController::class, 'login']);
    Route::get('/voucher', [OrderController::class, 'voucher']);

    Route::middleware('auth:sanctum')->group(function () {
        Route::post('/logout', [AuthController::class, 'logout']);
        Route::prefix('menu')->group(function () {
            Route::get('/search', [MenuController::class, 'searchMenuByKeyword']);
            Route::get('/detail/{id}', [MenuController::class, 'menuById']);
            Route::get('/{page}/{category?}', [MenuController::class, 'menuPage']);
        });
        Route::prefix('order')->group(function () {
            Route::post('/add', [OrderController::class, 'createOrder']);
            Route::get('/{id}', [OrderController::class, 'order']);
            Route::get('/detail/{id}', [OrderController::class, 'detailOrder']);
        });
    });
});
