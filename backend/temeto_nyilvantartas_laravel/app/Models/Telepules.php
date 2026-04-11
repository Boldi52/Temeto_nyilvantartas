<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Telepules extends Model
{
    protected $table = 'telepules';

    public $primaryKey = 'id';
    
    protected $fillable = ['ir_szam', 'nev'];
    
    public $timestamps = true;

    public function sirbnerlok()
    {
        return $this->hasMany(Sirberlo::class, 'telepules_id', 'id');
    }


}