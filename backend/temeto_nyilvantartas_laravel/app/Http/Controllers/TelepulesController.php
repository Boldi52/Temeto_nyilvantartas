<?php

namespace App\Http\Controllers;

use App\Models\Telepules;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class TelepulesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $telepulesek = Telepules::all();
        return response()->json($telepulesek);
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
        $telepulesValidator = Validator::make(
            $request->all(),
            [
                'ir_szam' => 'required|integer|unique:telepules,ir_szam',
                'nev'     => 'required|string|max:255',
            ],
            [
                'ir_szam.required' => 'Az irányítószám megadása kötelező.',
                'ir_szam.integer'  => 'Az irányítószám csak szám lehet.',
                'ir_szam.unique'   => 'Ezzel az irányítószámmal már létezik település.',

                'nev.required'     => 'A település neve kötelező.',
                'nev.string'       => 'A település neve szöveg típusú legyen.',
                'nev.max'          => 'A település neve legfeljebb 255 karakter lehet.',
            ]
        );

        if ($telepulesValidator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Az adatok nem megfelelőek!',
                'errors'  => $telepulesValidator->errors()->toArray(),
            ], 422);
        }

        $telepules = new Telepules();
        $telepules->ir_szam = $request->ir_szam;
        $telepules->nev     = $request->nev;
        $telepules->save();

        return response()->json([
            'success' => true,
            'message' => 'Település rögzítve.',
            'data'    => $telepules,
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $ir_szam)
    {
        $telepules = Telepules::find($ir_szam);
        if (!empty($telepules)) {
            return response()->json($telepules);
        } else {
            return response()->json(["message" => "Nincs település ezzel az id-val."], 404);
        }
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Telepules $telepules)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'ir_szam' => 'required|integer',
                'nev'     => 'required|string|max:255',
            ],
            [
                'ir_szam.required' => 'Az irányítószám megadása kötelező.',
                'ir_szam.integer'  => 'Az irányítószám csak szám lehet.',

                'nev.required'     => 'A település neve kötelező.',
                'nev.string'       => 'A település neve szöveg típusú legyen.',
                'nev.max'          => 'A település neve legfeljebb 255 karakter lehet.',
            ]
        );

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Az adatok nem megfelelőek!',
                'errors'  => $validator->errors()->toArray(),
            ], 422);
        }

        $telepules = Telepules::find($id);
        if (!empty($telepules)) {
            $telepules->ir_szam = $request->ir_szam;
            $telepules->nev     = $request->nev;
            $telepules->save();

            return response()->json(["message" => "Település sikeresen módosítva!"], 202);
        } else {
            return response()->json(["message" => "Nincs település ezzel az id-val."], 404);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {

        $telepulesTorles = Telepules::find($id);
        if (!empty($telepulesTorles)) {
            $telepulesTorles->delete();
            return response()->json(["message" => "Település sikeresen törölve!"]);
        } else {
            return response()->json(["message" => "Nincs település ezzel az id-val!"], 404);
        }
    }
}
