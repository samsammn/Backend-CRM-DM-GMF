<?php

// use Illuminate\Support\Facades\DB;
// use Illuminate\Support\Facades\Redis;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::get('/redis', function() {
//     $redis = Redis::connection();

//     if ($redis->exists('users')) {
//         $data = json_decode($redis->get('users'));
//         $source = 'data from redis';
//     } else {
//         $data = DB::table('user')->get();
//         $redis->set('users', $data);
//         $source = 'data from hit database';
//     }

//     return response()->json([
//         'users' => $data,
//         'source' => $source,
//         'redis' => $redis->keys('*')
//     ]);
// });

// Route::get('/redis-clear', function() {
//     $redis = Redis::connection();
//     $redis->flushall();

//     return "Redis Cleared";
// });

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/user/create','UserController@create');
Route::get('/user/createform','UserController@createForm');
Route::post('/user/update','UserController@update');
Route::get('/user/edit/{id}','UserController@edit');
Route::get('/user/read','UserController@read');
Route::get('/user/delete/{id}','UserController@delete');

Route::get('/admin/readmsg','UserController@read_message_admin');
Route::get('/admin/readcomplaint','UserController@read_complaint_admin');
Route::get('/admin/readfeedback','UserController@read_feedback_admin');
Route::get('/admin/read/{id}','UserController@read_admin');


Route::get('/loginldap', 'Auth\LoginController@login');
Route::post('/auth','LoginController@auth');
Route::get('/login','LoginController@login');
Route::get('/logout','LoginController@logout');

Route::get('/customer/read','UserCustomerController@read');
Route::get('/customer/edit/{id}','UserCustomerController@edit');
Route::get('/customer/delete/{id}','UserCustomerController@delete');
Route::post('/customer/update','UserCustomerController@update');
Route::get('/customer/done/{id}','UserCustomerController@done_tutorial');


//ads route
Route::get('/ads/read','AdsController@read');
Route::get('/ads/read/{id}','AdsController@getAdsInCompany');
Route::get('/ads/readinactive/{id}','AdsController@getInactiveAdsInCompany');
Route::get('/ads/edit/{id}','AdsController@edit');
Route::get('/ads/delete/{id}','AdsController@delete');
Route::post('/ads/update','AdsController@update');
Route::post('/ads/create','AdsController@create');

//birthday card route
Route::get('/birthday/read','BirthdayCardController@read');
Route::get('/birthday/edit/{id}','BirthdayCardController@edit');
Route::get('/birthday/delete/{id}','BirthdayCardController@delete');
Route::post('/birthday/update','BirthdayCardController@update');
Route::post('/birthday/create','BirthdayCardController@create');

//company route
Route::get('/company/read','CompanyController@read');
Route::get('/company/read/{id}','CompanyController@readUserInCompany');
Route::get('/company/edit/{id}','CompanyController@edit');
Route::get('/company/delete/{id}','CompanyController@delete');
Route::post('/company/update','CompanyController@update');
Route::post('/company/create','CompanyController@create');
Route::get('/company/export','CompanyController@export_excel');
Route::post('/company/import','CompanyController@import_excel');


//complaint route
Route::get('/complaint/read','ComplaintController@read');
Route::get('/complaint/read/{id}','ComplaintController@readByCompany');
Route::get('/complaint/edit/{id}','ComplaintController@edit');
Route::get('/complaint/delete/{id}','ComplaintController@delete');
Route::post('/complaint/update','ComplaintController@update');
Route::post('/complaint/create','ComplaintController@create');
Route::post('/complaint/reply','ComplaintController@reply');
Route::get('/complaint/readreply/{id}','ComplaintController@readReply');
Route::post('/complaint/filter','ComplaintController@filter');
Route::get('/complaint/filteroption','ComplaintController@filterOption');

//cp route
Route::get('/cp/read','CpController@read');
Route::get('/cp/read/{id}','CpController@readCpInCompany');
Route::get('/cp/edit/{id}','CpController@edit');
Route::get('/cp/delete/{id}','CpController@delete');
Route::post('/cp/update','CpController@update');
Route::post('/cp/create','CpController@create');

//newsletter route
Route::get('/newsletter/read','NewsletterController@read');
Route::get('/newsletter/edit/{id}','NewsletterController@edit');
Route::get('/newsletter/delete/{id}','NewsletterController@delete');
Route::post('/newsletter/update','NewsletterController@update');
Route::post('/newsletter/create','NewsletterController@create');

//religion route
Route::get('/religion/read','ReligionCardController@read');
Route::get('/religion/edit/{id}','ReligionCardController@edit');
Route::get('/religion/delete/{id}','ReligionCardController@delete');
Route::post('/religion/update','ReligionCardController@update');
Route::post('/religion/create','ReligionCardController@create');

//service route
Route::get('/service/read','ServiceController@read');
Route::get('/service/edit/{id}','ServiceController@edit');
Route::get('/service/delete/{id}','ServiceController@delete');
Route::post('/service/update','ServiceController@update');
Route::post('/service/create','ServiceController@create');

//feedback project route
Route::get('/feedbackproject/read','FeedbackProjectController@read');
Route::get('/feedbackproject/read/{id}','FeedbackProjectController@readByCompany');
Route::get('/feedbackproject/edit/{id}','FeedbackProjectController@edit');
Route::post('/feedbackproject/update','FeedbackProjectController@update');
Route::get('/feedbackproject/delete/{id}','FeedbackProjectController@delete');
Route::post('/feedbackproject/create','FeedbackProjectController@create');
Route::get('/feedbackproject/filteroption','FeedbackProjectController@filterOption');
Route::post('/feedbackproject/filter','FeedbackProjectController@filter');
Route::get('/feedbackproject/list/{id}','FeedbackProjectController@listFeedback');

Route::get('/feedbacknonproject/read','FeedbackNonProjectController@read');
Route::get('/feedbacknonproject/read/{id}','FeedbackNonProjectController@readByCompany');
Route::get('/feedbacknonproject/edit/{id}','FeedbackNonProjectController@edit');
Route::post('/feedbacknonproject/update','FeedbackNonProjectController@update');
Route::get('/feedbacknonproject/delete/{id}','FeedbackNonProjectController@delete');
Route::post('/feedbacknonproject/create','FeedbackNonProjectController@create');

//company ads route
Route::get('/companyads/add/{ads_id}/{company_id}','CompanyAdsController@add');
Route::get('/companyads/remove/{ads_id}/{company_id}','CompanyAdsController@remove');

//project route
Route::get('/project/read','ProjectController@read');
Route::get('/project/read/active','ProjectController@readactive');
Route::get('/project/read/{id}','ProjectController@readProjectInCompany');
Route::get('/project/edit/{id}','ProjectController@edit');
Route::post('/project/update','ProjectController@update');
Route::get('/project/delete/{id}','ProjectController@delete');
Route::post('/project/create','ProjectController@create');
Route::get('/project/fetch','ProjectController@read');

Route::get('/calendar/{month}/{year}','CalendarController@getHighlightedDays');
Route::get('/calendar/{day}/{month}/{year}','CalendarController@getCalendarDetail');

Route::get('/information/read/{id}','InformationController@read');
Route::get('/information/readinformation/{id}','InformationController@readInformation');

Route::post('/newsletter/send','NewsletterController@send');

Route::get('/messages', 'ChatController@index');
Route::get('/messages/get/{id}', 'ChatController@fetchMessages');
Route::post('/messages/send', 'ChatController@sendMessage');
Route::get('/messages/read/{sender_id}/{receiver_id}', 'ChatController@readMessage');
Route::get('/messages/search/{query}', 'ChatController@searchMessage');
Route::get('/messages/close/{id}', 'ChatController@closeThread');
Route::get('/messages/delete/{id}', 'ChatController@deleteMessage');
Route::get('/messages/history/{id}', 'ChatController@chatHistoryCustomer');
Route::get('/popup/read/{id}', 'PopUpController@read');

Route::get('/fleet/read','FleetMaintController@read');
Route::get('/fleet/read/{product}','FleetMaintController@readByProduct');
Route::post('/fleet/update','FleetMaintController@update');
Route::get('/fleet/delete/{id}','FleetMaintController@delete');
Route::post('/fleet/create','FleetMaintController@create');
Route::get('/fleet/readcompany/{id}','FleetMaintController@readByCompanyId');
Route::get('/fleet/readcompanyproduct/{id}/{product}','FleetMaintController@readByCompanyProduct');

Route::get('/revenue/read','RevenueController@read');
Route::get('/revenue/read/{id}','RevenueController@sum');
Route::post('/revenue/update','RevenueController@update');
Route::get('/revenue/delete/{id}','RevenueController@delete');
Route::post('/revenue/create','RevenueController@create');
Route::get('/revenue/sum/{id}','RevenueController@sum');

Route::get('/pastmarketing/read','PastMarketingController@read');
Route::get('/pastmarketing/read/{id}','PastMarketingController@readPastMarketingInCompany');
Route::post('/pastmarketing/update','PastMarketingController@update');
Route::get('/pastmarketing/delete/{id}','PastMarketingController@delete');
Route::post('/pastmarketing/create','PastMarketingController@create');

Route::get('/search/{query}/{company_id}','SearchController@search');
Route::get('/searchadmin/{query}','SearchController@search_admin');

Route::get('/alliance/read','AllianceController@read');
Route::post('/alliance/update','AllianceController@update');
Route::get('/alliance/delete/{id}','AllianceController@delete');
Route::post('/alliance/create','AllianceController@create');

Route::get('/ctype/read','CustomerTypeController@read');
Route::post('/ctype/update','CustomerTypeController@update');
Route::get('/ctype/delete/{id}','CustomerTypeController@delete');
Route::post('/ctype/create','CustomerTypeController@create');

Route::get('/aircraft_type/read','AircraftTypeController@read');
Route::post('/aircraft_type/update/{id}','AircraftTypeController@update');
Route::get('/aircraft_type/delete/{id}','AircraftTypeController@delete');
Route::post('/aircraft_type/create','AircraftTypeController@create');
