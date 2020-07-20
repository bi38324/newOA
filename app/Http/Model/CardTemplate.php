<?php

namespace App\Http\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CardTemplate extends Model
{
    protected $table = 'card_template';
    protected $guarded = [];
    use SoftDeletes;
}
