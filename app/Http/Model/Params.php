<?php

namespace App\Http\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Params extends Model
{
    protected $table = 'params';
    protected $guarded = [];
    use SoftDeletes;
}
