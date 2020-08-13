<?php

namespace App\Http\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class OrdersRenewLog extends Model
{
    protected $table = 'orders_renew_log';
    protected $guarded = [];
    use SoftDeletes;

    public function orders()
    {
        return $this->belongsTo(Orders::class, 'orders_id', 'id');
    }

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }

    public function admin_user()
    {
        return $this->belongsTo(AdminUsers::class, 'owner_user_id', 'id');
    }
}
