<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    public function login(Request $request)
    {
        if ($request->session()->has('username')){
            return response()->json([
                'message' => 'Authenticated',
                'auth' => true,
                'id' => $request->session()->get('id'),
            ],200);
        }else{
            return response()->json([
                'message' => 'Not Authenticated',
                'auth' => false
            ],400);
        }
    }

    public function logout(Request $request)
    {
        $id = $request->session()->get('id');
        $user = DB::table('user')->where('user_id', '=', $id)->update(['status_login' => 0]);

        $request->session()->forget('username');
        return response()->json([
            'message' => 'Successfully Logout'
        ]);
    }

    public function auth(Request $request)
    {
        $login = false;
        $users = DB::table('user')->get();
        foreach ($users as $user)
        {
            if ($user->username == $request->username && (Hash::check($request->password, $user->password)))
            {

                if ($request->remember_me){
                    config(['session.lifetime' => 35791394]);
                } else {
                    config(['session.lifetime' => 15]);
                }

                $request->session()->put('username',$request->username);
                $request->session()->put('id',$user->user_id);

                $id = $user->user_id;
                DB::table('user')->where('user_id', '=', $id)->update(['status_login' => 1]);

                $user_logged = $user;
                if ($user->role == "Customer"){
                    $user_detail = DB::table('user_customer')->where('user_id',$user->user_id)->get();
                    $company = DB::table('company')->where('company_id',$user_detail[0]->company_id)->get();
                    $user_detail[0]->company_name = $company[0]->name;
                }else if ($user->role == "Admin"){
                    $user_detail = DB::table('user_admin')->where('user_id',$user->user_id)->get();
                }else{
                    $user_detail = DB::table('user_guest')->where('user_id',$user->user_id)->get();
                }
                $login = true;
            }
        }
        if ($login){
            return response()->json([
                'message' => 'Successfully Login',
                'data_user' => $user_logged,
                'detail_user' => $user_detail[0],
            ]);
        }else{
            return response()->json([
                'message' => 'Failed to Login',
                'data_user' => [],
                'detail_user' => [],
            ],400);
        }
    }
    public function signin(Request $request)
    {
        $request->validate([
            'username' => 'required',
            'password' => 'required'
        ]);
        $username = $request->username;
        $password = $request->password;
        $isValidSignin = $this->checkLdap($username, $password);
        return response()->json(['result' => $isValidSignin ]);
    }
    function checkLdap($username, $password)
    {
        $dn = "DC=gmf-aeroasia,DC=co,DC=id";
        // $ldapconn = ldap_connect("192.168.240.57") or die ("Could not connect to LDAP server.");
        $ip_ldap = [
            '0' => "192.168.240.66",
            '1' => "192.168.240.57",
            '2' => "172.16.100.46",
        ];
        $ipcon="";
        for($a=0;$a<count($ip_ldap);$a++){
            $ldapconn = ldap_connect($ip_ldap[$a]);
            if($ldapconn){
                $ipcon=$ip_ldap[$a];
                break;
            }else{
                // log_message("error", "IP : ".$ip_ldap[$a]."- Not Connected");
                continue;
            }
        }
        if ($ldapconn) {
            ldap_set_option(@$ldapconn, LDAP_OPT_PROTOCOL_VERSION, 3);
            ldap_set_option(@$ldapconn, LDAP_OPT_REFERRALS, 0);
            $ldapbind = ldap_bind($ldapconn, "ldap", "aeroasia");
            @$sr = ldap_search($ldapconn, $dn, "samaccountname=$username");
            @$srmail = ldap_search($ldapconn, $dn, "mail=$username@gmf-aeroasia.co.id");
            @$info = ldap_get_entries($ldapconn, @$sr);
            @$infomail = ldap_get_entries($ldapconn, @$srmail);
            @$usermail = substr(@$infomail[0]["mail"][0], 0, strpos(@$infomail[0]["mail"][0], '@'));
            @$bind = @ldap_bind($ldapconn, $info[0]['dn'], $password);
            if(!$bind){
            return false;
            // log_message("error", "IP : ".$ipcon."- Eror Bind");
            }
            if ((@$info[0]["samaccountname"][0] == $username AND ($bind || isset($bind))) OR (@$usermail == $username AND ($bind || isset($bind)))) {
                //return mb_convert_encoding($info, 'UTF-8', 'UTF-8');
                return true;
            } else {
                return false;
            }
        } else {
            echo "LDAP Connection trouble, please try again 2/3 time";
        }
    }
}
