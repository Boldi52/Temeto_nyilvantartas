<?php

namespace App\Http\Controllers;

use App\Models\Elhunyt;
use Illuminate\Http\Request;

class ElhunytController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $name)
    {

        $elhunytByName = Elhunyt::where('nev', 'LIKE', '%' . $name . '%')->get();

        if ($elhunytByName->isEmpty()) {
            return response()->json(['message' => 'Nincs találat a megadott névre.'], 404);
        }

        return response()->json($elhunytByName);
    }

    public function bySirhely(SirhelyController $sirhely)
    {
        // ha több elhunyt is lehet egy sírhelyen, get(); ha csak egy, first()
        $elhunytak = $sirhely->elhunytak()->select('id', 'nev', 'szul_datum', 'halal_datuma', 'anyja_neve')->get();

        if ($elhunytak->isEmpty()) {
            return response()->json(['message' => 'Nincs elhunyt ezen a sírhelyen.'], 404);
        }

        return response()->json($elhunytak);
    }


    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Elhunyt $elhunyt)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Elhunyt $elhunyt)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Elhunyt $elhunyt)
    {
        //
    }
}
