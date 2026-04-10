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
    public function sirhelyek()
    {
        return $this->hasMany(Sirhely::class, 'sirhely_tipus_id');
    }
}
