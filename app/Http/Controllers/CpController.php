<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class CpController extends Controller
{
    //
    function read(){
        $gmf_cp = DB::table('gmf_cp')->get();
        return response()->json([
            'data' => $gmf_cp
        ]);
    }

    function readCPInCompany($id){
        $gmf_cp = DB::table('gmf_cp')->join('cp_company','gmf_cp.gmf_cp_id','=','cp_company.gmf_cp_id')->where('cp_company.company_id',$id)->get();
        return response()->json([
            'data' => $gmf_cp
        ]);
    }

    function edit($id){
        $gmf_cp = DB::table('gmf_cp')->where('gmf_cp_id',$id)->get();
        if (!$gmf_cp->isEmpty()){
            return response()->json([
                'message' => 'gmf_cp found',
                'data' => $gmf_cp
            ]);
        }else{
            return response()->json([
                'message' => 'gmf_cp not found',
                'data' => []
            ]);
        }
    }
    function update(Request $request){
        $gmf_cp = DB::table('gmf_cp')->where('gmf_cp_id',$request->id)->get();
        $path = $request->image != NULL ? Storage::putFile('user', $request->image) : $gmf_cp[0]->image;
        DB::table('gmf_cp')->where('gmf_cp_id',$request->id)->update([
            'name' => $request->name != NULL ? $request->name : $gmf_cp[0]->name,
            'position' => $request->position != NULL ? $request->position : $gmf_cp[0]->position,
            'phone' => $request->phone != NULL ? $request->phone : $gmf_cp[0]->phone,
            'email' => $request->email != NULL ? $request->email : $gmf_cp[0]->email,
            'image' => $path,
        ]);
        return response()->json([
            'message' => 'Cp Updated'
        ]);
    }

    function delete($id){
        DB::table('gmf_cp')->where('gmf_cp_id',$id)->delete();
        return response()->json([
            'message' => 'Cp Deleted'
        ]);
    }

    function create(Request $request){
        $company = DB::table('company')->where('company_id',$request->company_id)->get();
        $path = $request->image != NULL ? Storage::putFile('user', $request->image) : "";
        DB::table('gmf_cp')->insert([
            'name' => $request->name,
            'position' => $request->position,
            'phone' => $request->phone,
            'email' => $request->email,
            'image' => $path
        ]);
        $gmf_cp = DB::table('gmf_cp')->get();
        DB::table('cp_company')->insert([
            'company_id' => $request->company_id,
            'gmf_cp_id' =>  $gmf_cp[sizeof($gmf_cp)-1]->gmf_cp_id
        ]);
        return response()->json([
            'message' => 'Cp Created'
        ]);
    }
}
