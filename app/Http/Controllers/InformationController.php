<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class InformationController extends Controller
{
    //
    
    function read($id){
        $customer = DB::table('user_customer')->where('user_id',$id)->get();
        $data = array();
        $company_ads = DB::table('company_ads')->where('company_id',$customer[0]->company_id)->get();
        foreach ($company_ads as $ad){
            $ads = DB::table('ads')->where('ads_id',$ad->ads_id)->orderBy('updated_at','DESC')->get(['subject','updated_at','image']);
            $ads[0]->category = 'GMF Product';
            $data[] = $ads[0];
        }

        $birthday_card = DB::table('birthday_card')->get(['subject','updated_at','image']);
        foreach ($birthday_card as $bc){
            $date = strtotime($customer[0]->birthday);
            $temp = date('m-d',$date);
            if (now()->format('m-d') == $temp){
                $bc->category = 'Birthday Card';
                $data[] = $bc;
            }
        }

        $religion_card = DB::table('religion_card')->get();
        foreach ($religion_card as $rc){
            if ($rc->religion == $customer[0]->religion || $rc->religion == "Universal"){
                $date = strtotime($rc->date);
                $temp = date('Y-m-d',$date);
                if (now()->format('Y-m-d') == $temp){
                    $rc->category = 'Holiday Card';
                    $data[] = $rc;
                }
            }
        }

        $newsletter = DB::table('newsletter')->orderBy('updated_at','DESC')->get(['subject','updated_at','image','permalink']);
        foreach ($newsletter as $nw){
            $nw->category = 'Newsletter';
            $data[] = $nw;
        }
        usort($data, function($a, $b){
            return ($a->updated_at < $b->updated_at);
        });
        return $data;
    }

    function readInformation($id){
        DB::table('user_customer')->where('user_customer_id',$id)->update([
            'new_info' => 0
        ]);
        return response()->json([
            'message' => 'Read Information'
        ]);
    }

}
