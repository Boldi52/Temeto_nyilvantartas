<?php

namespace App\Http\Controllers;

use App\Models\Parcela;
use App\Models\Sor;
use App\Models\Parcella;
use Illuminate\Http\Request;

class SorController extends Controller
{
    public function index()
    {
        //
    }

    public function byParcella(Parcela $parcella)
    {
        return $parcella->sorok()
            ->select('id', 'nev')
            ->orderBy('nev')
            ->get();
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        //
    }

    public function show(Sor $sor)
    {
        //
    }

    public function edit(Sor $sor)
    {
        //
    }

    public function update(Request $request, Sor $sor)
    {
        //
    }

    public function destroy(Sor $sor)
    {
        //
    }
}