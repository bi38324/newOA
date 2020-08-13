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
        return $this->hasOne(CustomerContact::class, 'id', 'customer_contact_id');
    }

    public function getByContactId($contact_id)
    {
        return $this->where('customer_contact_id', $contact_id)->get()->toArray();
    }
}
