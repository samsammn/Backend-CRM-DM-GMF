<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FeedbackNonProjectController extends Controller
{
    function read(){
        $feedback_nonproject = DB::table('feedback_nonproject')->get();
        return response()->json([
            'data' => $feedback_nonproject
        ]);
    }
    function readByCompany($id){
        $feedback_nonproject = DB::table('feedback_nonproject')->where('company_id',$id)->get();
        if (!$feedback_nonproject->isEmpty()){
            return response()->json([
                'message' => 'feedback_nonproject found',
                'data' => $feedback_nonproject
            ]);
        }else{
            return response()->json([
                'message' => 'No feedback_nonproject in this company',
                'data' => []
            ]);
        }
    }
    function edit($id){
        $feedback_nonproject = DB::table('feedback_nonproject')->where('feedback_nonproject_id',$id)->get();
        if (!$feedback_nonproject->isEmpty()){
            return response()->json([
                'message' => 'feedback_nonproject found',
                'data' => $feedback_nonproject
            ]);
        }else{
            return response()->json([
                'message' => 'feedback_nonproject not found',
                'data' => []
            ]);
        }
    }
    function update(Request $request){
        $feedback_nonproject = DB::table('feedback_nonproject')->where('feedback_nonproject_id',$request->feedback_nonproject_id)->get();
        DB::table('feedback_nonproject')->where('feedback_nonproject_id',$request->feedback_nonproject_id)->update([
            'subject' => $request->subject != NULL ? $request->subject : $feedback_nonproject[0]->subject,
            'description' => $request->description != NULL ? $request->description : $feedback_nonproject[0]->description,
            'rating' => $request->rating != NULL ? $request->rating : $feedback_nonproject[0]->rating,
        ]);
        return response()->json([
            'message' => 'feedback_nonproject Updated'
        ]);
    }
    function delete($id){
        DB::table('feedback_nonproject')->where('feedback_nonproject_id',$id)->delete();
        return response()->json([
            'message' => 'feedback_nonproject Deleted'
        ]);
    }

    function create(Request $request){
        $customer = DB::table('user_customer')->where('user_id',$request->user_id)->get();
        DB::table('feedback_nonproject')->insert([
            'date'=> now()->toDateString(),
            'subject' => $request->subject,
            'rating' => $request->rating,
            'sender' => $customer[0]->name,
            'description' => $request->description,
            'user_customer_id' => $customer[0]->user_customer_id,
            'company_id' => $customer[0]->company_id,
        ]);
        return response()->json([
            'message' => 'feedback_nonproject Created'
        ]);
    }
}
