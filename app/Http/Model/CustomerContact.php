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

    public function customer_demand()
    {
        return $this->hasOne(CustomerDemand::class, 'id', 'customer_demand_id');
    }
}
