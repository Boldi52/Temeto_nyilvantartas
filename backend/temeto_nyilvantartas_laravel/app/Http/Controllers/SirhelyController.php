<?php

namespace App\Http\Controllers;

use App\Models\Sirhely;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Symfony\Component\HttpFoundation\StreamedResponse;

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
    public function openPhoto(string $path)
{
    $decodedPath = urldecode($path);

    if (!Storage::disk('public')->exists($decodedPath)) {
        return response()->json([
            'success' => false,
            'message' => 'A fájl nem található.',
        ], 404);
    }


    return Storage::disk('public')->response($decodedPath);
}

public function downloadPhoto(string $path): StreamedResponse|JsonResponse
{
    $decodedPath = urldecode($path);

    if (!Storage::disk('public')->exists($decodedPath)) {
        return response()->json([
            'success' => false,
            'message' => 'A fájl nem található.',
        ], 404);
    }

    $filename = basename($decodedPath);

    // letöltés
    return Storage::disk('public')->download($decodedPath, $filename);
}

    /**
     * Sírhely darabszám
     */
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

   
    public function store(Request $request)
    {
        $sirhelyValidator = Validator::make(
            $request->all(),
            [
                'sor_id' => 'required|integer|exists:sor,id',
                'sorszam' => 'nullable|integer|min:1|max:9999',
                'sirhely_tipus_id' => 'required|integer|exists:sirhely_tipus,id',
                'allapot' => 'nullable|string|max:255',
                'sirberlo_id' => 'nullable|integer|exists:sirberlo,id',

                'file' => 'required|file|mimes:jpg,jpeg,png,webp|max:5120',
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

                'sirberlo_id.integer' => 'A sírbérlő azonosító csak szám lehet.',
                'sirberlo_id.exists' => 'A megadott sírbérlő nem található.',

                'file.required' => 'A fotó feltöltése kötelező.',
                'file.file' => 'A küldött adat nem fájl.',
                'file.mimes' => 'Csak jpg, jpeg, png, webp fájl tölthető fel.',
                'file.max' => 'A fájl mérete legfeljebb 5 MB lehet.',
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

        $path = $request->file('file')->store('sirhelyek', 'public');

        $sirhely = new Sirhely();
        $sirhely->sor_id = $data['sor_id'];
        $sirhely->sorszam = $data['sorszam'] ?? null;
        $sirhely->sirhely_tipus_id = $data['sirhely_tipus_id'];
        $sirhely->allapot = $data['allapot'] ?? null;
        $sirhely->foto = $path;
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

   
    public function update(Request $request, string $sirhely)
    {
        $sirhelyRecord = Sirhely::find($sirhely);

        if (!$sirhelyRecord) {
            return response()->json(['message' => 'Nincs sírhely ezzel az id-val.'], 404);
        }

        $sirhelyValidator = Validator::make(
            $request->all(),
            [
                'sor_id' => 'required|integer|exists:sor,id',
                'sorszam' => 'nullable|integer|min:1|max:9999',
                'sirhely_tipus_id' => 'required|integer|exists:sirhely_tipus,id',
                'allapot' => 'nullable|string|max:255',
                'sirberlo_id' => 'nullable|integer|exists:sirberlo,id',

                'file' => 'nullable|file|mimes:jpg,jpeg,png,webp|max:5120',
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

                'sirberlo_id.integer' => 'A sírbérlő azonosító csak szám lehet.',
                'sirberlo_id.exists' => 'A megadott sírbérlő nem található.',

                'file.file' => 'A küldött adat nem fájl.',
                'file.mimes' => 'Csak jpg, jpeg, png, webp fájl tölthető fel.',
                'file.max' => 'A fájl mérete legfeljebb 5 MB lehet.',
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

        $sirhelyRecord->sor_id = $data['sor_id'];
        $sirhelyRecord->sorszam = $data['sorszam'] ?? null;
        $sirhelyRecord->sirhely_tipus_id = $data['sirhely_tipus_id'];
        $sirhelyRecord->allapot = $data['allapot'] ?? null;
        $sirhelyRecord->sirberlo_id = $data['sirberlo_id'] ?? null;

        if ($request->hasFile('file')) {
            if (!empty($sirhelyRecord->foto) && Storage::disk('public')->exists($sirhelyRecord->foto)) {
                Storage::disk('public')->delete($sirhelyRecord->foto);
            }

            $newPath = $request->file('file')->store('sirhelyek', 'public');
            $sirhelyRecord->foto = $newPath;
        }

        $sirhelyRecord->save();

        return response()->json([
            'success' => true,
            'message' => 'Sírhely sikeresen módosítva!',
            'data' => $sirhelyRecord,
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     * Törlés (fájllal együtt)
     */
    public function destroy(string $id)
    {
        $sirhelyTorles = Sirhely::find($id);

        if (!$sirhelyTorles) {
            return response()->json([
                'success' => false,
                'message' => 'Nincs sírhely ezzel az id-val!',
            ], 404);
        }

        // kapcsolódó fotó törlése
        if (!empty($sirhelyTorles->foto) && Storage::disk('public')->exists($sirhelyTorles->foto)) {
            Storage::disk('public')->delete($sirhelyTorles->foto);
        }

        $sirhelyTorles->delete();

        return response()->json([
            'success' => true,
            'message' => 'Sírhely sikeresen törölve!',
        ], 200);
    }
}