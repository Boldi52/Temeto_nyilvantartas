<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Dokumentum_tipus extends Model
{
    protected $table = 'dokumentum_tipus';

    public $incrementing = true;
    protected $keyType = 'int';
    public $timestamps = true;

    public function dokumentum()
    {
        return $this->belongsTo(Dokumentum::class, 'dokumentum_id', 'id');
    }
}

