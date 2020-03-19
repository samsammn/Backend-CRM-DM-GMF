<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use DateTime;
class CalendarController extends Controller
{
    //
    function getHighlightedDays($month,$year){
        $highlightedDays = array();
        $highlighted = DB::table('user_customer')->whereMonth('birthday',$month)->get();
        foreach ($highlighted as $highlight){
            $date = new DateTime($highlight->birthday);
            if (!in_array($date->format('d'),$highlightedDays)){
                array_push($highlightedDays,(int)$date->format('d'));
            }
        }
        $highlightedReligion = DB::table('religion_card')->whereMonth('date',$month)->whereYear('date',$year)->get();
        foreach ($highlightedReligion as $highlight){
            $date = new DateTime($highlight->date);
            if (!in_array($date->format('d'),$highlightedDays)){
                array_push($highlightedDays,(int)$date->format('d'));
            }
        }
        return response()->json([
            'highlightedDays' => $highlightedDays,
        ]);
        
    }

    function getCalendarDetail($day,$month,$year){
        $detail = array();
        $user_customer = DB::table('user_customer')->whereDay('birthday',$day)->whereMonth('birthday',$month)->get();
        foreach ($user_customer as $customer){
            $company = DB::table('company')->where('company_id',$customer->company_id)->get();
            $date = new DateTime($customer->birthday);
            $data = (object)[
                "event" => $customer->name." Birthday",
                "company" => $company[0]->name
            ];
            array_push($detail, $data);
        }
        $religion_card = DB::table('religion_card')->whereDay('date',$day)->whereMonth('date',$month)->whereYear('date',$year)->get();
        foreach ($religion_card as $religion){
            $date = new DateTime($religion->date);
            $data = (object)[
                "event" => $religion->subject." ".$year,
            ];
            array_push($detail, $data);
        }
        return response()->json([
            'detail' => $detail,
        ]);
    }
}
