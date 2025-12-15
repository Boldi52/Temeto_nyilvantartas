<?php

namespace App\Http\Controllers;

use App\Models\Sirhely;
use App\Models\Sor;
use Illuminate\Http\Request;

class SirhelyController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }
    public function bySor(SorController $sor)
    {
        return $sor->sirhelyek()->select('id', 'sirkod', 'allapot')->orderBy('sirkod')->get();
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
    public function show(Sirhely $sirhely)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Sirhely $sirhely)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Sirhely $sirhely)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Sirhely $sirhely)
    {
        //
    }
}
