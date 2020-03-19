<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Mail;

use Illuminate\Support\Facades\DB;
use App\Http\Requests;
use App\Http\Controllers\Controller;

class MailController extends Controller {
    public function send_email(Request $request) {
        $data = array('subject' => $request->subject, 'name'=>"Juan", 'from' => env('juanfelixparsaoran@gmail.com'));
        echo getenv('MAIL_FROM_ADDRESS','asda');
        $customer = DB::table('user_customer')->where('user_id',$request->user_id)->get();
        Mail::send('mail', $data, function($message) use ($data) {
            $message->to("juanfelixparsaoran@gmail.com", "Customer")->subject
            ($data['subject']);
            $message->from("juanfelixparsaoran@gmail.com","Juan");
        });
        return response()->json([
            'message' => 'Successfully send an email'
        ]);
    }
}
