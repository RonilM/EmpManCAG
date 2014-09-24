<?php

$GV["Environment"] = "Development";


if($GV["Environment"]==="Development"){
	$GV["BaseAddress"] = "http://localhost:8899";
	$GV["Scope"] = "email profile";
	$GV["ClientID"] = "666711050704-bfes64d4prcrqksgn2lgq8g3rh70886f.apps.googleusercontent.com";
	$GV["ClientSecret"] = "08_kTpT18oMr1L0egtcHHIbn";
	$GV["EmployeeState"] = "reimbursements";
	$GV["ManagerState"] = "Manager";
	$GV["FinanceState"] = "Finance";
}
elseif($GV["Environment"]==="Production"){

	$GV["BaseAddress"] = "https://www.indiancag.org";
	$GV["ClientID"] = "666711050704-gnolf2kjuum95e6mkvgflb36h3fsl1i5.apps.googleusercontent.com";
	$GV["ClientSecret"] = "sf-bSFKR0RmAb9DrPntdryxd";
	$GV["EmployeeState"] = "reimbursements";
	$GV["ManagerState"] = "Manager";
	$GV["FinanceState"] = "Finance";
}


return array( 'GV' => $GV );


