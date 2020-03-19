<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\File;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class CustomerTypeController extends Controller
{
    //
    function read(){
        $customer_type = DB::table('customer_type')->get();
        return response()->json([
            'data' => $customer_type
        ]);
    }

    function edit($id){
        $customer_type = DB::table('customer_type')->where('customer_type_id',$id)->get();
        if (!$customer_type->isEmpty()){
            return response()->json([
                'message' => 'customer_type found',
                'data' => $customer_type
            ]);
        }else{
            return response()->json([
                'message' => 'customer_type not found',
                'data' => []
            ]);
        }
    }
    function update(Request $request){
        $customer_type = DB::table('customer_type')->where('customer_type_id',$request->id)->get();
        DB::table('customer_type')->where('customer_type_id',$request->id)->update([
            'name' => $request->name != NULL ? $request->name : $customer_type[0]->name,
            
        ]);
        return response()->json([
            'message' => 'customer_type Updated'
        ]);
    }

    function delete($id){
        DB::table('customer_type')->where('customer_type_id',$id)->delete();
        return response()->json([
            'message' => 'customer_type Deleted'
        ]);
    }

    function create(Request $request){
        DB::table('customer_type')->insert([
            'name' => $request->name,
            
        ]);
        return response()->json([
            'message' => 'customer_type Created'
        ]);
    }
}
