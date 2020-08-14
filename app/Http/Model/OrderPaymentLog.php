<?php

namespace App\Http\Model;

use Illuminate\Database\Eloquent\Model;

class OrderPaymentLog extends Model
{
    protected $table = 'order_payment_log';
    protected $guarded = [];

    public function admin_user()
    {
        return $this->belongsTo(AdminUsers::class, 'admin_user_id', 'id');
    }

    public function pay_type()
    {
        return $this->belongsTo(PayType::class, 'id', 'pay_type_id');
    }

    public function getLastInfo($orders_renew_log_id)
    {
        return $this->where('orders_renew_log_id', $orders_renew_log_id)->orderBy('created_at', 'desc')->first();
    }
}
