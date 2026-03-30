<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Telepules extends Model
{
    protected $table = 'telepules';
    
    // Ezek a mezők lehetnek tömeges hozzárendelésben
    protected $fillable = ['ir_szam', 'nev'];
    
    public $timestamps = true;
}