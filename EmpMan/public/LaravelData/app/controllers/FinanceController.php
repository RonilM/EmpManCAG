<?php



class FinanceController extends BaseController {



	public function Claims()
	{

		FinanceCheckSessionLogin();

		$StatusS3 = DB::table('finances')->join('statustypes', 'finances.StatusID', '=', 'statustypes.StatusID')
										 ->join('finrequesttypes', 'finances.FRID', '=', 'finrequesttypes.FRID')
										 ->join('projects', 'finances.ProjectID', '=', 'projects.ProjectID')
	    											->where('finances.StatusID', 'S3' )
	    											->join('employees', 'finances.EID', '=', 'employees.EID')->get();

		$StatusS4 = DB::table('finances')->join('statustypes', 'finances.StatusID', '=', 'statustypes.StatusID')
										 ->join('finrequesttypes', 'finances.FRID', '=', 'finrequesttypes.FRID')
										 ->join('projects', 'finances.ProjectID', '=', 'projects.ProjectID')
	    											->where('finances.StatusID', 'S4' )
	    											->join('employees', 'finances.EID', '=', 'employees.EID')->get();

	    $StatusS67 = DB::table('finances')->join('statustypes', 'finances.StatusID', '=', 'statustypes.StatusID')
										 ->join('finrequesttypes', 'finances.FRID', '=', 'finrequesttypes.FRID')
										 ->join('projects', 'finances.ProjectID', '=', 'projects.ProjectID')
	    											->where('finances.StatusID', 'S6' )
	    											->orWhere('finances.StatusID', 'S7' )
	    											->join('employees', 'finances.EID', '=', 'employees.EID')->get();

	    return View::make('FinanceUI.FinanceTeamScreenClaims',array('StatusS3' => $StatusS3, 'StatusS4'=> $StatusS4, 'StatusS67'=> $StatusS67 ));
	}


	public function Approval()
    {
  
    	FinanceCheckSessionLogin();
		$InteractionType = Input::get('InteractionType');
		$RequestID = Input::get('RequestID');
		switch($InteractionType){
			case "S6":
				$NewAmount = Input::get('NewAmount');
				$QueryResult = DB::table('finances')
		            				->where('ReqID', $RequestID)
		            				->update(array('Amount' => $NewAmount,'StatusID' => $InteractionType));
		            				//->update(array('StatusID' => $InteractionType));
		        if($QueryResult == false)
		        	return "false";
		        else
		        	return "true";
		    break;

		    case "S5":
		    case "S7":
		    case "S8":
		    	$QueryResult = DB::table('finances')
		            				->where('ReqID', $RequestID)
		            				->update(array('StatusID' => $InteractionType));
		        if($QueryResult == false)
		        	return "false";
		        else
		        	return "true";

		    break;

		    }

		    return "false";

    }


 }