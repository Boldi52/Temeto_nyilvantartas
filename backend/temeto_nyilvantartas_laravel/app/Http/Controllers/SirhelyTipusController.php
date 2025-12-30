<?php

namespace App\Http\Controllers;

use App\Models\Sirhely_tipus;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SirhelyTipusController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $sirhelyTipusok = Sirhely_tipus::all();
        return response()->json($sirhelyTipusok);
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
        $sirhely_tipusValidator = Validator::make(
            $request->all(),
            [
                'sirhely_id' => 'required|integer|exists:sirhely,id',
                'nev'        => 'required|string|max:255',
            ],
            [
                'sirhely_id.required' => 'A sírhely megadása kötelező.',
                'sirhely_id.integer'  => 'A sírhely azonosító csak szám lehet.',
                'sirhely_id.exists'   => 'A megadott sírhely nem található.',

                'nev.required'        => 'A név megadása kötelező.',
                'nev.string'          => 'A név szöveg típusú legyen.',
                'nev.max'             => 'A név legfeljebb 255 karakter lehet.',
            ]
        );

        if ($sirhely_tipusValidator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Az adatok nem megfelelőek!',
                'errors'  => $sirhely_tipusValidator->errors()->toArray(),
            ], 422);
        }

        $data = $sirhely_tipusValidator->validated();

        $sirhelyTipus = new Sirhely_tipus();
        $sirhelyTipus->sirhely_id = $data['sirhely_id'];
        $sirhelyTipus->nev        = $data['nev'];
        $sirhelyTipus->save();

        return response()->json([
            'success' => true,
            'message' => 'Sírhely típus rögzítve.',
            'data'    => $sirhelyTipus,
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Sirhely_tipus $sirhely_tipus)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Sirhely_tipus $sirhely_tipus)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Sirhely_tipus $id)
    {
        $sirhelyTipusValidator = Validator::make(
            $request->all(),
            [
                'sirhely_id' => 'required|integer|exists:sirhely,id',
                'nev'        => 'required|string|max:255',
            ],
            [
                'sirhely_id.required' => 'A sírhely megadása kötelező.',
                'sirhely_id.integer'  => 'A sírhely azonosító csak szám lehet.',
                'sirhely_id.exists'   => 'A megadott sírhely nem található.',

                'nev.required'        => 'A név megadása kötelező.',
                'nev.string'          => 'A név szöveg típusú legyen.',
                'nev.max'             => 'A név legfeljebb 255 karakter lehet.',
            ]
        );

        if ($sirhelyTipusValidator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Az adatok nem megfelelőek!',
                'errors'  => $sirhelyTipusValidator->errors()->toArray(),
            ], 422);
        }

        $sirhelyTipus = Sirhely_tipus::find($id);
        if (!empty($sirhelyTipus)) {
            $sirhelyTipus->sirhely_id = $request->sirhely_id;
            $sirhelyTipus->nev        = $request->nev;
            $sirhelyTipus->save();

            return response()->json(["message" => "Sírhely típus sikeresen módosítva!"], 202);
        } else {
            return response()->json(["message" => "Nincs sírhely típus ezzel az id-val."], 404);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Sirhely_tipus $id)
    {
        $torles = Sirhely_tipus::find($id);
        if (!empty($torles)) {
            $torles->delete();
            return response()->json(["message" => "Sírhely típus sikeresen törölve!"]);
        } else {
            return response()->json(["message" => "Nincs sírhely típus ezzel az id-val!"], 404);
        }
    }
}
