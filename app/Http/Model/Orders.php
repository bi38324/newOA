<?php

namespace App\Http\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Orders extends Model
{
    protected $table = 'orders';
    protected $guarded = [];
    protected $appends = ['file_url'];
    use SoftDeletes;

    // 创建一个订单号
    public function createOrderNumb()
    {
        mt_srand((double)microtime() * 10000);
        $char_arr = strtoupper(md5(uniqid(rand(), true)));
        $leng = strlen($char_arr);
        $_index = rand(0, $leng - 8);
        $_str = substr($char_arr, $_index, 8);

        $date = new \DateTime();
        $f = date_format($date, 'YmdHisu');

        $order_num = $f . $_str;
        return $order_num;
    }

    public function orders_detail()
    {
        return $this->hasMany(OrdersDetail::class,'orders_id','id');
    }

    public function orders_status()
    {
        return $this->belongsTo(OrdersStatus::class,'id','orders_id');
    }

    public function admin_user()
    {
        return $this->hasOne(AdminUsers::class, 'id', 'admin_user_id');
    }

    public function product()
    {
        return $this->hasOne(Product::class, 'id', 'product_id');
    }

    public function customer_demand()
    {
        return $this->hasOne(CustomerDemand::class, 'id', 'customer_demand_id');
    }

    public function orders_renew()
    {
        return $this->hasMany(OrdersRenewLog::class,'orders_id','id');
    }

    public function getFileUrlAttribute()
    {
        $file_url = env('APP_URL').'upload/'.$this->file_path;

        return $file_url;
    }

    public function getById($id)
    {
        return $this->where('id', $id)->get()->toArray();
    }

    public function getByCustomerDemandId($customer_demand_id)
    {
        return $this->where('customer_demand_id', $customer_demand_id)->get()->toArray();
    }

    public function updateByIds($ids, $params, $params_value)
    {
        foreach ($ids as $key => $value)
        {
            $orders = $this->where('id', $value)->firstOrFail();
            if ($orders)
            {
                $orders->update([$params => $params_value]);
            }
        }
        return true;
    }
}
