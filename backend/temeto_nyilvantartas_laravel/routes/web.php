<?php

use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use Laravel\Fortify\Features;
use App\Http\Controllers\AdminController;
use Illuminate\Support\Facades\Storage;

Route::get('/', function () {
    return Inertia::render('welcome', [
        'canRegister' => Features::enabled(Features::registration()),
    ]);
})->name('home');

Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('dashboard', function () {
        return Inertia::render('dashboard');
    })->name('dashboard');
});

// Csak admin
Route::middleware(['auth', 'admin'])->group(function () {
    Route::get('/admin', [AdminController::class, 'dashboard'])->name('admin.dashboard');
    // Ide jöhetnek további admin CRUD útvonalak
});

require __DIR__ . '/settings.php';


Route::get('/dok-megnyit/{path}', function ($path) {
    $fullPath = storage_path('app/public/' . $path);
    abort_unless(file_exists($fullPath), 404);

    return response()->file($fullPath, [
        'Content-Type' => mime_content_type($fullPath) ?: 'application/octet-stream',
        'Content-Disposition' => 'inline; filename="' . basename($fullPath) . '"',
    ]);
})->where('path', '.*');

Route::get('/dok-letoltes/{path}', function ($path) {
    $fullPath = storage_path('app/public/' . $path);
    abort_unless(file_exists($fullPath), 404);

    return response()->download($fullPath, basename($fullPath));
})->where('path', '.*');