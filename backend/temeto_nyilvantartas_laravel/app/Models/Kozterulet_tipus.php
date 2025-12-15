<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Kozterulet_tipus extends Model
{
    protected $table = 'kozterulet_tipus';

    public $incrementing = true;
    protected $keyType = 'int';
    public $timestamps = true;

   public function sirberlok()
    {
        return $this->hasMany(Sirberlo::class, 'kozterulet_tipus_id', 'id');
    }
}

