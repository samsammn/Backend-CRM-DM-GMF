<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Company extends Model
{
    //
    protected $table = "company";
    protected $fillable = ['name','region','country','company_role','business_model','status','est_date','type','customer_type','shareholder','alliance','MRO','fleet_size','destination','customer_since'];
}
