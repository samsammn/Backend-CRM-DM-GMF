<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class ComplaintController extends Controller
{
    //
    function read(){
        $complaint = DB::table('complaint')->get();
        foreach ($complaint as $comp){
            $company = DB::table('company')->where('company_id',$comp->company_id)->get();
            $comp->company_name = $company[0]->name;
        }
        return response()->json([
            'data' => $complaint
        ]);
    }
    function readByCompany($id){
        $complaint = DB::table('complaint')->where('company_id',$id)->get();
        if (!$complaint->isEmpty()){
            return response()->json([
                'message' => 'Complaint found',
                'data' => $complaint
            ]);
        }else{
            return response()->json([
                'message' => 'No Complaint in this company'
            ]);
        }
    }
    function edit($id){
        $complaint = DB::table('complaint')->where('complaint_id',$id)->get();
        $company = DB::table('company')->where('company_id',$complaint[0]->company_id)->get();
        $complaint[0]->company_name = $company[0]->name;
        if (!$complaint->isEmpty()){
            return response()->json([
                'message' => 'Complaint found',
                'data' => $complaint
            ]);
        }else{
            return response()->json([
                'message' => 'Complaint not found',
                'data' => []
            ]);
        }
    }
    function update(Request $request){
        $complaint = DB::table('complaint')->where('complaint_id',$request->complaint_id)->get();
        if ($request->status != 'Closed'){
            DB::table('complaint')->where('complaint_id',$request->complaint_id)->update([
                'service' => $request->service != NULL ? $request->service : $complaint[0]->service,
                'subject' => $request->subject != NULL ? $request->subject : $complaint[0]->subject,
                'complaint' => $request->complaint != NULL ? $request->complaint : $complaint[0]->complaint,
                'status' => $request->status != NULL ? $request->status : $complaint[0]->status,
            ]);
        }else{
            DB::table('complaint')->where('complaint_id',$request->complaint_id)->update([
                'closed' => now()->toDateString(),
                'service' => $request->service != NULL ? $request->service : $complaint[0]->service,
                'subject' => $request->subject != NULL ? $request->subject : $complaint[0]->subject,
                'complaint' => $request->complaint != NULL ? $request->complaint : $complaint[0]->complaint,
                'status' => $request->status != NULL ? $request->status : $complaint[0]->status,
            ]);
        }
        return response()->json([
            'message' => 'Complaint Updated'
        ]);
    }
    function delete($id){
        DB::table('complaint')->where('complaint_id',$id)->delete();
        return response()->json([
            'message' => 'Complaint Deleted'
        ]);
    }

    function create(Request $request){
        $customer = DB::table('user_customer')->where('user_id',$request->user_id)->get();
        $path = $request->file != NULL ? Storage::putFile('complaint', $request->file) : "";
        DB::table('complaint')->insert([
            'date'=> now(),
            'service' => $request->service,
            'subject' => $request->subject,
            'complaint' => $request->complaint,
            'sender' => $customer[0]->name,
            'company_id' => $customer[0]->company_id,
            'user_id' => $request->user_id,
            'file' => $path
        ]);
        DB::table('user_admin')->update([
            'not_read_complaint' => DB::raw('not_read_complaint + 1')
        ]);
        return response()->json([
            'message' => 'Complaint Created'
        ]);
    }

    function reply(Request $request){
        DB::table('reply_complaint')->insert([
            'description' => $request->description,
            'complaint_id' => $request->complaint_id,
            'user_id' => $request->user_id,
            'sender_role' => $request->sender_role,
        ]);
        return response()->json([
            'message' => 'Replied Created'
        ]);
    }

    function readReply($id){
        $reply = DB::table('reply_complaint')->where('complaint_id',$id)->orderBy('created_at','DESC')->get(['description','sender_role','user_id']);
        foreach ($reply as $re){
            if ($re->sender_role == 'Customer'){
                $customer = DB::table('user_customer')->where('user_id',$re->user_id)->get();
                $re->sender = $customer[0]->name;
            }else{
                $admin = DB::table('user_admin')->where('user_id',$re->user_id)->get();
                $re->sender = $admin[0]->name;
            }
        }
        return response()->json([
            'data' => $reply
        ]);
    }

    function filter(Request $request){
        $complaint = DB::table('complaint');

        if ($request->company_name != NULL){
            $company = DB::table('company')->where('name',$request->company_name)->get();
            $complaint = $complaint->where('company_id',$company[0]->company_id);
        }
        if ($request->status != NULL){
            $complaint = $complaint->where('status',$request->status);
        }
        if ($request->service != NULL){
            $complaint = $complaint->where('service',$request->service);
        }
        if ($request->year != NULL){
            $complaint = $complaint->whereYear('date',$request->year);
        }
        if ($request->month != NULL){
            $complaint = $complaint->whereMonth('date',$request->month);
        }
        if ($request->range != NULL){
            $times = now()->toDateString();
            $time = strtotime(now()->toDateString());
            if (!($request->range == 1 || $request->range == 12 )){
                $final = date("Y-m-d", strtotime("-".$request->range." month", $time));
                $complaint = $complaint->whereBetween('date',[$final,$times]);
            }else if($request->range == 1){
                $complaint = $complaint->whereMonth('date',date("m",strtotime($times)));
            }else{
                $complaint = $complaint->whereYear('date',date("Y",strtotime($times)));
            }
        }

        if ($request->semester != NULL) {
            $semester_div = [1 => [1,2,3,4,5,6], 2 => [7,8,9,10,11,12]];
            $month = $request->semester > 0 && $request->semester < 3 ? $semester_div[$request->semester] : [];
            $complaint = $complaint->whereIn(DB::raw('MONTH(date)'), $month);
        }

        $complaint = $complaint->get();
        $result = array();
        foreach($complaint as $comp){
            $result[] = date("M",strtotime($comp->date));
        }
        $counts = array_count_values($result);
        $final = array();
        foreach ($counts as $key => $value) {
            $final[] = (object)[
                $key => $value
            ];
        }


        return response()->json([
            'trend' => $final,
        ]);
    }

    function filterOption(){
        $complaint = DB::table('complaint')->get();
        $name = array();
        $status = array();
        $years = array();
        $months = array();
        $service = array();
        foreach($complaint as $comp){
            $company_name = DB::table('company')->where('company_id',$comp->company_id)->get();
            if (!in_array($company_name[0]->name,$name)){
                $name[] = $company_name[0]->name;
            }
            if (!in_array($comp->status,$status)){
                $status[] = $comp->status;
            }
            if (!in_array($comp->service,$service)){
                $service[] = $comp->service;
            }
            $year = date('Y', strtotime($comp->date));
            if (!in_array($year,$years)){
                $years[] = $year;
            }
            $month = date('m', strtotime($comp->date));
            if (!in_array($month,$months)){
                $months[] = $month;
            }
        }
        return response()->json([
            'company_name' => $name,
            'status' => $status,
            'service' => $service,
            'year' => $years,
            'month' => $months,
            'range' => [1,3,6,12]
        ]);
    }
}
