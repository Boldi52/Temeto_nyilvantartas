<?php

namespace App\Http\Controllers;

use App\Models\Parcela;
use App\Models\Sor;
use App\Models\Parcella;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class SorController extends Controller
{
    public function index(Request $request)
    {
        $query = Sor::query()->select('id', 'parcella_id', 'nev')->orderBy('nev');

        if ($request->filled('parcella_id')) {
            $query->where('parcella_id', $request->parcella_id);
        }

        return response()->json($query->get());
    }

    public function byParcella(Parcela $parcella)
    {
        return $parcella->sorok()
            ->select('id', 'nev')
            ->orderBy('nev')
            ->get();
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $sorValidator = Validator::make(
            $request->all(),
            [
                'parcella_id' => 'required|integer|exists:parcella,id',
                'nev'         => 'nullable|string|max:255',
            ],
            [
                'parcella_id.required' => 'A parcella megadása kötelező.',
                'parcella_id.integer'  => 'A parcella azonosító csak szám lehet.',
                'parcella_id.exists'   => 'A megadott parcella nem található.',

                'nev.string'           => 'A név szöveg típusú legyen.',
                'nev.max'              => 'A név legfeljebb 255 karakter lehet.',
            ]
        );

        if ($sorValidator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Az adatok nem megfelelőek!',
                'errors'  => $sorValidator->errors()->toArray(),
            ], 422);
        }

        $data = $sorValidator->validated();

        $sor = new Sor();
        $sor->parcella_id = $data['parcella_id'];
        $sor->nev         = $data['nev'] ?? null;
        $sor->save();

        return response()->json([
            'success' => true,
            'message' => 'Sor rögzítve.',
            'data'    => $sor,
        ], 201);
    }

    public function show(Sor $sor)
    {
        //
    }

    public function edit(Sor $sor)
    {
        //
    }

    public function update(Request $request, Sor $id)
    {
        $sorValidator = Validator::make(
            $request->all(),
            [
                'parcella_id' => 'required|integer|exists:parcella,id',
                'nev'         => 'nullable|string|max:255',
            ],
            [
                'parcella_id.required' => 'A parcella megadása kötelező.',
                'parcella_id.integer'  => 'A parcella azonosító csak szám lehet.',
                'parcella_id.exists'   => 'A megadott parcella nem található.',

                'nev.string'           => 'A név szöveg típusú legyen.',
                'nev.max'              => 'A név legfeljebb 255 karakter lehet.',
            ]
        );

        if ($sorValidator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Az adatok nem megfelelőek!',
                'errors'  => $sorValidator->errors()->toArray(),
            ], 422);
        }

        $sor = Sor::find($id);
        if (!empty($sor)) {
            $sor->parcella_id = $request->parcella_id;
            $sor->nev         = $request->nev;
            $sor->save();

            return response()->json(["message" => "Sor sikeresen módosítva!"], 202);
        } else {
            return response()->json(["message" => "Nincs sor ezzel az id-val."], 404);
        }
    }

    public function destroy(Sor $id)
    {
        $sorTorles = Sor::find($id);
        if (!empty($sorTorles)) {
            $sorTorles->delete();
            return response()->json(["message" => "Sor sikeresen törölve!"]);
        } else {
            return response()->json(["message" => "Nincs sor ezzel az id-val!"], 404);
        }
    }
}
