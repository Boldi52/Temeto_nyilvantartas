<?php

namespace App\Http\Controllers;

use App\Models\Sirhely;
use App\Models\Sor;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class SirhelyController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $query = Sirhely::query()
            ->select('id', 'sor_id', 'sirkod', 'allapot')
            ->orderBy('sirkod');

        if ($request->filled('sor_id')) {
            $query->where('sor_id', $request->sor_id);
        }

        return response()->json($query->get());
    }

    public function count(): JsonResponse
    {
        return response()->json([
            'graves' => Sirhely::count(), // sírhelyek száma a sirhely táblából
        ]);
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
        $sirhelyvalidator = Validator::make(
            $request->all(),
            [
                'sor_id'      => 'required|integer|exists:sor,id',
                'sirkod'      => 'nullable|string|max:255',
                'allapot'     => 'nullable|string|max:255',
                'foto'        => 'nullable|string|max:255', // ha fájlt töltesz, válts file|mimes...-ra
                'sirberlo_id' => 'nullable|integer|exists:sirberlo,id',
            ],
            [
                'sor_id.required' => 'A sor megadása kötelező.',
                'sor_id.integer'  => 'A sor azonosító csak szám lehet.',
                'sor_id.exists'   => 'A megadott sor nem található.',

                'sirkod.string'   => 'A sírkód szöveg típusú legyen.',
                'sirkod.max'      => 'A sírkód legfeljebb 255 karakter lehet.',

                'allapot.string'  => 'Az állapot szöveg típusú legyen.',
                'allapot.max'     => 'Az állapot legfeljebb 255 karakter lehet.',

                'foto.string'     => 'A fotó elérési útja szöveg típusú legyen.',
                'foto.max'        => 'A fotó elérési útja legfeljebb 255 karakter lehet.',

                'sirberlo_id.integer' => 'A sírbérlő azonosító csak szám lehet.',
                'sirberlo_id.exists'  => 'A megadott sírbérlő nem található.',
            ]
        );

        if ($sirhelyvalidator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Az adatok nem megfelelőek!',
                'errors'  => $sirhelyvalidator->errors()->toArray(),
            ], 422);
        }

        $data = $sirhelyvalidator->validated();

        $sirhely = new Sirhely();
        $sirhely->sor_id      = $data['sor_id'];
        $sirhely->sirkod      = $data['sirkod'] ?? null;
        $sirhely->allapot     = $data['allapot'] ?? null;
        $sirhely->foto        = $data['foto'] ?? null;
        $sirhely->sirberlo_id = $data['sirberlo_id'] ?? null;
        $sirhely->save();

        return response()->json([
            'success' => true,
            'message' => 'Sírhely rögzítve.',
            'data'    => $sirhely,
        ], 201);
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
        $sirhelyValidator = Validator::make(
            $request->all(),
            [
                'sor_id'      => 'required|integer|exists:sor,id',
                'sirkod'      => 'nullable|string|max:255',
                'allapot'     => 'nullable|string|max:255',
                'foto'        => 'nullable|string|max:255', // ha fájl, használj file|mimes... szabályt
                'sirberlo_id' => 'nullable|integer|exists:sirberlo,id',
            ],
            [
                'sor_id.required' => 'A sor megadása kötelező.',
                'sor_id.integer'  => 'A sor azonosító csak szám lehet.',
                'sor_id.exists'   => 'A megadott sor nem található.',

                'sirkod.string'   => 'A sírkód szöveg típusú legyen.',
                'sirkod.max'      => 'A sírkód legfeljebb 255 karakter lehet.',

                'allapot.string'  => 'Az állapot szöveg típusú legyen.',
                'allapot.max'     => 'Az állapot legfeljebb 255 karakter lehet.',

                'foto.string'     => 'A fotó elérési útja szöveg típusú legyen.',
                'foto.max'        => 'A fotó elérési útja legfeljebb 255 karakter lehet.',

                'sirberlo_id.integer' => 'A sírbérlő azonosító csak szám lehet.',
                'sirberlo_id.exists'  => 'A megadott sírbérlő nem található.',
            ]
        );

        if ($sirhelyValidator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Az adatok nem megfelelőek!',
                'errors'  => $sirhelyValidator->errors()->toArray(),
            ], 422);
        }

        $sirhely = Sirhely::find($sirhely);
        if (!empty($sirhely)) {
            $sirhely->sor_id      = $request->sor_id;
            $sirhely->sirkod      = $request->sirkod;
            $sirhely->allapot     = $request->allapot;
            $sirhely->foto        = $request->foto;
            $sirhely->sirberlo_id = $request->sirberlo_id;
            $sirhely->save();

            return response()->json(["message" => "Sírhely sikeresen módosítva!"], 202);
        } else {
            return response()->json(["message" => "Nincs sírhely ezzel az id-val."], 404);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Sirhely $sirhely)
    {
        $sirhelyTorles = Sirhely::find($sirhely);
        if (!empty($sirhelyTorles)) {
            $sirhelyTorles->delete();
            return response()->json(["message" => "Sírhely sikeresen törölve!"]);
        } else {
            return response()->json(["message" => "Nincs sírhely ezzel az id-val!"], 404);
        }
    }
}
