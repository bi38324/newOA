<?php

namespace App\Http\Model;

use Encore\Admin\Traits\AdminBuilder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Encore\Admin\Traits\ModelTree;


class Department extends Model
{
    protected $table = 'department';
    protected $guarded = [];
    use SoftDeletes, ModelTree, AdminBuilder;

    public function __construct(array $attributes = [])
    {
        $this->setOrderColumn('sort');
        $this->setTitleColumn('title');
        $this->setParentColumn('PID');
        parent::__construct($attributes);
    }
}
