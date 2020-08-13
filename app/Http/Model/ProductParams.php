<?php

namespace App\Http\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ProductParams extends Model
{
    protected $table = 'product_params';
    protected $guarded = [];

    public function product()
    {
        return $this->hasOne(Product::class, 'id', 'product_id');
    }

    public function params()
    {
        return $this->hasOne(Params::class, 'id', 'params_id');
    }

    public function getByProductID($product_id)
    {
        return $this->where('product_id', $product_id)->get()->toArray();
    }

    public function getByParams($params)
    {
        return $this->where('product_id', $params['product_id'])->where('params_id', $params['params_id'])->first();
    }
}
