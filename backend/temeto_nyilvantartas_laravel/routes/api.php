<?php

use App\Http\Controllers\ParcelaController;
use App\Http\Controllers\SorController;
use App\Http\Controllers\SirhelyController;
use App\Http\Controllers\ElhunytController;
use Symfony\Component\HttpFoundation\Request;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
Route::get('/parcellak', [ParcelaController::class, 'index']);
Route::get('/parcellak/{parcella}/sorok', [SorController::class, 'byParcella']);
Route::get('/sorok/{sor}/sirhelyek', [SirhelyController::class, 'bySor']);
Route::get('/sirhelyek/{sirhely}/elhunytak', [ElhunytController::class, 'bySirhely']);
Route::get('/elhunytak/nev/{name}', [ElhunytController::class, 'show']);

