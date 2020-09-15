<?php

namespace App\Http\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class OrdersServiceReport extends Model
{
    protected $table = 'orders_service_report';
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
}
