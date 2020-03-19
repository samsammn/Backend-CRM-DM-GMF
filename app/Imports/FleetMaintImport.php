<?php

namespace App\Imports;

use App\FleetMaint;
use Maatwebsite\Excel\Concerns\ToModel;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

use App\Company;

class FleetMaintImport implements ToModel,WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        
        return new FleetMaint([
            //
            'company_id' => Company::all()->last()->company_id,
            'product' => $row['product'],
            'type' => $row['types'],
            'quantity' => $row['quantity'],
            'maint_provider' => $row['maint_provider'],
            'suitable' => $row['suitable'],
        ]);
    }
}
