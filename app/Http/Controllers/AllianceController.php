<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\File;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class AllianceController extends Controller
{
    //
    function read(){
        $alliance = DB::table('alliance')->get();
        return response()->json([
            'data' => $alliance
        ]);
    }

    function edit($id){
        $alliance = DB::table('alliance')->where('alliance_id',$id)->get();
        if (!$alliance->isEmpty()){
            return response()->json([
                'message' => 'alliance found',
                'data' => $alliance
            ]);
        }else{
            return response()->json([
                'message' => 'alliance not found',
                'data' => []
            ]);
        }
    }
    function update(Request $request){
        $alliance = DB::table('alliance')->where('alliance_id',$request->id)->get();
        DB::table('alliance')->where('alliance_id',$request->id)->update([
            'name' => $request->name != NULL ? $request->name : $alliance[0]->name,
            
        ]);
        return response()->json([
            'message' => 'Alliance Updated'
        ]);
    }

    function delete($id){
        DB::table('alliance')->where('alliance_id',$id)->delete();
        return response()->json([
            'message' => 'Alliance Deleted'
        ]);
    }

    function create(Request $request){
        DB::table('alliance')->insert([
            'name' => $request->name,
        ]);
        return response()->json([
            'message' => 'Alliance Created'
        ]);
    }
}
