<?php

use App\Http\Controllers\BefizetesController;
use App\Http\Controllers\ParcelaController;
use App\Http\Controllers\SorController;
use App\Http\Controllers\SirhelyController;
use App\Http\Controllers\ElhunytController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;



Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::get('/elhunytak/nev/{name}', [ElhunytController::class, 'show']); // ezzel a route-al náv alapján lehet szűrni az elhunnytra.
Route::get('/elhunytMindenAdata', [ElhunytController::class, 'index']); // ez a route minden elhunyt minden adatát kiírja.
Route::post('/elhunytak', [ElhunytController::class, 'store']); //elhunyt hozzáadása
Route::get('/elhunytak/count', [ElhunytController::class, 'count']); // ez a route az elhunytak számát adja vissza.
Route::get('/elhunytak/recent', [ElhunytController::class, 'recent']);  // ez a route a legutóbbi 7 elhunytat adja vissza.
Route::get('/sirhelyek/count', [SirhelyController::class, 'count']); // ez a route a sirhelyek számát adja vissza.

Route::get('/sirhelyek', [SirhelyController::class, 'index']); //ez lesz az egyik szűrési lehetőség.
Route::post('/sirhelyek', [SirhelyController::class, 'store']);
Route::get('/sirhelyek/{sirhely}', [SirhelyController::class, 'show']);
Route::put('/sirhelyek/{sirhely}', [SirhelyController::class, 'update']);
Route::delete('/sirhelyek/{sirhely}', [SirhelyController::class, 'destroy']);

Route::get('/parcellak',  [ParcelaController::class, 'index']); // ez a 3 route köti össze a táblákat az összefüggő kereséshez
Route::post('/parcellak', [ParcelaController::class, 'store']);
Route::get('/parcellak/{parcela}', [ParcelaController::class, 'show']);
Route::put('/parcellak/{parcela}', [ParcelaController::class, 'update']);
Route::delete('/parcellak/{parcela}', [ParcelaController::class, 'destroy']);

Route::get('/sorok', [SorController::class, 'index']); // a frontend-en 3 darab legördülő menüs select lesz, először a parcellát majd a sort végül a sirt 
Route::post('/sorok', [SorController::class, 'store']);
Route::get('/sorok/{sor}', [SorController::class, 'show']);
Route::put('/sorok/{sor}', [SorController::class, 'update']);
Route::delete('/sorok/{sor}', [SorController::class, 'destroy']);

Route::get('/sirberlok', [\App\Http\Controllers\SirberloController::class, 'index']);
Route::get('/sirberlok/{sirberlo}', [\App\Http\Controllers\SirberloController::class, 'show']);
Route::get('/sirberlok/count', [\App\Http\Controllers\SirberloController::class, 'count']);
Route::post('/sirberlok', [\App\Http\Controllers\SirberloController::class, 'store']);
Route::put('/sirberlok/{sirberlo}', [\App\Http\Controllers\SirberloController::class, 'update']);
Route::delete('/sirberlok/{sirberlo}', [\App\Http\Controllers\SirberloController::class, 'destroy']);

Route::get('/dokumentumok', [\App\Http\Controllers\DokumentumController::class, 'index']);
Route::get('/dokumentumok/{dokumentum}', [\App\Http\Controllers\DokumentumController::class, 'show']);
Route::post('/dokumentumok', [\App\Http\Controllers\DokumentumController::class, 'store']);
Route::put('/dokumentumok/{dokumentum}', [\App\Http\Controllers\DokumentumController::class, 'update']);
Route::delete('/dokumentumok/{dokumentum}', [\App\Http\Controllers\DokumentumController::class, 'destroy']);

Route::get('/befizetesek', [BefizetesController::class, 'index']); // ez a route kiirja az összes befizetést.
Route::get('/befizetesek/{befizetes}', [BefizetesController::class, 'show']);
Route::post('/befizetesek', [BefizetesController::class, 'store']);
Route::put('/befizetesek/{befizetes}', [BefizetesController::class, 'update']);
Route::delete('/befizetesek/{befizetes}', [BefizetesController::class, 'destroy']);

Route::get('/dokumentumtipusok', [\App\Http\Controllers\DokumentumTipusController::class, 'index']);
Route::get('/dokumentumtipusok/{dokumentumtipus}', [\App\Http\Controllers\DokumentumTipusController::class, 'show']);
Route::post('/dokumentumtipusok', [\App\Http\Controllers\DokumentumTipusController::class, 'store']);
Route::put('/dokumentumtipusok/{dokumentumtipus}', [\App\Http\Controllers\DokumentumTipusController::class, 'update']); 
Route::delete('/dokumentumtipusok/{dokumentumtipus}', [\App\Http\Controllers\DokumentumTipusController::class, 'destroy']);

Route::get('/kozteuletTipusok', [\App\Http\Controllers\KozteruletTipusController::class, 'index']);
Route::get('/kozteuletTipusok/{kozteuletTipus}', [\App\Http\Controllers\KozteruletTipusController::class, 'show']);
Route::post('/kozteuletTipusok', [\App\Http\Controllers\KozteruletTipusController::class, 'store']);
Route::put('/kozteuletTipusok/{kozteuletTipus}', [\App\Http\Controllers\KozteruletTipusController::class, 'update']);
Route::delete('/kozteuletTipusok/{kozteuletTipus}', [\App\Http\Controllers\KozteruletTipusController::class, 'destroy']);

Route::get('/sirhelytipusok', [\App\Http\Controllers\SirhelyTipusController::class, 'index']);
Route::get('/sirhelytipusok/{sirhelytipus}', [\App\Http\Controllers\SirhelyTipusController::class, 'show']);
Route::post('/sirhelytipusok', [\App\Http\Controllers\SirhelyTipusController::class, 'store']);
Route::put('/sirhelytipusok/{sirhelytipus}', [\App\Http\Controllers\SirhelyTipusController::class, 'update']);
Route::delete('/sirhelytipusok/{sirhelytipus}', [\App\Http\Controllers\SirhelyTipusController::class, 'destroy']);

Route::get('/telepulesek', [\App\Http\Controllers\TelepulesController::class, 'index']);
Route::get('/telepulesek/{telepules}', [\App\Http\Controllers\TelepulesController::class, 'show']);
Route::post('/telepulesek', [\App\Http\Controllers\TelepulesController::class, 'store']);
Route::put('/telepulesek/{telepules}', [\App\Http\Controllers\TelepulesController::class, 'update']);
Route::delete('/telepulesek/{telepules}', [\App\Http\Controllers\TelepulesController::class, 'destroy']);












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
}); // ez a route a bejelentkezést csinálja.
Route::post('/logout', function (Request $request) {
    $request->user()->currentAccessToken()->delete();
    return response()->json(['message' => 'Sikeres kijelentkezés!']);
})->middleware('auth:sanctum'); // ez a route a kijelentkezést csinálja.
Route::post('/register', function (Request $request) {
    $validated = $request->validate([
        'name' => 'required|string|max:255',
        'email' => 'required|string|email|max:255|unique:users',
        'password' => 'required|string|min:8|confirmed',
    ]);

    $user = \App\Models\User::create([
        'name' => $validated['name'],
        'email' => $validated['email'],
        'password' => Hash::make($validated['password']),
    ]);
    $token = $user->createToken('auth')->plainTextToken; // Sanctum token
    return response()->json(['token' => $token, 'user' => $user], 201);
});// ez a route a regisztrációt csinálja.
