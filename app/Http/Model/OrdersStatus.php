<?php

namespace App\Http\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class OrdersStatus extends Model
{
    protected $table = 'orders_status';
    protected $guarded = [];
    use SoftDeletes;
}
