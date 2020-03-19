<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class NewInfoBirthday extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'newinfo:birthday';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Add new info + 1 when customer birthday';

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
        //
        if (now()->toTimeString() == "00:00:00"){
            $customer = DB::table('user_customer')->get();
            foreach($customer as $cust){
                if (date('d-m',strtotime(now()->toDateString())) == date('d-m',strtotime($cust->birthday))){
                    DB::table('user_customer')->where('user_customer_id',$cust->user_customer_id)->update([
                        "new_info" => $cust->new_info + 1
                    ]);
                }
            }
            
        }
    }
}
