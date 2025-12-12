<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sirhely extends Model
{
    protected $table = 'sirhely';

    public $incrementing = true;
    protected $keyType = 'int';
    public $timestamps = true;
}

