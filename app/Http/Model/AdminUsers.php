<?php

namespace App\Http\Model;

use Illuminate\Database\Eloquent\Model;

class AdminUsers extends Model
{
    protected $table = 'admin_users';
    protected $guarded = [];

    public function getById($id)
    {
        return $this->where('id', $id)->first();
    }
}
