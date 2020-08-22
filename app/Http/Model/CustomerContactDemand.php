<?php

namespace App\Http\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CustomerContactDemand extends Model
{
    protected $table = 'customer_contact_demand';
    protected $guarded = [];

    public function contact()
    {
        return $this->hasOne(CustomerContact::class, 'customer_contact_id', 'id');
    }

    public function getByContactId($contact_id)
    {
        return $this->where('customer_contact_id', $contact_id)->get()->toArray();
    }

    public function getByDemand($customer_demand_id)
    {
        return $this->where('customer_demand_id', $customer_demand_id)->first();
    }
}
