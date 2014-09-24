<?php

function CheckSessionLogin()
{
	if(Session::has('EmpMan_EID') and  Session::has('EmpMan_Token'))
	{
		
	}
	else
	{
		 //return Redirect::to('/');
		die("Session Expired");
	}
}

function FinanceCheckSessionLogin()
{
	if(Session::has('EmpMan_EID') and Session::has('EmpMan_TID') and Session::get('EmpMan_TID')=='T3' and  Session::has('EmpMan_Token'))
	{
		
	}
	else
	{
		 //return Redirect::to('/Finance');
		 die("Session Expired");
	}
}

function ManagerCheckSessionLogin()
{
	if(Session::has('EmpMan_EID') and  Session::has('EmpMan_Token'))
	{
		
	}
	else
	{
		 //return Redirect::to('/');
		die("Session Expired");
	}
}