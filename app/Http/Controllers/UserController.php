<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;

class UserController extends Controller
{
    public function read()
    {
        // mengambil data dari table pegawai
        $user = DB::table('user')->get();
        return response()->json([
            'data' => $user
        ]);  
    }

    public function create(Request $request)
    {
        $path = $request->image != NULL ? Storage::putFile('user', $request->image) : "user/default.png";
        DB::table('user')->insert([
            'username' => $request->username,
            'password' => bcrypt($request->password),
            'pass_raw' => $request->password,
            'role' => $request->role,
            'status' => $request->status,
            'image' => $path
        ]);
        $user = DB::table('user')->where('username',$request->username)->get();
        $company = DB::table('company')->where('company_id',$request->company_id)->get();
        if ($request->role == 'Customer'){
            DB::table('user_customer')->insert([
                'name' => $request->name,
                'position' => $request->position,
                'religion' => $request->religion,
                'birthday' => $request->birthday,
                'email' => $request->email,
                'customer_role' => $request->customer_role,
                'user_id' => $user[0]->user_id,
                'company_id' => $company[0]->company_id
            ]);  
        }else if ($request->role == 'Admin'){
            DB::table('user_admin')->insert([
                'name' => $request->name,
                'position' => $request->position,
                'division' => $request->division,
                'user_id' => $user[0]->user_id
            ]);   
        }else{
            DB::table('user_guest')->insert([
                'name' => $request->name,
                'position' => $request->position,
                'division' => $request->division,
                'user_id' => $user[0]->user_id
            ]);  
        }

        return response()->json([
            'message' => 'User Created'
        ]);
    }

    public function createForm()
    {
        return view('create');
    }

    function edit($id){
        $user = DB::table('user')->where('user_id',$id)->get();
        if (!$user->isEmpty()){
            return response()->json([
                'message' => 'User found',
                'data' => $user
            ]);
        }else{
            return response()->json([
                'message' => 'User not found',
                'data' => []
            ]);
        }
    }

    public function update(Request $request){
        $user = DB::table('user')->where('user_id',$request->id)->get();
        $path = $request->image != NULL ? Storage::putFile('user', $request->image) : $user[0]->image;
        if ($request->image != NULL){
            Storage::delete($user[0]->image);
        }
        DB::table('user')->where('user_id',$request->id)->update([
            'username' => $request->username != NULL ? $request->username : $user[0]->username,
            'password' => $request->password != NULL ? bcrypt($request->password) : $user[0]->password,
            'pass_raw' => $request->password != NULL ? $request->password : $user[0]->pass_raw,
            'image' => $path
        ]);
        
        if($user[0]->role == 'Customer'){
            $user = DB::table('user')->join('user_customer','user.user_id','=','user_customer.user_id')->where('user.user_id',$request->id)->get();
            DB::table('user_customer')->where('user_id',$user[0]->user_id)->update([
                'name' => $request->name != NULL ? $request->name : $user[0]->name,
                'position' => $request->position != NULL ? $request->position : $user[0]->position,
                'religion' => $request->religion != NULL ? $request->religion : $user[0]->religion,
                'birthday' => $request->birthday != NULL ? $request->birthday : $user[0]->birthday,
                'email' => $request->email != NULL ? $request->email : $user[0]->email,
                'position' => $user[0]->position,
            ]);
        }else if($user[0]->role == 'Admin'){
            $user = DB::table('user')->join('user_admin','user.user_id','=','user_admin.user_id')->where('user.user_id',$request->id)->get();
            DB::table('user_admin')->where('user_id',$user[0]->user_id)->update([
                'name' => $request->name != NULL ? $request->name : $user[0]->name,
                'position' => $request->position != NULL ? $request->position : $user[0]->position,
                'division' => $request->division != NULL ? $request->division : $user[0]->division,
            ]);
        }else{
            $user = DB::table('user')->join('user_guest','user.user_id','=','user_guest.user_id')->where('user.user_id',$request->id)->get();
            DB::table('user_guest')->where('user_id',$user[0]->user_id)->update([
                'name' => $request->name != NULL ? $request->name : $user[0]->name,
                'position' => $request->position != NULL ? $request->position : $user[0]->position,
                'division' => $request->division != NULL ? $request->division : $user[0]->division,
            ]);
        }

        return response()->json([
            'message' => 'User Updated',
            'data' => $user[0],
        ]);
    }

    function delete($id){
        DB::table('user')->where('user_id',$id)->delete();
        return response()->json([
            'message' => 'Successfully delete customer'
        ]);
    }

    function checkUsername($username){
        $user = DB::table('user')->where('username',$username)->get();
        if (!$user->isEmpty()){
            return response()->json([
                'message' => 'User found',
                'data' => $user
            ]);
        }else{
            return response()->json([
                'message' => 'User not found',
                'data' => []
            ]);
        }
    }
    
    function read_message_admin(){
        DB::table('user_admin')->update([
            'not_read_msg' => 0
        ]);
        return response()->json([
            'message' => 'Read Message Success'
        ]);
    }
    function read_complaint_admin(){
        DB::table('user_admin')->update([
            'not_read_complaint' => 0
        ]);
        return response()->json([
            'message' => 'Read Complaint Success'
        ]);
    }
    function read_feedback_admin(){
        DB::table('user_admin')->update([
            'not_read_feedback' => 0
        ]);
        return response()->json([
            'message' => 'Read Feedback Success'
        ]);
    }

    function read_admin($id){
        $admin = DB::table('user_admin')->where('user_id',$id)->get();
        return response()->json([
            'data' => $admin
        ]);
    }

}
