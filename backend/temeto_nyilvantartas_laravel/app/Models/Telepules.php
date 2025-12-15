<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Telepules extends Model
{
    protected $table = 'Telepules';
    public $incrementing = false;
    protected $keyType = 'int';
    public $timestamps = true;

    public function sirberlok()
    {
        return $this->hasMany(Sirberlo::class, 'ir_szam', 'ir_szam');
    }
}

