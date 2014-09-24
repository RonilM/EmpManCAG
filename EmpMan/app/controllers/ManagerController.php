<?php



class ManagerController extends BaseController {

    /**
     * Show the profile for the given user.
     */

public function Claims()
	{
		ManagerCheckSessionLogin();
		$EID=Session::get("EmpMan_EID");

		$StatusS1 = DB::table('finances')->join('statustypes', 'finances.StatusID', '=', 'statustypes.StatusID')
										 ->join('finrequesttypes', 'finances.FRID', '=', 'finrequesttypes.FRID')
										 ->join('projects', 'finances.ProjectID', '=', 'projects.ProjectID')
	    										->where('finances.ApproverEID', $EID  )->where('finances.StatusID', 'S1' )
	    										->join('employees', 'finances.EID', '=', 'employees.EID')->get();

	    return View::make('ManagerUI.ManagerTeamScreenClaims',array('StatusS1' => $StatusS1,'EID' => $EID));
	}



public function Approval()
    {
  
    	ManagerCheckSessionLogin();
		$InteractionType = Input::get('InteractionType');
		$RequestID = Input::get('RequestID');
		switch($InteractionType){
			case "S3":
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

		    case "S4":
		    case "S2":
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