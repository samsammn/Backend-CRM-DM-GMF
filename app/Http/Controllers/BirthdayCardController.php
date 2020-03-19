<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;

class BirthdayCardController extends Controller
{
    //
    function read(){
        $birthday_card = DB::table('birthday_card')->orderBy('created_at','DESC')->get();
        return response()->json([
            'data' => $birthday_card
        ]);
    }
    function edit($id){
        $birthday_card = DB::table('birthday_card')->where('birthday_card_id',$id)->get();
        if (!$birthday_card->isEmpty()){
            return response()->json([
                'message' => 'Birthday Card found',
                'data' => $birthday_card
            ]);
        }else{
            return response()->json([
                'message' => 'Birthday Card not found',
                'data' => []
            ]);
        }
    }
    function update(Request $request){
        $birthday_card = DB::table('birthday_card')->where('birthday_card_id',$request->id)->get();
        $path = $request->image != NULL ? Storage::putFile('birthdaycard', $request->image) : $birthday_card[0]->image;
        if ($request->image != NULL){
            Storage::delete($birthday_card[0]->image);
        }
        DB::table('birthday_card')->where('birthday_card_id',$request->id)->update([
            'subject' => $request->subject != NULL ? $request->subject : $birthday_card[0]->subject,
            'permalink' => $request->permalink != NULL ? $request->permalink : $birthday_card[0]->permalink,
            'image' => $path,
            'updated_at' => now()
        ]);
        return response()->json([
            'message' => 'Birthday Card Updated'
        ]);
    }
    function delete($id){
        DB::table('birthday_card')->where('birthday_card_id',$id)->delete();
        return response()->json([
            'message' => 'Birthday Card Deleted'
        ]);
    }
    function create(Request $request){
        $path = $request->image != NULL ? Storage::putFile('birthdaycard', $request->image) : "";
        DB::table('birthday_card')->insert([
            'subject' => $request->subject,
            'permalink' => $request->permalink,
            'image' => $path,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
        return response()->json([
            'message' => 'Birthday Card Created'
        ]);
    }
}
