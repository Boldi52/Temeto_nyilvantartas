<?php

namespace App\Http\Controllers;

use App\Models\Dokumentum;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class DokumentumController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $dokumentumok = Dokumentum::all();
        return response()->json($dokumentumok);
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
        $dokumentumValidator = Validator::make(
            $request->all(),
            [
                'sirhely_id'  => 'nullable|integer|exists:sirhely,id',
                'sirberlo_id' => 'nullable|integer|exists:sirberlo,id',
                'tipus'       => 'nullable|string|max:255',
                'datum'       => 'nullable|date',
                'leiras'      => 'nullable|string|max:1000',
            ],
            [
                'sirhely_id.integer'  => 'A sírhely azonosító csak szám lehet.',
                'sirhely_id.exists'   => 'A megadott sírhely nem található.',

                'sirberlo_id.integer' => 'A sírbérlő azonosító csak szám lehet.',
                'sirberlo_id.exists'  => 'A megadott sírbérlő nem található.',

                'tipus.string'        => 'A típus szöveg típusú legyen.',
                'tipus.max'           => 'A típus legfeljebb 255 karakter lehet.',

                'datum.date'          => 'A dátum formátuma nem megfelelő.',

                'leiras.string'       => 'A leírás szöveg típusú legyen.',
                'leiras.max'          => 'A leírás legfeljebb 1000 karakter lehet.',
            ]
        );

        if ($dokumentumValidator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Az adatok nem megfelelőek!',
                'errors'  => $dokumentumValidator->errors()->toArray(),
            ], 422);
        }


        $dokumentum = new Dokumentum();
        $dokumentum->sirhely_id  = $request->sirhely_id;
        $dokumentum->sirberlo_id = $request->sirberlo_id;
        $dokumentum->tipus = $request->tipus;
        $dokumentum->datum = $request->datum;
        $dokumentum->leiras = $request->leiras;
        $dokumentum->save();

        return response()->json(["message" => "Dokumentum sikeresen módosítva!"], 202);
    }

    /**
     * Display the specified resource.
     */
    public function show(Dokumentum $dokumentum)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Dokumentum $dokumentum)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Dokumentum $dokumentum)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $dokumentum = Dokumentum::find($id);
        if (!$dokumentum) {
            return response()->json(["message" => "Nincs dokumentum ezzel az id-val!"], 404);
        }
        $dokumentum->delete();
        return response()->json(["message" => "Dokumentum sikeresen törölve!"], 200);
    }
}
