<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sirhely extends Model
{
    protected $table = 'sirhely';

    public $incrementing = true;
    protected $keyType = 'int';
    public $timestamps = true;
    public function sirberlo()
    {
        return $this->belongsTo(Sirberlo::class, 'sirberlo_id', 'id');
    }

    /**
     * Kapcsolat a sor táblához (1-to-1, belongsTo).
     */
    public function sor()
    {
        return $this->belongsTo(Sor::class, 'sor_id', 'id');
    }

    /**
     * Kapcsolat a sirhely_tipus táblához (1-to-many, hasMany).
     */
    public function sirhelyTipusok()
    {
        return $this->hasMany(Sirhely_tipus::class, 'sirhely_id', 'id');
    }

    /**
     * Kapcsolat a dokumentum táblához (1-to-many, hasMany).
     */
    public function dokumentumok()
    {
        return $this->hasMany(Dokumentum::class, 'sirhely_id', 'id');
    }

    /**
     * Kapcsolat az elhunyt táblához (1-to-many, hasMany).
     */
    public function elhunytak()
    {
        return $this->hasMany(Elhunyt::class, 'sirhely_id', 'id');
    }
}

