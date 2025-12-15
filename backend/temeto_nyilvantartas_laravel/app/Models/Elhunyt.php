<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Elhunyt extends Model
{
    protected $table = 'elhunyt';

    public $incrementing = true;
    protected $keyType = 'int';
    public $timestamps = true;
    
    /**
     * Kapcsolat a sirhely táblához (1-to-1, belongsTo).
     */
    public function sirhely()
    {
        return $this->belongsTo(Sirhely::class, 'sirhely_id', 'id');
    }

    /**
     * Kapcsolat a dokumentum táblához (1-to-1, belongsTo).
     */
    public function halottiAnyakonyviKivonat()
    {
        return $this->belongsTo(Dokumentum::class, 'halotti_anyakonyvi_kiv', 'id');
    }
}
