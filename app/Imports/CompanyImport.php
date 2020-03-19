<?php

namespace App\Imports;

use App\Company;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\SkipsOnFailure;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Concerns\SkipsFailures;
use Maatwebsite\Excel\Validators\Failure;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\SkipsOnError;

class CompanyImport implements ToModel, WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    
    */
    public function model(array $row)
    {
        return new Company([
            //
            'name' => $row['name'],
            'region' => $row['region'],
            'country' => $row['country'],
            'company_role' => $row['company_role'],
            'business_model' => $row['business_model'],
            'status' => $row['status'],
            'est_date' => $row['est_date'],
            'type' => $row['type'],
            'customer_type' => $row['customer_type'],
            'shareholder' => $row['shareholder'],
            'alliance' => $row['alliance'],
            'MRO' => $row['mro'],
            'fleet_size' => $row['fleet_size'],
            'destination' => $row['destination'],
            'customer_since' => $row['customer_since'],
        ]);
        
    }
    public function headingRow(): int
    {
        return 1;
    }
}
