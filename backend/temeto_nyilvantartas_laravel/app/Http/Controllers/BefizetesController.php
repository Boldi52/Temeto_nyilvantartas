<?php

namespace App\Http\Controllers;

use App\Models\Befizetes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BefizetesController extends Controller
{
    public function index()
    {
        $befizetesek = Befizetes::all();
        return response()->json($befizetesek);
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $befizetesvalidator = Validator::make(
            $request->all(),
            [
                'sirberlo_id' => 'required|integer|exists:sirberlo,id',
                'elhunyt_id' => 'nullable|integer|exists:elhunyt,id',
                'osszeg' => 'required|numeric|min:0.01|max:99999999.99',
                'hossza' => 'nullable|integer|min:1|max:240',
                'datum' => 'nullable|date',
            ],
            [
                'sirberlo_id.required' => 'A sírbérlő megadása kötelező.',
                'sirberlo_id.integer'  => 'A sírbérlő azonosító csak szám lehet.',
                'sirberlo_id.exists'   => 'A megadott sírbérlő nem található.',
                'elhunyt_id.integer'   => 'Az elhunyt azonosító csak szám lehet.',
                'elhunyt_id.exists'    => 'A megadott elhunyt nem található.',
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
        $befizetes->elhunyt_id = $request->elhunyt_id ?? null;
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

    public function show(string $id)
    {
        $befizetesAdatok = Befizetes::find($id);
        if (!empty($befizetesAdatok)) {
            return response()->json($befizetesAdatok);
        } else {
            return response()->json(["message" => "Nincs befizetés ezzel az id-val."], 404);
        }
    }

    public function edit(Befizetes $befizetes)
    {
        //
    }

    public function update(Request $request, string $id)
    {
        $befizetesValidator = Validator::make(
            $request->all(),
            [
                'sirberlo_id' => 'required|integer|exists:sirberlo,id',
                'elhunyt_id' => 'nullable|integer|exists:elhunyt,id',
                'osszeg'      => 'required|numeric|min:0.01|max:99999999.99',
                'hossza'      => 'nullable|integer|min:1|max:240',
                'datum'       => 'nullable|date',
            ],
            [
                'sirberlo_id.required' => 'A sírbérlő megadása kötelező.',
                'sirberlo_id.integer'  => 'A sírbérlő azonosító csak szám lehet.',
                'sirberlo_id.exists'   => 'A megadott sírbérlő nem található.',
                'elhunyt_id.integer'   => 'Az elhunyt azonosító csak szám lehet.',
                'elhunyt_id.exists'    => 'A megadott elhunyt nem található.',
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
            $befizetes->elhunyt_id = $request->elhunyt_id ?? null;
            $befizetes->osszeg      = $request->osszeg;
            $befizetes->hossza      = $request->hossza;
            $befizetes->datum       = $request->datum;
            $befizetes->save();

            return response()->json(["message" => "Befizetés sikeresen módosítva!"], 202);
        } else {
            return response()->json(["message" => "Nincs befizetés ezzel az id-val."], 404);
        }
    }

    public function destroy(string $id)
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