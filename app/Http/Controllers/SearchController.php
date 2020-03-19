<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class SearchController extends Controller
{
    //
    public function search($query, $company_id){
        $project = DB::table('project')->where('company_id',$company_id)->where('name','like','%'.$query.'%')->get();
        $profile = DB::table('user_customer')->where('company_id',$company_id);
        
        $profile2 = $profile->where('name','like','%'.$query.'%')->get();

        // $profile1 = $profile2->where('user_customer.company_id',$company_id)->get();
        $profile_username = DB::table('user')->join('user_customer','user.user_id','user_customer.user_id')->where('company_id',$company_id)->where('username','like','%'.$query.'%')->get();
        
        $service = DB::table('service')->where('name','like','%'.$query.'%')->get();
        
        $complaint = DB::table('complaint')->where('company_id',$company_id)->where('subject','like','%'.$query.'%')->get();
        
        $feedback_nonproject = DB::table('feedback_nonproject')->where('company_id',$company_id)->where('subject','like','%'.$query.'%')->get();
        
        return response()->json([
            'data' => ([
                "project" => $project,
                "name" => $profile2,
                "username" => $profile_username,
                "service" => $service,
                "complaint" => $complaint,
                "feedback_nonproject" => $feedback_nonproject
            ])
        ]);

    }

    public function search_admin($query){
        $project = DB::table('project')->where('name','like','%'.$query.'%')->get();
        $company = DB::table('company')->where('name','like','%'.$query.'%')->get();
        $complaint = DB::table('complaint')->where('subject','like','%'.$query.'%')->get();
        $holiday_card = DB::table('religion_card')->where('subject','like','%'.$query.'%')->get();
        $service = DB::table('service')->where('name','like','%'.$query.'%')->get();
        return response()->json([
            'data' => ([
                "project" => $project,
                "customer" => $company,
                "holiday_card" => $holiday_card,
                "service" => $service,
                "complaint" => $complaint,

            ])
        ]);
    }
}
