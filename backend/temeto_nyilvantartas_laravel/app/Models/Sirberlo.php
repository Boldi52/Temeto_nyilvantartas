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

    public function telepules()
    {
        return $this->belongsTo(Telepules::class, 'telepules_id', 'id');
    }


    public function sirhelyek()
    {
        return $this->hasMany(Sirhely::class, 'sirberlo_id', 'id');
    }

  
    public function befizetesek()
    {
        return $this->hasMany(Befizetes::class, 'sirberlo_id', 'id');
    }

  
    public function dokumentumok()
    {
        return $this->hasMany(Dokumentum::class, 'sirberlo_id', 'id');
    }
}
