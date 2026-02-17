<?php

namespace App\Http\Controllers;

use App\Models\Parcela;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Mockery\Generator\StringManipulation\Pass\Pass;

class ParcelaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return response()->json(
            Parcela::select('id', 'nev')->orderBy('nev')->get()
        );
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
        $parcellaValidator = Validator::make(
            $request->all(),
            [
                'nev' => 'required|string|max:255',
            ],
            [
                'nev.required' => 'A parcella neve kötelező.',
                'nev.string'   => 'A parcella neve szöveg típusú legyen.',
                'nev.max'      => 'A parcella neve legfeljebb 255 karakter lehet.',
            ]
        );

        if ($parcellaValidator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Az adatok nem megfelelőek!',
                'errors'  => $parcellaValidator->errors()->toArray(),
            ], 422);
        }

        $parcella = new Parcela();
        $parcella->nev = $request->nev;
        $parcella->save();

        return response()->json([
            'success' => true,
            'message' => 'Parcella rögzítve.',
            'data'    => $parcella,
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $parcella = Parcela::find($id);
        if (!$parcella) {
            return response()->json(["message" => "Nincs parcella ezzel az id-val!"], 404);
        }
        return response()->json($parcella);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Parcela $parcela)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $parcellaValidator = Validator::make(
            $request->all(),
            [
                'nev' => 'required|string|max:255',
            ],
            [
                'nev.required' => 'A parcella neve kötelező.',
                'nev.string'   => 'A parcella neve szöveg típusú legyen.',
                'nev.max'      => 'A parcella neve legfeljebb 255 karakter lehet.',
            ]
        );

        if ($parcellaValidator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Az adatok nem megfelelőek!',
                'errors'  => $parcellaValidator->errors()->toArray(),
            ], 422);
        }

        $parcela = Parcela::find($id);
        if (!$parcela) {
            return response()->json(["message" => "Nincs parcella ezzel az id-val!"], 404);
        }
        $parcela->nev = $request->nev;
        $parcela->save();

        return response()->json(["message" => "Parcella sikeresen módosítva!"], 202);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $parcela = Parcela::find($id);
        if (!$parcela) {
            return response()->json(["message" => "Nincs parcella ezzel az id-val!"], 404);
        }

        $parcela->delete();
        return response()->json(["message" => "Parcella sikeresen törölve!"]);
    }
}
