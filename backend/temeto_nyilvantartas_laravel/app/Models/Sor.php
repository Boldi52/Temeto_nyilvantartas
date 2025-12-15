<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sor extends Model
{
    protected $table = 'sor';

    public $incrementing = true;
    protected $keyType = 'int';
    public $timestamps = true;

   
    /**
     * Kapcsolat a parcella táblához (1-to-1, belongsTo).
     */
    public function parcella()
    {
        return $this->belongsTo(Parcella::class, 'parcella_id', 'id');
    }

    /**
     * Kapcsolat a sirhely táblához (1-to-many, hasMany).
     */
    public function sirhelyek()
    {
        return $this->hasMany(Sirhely::class, 'sor_id', 'id');
    }
}

