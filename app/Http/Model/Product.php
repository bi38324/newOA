<?php

namespace App\Http\Model;

use Encore\Admin\Traits\AdminBuilder;
use Encore\Admin\Traits\ModelTree;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    protected $table = 'product';
    protected $guarded = [];
    use SoftDeletes, ModelTree, AdminBuilder;

    public function __construct(array $attributes = [])
    {
        $this->setOrderColumn('sort');
        $this->setTitleColumn('title');
        $this->setParentColumn('PID');
        parent::__construct($attributes);
    }

    public function getById($id)
    {
        return $this->where('id', $id)->first();
    }

    public function getList()
    {
        return $this->get(['id', 'PID'])->toArray();
    }

}
