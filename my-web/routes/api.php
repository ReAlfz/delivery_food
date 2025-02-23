<?php

use App\Http\Controllers\Api\V1\AuthController;
use App\Http\Controllers\Api\V1\MenuController;
use App\Http\Controllers\Api\V1\OrderController;
use Illuminate\Support\Facades\Route;

Route::prefix('v1')->group(function () {
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/login', [AuthController::class, 'login']);

    Route::middleware('auth:sanctum')->group(function () {
        Route::post('/logout', [AuthController::class, 'logout']);
        Route::prefix('menu')->group(function () {
            Route::get('/all', [MenuController::class, 'menuAll']);
            Route::get('/page/{page}', [MenuController::class, 'menuPage']);
            Route::get('/detail/{id}', [MenuController::class, 'menuById']);
            Route::get('/category/{category}/{page}', [MenuController::class, 'menuCategory']);
        });
        Route::prefix('order')->group(function () {
            Route::post('/add', [OrderController::class, 'createOrder']);
            Route::get('/{id}', [OrderController::class, 'order']);
            Route::get('/detail/{id}', [OrderController::class, 'detailOrder']);
        });
    });
});
