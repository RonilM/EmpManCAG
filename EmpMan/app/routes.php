<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

//General Workflow ********************************************************************************************
Route::get('/', function()
{
	return View::make('index');
});
Route::get('/LogoutLogic','LoginLogicController@Logout');
//**************************************************************************************************************


//Employee Workflow ***************************************************************************************
Route::get('/Employee', function()
{
	$Reply="";
	return View::make('EmployeeUI.ReimbursementLogin',array('Reply' => $Reply));
});

Route::get('/GoogleLogin','GoogleLoginController@AuthTokenExchange');
Route::get('/LoginLogic','LoginLogicController@Login');
Route::get('/reimbursements',array('before'=>'EmpManAuth',function()
{	
	$finrequesttypes = DB::table('finrequesttypes')->get();
	return View::make('EmployeeUI.reimbursements', array('finrequesttypes' => $finrequesttypes) );
}));
Route::post('/reimbursementsrequest', 'reimbursementController@AcceptRequest');
//***************************************************************************************************************


//Finance Workflow **********************************************************************************************
Route::get('/Finance', function()
{
	$Reply="";
	return View::make('FinanceUI.FinanceLogin',array('Reply' => $Reply));
});
Route::get('/FinanceLoginLogic','LoginLogicController@FinanceLogin');
Route::get('/FinanceTeamScreenClaims','FinanceController@Claims');
Route::post('/FinanceApprovals','FinanceController@Approval');
//****************************************************************************************************************

//Manager Workflow **********************************************************************************************
Route::get('/Manager', function()
{
	$Reply="";
	return View::make('ManagerUI.ManagerLogin',array('Reply' => $Reply));
});
Route::get('/ManagerLoginLogic','LoginLogicController@ManagerLogin');
Route::get('/ManagerTeamScreenClaims','ManagerController@Claims');
Route::post('/managerapprovals','ManagerController@Approval');
//****************************************************************************************************************

