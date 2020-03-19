<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PopUpController extends Controller
{
    //
    function read($id){
        $customer = DB::table('user_customer')->where('user_id',$id)->get();
        //holiday
        $holiday_card = DB::table('religion_card')->get();
        foreach ($holiday_card as $hc){
            if ($customer[0]->religion == $hc->religion){
                $popup_hc = (object) ([
                    'image' => $hc->image,
                    'permalink' => $hc->permalink
                ]);
            }else{
                $popup_hc = [];
            }
        }
        //ads
        $popup_ads = array();
        $company_ads = DB::table('company_ads')->where('company_id',$customer[0]->company_id)->get();
        foreach($company_ads as $ca){
            $ads = DB::table('ads')->where('ads_id',$ca->ads_id)->get();
            $popup_ads[] = (object) ([
                'image' => $ads[0]->image,
                'permalink' => $ads[0]->permalink,
                'interval' => $ads[0]->ads_interval,
            ]);
        }
        return response()->json([
            'popup_holiday' => $popup_hc,
            'popup_ads' => $popup_ads,
        ]);

    }
}
