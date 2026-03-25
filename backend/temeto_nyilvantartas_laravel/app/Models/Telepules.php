<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Telepules extends Model
{
    protected $table = 'Telepules';
    protected $primaryKey = 'id';
    public $incrementing = false;
    protected $keyType = 'string';
    public $timestamps = true;

    public function sirberlok()
    {
        return $this->hasMany(Sirberlo::class, 'telepules_id', 'id');
    }
}
