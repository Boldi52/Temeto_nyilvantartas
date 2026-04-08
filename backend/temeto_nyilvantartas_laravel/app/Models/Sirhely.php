<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sirhely extends Model
{
    protected $table = 'sirhely';

    public $incrementing = true;
    protected $keyType = 'int';
    public $timestamps = true;

    protected $fillable = [
        'sor_id',
        'sirkod',
        'tipus',
        'allapot',
        'foto',
        'sirberlo_id',
    ];

    public function sirberlo()
    {
        return $this->belongsTo(Sirberlo::class, 'sirberlo_id', 'id');
    }

    public function sor()
    {
        return $this->belongsTo(Sor::class, 'sor_id', 'id');
    }

    public function sirhelyTipusok()
    {
        return $this->hasMany(Sirhely_tipus::class, 'sirhely_id', 'id');
    }

    public function dokumentumok()
    {
        return $this->hasMany(Dokumentum::class, 'sirhely_id', 'id');
    }

    public function elhunytak()
    {
        return $this->hasMany(Elhunyt::class, 'sirhely_id', 'id');
    }
}
