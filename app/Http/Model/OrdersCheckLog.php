<?php

namespace App\Http\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class OrdersCheckLog extends Model
{
    protected $table = 'orders_check_log';
    protected $guarded = [];
    use SoftDeletes;

    public function orders()
    {
        return $this->belongsTo(Orders::class, 'orders_id', 'id');
    }

    public function admin_user()
    {
        return $this->belongsTo(AdminUsers::class, 'admin_user_id', 'id');
    }

    public function customer_contact()
    {
        return $this->belongsTo(CustomerContact::class, 'customer_check_contact', 'id');
    }
}
