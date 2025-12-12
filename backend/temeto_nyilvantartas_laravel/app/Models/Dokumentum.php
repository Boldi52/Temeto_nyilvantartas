<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Dokumentum extends Model
{
    protected $table = 'dokumentum';
    public $incrementing = true;
    protected $keyType = 'int';
    public $timestamps = true;
}
