<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Parcela extends Model
{
    protected $table = 'parcella';

    public $incrementing = true;
    protected $keyType = 'int';
    public $timestamps = true;
    
   
    /**
     * Kapcsolat a sor táblához (1-to-many, hasMany).
     */
    public function sorok()
    {
        return $this->hasMany(Sor::class, 'parcella_id', 'id');
    }
}

