<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;

use Mail;
class NewsletterController extends Controller
{
    //
    function read(){
        $newsletter = DB::table('newsletter')->orderBy('created_at','DESC')->get();
        return $newsletter;
    }
    function edit($id){
        $newsletter = DB::table('newsletter')->where('newsletter_id',$id)->get();
        return response()->json([
            'data' => $newsletter
        ]);
    }
    function update(Request $request){
        $newsletter = DB::table('newsletter')->where('newsletter_id',$request->id)->get();
        $path = $request->image != NULL ? Storage::putFile('newsletter', $request->image) : $newsletter[0]->image;
        if ($request->image != NULL){
            Storage::delete($newsletter[0]->image);
        }
        DB::table('newsletter')->where('newsletter_id',$request->id)->update([
            'subject' => $request->subject != NULL ? $request->subject : $newsletter[0]->subject,
            'image' => $path,
            'permalink' => $request->permalink != NULL ? $request->permalink : $newsletter[0]->permalink,
            'updated_at' => now()
        ]);
        return response()->json([
            'message' => 'Newsletter Updated'
        ]);
    }
    function delete($id){
        DB::table('newsletter')->where('newsletter_id',$id)->delete();
        return 'deleted';
    }
    function create(Request $request){
        $from = \config('mail.from.address');
        $url = \config('filesystems.disks.local.root');
        $name = \config('mail.from.name');
        $path = $request->image != NULL ? Storage::putFile('newsletter', $request->image) : "";
        DB::table('newsletter')->insert([
            'subject' => $request->subject,
            'image' => $path,
            'permalink' => $request->permalink,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
        $customer = DB::table('user_customer')->get();
        foreach($customer as $cust){
            DB::table('user_customer')->where('user_customer_id',$cust->user_customer_id)->update([
                "new_info" => $cust->new_info + 1
            ]);
            $data = array('subject' => $request->subject, 'name'=>$name, 'path' => $path, 'attachment'=>$url."/".$path , 'from' => $from, 'to'=>$cust->email, 'type'=>"Newsletter");
            Mail::send('mail', $data, function($message) use ($data) {
                $message->to($data['to'], "Customer")->subject
                ($data['subject']);
                if ($data['path'] != ""){
                    $message->attach($data['attachment']);
                }
                $message->from($data['from'],"Juan");
            });
        }
        return response()->json([
            'message' => 'Successfully send an email'
        ]);
    }
}
