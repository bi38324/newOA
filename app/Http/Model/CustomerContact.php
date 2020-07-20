<?php

namespace App\Http\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CustomerContact extends Model
{
    protected $table = 'customer_contact';
    protected $guarded = [];
    use SoftDeletes;
}
