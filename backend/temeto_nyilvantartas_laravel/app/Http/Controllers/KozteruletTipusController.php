<?php

namespace App\Http\Controllers;

use App\Models\Kozterulet_tipus;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class KozteruletTipusController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $kozteruletTipusok = Kozterulet_tipus::all();
        return response()->json($kozteruletTipusok);
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
        $kozteruletTipusValidator = Validator::make(
            $request->all(),
            [
                'nev' => 'required|string|max:255',
            ],
            [
                'nev.required' => 'A közterület típus neve kötelező.',
                'nev.string'   => 'A közterület típus neve szöveg típusú legyen.',
                'nev.max'      => 'A közterület típus neve legfeljebb 255 karakter lehet.',
            ]
        );

        if ($kozteruletTipusValidator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Az adatok nem megfelelőek!',
                'errors'  => $kozteruletTipusValidator->errors()->toArray(),
            ], 422);
        }

        $tipus = new Kozterulet_tipus();
        $tipus->nev = $request->nev;
        $tipus->save();

        return response()->json([
            'success' => true,
            'message' => 'Közterület típus rögzítve.',
            'data'    => $tipus,
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Kozterulet_tipus $kozterulet_tipus)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Kozterulet_tipus $kozterulet_tipus)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Kozterulet_tipus $id)
    {
        $kozteruletTipusValidator = Validator::make(
            $request->all(),
            [
                'nev' => 'required|string|max:255',
            ],
            [
                'nev.required' => 'A közterület típus neve kötelező.',
                'nev.string'   => 'A közterület típus neve szöveg típusú legyen.',
                'nev.max'      => 'A közterület típus neve legfeljebb 255 karakter lehet.',
            ]
        );

        if ($kozteruletTipusValidator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Az adatok nem megfelelőek!',
                'errors'  => $kozteruletTipusValidator->errors()->toArray(),
            ], 422);
        }

        $tipus = Kozterulet_tipus::find($id);
        if (!empty($tipus)) {
            $tipus->nev = $request->nev;
            $tipus->save();

            return response()->json(["message" => "Közterület típus sikeresen módosítva!"], 202);
        } else {
            return response()->json(["message" => "Nincs közterület típus ezzel az id-val."], 404);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Kozterulet_tipus $id)
    {
        $tipusTorles = Kozterulet_tipus::find($id);
        if (!empty($tipusTorles)) {
            $tipusTorles->delete();
            return response()->json(["message" => "Közterület típus sikeresen törölve!"]);
        } else {
            return response()->json(["message" => "Nincs közterület típus ezzel az id-val!"], 404);
        }
    }
}
