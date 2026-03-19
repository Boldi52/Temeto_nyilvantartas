<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Elhunyt extends Model
{
    use HasFactory;
    protected $table = 'elhunyt';

    public $incrementing = true;
    protected $keyType = 'int';
    public $timestamps = true;

    public function sirhely()
    {
        return $this->belongsTo(Sirhely::class, 'sirhely_id', 'id');
    }

    
    public function halottiAnyakonyviKivonat()
    {
        return $this->belongsTo(Dokumentum::class, 'halotti_anyakonyvi_kiv', 'id');
    }

    public function befizetesek()
    {
        return $this->hasMany(Befizetes::class, 'elhunyt_id');
    }
    

}
