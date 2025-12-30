<?php

namespace App\Http\Controllers;

use App\Models\Dokumentum_tipus;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class DokumentumTipusController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $dok_tipusok = Dokumentum_tipus::all();
        return response()->json($dok_tipusok);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $dokTipusValidator = Validator::make(
            $request->all(),
            [
                'tipus_elnevezese' => 'required|string|max:255',
                'dokumentum_id'    => 'nullable|integer|exists:dokumentum,id',
            ],
            [
                'tipus_elnevezese.required' => 'A típus elnevezése kötelező.',
                'tipus_elnevezese.string'   => 'A típus elnevezése szöveg típusú legyen.',
                'tipus_elnevezese.max'      => 'A típus elnevezése legfeljebb 255 karakter lehet.',

                'dokumentum_id.integer' => 'A dokumentum azonosító csak szám lehet.',
                'dokumentum_id.exists'  => 'A megadott dokumentum nem található.',
            ]
        );

        if ($dokTipusValidator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Az adatok nem megfelelőek!',
                'errors'  => $dokTipusValidator->errors()->toArray(),
            ], 422);
        }

        $data = $dokTipusValidator->validated();

        $dokTipus = new Dokumentum_tipus();
        $dokTipus->tipus_elnevezese = $data['tipus_elnevezese'];
        $dokTipus->dokumentum_id    = $data['dokumentum_id'] ?? null;
        $dokTipus->save();

        return response()->json([
            'success' => true,
            'message' => 'Dokumentum típus rögzítve.',
            'data'    => $dokTipus,
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $dok_tipusValidator = Validator::make(
            $request->all(),
            [
                'tipus_elnevezese' => 'required|string|max:255',
                'dokumentum_id'    => 'nullable|integer|exists:dokumentum,id',
            ],
            [
                'tipus_elnevezese.required' => 'A típus elnevezése kötelező.',
                'tipus_elnevezese.string'   => 'A típus elnevezése szöveg típusú legyen.',
                'tipus_elnevezese.max'      => 'A típus elnevezése legfeljebb 255 karakter lehet.',

                'dokumentum_id.integer' => 'A dokumentum azonosító csak szám lehet.',
                'dokumentum_id.exists'  => 'A megadott dokumentum nem található.',
            ]
        );

        if ($dok_tipusValidator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Az adatok nem megfelelőek!',
                'errors'  => $dok_tipusValidator->errors()->toArray(),
            ], 422);
        }

        $dokumentumTipus = Dokumentum_tipus::find($id);
        if (!empty($dokumentumTipus)) {
            $dokumentumTipus->tipus_elnevezese = $request->tipus_elnevezese;
            $dokumentumTipus->dokumentum_id    = $request->dokumentum_id;
            $dokumentumTipus->save();

            return response()->json(["message" => "Dokumentum típus sikeresen módosítva!"], 202);
        } else {
            return response()->json(["message" => "Nincs dokumentum típus ezzel az id-val."], 404);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $dokumentumTipusTorles = Dokumentum_tipus::find($id);
        if (!empty($dokumentumTipusTorles)) {
            $dokumentumTipusTorles->delete();
            return response()->json(["message" => "Dokumentum típus sikeresen törölve!"]);
        } else {
            return response()->json(["message" => "Nincs dokumentum típus ezzel az id-val!"], 404);
        }
    }
}
