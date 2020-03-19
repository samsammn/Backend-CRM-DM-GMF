<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\File;
use App\Exports\CompanyExport;
use App\Imports\CompanyImport;
use App\Imports\CompleteCompanyImport;
use App\Imports\FleetMaintImport;
use App\Imports\RevenueImport;
use Maatwebsite\Excel\Facades\Excel;
use App\Company;
use App\FleetMaint;
use App\Revenue;
class CompanyController extends Controller
{
    function read(){
        $company = DB::table('company')->get();
        return response()->json([
            'data' => $company
        ]);
    }
    function readUserInCompany($id){
        $user = DB::table('user_customer')->join('user','user_customer.user_id', '=', 'user.user_id')->where('user_customer.company_id',$id)->get();
        return response()->json([
            'data' => $user
        ]);
    }

    function readCpInCompany($id){
        $user = DB::table('gmf_cp')->where()->get();
        return response()->json([
            'data' => $user
        ]);
    }
    function edit($id){
        $company = DB::table('company')->where('company_id',$id)->get();
        if (!$company->isEmpty()){
            return response()->json([
                'message' => 'Company found',
                'data' => $company
            ]);
        }else{
            return response()->json([
                'message' => 'Company not found',
                'data' => []
            ]);
        }
    }
    function update(Request $request){
        $company = DB::table('company')->where('company_id',$request->id)->get(); 
        $path = $request->image != NULL ? Storage::putFile('company', $request->image) : $company[0]->image;
        if ($request->image != NULL){
            Storage::delete($company[0]->image);
        }
        DB::table('company')->where('company_id',$request->id)->update([
            'image' => $path,
            'name' => $request->name != NULL ? $request->name : $company[0]->name,
            'region' => $request->region != NULL ? $request->region : $company[0]->region,
            'country' => $request->country != NULL ? $request->country : $company[0]->country,
            'company_role' => $request->company_role != NULL ? $request->company_role : $company[0]->company_role,
            'business_model' => $request->business_model != NULL ? $request->business_model : $company[0]->business_model,
            'status' => $request->status != NULL ? $request->status : $company[0]->status,
            'est_date' => $request->est_date != NULL ? $request->est_date : $company[0]->est_date,
            'type' => $request->type != NULL ? $request->type : $company[0]->type,
            'customer_type' => $request->customer_type != NULL ? $request->customer_type : $company[0]->customer_type,
            'shareholder' => $request->shareholder != NULL ? $request->shareholder : $company[0]->shareholder,
            'alliance' => $request->alliance != NULL ? $request->alliance : $company[0]->alliance,
            'MRO' => $request->MRO != NULL ? $request->MRO : $company[0]->MRO,
            'fleet_size' => $request->fleet_size != NULL ? $request->fleet_size : $company[0]->fleet_size,
            'destination' => $request->destination != NULL ? $request->destination : $company[0]->destination,
            'customer_since' => $request->customer_since != NULL ? $request->customer_since : $company[0]->customer_since,
        ]);
        return response()->json([
            'message' => 'Company Updated'
        ]);
    }
    function delete($id){
        DB::table('company')->where('company_id',$id)->delete();
        return response()->json([
            'message' => 'Company Deleted'
        ]);
    }
    function create(Request $request){
        $path = $request->image != NULL ? Storage::putFile('company', $request->image) : "";
        DB::table('company')->insert([
            'image' => $path,
            'name' => $request->name,
            'region' => $request->region,
            'country' => $request->country,
            'company_role' => $request->company_role,
            'business_model' => $request->business_model,
            'status' => $request->status,
            'est_date' => $request->est_date,
            'type' => $request->type,
            'customer_type' => $request->customer_type,
            'shareholder' => $request->shareholder,
            'alliance' => $request->alliance,
            'MRO' => $request->MRO,
            'fleet_size' => $request->fleet_size,
            'destination' => $request->destination,
            'customer_since' => $request->customer_since,
        ]);
        return response()->json([
            'message' => 'Company Created'
        ]);
    }

    public function export_excel(){
        $url = \config('filesystems.disks.local.root');
        $path = $url."/CompanyForm.xlsx";
        return response()->download($path);
    }

    public function import_excel(Request $request){
        $path = Storage::putFile('form_company', $request->file);
        $url = \config('filesystems.disks.local.root');
        Excel::import(new CompleteCompanyImport, $url."/".$path);
        return "Successfully add Customer";
    }
}
