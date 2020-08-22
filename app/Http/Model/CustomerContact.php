<?php

namespace App\Http\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CustomerContact extends Model
{
    protected $table = 'customer_contact';
    protected $guarded = [];
    use SoftDeletes;

    public function customer()
    {
        return $this->hasOne(Customer::class, 'id', 'customer_id');
    }

    public function getByCustomerId($customer_id, $last_user_id = null)
    {
        if ($last_user_id)
        {
            return $this->where('customer_id', $customer_id)->where('last_user_id', $last_user_id)->get()->toArray();
        } else {
            return $this->where('customer_id', $customer_id)->get()->toArray();
        }
    }

    public function getById($contact_id)
    {
        return $this->where('id', $contact_id)->first();
    }

    public function getByName($customer_id, $name, $phone)
    {
        return $this->where('customer_id', $customer_id)->where('name', 'like', '%'.$name.'%')->where('phone', 'like', '%'.$phone.'%')->first();
    }
}
