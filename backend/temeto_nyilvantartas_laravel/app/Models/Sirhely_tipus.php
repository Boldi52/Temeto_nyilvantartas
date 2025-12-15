<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sirhely_tipus extends Model
{
    protected $table = 'sirhely_tipus';

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
}

