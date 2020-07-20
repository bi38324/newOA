<?php

namespace App\Http\Model;

use Encore\Admin\Traits\AdminBuilder;
use Illuminate\Database\Eloquent\Model;
use Encore\Admin\Traits\ModelTree;


class Industry extends Model
{
    protected $table = 'industry';
    protected $guarded = [];
    use ModelTree, AdminBuilder;

    public function __construct(array $attributes = [])
    {
        $this->setOrderColumn('id');
        $this->setTitleColumn('IndustryName');
        $this->setParentColumn('ParentID');
        parent::__construct($attributes);
    }
}
