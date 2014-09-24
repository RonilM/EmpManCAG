<?php



class ReimbursementController extends BaseController {

    /**
     * Show the profile for the given user.
     */
    public function AcceptRequest()
    {
    	CheckSessionLogin();
        
        $RequestType = Input::get('RequestType');
        $EID=Session::get("EmpMan_EID");

    	if($RequestType=='1' || $RequestType=='2'){

	    	
	    	$DateOfExpense = Input::get('DateOfExpense');
	    	$Amount = Input::get('Amount');
	    	$DescriptionOfExpense = Input::get('DescriptionOfExpense');
	    	$PaymentCategory = Input::get('PaymentCategory');
	    	$PaymentMadeTo = Input::get('PaymentMadeTo');
	    	$BillNumber = Input::get('BillNumber');
	    	$BillType = Input::get('BillType');
	    	$ProjectName = Input::get('ProjectName'); //Add later to database
	    	//$UploadBill = Input::hasFile('UploadBill');
	    	$Comments = Input::get('Comments');
	    	$PaymentDate = Input::get('PaymentDate');

	    	//$InputFile = Input::file('UploadBill');
	    	
	    	


	    	$ErrorLog = "";
	    	if(trim($RequestType)=="" || trim($RequestType)==null || trim($RequestType)=='NA')
	    		$ErrorLog = $ErrorLog.'Fatal Error!\n';
			if((trim($DateOfExpense)=="" || trim($DateOfExpense)==null || trim($DateOfExpense)=='NA') && $RequestType!=='2')
	    		$ErrorLog = $ErrorLog."Please Enter Date Of Expense!\n";
	    	if(trim($Amount)=="" || trim($Amount)==null || trim($Amount)=='NA')
	    		$ErrorLog = $ErrorLog."Please Enter Amount!\n";
	    	if(trim($PaymentCategory)=="" || trim($PaymentCategory)==null || trim($PaymentCategory)=='NA')
	    		$ErrorLog = $ErrorLog."Please Enter Payment Category!\n";
	    	if(trim($PaymentMadeTo)=="" || trim($PaymentMadeTo)==null || trim($PaymentMadeTo)=='NA')
	    		$ErrorLog = $ErrorLog."Please Enter \"Payment Made To\"!\n";
	    	if((trim($BillNumber)=="" || trim($BillNumber)==null || trim($BillNumber)=='NA') && $RequestType!=='2')
	    		$ErrorLog = $ErrorLog."Please Enter BillNumber!\n";
	    	if((trim($BillType)=="" || trim($BillType)==null || trim($BillType)=='NA') && $RequestType!=='2')
	    		$ErrorLog = $ErrorLog."Please Enter Bill Type !\n";
	    	if(trim($ProjectName)=="" || trim($ProjectName)==null || trim($ProjectName)=='NA')
	    		$ErrorLog = $ErrorLog."Please Enter Project Name!\n";
	    	if(!Input::hasFile('UploadBill') and strpos(strtolower($BillType),'soft')!==false) 
	    		$ErrorLog = $ErrorLog."Please upload a snapshot of your bill!!\n";

	    	if($ErrorLog=="")
	    	{	
	    		$ReqID = 'F'.uniqid(); //Need to write function    		
	    		$ProjectID = Cookie::get("EmpMan_ProjectID");
	    		$ApproverEID = Cookie::get("EmpMan_Approver1");
	    		$Approver2EID = NULL; //Future Use
	    		$StatusID = "S1"; // 1:Submitted

	    		$FRID = $RequestType;
	    		

	    		if(Input::hasFile('UploadBill')){
	    			$Filename = $EID.'_'.$DateOfExpense.'_'.time().'.'.Input::file('UploadBill')->getClientOriginalExtension();
	    			Input::file('UploadBill')->move('BillCopies', $Filename);
	    			$BillFilePath = "BillCopies/".$Filename;
	    			//$HardCopyReceived = true;
	    		}
	    		else
	    		{
	    			//$HardCopyReceived = false;
	    			$BillFilePath="";
	    		}

	    		$InsertActionResult = DB::table('finances')->insert(array('ReqID' => strtoupper($ReqID), 'EID' => $EID, 'FRID' => $RequestType, 'DateOfExpense' => $DateOfExpense, 'Amount' => $Amount, 'DescriptionOfExpense' => 'ProjectName: '.$ProjectName.'   Desc: '.$DescriptionOfExpense, 'PaymentCategory' => $PaymentCategory, 'PaymentMadeTo' => $PaymentMadeTo, 'BillNumber' => $BillNumber, 'BillType' => $BillType,'BillFilePath' => $BillFilePath,'ApproverEID' => $ApproverEID,'Approver2EID' => $Approver2EID,'ProjectID' => $ProjectID,'Comments' => $Comments,'AdvancePaymentDate' => $PaymentDate,'StatusID' => $StatusID,'HardCopyReceived' => false));
	    		if($InsertActionResult == false)
	    			die('Oops! An error occured. I don\'t understand!');
	    		else
	    			return "CorrectExecution";


	    	}
	    	else
	    	{
	    		die($ErrorLog);
	    	}



	    }
	    elseif($RequestType=='3'){
	    	$PendingRequests = DB::table('finances')->join('statustypes', 'finances.StatusID', '=', 'statustypes.StatusID')
	    											->where('EID', $EID )->where(function($query){
	    													$query->where('finances.StatusID', "S1" )->orWhere('finances.StatusID', "S3" )->orWhere('finances.StatusID', "S4" )->orWhere('finances.StatusID', "S6" )->orWhere('finances.StatusID', "S7" );
	    												})->get();  	

	    	return View::make('EmployeeUI.ReimbursementTableView', array('RequestType' => $RequestType,'finrequests' => $PendingRequests) );

	    }
	    elseif($RequestType=='4'){
	    	$PendingRequests = DB::table('finances')->join('statustypes', 'finances.StatusID', '=', 'statustypes.StatusID')
	    											->where('EID', $EID )->where('finances.StatusID', "S8" )->get();  	

	    	return View::make('EmployeeUI.ReimbursementTableView', array('RequestType' => $RequestType,'finrequests' => $PendingRequests) );

	    }
	    elseif($RequestType=='5'){
	    	$PendingRequests = DB::table('finances')->join('statustypes', 'finances.StatusID', '=', 'statustypes.StatusID')
	    											->where('EID', $EID )->where(function($query){
	    												$query->where('finances.StatusID', "S2" )->orWhere('finances.StatusID', "S5" );
	    											})->get();  	

	    	return View::make('EmployeeUI.ReimbursementTableView', array('RequestType' => $RequestType,'finrequests' => $PendingRequests) );

	    }
	  
    }

}


