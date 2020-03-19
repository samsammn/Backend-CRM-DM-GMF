<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class NewInfoHoliday extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'newinfo:holiday';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Add new info + 1 when customer holiday';

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
            $religion_card = DB::table('religion_card')->get();
            $customer = DB::table('user_customer')->get();
            foreach($religion_card as $rc){
                if (now()->toDateString == $rc->date){
                    foreach($customer as $cust){
                        if ($cust->religion == $rc->religion || $rc->religion == "Universal"){
                            DB::table('user_customer')->where('user_customer_id',$cust->user_customer_id)->update([
                                "new_info" => $cust->new_info + 1
                            ]);
                        }
                    }
                }
            }
        }
    }
}
