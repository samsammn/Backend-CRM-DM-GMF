<?php

namespace App\Imports;

use App\Revenue;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

use App\Company;

class RevenueImport implements ToModel,WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new Revenue([
            //
            'company_id' => Company::all()->last()->company_id,
            'product' => $row['products'],
            'sales' => $row['sales']
        ]);
    }
}
