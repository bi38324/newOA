<?php

namespace App\Http\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CustomerDemand extends Model
{
    protected $table = 'customer_demand';
    protected $guarded = [];
    use SoftDeletes;

    public function getByCustomerId($customer_id, $last_user_id = null)
    {
        if ($last_user_id)
        {
            return $this->where('customer_id', $customer_id)->where('last_user_id', $last_user_id)->get()->toArray();
        } else {
            return $this->where('customer_id', $customer_id)->get()->toArray();
        }
    }

    public function customer_contact()
    {
        return $this->hasOne(CustomerContactDemand::class, 'customer_demand_id', 'id');
    }

    public function customer()
    {
        return $this->hasOne(Customer::class, 'id', 'customer_id');
    }

    public function owner_user()
    {
        return $this->hasOne(AdminUsers::class, 'id', 'owner_user_id');
    }

    public function last_user()
    {
        return $this->hasOne(AdminUsers::class, 'id', 'last_user_id');
    }

    public function getByLastUser($last_user_id)
    {
        return $this->where('last_user_id', $last_user_id)->get()->toArray();
    }
}
