<?php

namespace App\Console\Commands;

use Mail;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Image;
use Intervention\Image\Response;

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
                        $image_path = "http://172.16.41.180:8080/storage/".$path;
                        $name = $cust->name;

                        $image = $this->merge_image($image_path, $name);

                        $data = array('subject' => $birthday_card[0]->subject, 'name' => $name, 'path' => $path, 'attachment' => $image , 'from' => $from, 'to' => $cust->email,'type' => "Birthday Card", 'image' => $image);
                        Mail::send('mail', $data, function($message) use ($data) {
                            $message->to($data['to'], "Customer")->subject
                            ($data['subject']);
                            if ($data['path'] != ""){
                                $message->attach($data['attachment']);
                            }
                            $message->from($data['from'], "Garuda Maintenance Facility");
                        });
                    }
                }
        }
    }

    public function merge_image($image, $name)
    {
        $filename = $image;

        $img = Image::make($filename);
        $width = $img->width();
        $height = $img->height();

        $pos_x = round($width / 2);
        $pos_y = round($height / 2) - 110;

        $img->text('Happy Birthday', $pos_x, $pos_y, function($font) {
            $font->file(resource_path('fonts/futur.ttf'));
            $font->size(22);
            $font->color('#fff');
            $font->align('center');
            $font->valign('top');
            $font->angle(0);
        });
        $img->text($name, $pos_x, ($pos_y + 45), function($font) {
            $font->file(resource_path('fonts/futur.ttf'));
            $font->size(18);
            $font->color('#fff');
            $font->align('center');
            $font->valign('top');
            $font->angle(0);
        });
        $img->text('Wishing you a wonderful birthday and a year filled with success', $pos_x, ($pos_y + 100), function($font) {
            $font->file(resource_path('fonts/futur.ttf'));
            $font->size(12);
            $font->color('#fff');
            $font->align('center');
            $font->valign('top');
            $font->angle(0);
        });

        $path = 'public/storage/birthdaycard/' . uniqid('for_email_') . '.png';
        $img->save($path);

        return $path;
    }
}
