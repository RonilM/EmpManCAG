@extends('EmployeeUI.layout')

@section('InputForms')
    <div class="RightSidedFormContainer">
	    <select onChange="UpdateRForm(this)" class="form-control">
	    	  <option value="0">-- Select Action --</option> 	
			 <!-- <option value="">Reimbursement Request</option>
			  <option value="">Advanced Claim Request</option>
			  <option value="">Pending Requests</option>
			  <option value="">Approved requests</option>
			  <option value="">Processed requests</option> -->

			 @foreach($finrequesttypes as $finrequesttype)
        			<option value={{ '"'.($finrequesttype->FRID).'"' }}>{{ $finrequesttype->RequestName }}</option>
   			 @endforeach

		</select>

		<div id="RForm" class="RightSidedForm panel panel-info">
				<div class="panel-heading">
   			 		<h3 class="panel-title" id="FormType">Claims</h3>
  				</div>
				<div class="panel-body" id="FormTypeData">
			    	
				</div>

		</div>
		<hr>
    </div>
@stop


@section('PageLogic')


	 <script type="text/javascript">
      function FormAjax() {

       $("form").submit(function(){

    		var formData = new FormData($(this)[0]);

   	 		$.ajax({
		        url: 'reimbursementsrequest',
		        type: 'POST',
		        data: formData,
		        async: false,
		        success: function (data) {
		            if(data=='CorrectExecution')
		            {
		            	alert("Request submitted!");
		            	location.reload();
		            }
		            else{
		            	alert(data);
		        	}
		        },
		        cache: false,
		        contentType: false,
		        processData: false
		    });

    		return false;
		});

      }

      function CheckRequests() {

      	var formData = new FormData($('form')[0]);
      	var DataFromRequest;
      	$.ajax({
		        url: 'reimbursementsrequest',
		        type: 'POST',
		        data: formData,
		        async: false,
		        success: function (data) {
		           DataFromRequest = data;
		        },
		        cache: false,
		        contentType: false,
		        processData: false
		    });

    		return DataFromRequest;
		

      }
    </script>

	<script type="text/javascript">
		function UpdateRForm(SelectElement)
		{
			var OutputForm;
			switch(SelectElement.value){

				case '0':
					$('#FormType').html("Claims");
					$('#FormTypeData').html("");
				break;

				case '1':

					OutputForm =	['<form method="post" role="form" enctype="multipart/form-data">',
										  '<div class="form-group">',
										    '<label for="DateOfExpense">Date Of Expense</label>',
										    '<input type="date" class="form-control" id="DateOfExpense" name="DateOfExpense" placeholder="dd/mm/yyyy">',
										  '</div>',
										   '<div class="form-group">',
										    '<label for="Amount">Amount</label>',
										    '<input type="number" class="form-control" id="Amount" name="Amount" placeholder="Amount">',
										  '</div>',
										   '<div class="form-group">',
										    '<label for="DescriptionOfExpense">Description Of Expense</label>',
										    '<input type="text" class="form-control" id="DescriptionOfExpense" name="DescriptionOfExpense" placeholder="Description Of Expense">',
										  '</div>',
										  '<div class="form-group">',
										  	'<label for="PaymentCategory">Payment Category</label>',
										  	'<select id="PaymentCategory" name="PaymentCategory" class="form-control">',
										  		'<option>-- Select Action --</option> ',
										    	'<option>Food</option>',
										    	'<option>Accomodation</option>',
										    	'<option>Travel</option>',
										    	'<option>Other</option>',
										    '</select>',
										  '</div>',
										  '<div class="form-group">',
										    '<label for="PaymentMadeTo">Payment Made To</label>',
										    '<input type="text" class="form-control" id="PaymentMadeTo" name="PaymentMadeTo" placeholder="Payment Made To">',
										  '</div>',
										  '<div class="form-group">',
										    '<label for="DescriptionOfExpense">Bill Number</label>',
										    '<input type="text" class="form-control" id="BillNumber" name="BillNumber" placeholder="Bill Number">',
										  '</div>',
										  '<div class="form-group">',
										  	'<label for="PaymentCategory">Bill Type</label>',
										  	'<select id="BillType" name="BillType" class="form-control">',
										  		'<option>-- Select Action --</option> ',
										    	'<option>Hard Copy</option>',
										    	'<option>Soft Copy</option>',
										    '</select>',
										  '</div>',
										  '<div class="form-group">',
										    '<label for="ProjectName">Project Name</label>',
										    '<input type="text" class="form-control" id="ProjectName" name="ProjectName" placeholder="Project Name">',
										  '</div>',
										  '<div class="form-group">',
										    '<label for="UploadBill">Upload Bill</label>',
										    '<input type="file" id="UploadBill" name="UploadBill">',
										    '<p class="help-block">Upload Bill</p>',
										  '</div>',
										  '<div class="form-group">',
										    '<label for="Comments">Comments</label>',
										    '<input type="text" class="form-control" id="Comments" name="Comments" placeholder="Comments">',
										  '</div>',
										  '<input type="hidden" class="form-control" id="PaymentDate" name="PaymentDate" placeholder="PaymentDate" value="">',
										  '<input type="hidden" class="form-control" id="RequestType" name="RequestType" value="'+SelectElement.value+'">',
										  '<button class="btn btn-default">Submit</button>',
									'</form>'].join('\n');
					$('#FormType').html(SelectElement.options[ SelectElement.selectedIndex ].text);
					$('#FormTypeData').html(OutputForm);
					FormAjax();

				break;

				case '2':

				OutputForm =	['<form method="post" role="form" enctype="multipart/form-data">',
										  '<div class="form-group">',
										    '<label for="PaymentDate">Payment Date</label>',
										    '<input type="date" class="form-control" id="PaymentDate" name="PaymentDate" placeholder="dd/mm/yyyy">',
										  '</div>',
										   '<div class="form-group">',
										    '<label for="Amount">Amount</label>',
										    '<input type="number" class="form-control" id="Amount" name="Amount" placeholder="Amount">',
										  '</div>',
										   '<div class="form-group">',
										    '<label for="DescriptionOfExpense">Description Of Expense</label>',
										    '<input type="text" class="form-control" id="DescriptionOfExpense" name="DescriptionOfExpense" placeholder="Description Of Expense">',
										  '</div>',
										  '<div class="form-group">',
										  	'<label for="PaymentCategory">Payment Category</label>',
										  	'<select id="PaymentCategory" name="PaymentCategory" class="form-control">',
										  		'<option>-- Select Action --</option> ',
										    	'<option>Food</option>',
										    	'<option>Accomodation</option>',
										    	'<option>Travel</option>',
										    	'<option>Other</option>',
										    '</select>',
										  '</div>',
										  '<div class="form-group">',
										    '<label for="PaymentMadeTo">Payment Made To</label>',
										    '<input type="text" class="form-control" id="PaymentMadeTo" name="PaymentMadeTo" placeholder="Payment Made To">',
										  '</div>',
										  '<div class="form-group">',
										    '<label for="ProjectName">Project Name</label>',
										    '<input type="text" class="form-control" id="ProjectName" name="ProjectName" placeholder="Project Name">',
										  '</div>',
										  '<div class="form-group">',
										    '<label for="Comments">Comments</label>',
										    '<input type="text" class="form-control" id="Comments" name="Comments" placeholder="Comments">',
										  '</div>',
										  '<input type="hidden" class="form-control" id="DateOfExpense" name="DateOfExpense" placeholder="DateOfExpense" value="">',
										  '<input type="hidden" class="form-control" id="BillNumber" name="BillNumber" placeholder="Bill Number" value="NA">',
										  '<input type="hidden" class="form-control" id="BillType" name="BillType" placeholder="BillType" value="NA">',
										  '<input type="hidden" class="form-control" id="RequestType" name="RequestType" value="'+SelectElement.value+'">',
										  '<button type="submit" class="btn btn-default">Submit</button>',
									'</form>'].join('\n');
					$('#FormType').html(SelectElement.options[ SelectElement.selectedIndex ].text);
					$('#FormTypeData').html(OutputForm);
					FormAjax();

				break;

				case '3':

					OutputForm =	['<form method="post" role="form" enctype="multipart/form-data">',
										  '<input type="hidden" class="form-control" id="RequestType" name="RequestType" value="'+SelectElement.value+'">',
									 '</form>'].join('\n');
					$('#FormType').html(SelectElement.options[ SelectElement.selectedIndex ].text);
					$('#FormTypeData').html(OutputForm);
					$('#FormTypeData').html(CheckRequests());

				break;

				case '4':
					OutputForm =	['<form method="post" role="form" enctype="multipart/form-data">',
										  '<input type="hidden" class="form-control" id="RequestType" name="RequestType" value="'+SelectElement.value+'">',
									 '</form>'].join('\n');
					$('#FormType').html(SelectElement.options[ SelectElement.selectedIndex ].text);
					$('#FormTypeData').html(OutputForm);
					$('#FormTypeData').html(CheckRequests());

				break;
				case '5':
					OutputForm =	['<form method="post" role="form" enctype="multipart/form-data">',
										  '<input type="hidden" class="form-control" id="RequestType" name="RequestType" value="'+SelectElement.value+'">',
									 '</form>'].join('\n');
					$('#FormType').html(SelectElement.options[ SelectElement.selectedIndex ].text);
					$('#FormTypeData').html(OutputForm);
					$('#FormTypeData').html(CheckRequests());

				break;

			}

		}


	</script>

@stop


