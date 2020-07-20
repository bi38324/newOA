<?php

namespace App\Http\Model;

use Encore\Admin\Traits\AdminBuilder;
use Encore\Admin\Traits\ModelTree;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Channel extends Model
{
    protected $table = 'channel';
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
