<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class PastMarketingController extends Controller
{
    //
    function read(){
        $past_marketing = DB::table('past_marketing')->get();
        return response()->json([
            'data' => $past_marketing
        ]);
    }

    function readPastMarketingInCompany($id){
        $past_marketing = DB::table('past_marketing')->where('company_id',$id)->get();
        return response()->json([
            'data' => $past_marketing
        ]);
    }

    function edit($id){
        $past_marketing = DB::table('past_marketing')->where('past_marketing_id',$id)->get();
        if (!$past_marketing->isEmpty()){
            return response()->json([
                'message' => 'past_marketing found',
                'data' => $past_marketing
            ]);
        }else{
            return response()->json([
                'message' => 'past_marketing not found',
                'data' => []
            ]);
        }
    }
    function update(Request $request){
        $past_marketing = DB::table('past_marketing')->where('past_marketing_id',$request->id)->get();
        DB::table('past_marketing')->where('past_marketing_id',$request->id)->update([
            'date' => $request->date != NULL ? $request->date : $past_marketing[0]->date,
            'activity' => $request->activity != NULL ? $request->activity : $past_marketing[0]->activity,
            'remarks' => $request->remarks != NULL ? $request->remarks : $past_marketing[0]->remarks,
        ]);
        return response()->json([
            'message' => 'past_marketing Updated'
        ]);
    }

    function delete($id){
        DB::table('past_marketing')->where('past_marketing_id',$id)->delete();
        return response()->json([
            'message' => 'past_marketing Deleted'
        ]);
    }

    function create(Request $request){
        DB::table('past_marketing')->insert([
            'date' => $request->date,
            'activity' => $request->activity,
            'remarks' => $request->remarks,
            'company_id' => $request->company_id
        ]);
        return response()->json([
            'message' => 'past_marketing Created'
        ]);
    }
}
