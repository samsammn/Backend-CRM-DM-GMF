<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Revenue extends Model
{
    //
    protected $table = "revenue";
    protected $fillable = ['product','sales','company_id'];
    public $timestamps = false;
}
