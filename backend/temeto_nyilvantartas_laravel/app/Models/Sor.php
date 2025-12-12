<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sor extends Model
{
    protected $table = 'sor';

    public $incrementing = true;
    protected $keyType = 'int';
    public $timestamps = true;
}

