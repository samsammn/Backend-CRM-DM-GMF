<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Mail;
use Illuminate\Support\Facades\DB;

class SendBirthdayCard extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'sendemail:birthdaycard';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Send birthday card at a spesific date';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        if (now()->toTimeString() == "12:00:00"){
            $birthday_card = DB::table('birthday_card')->get();
            $from = \config('mail.from.address');
            $url = \config('filesystems.disks.local.root');
            
                $path = $birthday_card[0]->image;
                $customer = DB::table('user_customer')->get();
                foreach ($customer as $cust){
                    if (date('d-m',strtotime(now()->toDateString())) == date('d-m',strtotime($cust->birthday))){
                        $image = "http://172.16.40.180:8080/storage/".$path;
                        $name = $cust->name;
                        $data = array('subject' => $rc->subject, 'name'=>$name, 'path' => $path, 'attachment'=>$url."/".$path , 'from' => $from, 'to'=>$cust->email,'type'=>"Holiday Card", 'image' => $image);
                        Mail::send('mail', $data, function($message) use ($data) {
                            $message->to($data['to'], "Customer")->subject
                            ($data['subject']);
                            if ($data['path'] != ""){
                                $message->attach($data['attachment']);
                            }
                            $message->from($data['from'],"Juan");
                        });
                    }
                }
                
            
        }
    }
}
