<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FeedbackProjectController extends Controller
{
    //
    function read(){
        $feedback_project = DB::table('feedback_project')->get();
        foreach ($feedback_project as $pro){
            $company = DB::table('company')->where('company_id',$pro->company_id)->get();
            $pro->company_name = $company[0]->name;
            $project = DB::table('project')->where('project_id',$pro->project_id)->get();
            $pro->location = $project[0]->location;
            $service = DB::table('service')->where('service_id',$pro->service_id)->get();
            $pro->project_type = $service[0]->name;
        }
        return response()->json([
            'data' => $feedback_project
        ]);
    }
    function readByCompany($id){
        $feedback_project = DB::table('feedback_project')->where('company_id',$id)->get();
        if (!$feedback_project->isEmpty()){
            foreach ($feedback_project as $pro){
                $company = DB::table('company')->where('company_id',$pro->company_id)->get();
                $pro->company_name = $company[0]->name;
                $project = DB::table('project')->where('project_id',$pro->project_id)->get();
                $pro->location = $project[0]->location;
                $pro->project_type = $project[0]->project_type;
            }
            return response()->json([
                'message' => 'feedback_project found',
                'data' => $feedback_project
            ]);
        }else{
            return response()->json([
                'message' => 'No feedback_project in this company',
                'data' => []
            ]);
        }
    }
    function edit($id){
        $feedback_project = DB::table('feedback_project')->where('feedback_project_id',$id)->get();
        if (!$feedback_project->isEmpty()){
            $company = DB::table('company')->where('company_id',$feedback_project[0]->company_id)->get();
            $feedback_project[0]->company_name = $company[0]->name;
            $project = DB::table('project')->where('project_id',$feedback_project[0]->project_id)->get();
            $feedback_project[0]->location = $project[0]->location;
            $feedback_project[0]->project_type = $project[0]->project_type;
            return response()->json([
                'message' => 'feedback_project found',
                'data' => $feedback_project
            ]);
        }else{
            return response()->json([
                'message' => 'feedback_project not found',
                'data' => []
            ]);
        }
    }
    function update(Request $request){
        $feedback_project = DB::table('feedback_project')->where('feedback_project_id',$request->feedback_project_id)->get();
        DB::table('feedback_project')->where('feedback_project_id',$request->feedback_project_id)->update([
            'date'=> $request->date != NULL ? $request->date : $feedback_project[0]->date,
            'project_type' => $request->project_type != NULL ? $request->project_type : $feedback_project[0]->project_type,
            'location' => $request->location != NULL ? $request->location : $feedback_project[0]->location,
            'rating' => $request->rating != NULL ? $request->rating : $feedback_project[0]->rating,
            'aspect_to_improve' => $request->aspect_to_improve != NULL ? $request->aspect_to_improve : $feedback_project[0]->aspect_to_improve,
            'remark' => $request->remark != NULL ? $request->remark : $feedback_project[0]->remark,
        ]);
        return response()->json([
            'message' => 'feedback_project Updated'
        ]);
    }
    function delete($id){
        DB::table('feedback_project')->where('feedback_project_id',$id)->delete();
        return response()->json([
            'message' => 'feedback_project Deleted'
        ]);
    }

    function create(Request $request){
        $check = true;
        foreach ($request->service as $service){
            if ($service['rating'] == 0){
                $check = false;
            }
        }
        if ($check){
            $customer = DB::table('user_customer')->where('user_id',$request->user_id)->get();
            foreach ($request->service as $service){
                $service1 = DB::table('service')->where('name',$service['service'])->get();
                DB::table('feedback_project')->insert([
                    'date'=> now()->toDateString(),
                    'rating' => $service['rating'],
                    'sender' => $customer[0]->name,
                    'aspect_to_improve' => $service['aspect_to_improve'],
                    'remark' => $service['remark'],
                    'company_id' => $customer[0]->company_id,
                    'user_id' => $request->user_id,
                    'project_id' => $request->project_id,
                    'service_id' => $service1[0]->service_id,
                    'list_feedback_project_id' => $request->list_feedback_project_id
                ]);
                DB::table('user_admin')->update([
                    'not_read_feedback' => DB::raw('not_read_feedback + 1')
                ]);
            }
            $project = DB::table('project')->where('project_id',$request->project_id)->get();
            if ($project[0]->quantity > 1){
                $feedback_project = DB::table('feedback_project')->where('list_feedback_project_id',$request->list_feedback_project_id)->get();
                $rating = 0;
                foreach ($feedback_project as $fp){
                    $rating = $fp->rating + $rating;
                }
                $avg = $rating/sizeof($feedback_project);
                $avg = round($avg*2)/2;

                DB::table('list_feedback_project')->where('list_feedback_project_id',$request->list_feedback_project_id)->update([
                    'rating' => $avg,
                    'date' => now()->toDateString(),
                ]);

                $list_feedback_project = DB::table('list_feedback_project')->where('project_id',$request->project_id)->get();
                $done = 0;
                foreach ($list_feedback_project as $fp){
                    if ($fp->rating != NULL){
                        $done = $done + 1;
                    }
                }

                DB::table('project')->where('project_id',$request->project_id)->update([
                    'done' => $done,
                ]);
            }else{
                DB::table('project')->where('project_id',$request->project_id)->update([
                    'done' => 1,
                ]);
            }

            $feedback_project = DB::table('feedback_project')->where('project_id',$request->project_id)->get();
            $rating = 0;
            foreach ($feedback_project as $fp){
                $rating = $fp->rating + $rating;
            }
            $avg = $rating/sizeof($feedback_project);
            $avg = round($avg*2)/2;

            DB::table('project')->where('project_id',$request->project_id)->update([
                'rating' => $avg
            ]);

            return response()->json([
                'message' => 'feedback_project Created'
            ]);
        }else{
            return response()->json([
                'message' => 'Rating cannot be 0'
            ],400);
        }
    }

    function filterOption(){
        $feedback_project = DB::table('feedback_project')->get();
        $name = array();
        $project_type = array();
        $years = array();
        $months = array();
        $aspect_to_improve = array();
        foreach($feedback_project as $comp){
            $company_name = DB::table('company')->where('company_id',$comp->company_id)->get();
            $project = DB::table('project')->where('project_id',$comp->project_id)->get();
            if (!in_array($company_name[0]->name,$name)){
                $name[] = $company_name[0]->name;
            }
            if (!in_array($project[0]->project_type,$project_type)){
                $project_type[] = $project[0]->project_type;
            }
            $temp = explode(',', $comp->aspect_to_improve);
            foreach ($temp as $ati){
                if (!in_array($ati,$aspect_to_improve)){
                    $aspect_to_improve[] = $ati;
                }
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
            'project_type' => $project_type,
            'feedback_component' => $aspect_to_improve,
            'year' => $years,
            'month' => $months,
            'range' => [1,3,6,12]
        ]);
    }

    function filter(Request $request){
        $feedback_project = DB::table('feedback_project');
        if ($request->company_name != NULL){
            $company = DB::table('company')->where('name',$request->company_name)->get();
            foreach($company as $c){
                $feedback_project = $feedback_project->where('company_id',$c->company_id);
            }
        }
        if ($request->project_type != NULL){
            $project = DB::table('project')->where('project_type',$request->project_type)->get();
            foreach ($project as $pro){
                $feedback_project = $feedback_project->where('project_id',$pro->project_id);
            }
        }
        if ($request->aspect_to_improve != NULL){
            $feedback_project = $feedback_project->where('aspect_to_improve','like','%'.$request->aspect_to_improve.'%');
        }
        if ($request->year != NULL){
            $feedback_project = $feedback_project->whereYear('date',$request->year);
        }
        if ($request->month != NULL){
            $feedback_project = $feedback_project->whereMonth('date',$request->month);
        }
        if ($request->rating != NULL){
            $feedback_project = $feedback_project->where('rating',$request->rating);
        }

        if ($request->range != NULL){
            $times = now()->toDateString();
            $time = strtotime(now()->toDateString());
            if (!($request->range == 1 || $request->range == 12 )){
                $final = date("Y-m-d", strtotime("-".$request->range." month", $time));
                $feedback_project = $feedback_project->whereBetween('date',[$final,$times]);
            }else if($request->range == 1){
                $feedback_project = $feedback_project->whereMonth('date',date("m",strtotime($times)));
            }else{
                $feedback_project = $feedback_project->whereYear('date',date("Y",strtotime($times)));
            }
        }

        if ($request->semester != NULL) {
            $semester_div = [1 => [1,2,3,4,5,6], 2 => [7,8,9,10,11,12]];
            $month = $request->semester > 0 && $request->semester < 3 ? $semester_div[$request->semester] : [];
            $feedback_project = $feedback_project->whereIn(DB::raw('MONTH(date)'), $month);
        }

        $feedback_project = $feedback_project->get();
        $result = array();
        foreach($feedback_project as $comp){
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

    function listFeedback($id){
        $list = DB::table('list_feedback_project')->where('project_id',$id)->get();
        return response()->json([
            'data' => $list,
        ]);
    }
}
