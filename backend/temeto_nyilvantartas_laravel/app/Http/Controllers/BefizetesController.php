<?php

namespace App\Http\Controllers;

use App\Models\Befizetes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BefizetesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $befizetesek = Befizetes::all();
        return response()->json($befizetesek);
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
        $befizetesvalidator = Validator::make(
            $request->all(),
            [
                'sirberlo_id' => 'required|integer|exists:sirberlo,id',
                'osszeg' => 'required|numeric|min:0.01|max:99999999.99',
                'hossza' => 'nullable|integer|min:1|max:240', // hónap, igény szerint állítsd
                'datum' => 'nullable|date',
            ],
            [
                'sirberlo_id.required' => 'A sírbérlő megadása kötelező.',
                'sirberlo_id.integer'  => 'A sírbérlő azonosító csak szám lehet.',
                'sirberlo_id.exists'   => 'A megadott sírbérlő nem található.',

                'osszeg.required' => 'Az összeg megadása kötelező.',
                'osszeg.numeric'  => 'Az összeg csak szám lehet.',
                'osszeg.min'      => 'Az összegnek pozitívnak kell lennie.',
                'osszeg.max'      => 'Az összeg túl nagy (max. 99 999 999,99).',

                'hossza.integer'  => 'A hossza csak egész hónap lehet.',
                'hossza.min'      => 'A hossza legalább 1 hónap legyen.',
                'hossza.max'      => 'A hossza legfeljebb 240 hónap lehet.',

                'datum.date'      => 'A dátum formátuma nem megfelelő.',


            ]
        );
        if ($befizetesvalidator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Az adatok nem megfelelőek!',
                'errors'  => $befizetesvalidator->errors()->toArray(),
            ], 422);
        }


        $befizetes = new Befizetes();
        $befizetes->sirberlo_id = $request->sirberlo_id;
        $befizetes->osszeg = $request->osszeg;
        $befizetes->hossza = $request->hossza;
        $befizetes->datum = $request->datum;

        $befizetes->save();

        return response()->json([
            'success' => true,
            'message' => 'Befizetés rögzítve.',
            'data'    => $befizetes,
        ], 201);
    }




    /**
     * Display the specified resource.
     */
    public function show(Befizetes $befizetes)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Befizetes $befizetes)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Befizetes $id)
    {
        $befizetesValidator = Validator::make(
            $request->all(),
            [
                'sirberlo_id' => 'required|integer|exists:sirberlo,id',
                'osszeg'      => 'required|numeric|min:0.01|max:99999999.99',
                'hossza'      => 'nullable|integer|min:1|max:240',
                'datum'       => 'nullable|date',
            ],
            [
                'sirberlo_id.required' => 'A sírbérlő megadása kötelező.',
                'sirberlo_id.integer'  => 'A sírbérlő azonosító csak szám lehet.',
                'sirberlo_id.exists'   => 'A megadott sírbérlő nem található.',

                'osszeg.required' => 'Az összeg megadása kötelező.',
                'osszeg.numeric'  => 'Az összeg csak szám lehet.',
                'osszeg.min'      => 'Az összegnek pozitívnak kell lennie.',
                'osszeg.max'      => 'Az összeg túl nagy (max. 99 999 999,99).',

                'hossza.integer'  => 'A hossza csak egész hónap lehet.',
                'hossza.min'      => 'A hossza legalább 1 hónap legyen.',
                'hossza.max'      => 'A hossza legfeljebb 240 hónap lehet.',

                'datum.date'      => 'A dátum formátuma nem megfelelő.',
            ]
        );

        if ($befizetesValidator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Az adatok nem megfelelőek!',
                'errors'  => $befizetesValidator->errors()->toArray(),
            ], 422);
        }

        $befizetes = Befizetes::find($id);
        if (!empty($befizetes)) {
            $befizetes->sirberlo_id = $request->sirberlo_id;
            $befizetes->osszeg      = $request->osszeg;
            $befizetes->hossza      = $request->hossza;
            $befizetes->datum       = $request->datum;
            $befizetes->save();

            return response()->json(["message" => "Befizetés sikeresen módosítva!"], 202);
        } else {
            return response()->json(["message" => "Nincs befizetés ezzel az id-val."], 404);
        }
    }

    /**
     * Remove the specified resource from storage.s
     */
    public function destroy(Befizetes $id)
    {
        $befizetesTorles = Befizetes::find($id);
        if (!empty($befizetesTorles)) {
            $befizetesTorles->delete();
            return response()->json(["message" => "Befizetés sikeresen törölve!"]);
        } else {
            return response()->json(["message" => "Nincs befizetés ezzel az id-val!"], 404);
        }
    }
}
