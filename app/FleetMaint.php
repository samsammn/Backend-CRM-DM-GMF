<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FleetMaint extends Model
{
    //
    protected $table = "fleet_maint";
    protected $fillable = ['product','type','quantity','maint_provider','suitable','company_id'];
    public $timestamps = false;
}
