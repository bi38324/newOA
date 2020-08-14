<?php

namespace App\Http\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Params extends Model
{
    protected $table = 'params';
    protected $guarded = [];
    use SoftDeletes;

    public function getByIds($ids)
    {
        return $this->whereIn('id', $ids)->get()->toArray();
    }

    public function getById($id)
    {
        return $this->where('id', $id)->get()->toArray();
    }

}
