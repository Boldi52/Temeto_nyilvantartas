<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sirberlo extends Model
{
    protected $table = 'sirberlo';
    public $incrementing = true;
    protected $keyType = 'int';
    public $timestamps = true;
     public function kozteruletTipus()
    {
        return $this->belongsTo(Kozterulet_tipus::class, 'kozterulet_tipus_id', 'id');
    }

    /**
     * Kapcsolat a telepules táblához (1-to-1, belongsTo).
     */
    public function telepules()
    {
        return $this->belongsTo(Telepules::class, 'ir_szam', 'ir_szam');
    }

    /**
     * Kapcsolat a sirhely táblához (1-to-many, hasMany).
     */
    public function sirhelyek()
    {
        return $this->hasMany(Sirhely::class, 'sirberlo_id', 'id');
    }

    /**
     * Kapcsolat a befizetes táblához (1-to-many, hasMany).
     */
    public function befizetesek()
    {
        return $this->hasMany(Befizetes::class, 'sirberlo_id', 'id');
    }

    /**
     * Kapcsolat a dokumentum táblához (1-to-many, hasMany).
     */
    public function dokumentumok()
    {
        return $this->hasMany(Dokumentum::class, 'sirberlo_id', 'id');
    }
}

