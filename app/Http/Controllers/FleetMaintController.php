<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FleetMaintController extends Controller
{
    //
    function read(){
        $fleet_maint = DB::table('fleet_maint')->get();
        return response()->json([
            'data' => $fleet_maint
        ]);
    }

    function readByProduct($product){
        $fleet_maint = DB::table('fleet_maint')->where('product',$product)->get();
        return response()->json([
            'data' => $fleet_maint
        ]);
    }

    function readByCompanyId($id){
        $fleet_maint = DB::table('fleet_maint')->where('company_id',$id)->get();
        return response()->json([
            'data' => $fleet_maint
        ]);
    }

    function readByCompanyProduct($id, $product){
        $fleet_maint = DB::table('fleet_maint')->where('company_id',$id)->where('product',$product)->get();
        return response()->json([
            'data' => $fleet_maint
        ]);
    }

    function edit($id){
        $fleet_maint = DB::table('fleet_maint')->where('fleet_maint_id',$id)->get();
        if (!$fleet_maint->isEmpty()){
            return response()->json([
                'message' => 'fleet_maint found',
                'data' => $fleet_maint
            ]);
        }else{
            return response()->json([
                'message' => 'fleet_maint not found',
                'data' => []
            ]);
        }
    }
    function update(Request $request){
        $fleet_maint = DB::table('fleet_maint')->where('fleet_maint_id',$request->fleet_maint_id)->get();
        DB::table('fleet_maint')->where('fleet_maint_id',$request->fleet_maint_id)->update([
            'type' => $request->type != NULL ? $request->type : $fleet_maint[0]->type,
            'quantity' => $request->quantity != NULL ? $request->quantity : $fleet_maint[0]->quantity,
            'maint_provider' => $request->maint_provider != NULL ? $request->maint_provider : $fleet_maint[0]->maint_provider,
            'suitable' => $request->suitable != NULL ? $request->suitable : $fleet_maint[0]->suitable,
            'product' => $request->product != NULL ? $request->product : $fleet_maint[0]->product,
        ]);
        return response()->json([
            'message' => 'Fleet Maint Updated'
        ]);
    }
    function delete($id){
        DB::table('fleet_maint')->where('fleet_maint_id',$id)->delete();
        return response()->json([
            'message' => 'fleet_maint Deleted'
        ]);
    }
    function create(Request $request){
        DB::table('fleet_maint')->insert([
            'type' => $request->type,
            'product' => $request->product,
            'quantity' => $request->quantity,
            'maint_provider' => $request->maint_provider,
            'suitable' => $request->suitable,
            'company_id' => $request->company_id,
        ]);
        return response()->json([
            'message' => 'Fleet Maint Created'
        ]);
    }
}
