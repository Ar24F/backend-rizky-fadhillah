<?php

use App\Http\Controllers\MerchantController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\TransaksiController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\Auth\RegisteredUserController;
use Illuminate\Support\Facades\Route;
use App\Http\Middleware\CheckRole;

Route::middleware('guest')->group(function () {
    Route::post('/register', [RegisteredUserController::class, 'store']);
    Route::post('/login', [AuthenticatedSessionController::class, 'store']);
});

Route::middleware('auth:sanctum')->group(function () {
    
    Route::middleware(CheckRole::class.':Customer')->group(function () {
        Route::prefix('customer')->group(function () {
            Route::get('/profile', [CustomerController::class, 'profile']);
            Route::put('/profile', [CustomerController::class, 'update']);
        });

        Route::get('/product/all', [ProductController::class, 'allproduct']);

        Route::get('/transaksi/pemesanan', [TransaksiController::class, 'pemesanan']);
    });
    
    Route::middleware(CheckRole::class.':Merchant')->group(function () {
        Route::prefix('merchant')->group(function () {
            Route::get('/profile', [MerchantController::class, 'profile']);
            Route::put('/profile', [MerchantController::class, 'update']);
        });

        Route::prefix('product')->group(function () {
            Route::get('/', [ProductController::class, 'index']);
            Route::post('/', [ProductController::class, 'store']);
            Route::put('/{product}', [ProductController::class, 'update']);
            Route::delete('/{product}', [ProductController::class, 'destroy']);
        });

        Route::prefix('transaksi')->group(function () {
            Route::get('/', [TransaksiController::class, 'index']);
            Route::put('/{transaksi}', [TransaksiController::class, 'update']);
            Route::delete('/{transaksi}', [TransaksiController::class, 'destroy']);
        });
    });
    
    Route::get('/product/{product}', [ProductController::class, 'show']);
    Route::post('/transaksi', [TransaksiController::class, 'store']);
    Route::get('/transaksi/{transaksi}', [TransaksiController::class, 'show']);
    Route::post('/logout', [AuthenticatedSessionController::class, 'destroy']);
});
