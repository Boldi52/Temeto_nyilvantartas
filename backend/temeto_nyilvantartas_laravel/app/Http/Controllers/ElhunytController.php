<?php

namespace App\Http\Controllers;

use App\Models\Dokumentum;
use App\Models\Elhunyt;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Sirhely;

class ElhunytController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $elhunytMindenAdata = Elhunyt::all();
        return response()->json($elhunytMindenAdata);
    }

    public function count()
    {
        return response()->json([
            'osszes' => Elhunyt::count(), 
        ]);
    }

    public function recent(): JsonResponse
    {                   
       
        $recent = Elhunyt::select([
                'id',
                'nev as name',
                'halal_datuma as date',
            ])
            ->orderByDesc('halal_datuma')
            ->take(7)
            ->get();

        return response()->json($recent);
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
        $validator = Validator::make(
            $request->all(),
            [
                'nev'                    => 'required|string|max:100',
                'szul_datum'             => 'nullable|date',
                'halal_datuma'           => 'nullable|date',
                'anyja_neve'             => 'nullable|string|max:100',
                'halotti_anyakonyvi_kiv' => 'nullable|file|mimes:pdf,jpg,png|max:5120',
                'sirhely_id'             => 'nullable|integer|exists:sirhely,id',
            ],
            [
                'nev.required'       => 'A név megadása kötelező.',
                'nev.string'         => 'A név szöveg típusú legyen.',
                'nev.max'            => 'A név legfeljebb 100 karakter lehet.',
                'szul_datum.date'    => 'A születési dátum formátuma nem megfelelő.',
                'halal_datuma.date'  => 'A halál dátumának formátuma nem megfelelő.',
                'anyja_neve.string'  => 'Az anya neve szöveg típusú legyen.',
                'anyja_neve.max'     => 'Az anya neve legfeljebb 100 karakter lehet.',
                'halotti_anyakonyvi_kiv.file'  => 'A halotti anyakönyvi kivonat fájl legyen.',
                'halotti_anyakonyvi_kiv.mimes' => 'Csak PDF, JPG vagy PNG tölthető fel.',
                'halotti_anyakonyvi_kiv.max'   => 'A fájl mérete legfeljebb 5 MB lehet.',
                'sirhely_id.integer'  => 'A sírhely azonosító csak szám lehet.',
                'sirhely_id.exists'   => 'A megadott sírhely nem található.',
            ]
        );

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Az adatok nem megfelelőek!',
                'errors'  => $validator->errors()->toArray(),
            ], 422);
        }

        $data = $validator->validated();

        // Ha van fájl, mentsd és hozz létre dokumentum rekordot, majd állítsd be az FK-t
        $dokumentumId = null;
        if ($request->hasFile('halotti_anyakonyvi_kiv')) {
            $path = $request->file('halotti_anyakonyvi_kiv')->store('halotti_anyakonyvi_kiv', 'public');

            // ha van Dokumentum modelled/táblád:
            $doc = new Dokumentum();
            $doc->nev      = $request->file('halotti_anyakonyvi_kiv')->getClientOriginalName();
            $doc->path     = $path;
            $doc->mime     = $request->file('halotti_anyakonyvi_kiv')->getClientMimeType();
            $doc->meret    = $request->file('halotti_anyakonyvi_kiv')->getSize();
            $doc->save();

            $dokumentumId = $doc->id;
        }

        $elhunyt = new Elhunyt();
        $elhunyt->nev                    = $data['nev'];
        $elhunyt->szul_datum             = $data['szul_datum'] ?? null;
        $elhunyt->halal_datuma           = $data['halal_datuma'] ?? null;
        $elhunyt->anyja_neve             = $data['anyja_neve'] ?? null;
        $elhunyt->sirhely_id             = $data['sirhely_id'] ?? null;
        $elhunyt->halotti_anyakonyvi_kiv = $dokumentumId; // FK (int), nem path string
        $elhunyt->save();

        return response()->json([
            'success' => true,
            'message' => 'Elhunyt mentve.',
            'data'    => $elhunyt,
        ], 201);
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
    public function update(Request $request, Elhunyt $id)
    {
        $elhunytValidator = Validator::make(
            $request->all(),
            [
                'nev' => 'nullable|string|max:100',
                'szul_datum' => 'nullable|date',
                'halal_datuma' => 'nullable|date',
                'anyja_neve' => 'nullable|string|max:100',
                'halotti_anyakonyvi_kiv' => 'nullable|file|mimes:pdf,jpg,png|max:5120',
                'sirhely_id' => 'nullable|integer|exists:sirhely,id',
            ],
            [
                'nev.string' => 'A név szöveg típusú legyen.',
                'nev.max' => 'A név legfeljebb 100 karakter lehet.',

                'szul_datum.required' => 'A születési dátum megadása kötelező.',
                'szul_datum.date' => 'A születési dátum formátuma nem megfelelő.',

                'halal_datuma.required' => 'A halál dátumának megadása kötelező.',
                'halal_datuma.date' => 'A halál dátumának formátuma nem megfelelő.',

                'anyja_neve.required' => 'Az anya neve megadása kötelező.',
                'anyja_neve.string' => 'Az anya neve szöveg típusú legyen.',
                'anyja_neve.max' => 'Az anya neve legfeljebb 100 karakter lehet.',

                'halotti_anyakonyvi_kiv.required' => 'A halotti anyakönyvi kivonat feltöltése kötelező.',
                'halotti_anyakonyvi_kiv.file' => 'A halotti anyakönyvi kivonat fájl legyen.',
                'halotti_anyakonyvi_kiv.mimes' => 'Csak PDF, JPG vagy PNG tölthető fel.',
                'halotti_anyakonyvi_kiv.max' => 'A fájl mérete legfeljebb 5 MB lehet.',


                'sirhely_id.integer'  => 'A sírhely azonosító csak szám lehet.',
                'sirhely_id.exists'   => 'A megadott sírhely nem található.',
            ]
        );

        if ($elhunytValidator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Az adatok nem megfelelőek!',
                'errors'  => $elhunytValidator->errors()->toArray(),
            ], 422);
        }

        $elhunyt = Elhunyt::find($id);
        if (!empty($elhunyt)) {
            $elhunyt->nev = $request->string('nev');
            $elhunyt->szul_datum = $request->date('szul_datum');
            $elhunyt->halal_datuma = $request->date('halal_datuma');
            $elhunyt->anyja_neve = $request->string('anyja_neve');
            $elhunyt->halotti_anyakonyvi_kiv = $request->string('halotti_anyakonyvi_kiv');

            $elhunyt->save();
            return response()->json(["message: " => "elhunyt sikeresen módosítva!"], 202);
        } else {
            return response()->json(["message" => "Nincs halott ezzel az id val."], 404);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Elhunyt $id)
    {
        $elhunytTorles = Elhunyt::find($id);
        if (!empty($elhunytTorles)) {
            $elhunytTorles->delete();
            return response()->json(["message: " => "Elhunyt sikeresen törölve!"]);
        } else {
            return response()->json(["message: " => "Nincs halott ezzel az id-val!"]);
        }
    }
}
