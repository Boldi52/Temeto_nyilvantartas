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
Route::get('/sirhelyek/{id}', [SirhelyController::class, 'show']); // id val szűrési lehetőség, ez a route egy konkrét sirhely adatait adja vissza.
Route::post('/sirhelyek', [SirhelyController::class, 'store']); // új sírhely létrehozása
Route::put('/sirhelyek/{id}', [SirhelyController::class, 'update']); // ez a route egy konkrét sirhely adatait frissíti, a request-ben megadott adatokkal, id alapján szűrve.
Route::delete('/sirhelyek/{id}', [SirhelyController::class, 'destroy']); // ez a route egy sirhelyet töröl id alapján

Route::get('/parcellak',  [ParcelaController::class, 'index']); // ez a 3 route köti össze a táblákat az összefüggő kereséshez
Route::get('/parcellak/{id}', [ParcelaController::class, 'show']); // ez a route egy parcella adatait adja vissza, id alapján szűrve.
Route::post('/parcellak', [ParcelaController::class, 'store']); // ez a route egy új parcellát hoz létre a request-ben megadott adatokkal.
Route::put('/parcellak/{id}', [ParcelaController::class, 'update']); // ez a route egy konkrét parcellát frissíti a request-ben megadott adatokkal, id alapján szűrve.
Route::delete('/parcellak/{id}', [ParcelaController::class, 'destroy']); // ez a route egy parcellát töröl id alapján szűrve.

Route::get('/sorok', [SorController::class, 'index']); // a frontend-en 3 darab legördülő menüs select lesz, először a parcellát majd a sort végül a sirt 
Route::get('/sorok/{sor}', [SorController::class, 'show']); // sor szűrése id alapján
Route::post('/sorok', [SorController::class, 'store']); //új sor létrehozása
Route::put('/sorok/{id}', [SorController::class, 'update']); // sor frissítése id alapján
Route::delete('/sorok/{id}', [SorController::class, 'destroy']); // sor törlése id alapján

Route::get('/sirberlok', [\App\Http\Controllers\SirberloController::class, 'index']); // ez a route kiirja az összes sírberlőt.
Route::get('/sirberlok/{id}', [\App\Http\Controllers\SirberloController::class, 'show']); // sírbérlő id aalpján
Route::post('/sirberlok', [\App\Http\Controllers\SirberloController::class, 'store']); // új sírbérlő létrehozása a request-ben megadott adatokkal
Route::put('/sirberlok/{id}', [\App\Http\Controllers\SirberloController::class, 'update']); // sírbérlő frissítése id alapján
Route::delete('/sirberlok/{id}', [\App\Http\Controllers\SirberloController::class, 'destroy']); // sírbérlő törlése id alapján

Route::get('/dokumentumok', [\App\Http\Controllers\DokumentumController::class, 'index']); // ez a route kiirja az összes dokumentumot.
Route::post('/dokumentumok', [\App\Http\Controllers\DokumentumController::class, 'store']); // ez a route egy új dokumentumot hoz létre a request-ben megadott adatokkal.
Route::delete('/dokumentumok/{id}', [\App\Http\Controllers\DokumentumController::class, 'destroy']); // ez a route egy dokumentumot töröl id alapján szűrve.

Route::get('/befizetesek', [BefizetesController::class, 'index']); // ez a route kiirja az összes befizetést.
Route::get('/befizetesek/{id}', [BefizetesController::class, 'show']); // befizetés id alapján
Route::post('/befizetesek', [BefizetesController::class, 'store']); // új befizetés létrehozása
Route::put('/befizetesek/{id}', [BefizetesController::class, 'update']); // befizetés frissítése id alapján
Route::delete('/befizetesek/{id}', [BefizetesController::class, 'destroy']); // befizetés törlése id alapján

Route::get('/dokumentumtipusok', [\App\Http\Controllers\DokumentumTipusController::class, 'index']); // ez a route kiirja az összes dokumentum típust.
Route::post('/dokumentumtipusok', [\App\Http\Controllers\DokumentumTipusController::class, 'store']); // új doksi
Route::put('/dokumentumtipusok/{id}', [\App\Http\Controllers\DokumentumTipusController::class, 'update']); // doksi frissítése id alapján
Route::delete('/dokumentumtipusok/{id}', [\App\Http\Controllers\DokumentumTipusController::class, 'destroy']); // doksi törlése id alapján

Route::get('/kozteuletTipusok', [\App\Http\Controllers\KozteruletTipusController::class, 'index']); // ez a route kiirja az összes közterület típust.
Route::get('/kozteuletTipusok/{id}', [\App\Http\Controllers\KozteruletTipusController::class, 'show']); //kozt tipus id alapján
Route::post('/kozteuletTipusok', [\App\Http\Controllers\KozteruletTipusController::class, 'store']); // új kozt tipus létrehozása a request-ben megadott adatokkal
Route::put('/kozteuletTipusok/{id}', [\App\Http\Controllers\KozteruletTipusController::class, 'update']); // kozt tipus frissítése id alapján
Route::delete('/kozteuletTipusok/{id}', [\App\Http\Controllers\KozteruletTipusController::class, 'destroy']); // kozt tipus törlése id alapján

Route::get('/sirhelytipusok', [\App\Http\Controllers\SirhelyTipusController::class, 'index']); // ez a route kiirja az összes sírhely típust.
Route::get('/sirhelytipusok/{id}', [\App\Http\Controllers\SirhelyTipusController::class, 'show']); // sirhely tipus id alapján
Route::post('/sirhelytipusok', [\App\Http\Controllers\SirhelyTipusController::class, 'store']);  // új sirhely tipus létrehozása a request-ben megadott adatokkal
Route::put('/sirhelytipusok/{id}', [\App\Http\Controllers\SirhelyTipusController::class, 'update']); // sirhely tipus frissítése id alapján
Route::delete('/sirhelytipusok/{id}', [\App\Http\Controllers\SirhelyTipusController::class, 'destroy']); // sirhely tipus törlése id alapján

Route::get('/telepulesek', [\App\Http\Controllers\TelepulesController::class, 'index']); // ez a route kiirja az összes települést.
Route::get('/telepulesek/{ir_szam}', [\App\Http\Controllers\TelepulesController::class, 'show']); // ez a route egy település adatait adja vissza, ir_szam alapján szűrve.
Route::post('/telepulesek', [\App\Http\Controllers\TelepulesController::class, 'store']); // új település létrehozása a request-ben megadott adatokkal
Route::put('/telepulesek/{ir_szam}', [\App\Http\Controllers\TelepulesController::class, 'update']); // település frissítése ir_szam alapján
Route::delete('/telepulesek/{ir_szam}', [\App\Http\Controllers\TelepulesController::class, 'destroy']); // település törlése ir_szam alapján











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
