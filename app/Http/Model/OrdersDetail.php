<?php

namespace App\Http\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class OrdersDetail extends Model
{
    protected $table = 'orders_detail';
    protected $guarded = [];
    use SoftDeletes;

    public function product_params()
    {
        return $this->belongsTo(Params::class, 'params_id', 'id');
    }

    public function getByOrdersId($orders_id)
    {
        return $this->where('orders_id', $orders_id)->get()->toArray();
    }
}
