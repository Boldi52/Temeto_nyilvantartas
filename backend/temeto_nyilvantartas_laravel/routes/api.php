<?php

use App\Http\Controllers\ParcelaController;
use App\Http\Controllers\SorController;
use App\Http\Controllers\SirhelyController;
use App\Http\Controllers\ElhunytController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::get('/parcellak', [ParcelaController::class, 'index']);
Route::get('/parcellak/{parcella}/sorok', [SorController::class, 'byParcella']);
Route::get('/sorok/{sor}/sirhelyek', [SirhelyController::class, 'bySor']);
Route::get('/sirhelyek/{sirhely}/elhunytak', [ElhunytController::class, 'bySirhely']);
Route::get('/elhunytak/nev/{name}', [ElhunytController::class, 'show']);

Route::post('/login', function (Request $request) {
    $creds = $request->validate([
        'email' => 'required|email',
        'password' => 'required',
    ]);

    if (!Auth::attempt($creds)) {
        return response()->json(['message' => 'Helytelen adatok!'], 401);
    }

    $user = \App\Models\User::where('email', $request->email)->first();
    $token = $user->createToken('auth')->plainTextToken; // Sanctum token
    return response()->json(['token' => $token, 'user' => $user]);
});