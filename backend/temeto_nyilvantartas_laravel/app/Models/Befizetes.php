<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Befizetes extends Model
{
    protected $table = 'befizetes';

    public $incrementing = true; 
    protected $keyType = 'int'; 
    
    public $timestamps = true;
    public function dokumentum()
    {
        return $this->belongsTo(Dokumentum::class, 'dokumentum_id', 'id');
    }   
}



