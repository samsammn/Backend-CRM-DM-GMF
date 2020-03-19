<?php

namespace App\Imports;

use Maatwebsite\Excel\Concerns\WithMultipleSheets;

class CompleteCompanyImport implements WithMultipleSheets 
{
   
    public function sheets(): array
    {
        return [
            0 => new CompanyImport(),
            1 => new FleetMaintImport(),
            2 => new RevenueImport(),
        ];
    }
}
