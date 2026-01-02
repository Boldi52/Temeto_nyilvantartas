<?php

use App\Http\Controllers\BefizetesController;
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

Route::get('/parcellak', action: [ParcelaController::class, 'index']); // ez a 3 route köti össze a táblákat az összefüggő kereséshez
Route::get('/sorok', [SorController::class, 'index']); // a frontend-en 3 darab legördülő menüs select lesz, először a parcellát majd a sort végül a sirt kell kivállasztani
Route::get('/sirhelyek', [SirhelyController::class, 'index']); //ez lesz az egyik szűrési lehetőség.

Route::get('/elhunytak/nev/{name}', [ElhunytController::class, 'show']); // ezzel a route-al náv alapján lehet szűrni az elhunnytra.
Route::get('/befizetesek', [BefizetesController::class, 'index']); // ez a route kiirja az összes befizetést.

Route::get('/elhunytMindenAdata', [ElhunytController::class, 'index']); // ez a route minden elhunyt minden adatát kiírja.

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
});// ez a route a bejelentkezést csinálja.
