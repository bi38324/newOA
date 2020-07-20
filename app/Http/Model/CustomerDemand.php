<?php

namespace App\Http\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CustomerDemand extends Model
{
    protected $table = 'customer_demand';
    protected $guarded = [];
    use SoftDeletes;

    public function getByCustomerId($customer_id)
    {
        return $this->where('customer_id', $customer_id)->get()->toArray();
    }

    public function customer()
    {
        return $this->hasOne(Customer::class, 'id', 'customer_id');
    }
}
