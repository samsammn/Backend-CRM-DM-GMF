<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\File;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class AircraftTypeController extends Controller
{
    //
    function read(){
        $data = DB::table('aircraft_type')->get();
        return response()->json([
            'data' => $data
        ]);
    }

    function update(Request $request, $id){
        $data = DB::table('aircraft_type')->where('id', $id)->get();

        if ($data !== null) {
            DB::table('aircraft_type')->where('id', $id)->update([
                'type' => $request->type
            ]);
        }

        return response()->json([
            'message' => 'Aircraft Type Updated'
        ]);
    }

    function delete($id){
        DB::table('aircraft_type')->where('id', $id)->delete();

        return response()->json([
            'message' => 'Aircraft Type Deleted'
        ]);
    }

    function create(Request $request){
        DB::table('aircraft_type')->insert([
            'type' => $request->type
        ]);

        return response()->json([
            'message' => 'Aircraft Type Created'
        ]);
    }
}
