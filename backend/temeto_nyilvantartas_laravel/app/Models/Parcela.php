<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Parcela extends Model
{
    protected $table = 'parcella';

    public $incrementing = true;
    protected $keyType = 'int';
    public $timestamps = true;
}

