<?php

namespace App\Http\Controllers;

use App\Models\Sirberlo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SirberloController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $sirberlok = Sirberlo::all();
        return response()->json($sirberlok);
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
        $sirberloValidator = Validator::make(
            $request->all(),
            [
                'nev'                => 'required|string|max:255',
                'kozterulet_neve'    => 'required|string|max:255',
                'kozterulet_tipus_id' => 'nullable|integer|exists:kozterulet_tipus,id',
                'ir_szam'            => 'required|integer|exists:telepules,ir_szam',
                'email_cim'          => 'nullable|email|max:255',
            ],
            [
                'nev.required'             => 'A név megadása kötelező.',
                'nev.string'               => 'A név szöveg típusú legyen.',
                'nev.max'                  => 'A név legfeljebb 255 karakter lehet.',

                'kozterulet_neve.required' => 'A közterület neve kötelező.',
                'kozterulet_neve.string'   => 'A közterület neve szöveg típusú legyen.',
                'kozterulet_neve.max'      => 'A közterület neve legfeljebb 255 karakter lehet.',

                'kozterulet_tipus_id.integer' => 'A közterület típus azonosító csak szám lehet.',
                'kozterulet_tipus_id.exists'  => 'A megadott közterület típus nem található.',

                'ir_szam.required'         => 'Az irányítószám megadása kötelező.',
                'ir_szam.integer'          => 'Az irányítószám csak szám lehet.',
                'ir_szam.exists'           => 'A megadott irányítószám nem található.',

                'email_cim.email'          => 'Az e-mail cím formátuma nem megfelelő.',
                'email_cim.max'            => 'Az e-mail cím legfeljebb 255 karakter lehet.',
            ]
        );

        if ($sirberloValidator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Az adatok nem megfelelőek!',
                'errors'  => $sirberloValidator->errors()->toArray(),
            ], 422);
        }

        $data = $sirberloValidator->validated();

        $sirberlo = new Sirberlo();
        $sirberlo->nev                 = $data['nev'];
        $sirberlo->kozterulet_neve     = $data['kozterulet_neve'];
        $sirberlo->kozterulet_tipus_id = $data['kozterulet_tipus_id'] ?? null;
        $sirberlo->ir_szam             = $data['ir_szam'];
        $sirberlo->email_cim           = $data['email_cim'] ?? null;
        $sirberlo->save();

        return response()->json([
            'success' => true,
            'message' => 'Sírbérlő rögzítve.',
            'data'    => $sirberlo,
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Sirberlo $sirberlo)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Sirberlo $sirberlo)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Sirberlo $id)
    {
        $sirberloValidator = Validator::make(
            $request->all(),
            [
                'nev'                => 'required|string|max:255',
                'kozterulet_neve'    => 'required|string|max:255',
                'kozterulet_tipus_id' => 'nullable|integer|exists:kozterulet_tipus,id',
                'ir_szam'            => 'required|integer|exists:telepules,ir_szam',
                'email_cim'          => 'nullable|email|max:255',
            ],
            [
                'nev.required'             => 'A név megadása kötelező.',
                'nev.string'               => 'A név szöveg típusú legyen.',
                'nev.max'                  => 'A név legfeljebb 255 karakter lehet.',

                'kozterulet_neve.required' => 'A közterület neve kötelező.',
                'kozterulet_neve.string'   => 'A közterület neve szöveg típusú legyen.',
                'kozterulet_neve.max'      => 'A közterület neve legfeljebb 255 karakter lehet.',

                'kozterulet_tipus_id.integer' => 'A közterület típus azonosító csak szám lehet.',
                'kozterulet_tipus_id.exists'  => 'A megadott közterület típus nem található.',

                'ir_szam.required'         => 'Az irányítószám megadása kötelező.',
                'ir_szam.integer'          => 'Az irányítószám csak szám lehet.',
                'ir_szam.exists'           => 'A megadott irányítószám nem található.',

                'email_cim.email'          => 'Az e-mail cím formátuma nem megfelelő.',
                'email_cim.max'            => 'Az e-mail cím legfeljebb 255 karakter lehet.',
            ]
        );

        if ($sirberloValidator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Az adatok nem megfelelőek!',
                'errors'  => $sirberloValidator->errors()->toArray(),
            ], 422);
        }

        $sirberlo = Sirberlo::find($id);
        if (!empty($sirberlo)) {
            $sirberlo->nev                 = $request->nev;
            $sirberlo->kozterulet_neve     = $request->kozterulet_neve;
            $sirberlo->kozterulet_tipus_id = $request->kozterulet_tipus_id;
            $sirberlo->ir_szam             = $request->ir_szam;
            $sirberlo->email_cim           = $request->email_cim;
            $sirberlo->save();

            return response()->json(["message" => "Sírbérlő sikeresen módosítva!"], 202);
        } else {
            return response()->json(["message" => "Nincs sírbérlő ezzel az id-val."], 404);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Sirberlo $id)
    {
        $sirberloTorles = Sirberlo::find($id);
        if (!empty($sirberloTorles)) {
            $sirberloTorles->delete();
            return response()->json(["message" => "Sírbérlő sikeresen törölve!"]);
        } else {
            return response()->json(["message" => "Nincs sírbérlő ezzel az id-val!"], 404);
        }
    }
}
