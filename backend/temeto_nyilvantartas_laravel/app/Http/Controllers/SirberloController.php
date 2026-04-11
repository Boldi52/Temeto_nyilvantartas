<?php

namespace App\Http\Controllers;

use App\Models\Sirberlo;
use App\Models\Telepules;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Log;


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
        Log::info('Store request data:', $request->all());

        $sirberloValidator = Validator::make(
            $request->all(),
            [
                'nev'                => 'required|string|max:255',
                'kozterulet_neve'    => 'required|string|max:255',
                'kozterulet_tipus_id' => 'nullable|integer|exists:kozterulet_tipus,id',
                'email_cim'          => 'nullable|email|max:255',
                'telefonszam'        => 'nullable|string|max:30',
                'hazszam'            => 'required',
                'telepules_ir_szam'  => 'required',
                'telepules_nev'      => 'required|string|max:255'
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

        try {
            $telepulesIrszam = (int)$data['telepules_ir_szam'];
            $telepulesNev = trim($data['telepules_nev']);

            Log::info("Keresés: ir_szam=$telepulesIrszam, nev=$telepulesNev");


            $telepules = Telepules::where('ir_szam', $telepulesIrszam)
                ->where('nev', $telepulesNev)
                ->first();


            if (!$telepules) {
                Log::info("Új település létrehozása: ir_szam=$telepulesIrszam, nev=$telepulesNev");
                $telepules = new Telepules();
                $telepules->ir_szam = $telepulesIrszam;
                $telepules->nev = $telepulesNev;
                $telepules->save();
                Log::info("Település létrehozva: ID=" . $telepules->id);
            } else {
                Log::info("Település megtalálva: ID=" . $telepules->id);
            }

            $sirberlo = new Sirberlo();
            $sirberlo->nev                 = $data['nev'];
            $sirberlo->kozterulet_neve     = $data['kozterulet_neve'];
            $sirberlo->kozterulet_tipus_id = $data['kozterulet_tipus_id'] ?? null;
            $sirberlo->hazszam             = $data['hazszam'];
            $sirberlo->telepules_id        = $telepules->id;
            $sirberlo->email_cim           = $data['email_cim'] ?? null;
            $sirberlo->telefonszam         = $data['telefonszam'] ?? null;
            $sirberlo->save();

            Log::info("Sírbérlő mentve: ID=" . $sirberlo->id);

            return response()->json([
                'success' => true,
                'message' => 'Sírbérlő rögzítve.',
                'data'    => $sirberlo,
            ], 201);
        } catch (\Exception $e) {
            Log::error('Sirberlo store error: ' . $e->getMessage());
            Log::error('Stack trace: ' . $e->getTraceAsString());
            return response()->json([
                'success' => false,
                'message' => 'Hiba történt a mentés során: ' . $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $sirberlo = Sirberlo::find($id);
        if (!empty($sirberlo)) {
            return response()->json($sirberlo);
        } else {
            return response()->json(["message" => "Nincs sírbérlő ezzel az id-val."], 404);
        }
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
    public function update(Request $request, string $id)
    {
        $sirberloValidator = Validator::make(
            $request->all(),
            [
                'nev'                => 'required|string|max:255',
                'kozterulet_neve'    => 'required|string|max:255',
                'kozterulet_tipus_id' => 'nullable|integer|exists:kozterulet_tipus,id',
                'email_cim'          => 'nullable|email|max:255',
                'telefonszam'        => 'nullable|string|max:30',
                'hazszam'            => 'required',
                'telepules_ir_szam'  => 'required|integer',
                'telepules_nev'      => 'required|string|max:255'
            ],
            [
                'nev.required'               => 'A név megadása kötelező.',
                'kozterulet_neve.required'   => 'A közterület neve kötelező.',
                'hazszam.required'           => 'A házszám megadása kötelező.',
                'telepules_ir_szam.required' => 'Az irányítószám megadása kötelező.',
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
        if (!$sirberlo) {
            return response()->json(["message" => "Nincs sírbérlő ezzel az id-val."], 404);
        }

        $data = $sirberloValidator->validated();

        try {
            $telepulesIrszam = (int)$data['telepules_ir_szam'];
            $telepulesNev = trim($data['telepules_nev']);

           
            $telepules = Telepules::where('ir_szam', $telepulesIrszam)
                ->where('nev', $telepulesNev)
                ->first();

            
            if (!$telepules) {
                $telepules = new Telepules();
                $telepules->ir_szam = $telepulesIrszam;
                $telepules->nev = $telepulesNev;
                $telepules->save();
            }

            $sirberlo->nev                 = $data['nev'];
            $sirberlo->kozterulet_neve     = $data['kozterulet_neve'];
            $sirberlo->hazszam             = $data['hazszam'];
            $sirberlo->kozterulet_tipus_id = $data['kozterulet_tipus_id'] ?? null;
            $sirberlo->telepules_id        = $telepules->id;
            $sirberlo->email_cim           = $data['email_cim'] ?? null;
            $sirberlo->telefonszam         = $data['telefonszam'] ?? null;
            $sirberlo->save();

            return response()->json(["message" => "Sírbérlő sikeresen módosítva!"], 202);
        } catch (\Exception $e) {
            Log::error('Sirberlo update error: ' . $e->getMessage());
            return response()->json([
                'success' => false,
                'message' => 'Hiba történt a módosítás során: ' . $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
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
