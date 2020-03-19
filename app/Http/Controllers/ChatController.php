<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Events\MessageSent;
use Carbon\Carbon;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Storage;

class ChatController extends Controller
{
    //
    public function index()
    {
        $user_detail = DB::table('user_customer')->where('user_id',10)->get();
        return view('chat',['user_detail' => $user_detail]);
    }

    /**
     * Fetch all messages
     *
     * @return Message
     */
    public function fetchMessages($id)
    {
        $user = DB::table('user')->where('user_id', $id)->first();
        if ($user === null) {
            return response()->json([
                'message' => 'User not found'
            ]);
        }

        if ($user->role == "Customer"){
            $message = DB::table('message')
                            ->where('user_id', '=', $id)
                            ->orWhere('rcv_user_id', $id)
                            ->orderBy('created_at', 'ASC')
                            ->get();

            $count = 0;
            foreach ($message as $msgu){
                if ($msgu->already_read == 0 && $msgu->user_id != $id){
                    $count = $count + 1;
                }
            }

            return response()->json([
                "message" => $message,
                "unread_count" => $count
            ]);

        }else{
            $sender = array();
            $response = array();
            $message = DB::table('message')->orderBy('created_at','DESC')->get();

            foreach ($message as $msg){
                if (!in_array($msg->user_id, $sender) && $msg->sender != "admin"){
                    $sender[] = $msg->user_id;
                }
                if (!in_array($msg->rcv_user_id, $sender) && $msg->receiver != "admin"){
                    $sender[] = $msg->rcv_user_id;
                }
            }

            foreach ($sender as $send){
                $message_user = DB::table('message')->where('user_id', $send)->orWhere('rcv_user_id', $send)->orderBy('created_at','ASC')->get();
                $unread = 0;

                foreach ($message_user as $msgu){
                    if ($msgu->already_read == 0 && $msgu->user_id != $id){
                        $unread = $unread + 1;
                    }
                }

                $user_customer = DB::table('user_customer')->where('user_id',$send)->get();
                $user = DB::table('user')->where('user_id',$send)->get();
                $company = DB::table('company')->where('company_id',$user_customer[0]->company_id)->get();

                $rsp_body = (object)[
                    $send => ([
                        "name" => $user_customer[0]->name,
                        "image" => $user[0]->image,
                        "last_message" => $message_user[sizeof($message_user)-1],
                        "messages" => $message_user,
                        "unread_count" => $unread,
                        "company" => $company[0]->name
                    ])
                ];

                $response[] = $rsp_body;

            }

            return response()->json([
                $response
            ]);
        }
    }

    /**
     * Persist message to database
     *
     * @param  Request $request
     * @return Response
     */
    public function sendMessage(Request $request)
    {
        $user = DB::table('user')->where('user_id',$request->user_id)->get();
        if ($user[0]->role == "Customer"){
            $user_detail = DB::table('user_customer')->where('user_id',$request->user_id)->get();
            $receiver = "admin";
            $sender = $user_detail[0]->name;
            DB::table('user_admin')->update([
                'not_read_msg' => DB::raw('not_read_msg + 1')
            ]);

        }else if ($user[0]->role == "Admin"){
            $user_detail = DB::table('user_admin')->where('user_id',$request->user_id)->get();
            $rcvr_detail = DB::table('user_customer')->where('user_id',$request->rcvr_id)->get();
            $receiver = $rcvr_detail[0]->name;
            $sender = "admin";
        }else{
            $user_detail = DB::table('user_guest')->where('user_id',$request->user_id)->get();
            $rcvr_detail = DB::table('user_customer')->where('user_id',$request->rcvr_id)->get();
            $receiver = $rcvr_detail[0]->name;
        }
        if ($request->type == "text"){
            DB::table('message')->insert([
                'message' => $request->message,
                'user_id' => $request->user_id,
                'sender' => $sender,
                'created_at' => now(),
                'receiver' => $receiver,
                'rcv_user_id' => $request->rcvr_id,
                'type' => "text"
            ]);
        }else{
            $path = $request->file != NULL ? Storage::putFile('chat', $request->file) : "";
            DB::table('message')->insert([
                'message' => $path,
                'user_id' => $request->user_id,
                'sender' => $sender,
                'created_at' => now(),
                'receiver' => $receiver,
                'rcv_user_id' => $request->rcvr_id,
                'type' => $request->type
            ]);
        }
        if ($user[0]->role == "Customer"){
            $chat = DB::table('message')->where('user_id',$request->user_id)->get();
            $admin = DB::table('user')->where('role', '=', 'Admin')->limit(1)->first();

            // mengecek waktu terakhir bot dikirim
            if (!Session::has('time_bot')){
                Session::put('time_bot', date('d-m-Y H:i:s'));
            }

            $startDate = Carbon::createFromFormat('d-m-Y H:i:s', Session::get('time_bot'));
            $endDate = Carbon::createFromFormat('d-m-Y H:i:s', date('d-m-Y H:i:s'));

            $days = $startDate->diffInDays($endDate);
            $hours = $startDate->copy()->addDays($days)->diffInHours($endDate);
            $minutes = $startDate->copy()->addDays($days)->addHours($hours)->diffInMinutes($endDate);

            if ($admin->status_login == 0 && $minutes >= 2){
                DB::table('message')->insert([
                    'message' => "Your message has been received. Please wait for our admin to reply",
                    'user_id' => $admin->user_id,
                    'sender' => "admin",
                    'created_at' => now(),
                    'receiver' => $sender,
                    'rcv_user_id' => $request->user_id,
                    'type' => "text"
                ]);
                Session::set('time_bot', date('d-m-Y H:i:s'));
            }
        }
        // $message = (object)([
        //     'message' => $request->message,
        //     'sender' => $user_detail[0]->name,
        //     'user_id' => $request->user_id,
        //     'receiver' => $receiver,
        //     'rcvr_id' => $request->rcvr_id,
        // ]);

        // broadcast(new MessageSent($message));
        return response()->json([
            'message' => "Message Sent"
        ]);
    }

    public function readMessage($sender_id, $receiver_id){
        $user = DB::table('user')->where('user_id',$receiver_id)->get();
        if ($user[0]->role == "Customer"){
            DB::table('message')->where('rcv_user_id',$receiver_id)->update([
                "already_read" => true
            ]);
        }else{
            DB::table('message')->where('user_id',$sender_id)->update([
                "already_read" => true
            ]);
        }
        return response()->json([
            'message' => "Already Read Updated"
        ]);
    }

    public function searchMessage($query){
        $sender = array();
        $response = array();
        $message = DB::table('message')->orderBy('created_at')->get();
        foreach ($message as $msg){
            if (!in_array($msg->user_id,$sender) && $msg->sender != "admin"){
                $sender[] = $msg->user_id;
            }
        }
        foreach ($sender as $send){
            $message_user = DB::table('message')->where('user_id',$send)->orWhere('rcv_user_id',$send)->orderBy('created_at','ASC')->get();
            $unread = 0;
            foreach ($message_user as $msgu){
                if ($msgu->already_read == 0 && $msgu->receiver == "admin"){
                    $unread = $unread + 1;
                }
            }
            $user_customer = DB::table('user_customer')->where('user_id',$send)->get();
            $user = DB::table('user')->where('user_id',$send)->get();
            $company = DB::table('company')->where('company_id',$user_customer[0]->company_id)->get();
            if ((strpos($user_customer[0]->name,$query) !== false) || (strpos($message_user[sizeof($message_user)-1]->message,$query)!==false)){
                $rsp_body = (object)[
                    $send => ([
                        "name" => $user_customer[0]->name,
                        "image" => $user[0]->image,
                        "last_message" => $message_user[sizeof($message_user)-1],
                        "messages" => $message_user,
                        "unread_count" => $unread,
                        "company" => $company[0]->name
                    ])
                ];
                $response[] = $rsp_body;
            }
        }
        return response()->json([
            $response
        ]);
    }

    public function closeThread($id){
        DB::table('message')->where('user_id',$id)->orWhere('rcv_user_id',$id)->update(['status' => 'close']);
        return response()->json([
            'message' => "Thread Closed"
        ]);
    }

    public function deleteMessage($id){
        DB::table('message')->where('status','close')->where('user_id',$id)->orWhere('rcv_user_id',$id)->delete();
        return response()->json([
            'message' => "Thread Delted"
        ]);
    }
}
