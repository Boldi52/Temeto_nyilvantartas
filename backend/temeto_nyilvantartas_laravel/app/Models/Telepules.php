<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Telepules extends Model
{
    protected $table = 'Telepules';
    protected $primaryKey = 'ir_szam';
    public $incrementing = false;
    protected $keyType = 'string';
    public $timestamps = true;

    public function sirberlok()
    {
        return $this->hasMany(Sirberlo::class, 'ir_szam', 'ir_szam');
    }
}
