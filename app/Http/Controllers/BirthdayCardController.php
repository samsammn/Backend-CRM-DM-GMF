<?php

namespace App\Http\Controllers;

use Image;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;

class BirthdayCardController extends Controller
{
    //
    function read(){
        $birthday_card = DB::table('birthday_card')->orderBy('created_at','DESC')->get();
        return response()->json([
            'data' => $birthday_card
        ]);
    }
    function edit($id){
        $birthday_card = DB::table('birthday_card')->where('birthday_card_id',$id)->get();
        if (!$birthday_card->isEmpty()){
            return response()->json([
                'message' => 'Birthday Card found',
                'data' => $birthday_card
            ]);
        }else{
            return response()->json([
                'message' => 'Birthday Card not found',
                'data' => []
            ]);
        }
    }
    function update(Request $request){
        $this->validate($request, [
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:1024'
        ]);

        $birthday_card = DB::table('birthday_card')->where('birthday_card_id',$request->id)->get();
        $path = $request->image != NULL ? Storage::putFile('birthdaycard', $request->image) : $birthday_card[0]->image;
        if ($request->image != NULL){
            Storage::delete($birthday_card[0]->image);
        }
        DB::table('birthday_card')->where('birthday_card_id',$request->id)->update([
            'subject' => $request->subject != NULL ? $request->subject : $birthday_card[0]->subject,
            'permalink' => $request->permalink != NULL ? $request->permalink : $birthday_card[0]->permalink,
            'image' => $path,
            'updated_at' => now()
        ]);

        return response()->json([
            'message' => 'Birthday Card Updated',
            'errors' => ''
        ]);
    }
    function delete($id){
        DB::table('birthday_card')->where('birthday_card_id',$id)->delete();
        return response()->json([
            'message' => 'Birthday Card Deleted'
        ]);
    }
    function create(Request $request){
        $this->validate($request, [
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:1024'
        ]);

        $path = $request->image != NULL ? Storage::putFile('birthdaycard', $request->image) : "";
        DB::table('birthday_card')->insert([
            'subject' => $request->subject,
            'permalink' => $request->permalink,
            'image' => $path,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        return response()->json([
            'message' => 'Birthday Card Created',
            'errors' => ''
        ]);
    }

    public function merge(Request $request)
    {
        // $filename = 'http://172.16.41.180:8080/storage/birthdaycard/lCmIlRAEmcNWdpKdVVjIu6ksB15MvSI7tA4SLD0Y.png';
        // $filename = 'http://172.16.41.180:8080/storage/birthdaycard/LlK7MK2i8UO2nvHUZ4I5NHD3PlUKtN1FELHeJtfh.jpeg';
        $filename = $request->file('image')->getRealPath();

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
        $img->text('Samsam MN', $pos_x, ($pos_y + 45), function($font) {
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

        return $img->response('jpg');
    }
}
