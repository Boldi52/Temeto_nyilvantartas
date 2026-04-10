<?php

namespace App\Http\Controllers;

use App\Models\Dokumentum;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class DokumentumController extends Controller
{
    /**
     * Dokumentumok listázása
     */
    public function index()
    {
        $dokumentumok = Dokumentum::orderByDesc('id')->get();
        return response()->json($dokumentumok);
    }

    /**
     * Új dokumentum mentése (fájlfeltöltéssel)
     */
    public function store(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'sirhely_id'  => 'nullable|integer|exists:sirhely,id',
                'sirberlo_id' => 'nullable|integer|exists:sirberlo,id',
                'tipus'       => 'nullable|string|max:255',
                'dokumentum_tipus_id' => 'required|exists:dokumentum_tipus,id',
                'datum'       => 'nullable|date',
                'leiras'      => 'nullable|string|max:1000',

                // fájl kötelező új mentésnél
                'file'        => 'required|file|mimes:pdf,jpg,jpeg,png,doc,docx|max:10240',
            ],
            [
                'sirhely_id.integer'  => 'A sírhely azonosító csak szám lehet.',
                'sirhely_id.exists'   => 'A megadott sírhely nem található.',

                'sirberlo_id.integer' => 'A sírbérlő azonosító csak szám lehet.',
                'sirberlo_id.exists'  => 'A megadott sírbérlő nem található.',

                'tipus.string'        => 'A típus szöveg típusú legyen.',
                'tipus.max'           => 'A típus legfeljebb 255 karakter lehet.',

                'datum.date'          => 'A dátum formátuma nem megfelelő.',

                'leiras.string'       => 'A leírás szöveg típusú legyen.',
                'leiras.max'          => 'A leírás legfeljebb 1000 karakter lehet.',

                'file.required'       => 'A fájl feltöltése kötelező.',
                'file.file'           => 'A küldött adat nem fájl.',
                'file.mimes'          => 'Csak pdf, jpg, jpeg, png, doc, docx fájl tölthető fel.',
                'file.max'            => 'A fájl mérete legfeljebb 10 MB lehet.',
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

        // fájl mentése: storage/app/public/dokumentumok
        $path = $request->file('file')->store('dokumentumok', 'public');

        $dokumentum = new Dokumentum();
        $dokumentum->sirhely_id      = $data['sirhely_id'] ?? null;
        $dokumentum->sirberlo_id     = $data['sirberlo_id'] ?? null;
        $dokumentum->tipus           = $data['tipus'] ?? null;
        $dokumentum->dokumentum_tipus_id = $data['dokumentum_tipus_id'];
        $dokumentum->datum           = $data['datum'] ?? null;
        $dokumentum->leiras          = $data['leiras'] ?? null;
        $dokumentum->fajl_utvonal    = $path;
        $dokumentum->eredeti_fajlnev = $request->file('file')->getClientOriginalName();
        $dokumentum->mime_type       = $request->file('file')->getClientMimeType();
        $dokumentum->save();

        return response()->json([
            'success' => true,
            'message' => 'Dokumentum sikeresen rögzítve!',
            'data'    => $dokumentum,
        ], 201);
    }

    /**
     * Egy dokumentum lekérdezése
     */
    public function show(string $id)
    {
        $dokumentum = Dokumentum::find($id);

        if (!$dokumentum) {
            return response()->json([
                'success' => false,
                'message' => 'Nincs dokumentum ezzel az id-val.',
            ], 404);
        }

        return response()->json($dokumentum);
    }

    /**
     * Dokumentum módosítása (fájl csere opcionális)
     */
    public function update(Request $request, string $id)
    {
        $dokumentum = Dokumentum::find($id);

        if (!$dokumentum) {
            return response()->json([
                'success' => false,
                'message' => 'Nincs dokumentum ezzel az id-val.',
            ], 404);
        }

        $validator = Validator::make(
            $request->all(),
            [
                'sirhely_id'  => 'nullable|integer|exists:sirhely,id',
                'sirberlo_id' => 'nullable|integer|exists:sirberlo,id',
                'tipus'       => 'nullable|string|max:255',
                'datum'       => 'nullable|date',
                'leiras'      => 'nullable|string|max:1000',

                // update-nél nem kötelező
                'file'        => 'nullable|file|mimes:pdf,jpg,jpeg,png,doc,docx|max:10240',
            ],
            [
                'sirhely_id.integer'  => 'A sírhely azonosító csak szám lehet.',
                'sirhely_id.exists'   => 'A megadott sírhely nem található.',

                'sirberlo_id.integer' => 'A sírbérlő azonosító csak szám lehet.',
                'sirberlo_id.exists'  => 'A megadott sírbérlő nem található.',

                'tipus.string'        => 'A típus szöveg típusú legyen.',
                'tipus.max'           => 'A típus legfeljebb 255 karakter lehet.',

                'datum.date'          => 'A dátum formátuma nem megfelelő.',

                'leiras.string'       => 'A leírás szöveg típusú legyen.',
                'leiras.max'          => 'A leírás legfeljebb 1000 karakter lehet.',

                'file.file'           => 'A küldött adat nem fájl.',
                'file.mimes'          => 'Csak pdf, jpg, jpeg, png, doc, docx fájl tölthető fel.',
                'file.max'            => 'A fájl mérete legfeljebb 10 MB lehet.',
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

        $dokumentum->sirhely_id  = $data['sirhely_id'] ?? null;
        $dokumentum->sirberlo_id = $data['sirberlo_id'] ?? null;
        $dokumentum->tipus       = $data['tipus'] ?? null;
        $dokumentum->datum       = $data['datum'] ?? null;
        $dokumentum->leiras      = $data['leiras'] ?? null;

        if ($request->hasFile('file')) {
            // régi fájl törlése
            if (!empty($dokumentum->fajl_utvonal) && Storage::disk('public')->exists($dokumentum->fajl_utvonal)) {
                Storage::disk('public')->delete($dokumentum->fajl_utvonal);
            }

            $newPath = $request->file('file')->store('dokumentumok', 'public');
            $dokumentum->fajl_utvonal    = $newPath;
            $dokumentum->eredeti_fajlnev = $request->file('file')->getClientOriginalName();
            $dokumentum->mime_type       = $request->file('file')->getClientMimeType();
        }

        $dokumentum->save();

        return response()->json([
            'success' => true,
            'message' => 'Dokumentum sikeresen módosítva!',
            'data'    => $dokumentum,
        ], 200);
    }

    /**
     * Dokumentum törlése (fájllal együtt)
     */
    public function destroy(string $id)
    {
        $dokumentum = Dokumentum::find($id);

        if (!$dokumentum) {
            return response()->json([
                'success' => false,
                'message' => 'Nincs dokumentum ezzel az id-val.',
            ], 404);
        }

        if (!empty($dokumentum->fajl_utvonal) && Storage::disk('public')->exists($dokumentum->fajl_utvonal)) {
            Storage::disk('public')->delete($dokumentum->fajl_utvonal);
        }

        $dokumentum->delete();

        return response()->json([
            'success' => true,
            'message' => 'Dokumentum sikeresen törölve!',
        ], 200);
    }
}
