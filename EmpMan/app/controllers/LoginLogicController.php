<?php



class LoginLogicController extends BaseController {

    /**
     * Show the profile for the given user.
     */

public function Login()
    {

    $Email = Session::get('EmpMan_Email');
    $Token = Session::get('EmpMan_Token');
    	//$Password = Input::get('Password');

    if($Token !== "" and $Token !== null)
    	$EmployeeRow = DB::table('employees')->where('Email', $Email )->first();  	
    else
        die("Session expired!");

    if($EmployeeRow != NULL)
    	{
    		$EID = $EmployeeRow->EID;
    		$Minutes = 120;
    		Session::put('EmpMan_EID', $EID);
    		//Cookie::make("EmpMan_EID", $EID, $Minutes);
    		//Cookie::make("EmpMan_Name", $EmployeeRow->Name, $Minutes);
            //Cookie::make("EmpMan_Email", $Email, $Minutes);
    		//Cookie::make("EmpMan_Approver1", $EmployeeRow->Approver1, $Minutes);    		
    		//Cookie::make("EmpMan_ProjectID", $EmployeeRow->ProjectID, $Minutes);

    		return Redirect::to('/reimbursements')->withCookie(Cookie::forever("EmpMan_EID", $EID))->withCookie(Cookie::forever("EmpMan_Name", $EmployeeRow->Name))->withCookie(Cookie::forever("EmpMan_Email", $Email))->withCookie(Cookie::forever("EmpMan_Approver1", $EmployeeRow->Approver1))->withCookie(Cookie::forever("EmpMan_ProjectID", $EmployeeRow->ProjectID));

    	}
    	else
    	{	
    		$Reply="Incorrect credentials entered!";
    		return View::make('ReimbursementLogin',array('Reply' => $Reply));
    	}

    }


public function FinanceLogin()
    {
        //T3 is defined as Finance Team Tier
        $Email = Session::get('EmpMan_Email');
        $Token = Session::get('EmpMan_Token');
        
        if($Token !== "" and $Token !== null)
            $EmployeeRow = DB::table('employees')->where('Email', $Email )->where('TID','T3')->first();  
        else
            die("Session expired!");   

    if($EmployeeRow != NULL)
        {
            $EID = $EmployeeRow->EID;
            $Minutes = 120;
            Session::put('EmpMan_EID', $EID);
            Session::put('EmpMan_TID', 'T3');
            //Cookie::make("EmpMan_EID", $EID, $Minutes);
            //Cookie::make("EmpMan_Name", $EmployeeRow->Name, $Minutes);
            //Cookie::make("EmpMan_Email", $Email, $Minutes);
            //Cookie::make("EmpMan_Approver1", $EmployeeRow->Approver1, $Minutes);          
            //Cookie::make("EmpMan_ProjectID", $EmployeeRow->ProjectID, $Minutes);

            return Redirect::to('/FinanceTeamScreenClaims')->withCookie(Cookie::forever("EmpMan_EID", $EID))->withCookie(Cookie::forever("EmpMan_Name", $EmployeeRow->Name))->withCookie(Cookie::forever("EmpMan_Email", $Email))->withCookie(Cookie::forever("EmpMan_Approver1", $EmployeeRow->Approver1))->withCookie(Cookie::forever("EmpMan_ProjectID", $EmployeeRow->ProjectID));

        }
        else
        {   
            $Reply="Incorrect credentials entered!";
            return View::make('FinanceUI.FinanceLogin',array('Reply' => $Reply));
        }

    }

    public function ManagerLogin()
    {
        //T3 is defined as Finance Team Tier
        $Email = Session::get('EmpMan_Email');
        $Token = Session::get('EmpMan_Token');
        
    if($Token !== "" and $Token !== null)
        $EmployeeRow = DB::table('employees')->where('Email', $Email )->first(); 
    else    
        die("Session expired!"); 

    if($EmployeeRow != NULL)
        {
            $EID = $EmployeeRow->EID;
            $Minutes = 120;
            Session::put('EmpMan_EID', $EID);
            //Cookie::make("EmpMan_EID", $EID, $Minutes);
            //Cookie::make("EmpMan_Name", $EmployeeRow->Name, $Minutes);
            //Cookie::make("EmpMan_Email", $Email, $Minutes);
            //Cookie::make("EmpMan_Approver1", $EmployeeRow->Approver1, $Minutes);          
            //Cookie::make("EmpMan_ProjectID", $EmployeeRow->ProjectID, $Minutes);

            return Redirect::to('/ManagerTeamScreenClaims')->withCookie(Cookie::forever("EmpMan_EID", $EID))->withCookie(Cookie::forever("EmpMan_Name", $EmployeeRow->Name))->withCookie(Cookie::forever("EmpMan_Email", $Email))->withCookie(Cookie::forever("EmpMan_Approver1", $EmployeeRow->Approver1))->withCookie(Cookie::forever("EmpMan_ProjectID", $EmployeeRow->ProjectID));

        }
        else
        {   
            $Reply="Incorrect credentials entered!";
            return View::make('ManagerUI.ManagerLogin',array('Reply' => $Reply));
        }

    }



    public function Logout()
    {
    	Session::flush();
    	//return Redirect::to('/')->withCookie(Cookie::forget('EmpMan_EID'))->withCookie(Cookie::forget('EmpMan_Name'))->withCookie(Cookie::forget('EmpMan_Email'))->withCookie(Cookie::forget('EmpMan_Approver1'))->withCookie(Cookie::forget('EmpMan_ProjectID'));
        return Redirect::to('https://mail.google.com/mail/u/0/?logout&hl=en')->withCookie(Cookie::forget('EmpMan_EID'))->withCookie(Cookie::forget('EmpMan_Name'))->withCookie(Cookie::forget('EmpMan_Email'))->withCookie(Cookie::forget('EmpMan_Approver1'))->withCookie(Cookie::forget('EmpMan_ProjectID'));
    }


}