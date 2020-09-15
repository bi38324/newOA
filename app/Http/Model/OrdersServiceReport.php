<?php

namespace App\Http\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class OrdersServiceReport extends Model
{
    protected $table = 'orders_service_report';
    protected $guarded = [];
    protected $appends = ['report_path'];
    use SoftDeletes;

    public function orders()
    {
        return $this->belongsTo(Orders::class, 'orders_id', 'id');
    }

    public function admin_user()
    {
        return $this->belongsTo(AdminUsers::class, 'admin_user_id', 'id');
    }

    public function getReportPathAttribute()
    {
        $report_url = env('APP_URL').'/upload/'.$this->report_url;
        return $report_url;
    }

    public function getById($id)
    {
        return $this->where('id', $id)->first();
    }

}
