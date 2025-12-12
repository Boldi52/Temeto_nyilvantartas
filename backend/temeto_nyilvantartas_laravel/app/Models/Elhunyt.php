<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Elhunyt extends Model
{
    protected $table = 'elhunyt';

    public $incrementing = true;
    protected $keyType = 'int';
    public $timestamps = true;
}
