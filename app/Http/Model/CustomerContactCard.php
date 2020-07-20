<?php

namespace App\Http\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CustomerContactCard extends Model
{
    protected $table = 'customer_contact_card';
    protected $guarded = [];
    use SoftDeletes;
}
