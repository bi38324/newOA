<?php

namespace App\Http\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Customer extends Model
{
    protected $table = 'customer';
    protected $guarded = [];
    use SoftDeletes;

    public function channel()
    {
        return $this->hasOne(Channel::class, 'id', 'channel_id');
    }

    public function industry()
    {
        return $this->hasOne(Industry::class, 'id', 'channel_id');
    }

    public function owner_user()
    {
        return $this->hasOne(AdminUsers::class, 'id', 'owner_user_id');
    }

    public function last_user()
    {
        return $this->hasOne(AdminUsers::class, 'id', 'last_user_id');
    }

    public function getById($id)
    {
        return $this->find($id);
    }
}
