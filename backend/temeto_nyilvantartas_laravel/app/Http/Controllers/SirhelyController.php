<?php

namespace App\Http\Controllers;

use App\Models\Sirhely;
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
            ->select('id', 'sor_id', 'sorszam', 'sirhely_tipus_id', 'allapot', 'foto', 'sirberlo_id')
            ->orderBy('sorszam', 'asc');

        if ($request->filled('sor_id')) {
            $query->where('sor_id', $request->sor_id);
        }

        return response()->json($query->get());
    }

    public function count(): JsonResponse
    {
        return response()->json([
            'graves' => Sirhely::count(),
        ]);
    }

    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $sirhelyValidator = Validator::make(
            $request->all(),
            [
                'sor_id' => 'required|integer|exists:sor,id',
                'sorszam' => 'nullable|integer|min:1|max:9999',
                'sirhely_tipus_id' => 'required|integer|exists:sirhely_tipus,id',
                'allapot' => 'nullable|string|max:255',
                'foto' => 'nullable|string|max:255',
                'sirberlo_id' => 'nullable|integer|exists:sirberlo,id',
            ],
            [
                'sor_id.required' => 'A sor megadása kötelező.',
                'sor_id.integer' => 'A sor azonosító csak szám lehet.',
                'sor_id.exists' => 'A megadott sor nem található.',

                'sorszam.integer' => 'A sorszám csak szám lehet.',
                'sorszam.min' => 'A sorszám minimum 1 lehet.',
                'sorszam.max' => 'A sorszám túl nagy érték.',

                'sirhely_tipus_id.required' => 'A sírhely típus megadása kötelező.',
                'sirhely_tipus_id.integer' => 'A sírhely típus azonosító csak szám lehet.',
                'sirhely_tipus_id.exists' => 'A megadott sírhely típus nem található.',

                'allapot.string' => 'Az állapot szöveg típusú legyen.',
                'allapot.max' => 'Az állapot legfeljebb 255 karakter lehet.',

                'foto.string' => 'A fotó elérési útja szöveg típusú legyen.',
                'foto.max' => 'A fotó elérési útja legfeljebb 255 karakter lehet.',

                'sirberlo_id.integer' => 'A sírbérlő azonosító csak szám lehet.',
                'sirberlo_id.exists' => 'A megadott sírbérlő nem található.',
            ]
        );

        if ($sirhelyValidator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Az adatok nem megfelelőek!',
                'errors' => $sirhelyValidator->errors()->toArray(),
            ], 422);
        }

        $data = $sirhelyValidator->validated();

        $sirhely = new Sirhely();
        $sirhely->sor_id = $data['sor_id'];
        $sirhely->sorszam = $data['sorszam'] ?? null;
        $sirhely->sirhely_tipus_id = $data['sirhely_tipus_id'];
        $sirhely->allapot = $data['allapot'] ?? null;
        $sirhely->foto = $data['foto'] ?? null;
        $sirhely->sirberlo_id = $data['sirberlo_id'] ?? null;
        $sirhely->save();

        return response()->json([
            'success' => true,
            'message' => 'Sírhely rögzítve.',
            'data' => $sirhely,
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $sirhely = Sirhely::find($id);

        if (!$sirhely) {
            return response()->json(['message' => 'Nincs sírhely ezzel az id-val.'], 404);
        }

        return response()->json($sirhely);
    }

    public function edit(Sirhely $sirhely)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $sirhely)
    {
        $sirhelyValidator = Validator::make(
            $request->all(),
            [
                'sor_id' => 'required|integer|exists:sor,id',
                'sorszam' => 'nullable|integer|min:1|max:9999',
                'sirhely_tipus_id' => 'required|integer|exists:sirhely_tipus,id',
                'allapot' => 'nullable|string|max:255',
                'foto' => 'nullable|string|max:255',
                'sirberlo_id' => 'nullable|integer|exists:sirberlo,id',
            ],
            [
                'sor_id.required' => 'A sor megadása kötelező.',
                'sor_id.integer' => 'A sor azonosító csak szám lehet.',
                'sor_id.exists' => 'A megadott sor nem található.',

                'sorszam.integer' => 'A sorszám csak szám lehet.',
                'sorszam.min' => 'A sorszám minimum 1 lehet.',
                'sorszam.max' => 'A sorszám túl nagy érték.',

                'sirhely_tipus_id.required' => 'A sírhely típus megadása kötelező.',
                'sirhely_tipus_id.integer' => 'A sírhely típus azonosító csak szám lehet.',
                'sirhely_tipus_id.exists' => 'A megadott sírhely típus nem található.',

                'allapot.string' => 'Az állapot szöveg típusú legyen.',
                'allapot.max' => 'Az állapot legfeljebb 255 karakter lehet.',

                'foto.string' => 'A fotó elérési útja szöveg típusú legyen.',
                'foto.max' => 'A fotó elérési útja legfeljebb 255 karakter lehet.',

                'sirberlo_id.integer' => 'A sírbérlő azonosító csak szám lehet.',
                'sirberlo_id.exists' => 'A megadott sírbérlő nem található.',
            ]
        );

        if ($sirhelyValidator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Az adatok nem megfelelőek!',
                'errors' => $sirhelyValidator->errors()->toArray(),
            ], 422);
        }

        $sirhelyRecord = Sirhely::find($sirhely);

        if (!$sirhelyRecord) {
            return response()->json(['message' => 'Nincs sírhely ezzel az id-val.'], 404);
        }

        $data = $sirhelyValidator->validated();

        $sirhelyRecord->sor_id = $data['sor_id'];
        $sirhelyRecord->sorszam = $data['sorszam'] ?? null;
        $sirhelyRecord->sirhely_tipus_id = $data['sirhely_tipus_id'];
        $sirhelyRecord->allapot = $data['allapot'] ?? null;
        $sirhelyRecord->foto = $data['foto'] ?? null;
        $sirhelyRecord->sirberlo_id = $data['sirberlo_id'] ?? null;
        $sirhelyRecord->save();

        return response()->json(['message' => 'Sírhely sikeresen módosítva!'], 202);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $sirhelyTorles = Sirhely::find($id);

        if (!$sirhelyTorles) {
            return response()->json(['message' => 'Nincs sírhely ezzel az id-val!'], 404);
        }

        $sirhelyTorles->delete();
        return response()->json(['message' => 'Sírhely sikeresen törölve!']);
    }
}
