<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;

class ReligionCardController extends Controller
{
    //
    function read(){
        $religion_card = DB::table('religion_card')->orderBy('created_at','DESC')->get();
        return response()->json([
            'data' => $religion_card
        ]);
    }
    function edit($id){
        $religion_card = DB::table('religion_card')->where('religion_card_id',$id)->get();
        if (!$religion_card->isEmpty()){
            return response()->json([
                'message' => 'religion card found',
                'data' => $religion_card
            ]);
        }else{
            return response()->json([
                'message' => 'religion card not found',
                'data' => []
            ]);
        }
    }
    function update(Request $request){
        $religion_card = DB::table('religion_card')->where('religion_card_id',$request->religion_card_id)->get();
        $path = $request->image != NULL ? Storage::putFile('religioncard', $request->image) : $religion_card[0]->image;
        if ($request->image != NULL){
            Storage::delete($religion_card[0]->image);
        }

        DB::table('religion_card')->where('religion_card_id',$request->religion_card_id)->update([
            'subject' => $request->subject != NULL ? $request->subject : $religion_card[0]->subject,
            'image' => $path,
            'religion' => $request->religion != NULL ? $request->religion : $religion_card[0]->religion,
            'date' => $request->date != NULL ? $request->date : $religion_card[0]->date,
            'permalink' => $request->permalink != NULL ? $request->permalink : $religion_card[0]->permalink,
            'updated_at' => now()
        ]);
        return response()->json([
            'message' => 'Religion Card Updated'
        ]);
    }
    function delete($id){
        DB::table('religion_card')->where('religion_card_id',$id)->delete();
        return 'deleted';
    }
    function create(Request $request){
        $path = $request->image != NULL ? Storage::putFile('religioncard', $request->image) : "";
        DB::table('religion_card')->insert([
            'subject' => $request->subject,
            'image' => $path,
            'date' => $request->date,
            'religion' => $request->religion,
            'permalink' => $request->permalink,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
        return response()->json([
            'message' => 'Religion Card Created'
        ]);
    }
}
