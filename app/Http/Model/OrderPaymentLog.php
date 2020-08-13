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
}
