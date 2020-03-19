<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;

class ServiceController extends Controller
{
    //
    function read(){
        $service = DB::table('service')->get();
        return response()->json([
            'data' => $service
        ]);
    }
    function edit($id){
        $service = DB::table('service')->where('service_id',$id)->get();
        if (!$service->isEmpty()){
            return response()->json([
                'message' => 'Service found',
                'data' => $service
            ]);
        }else{
            return response()->json([
                'message' => 'Service not found',
                'data' => []
            ]);
        }
    }
    function update(Request $request){
        $service = DB::table('service')->where('service_id',$request->id)->get();
        $path_large = $request->large_image ? Storage::putFile('serviceimage', $request->large_image) : $service[0]->large_image;
        $path_small1 = $request->small_image1 ? Storage::putFile('serviceimage', $request->small_image1) : $service[0]->small_image1;
        $path_small2 = $request->small_image2 ? Storage::putFile('serviceimage', $request->small_image2) : $service[0]->small_image2;
        if ($request->large_image != NULL){
            Storage::delete($service[0]->large_image);
        }
        if ($request->small_image1 != NULL){
            Storage::delete($service[0]->small_image1);
        }
        if ($request->small_image2 != NULL){
            Storage::delete($service[0]->small_image2);
        }
        DB::table('service')->where('service_id',$request->id)->update([
            'name' => ($request->name != NULL ? $request->name : $service[0]->name),
            'detail' => ($request->detail != NULL ? $request->detail : $service[0]->detail),
            'permalink' => $request->permalink != NULL ? $request->permalink : $service[0]->permalink,
            'large_image' => $path_large,
            'small_image1' => $path_small1,
            'small_image2' => $path_small2,
            'permalink' => $request->permalink,
            'updated_at' => now(),
        ]);
    
        return response()->json([
            'message' => 'Service Updated'
        ]);
    }
    function delete($id){
        DB::table('service')->where('service_id',$id)->delete();
        return response()->json([
            'message' => 'Service Deleted'
        ]);
    }

    function create(Request $request){
        $path_large = $request->large_image ? Storage::putFile('serviceimage', $request->large_image) : "";
        $path_small1 = $request->small_image1 ? Storage::putFile('serviceimage', $request->small_image1) : "";
        $path_small2 = $request->small_image2 ? Storage::putFile('serviceimage', $request->small_image2) : "";
        DB::table('service')->insert([
            'name' => $request->name,
            'detail' => $request->detail,
            'large_image' => $path_large,
            'small_image1' => $path_small1,
            'small_image2' => $path_small2,
            'permalink' => $request->permalink,
            'updated_at' => now(),
            'created_at' => now(),
        ]);
    
        return response()->json([
            'message' => 'Service Created'
        ]);
    }
}
