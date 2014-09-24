@extends('ManagerUI.ManagerLayout')

@section('InputForms')
    <div class="RightSidedFormContainer">
	   

		<div id="RForm" class="RightSidedForm panel panel-info">
				<div class="panel-heading">
   			 		<h3 class="panel-title" id="FormType">Requests</h3>
  				</div>
				<div class="panel-body" id="FormTypeData">					

					<!-- Column Select -->
					<div class="btn-group">
					  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
					    Column Selector <span class="caret"></span>
					  </button>
					  <ul class="dropdown-menu" role="menu">
					  	<li><a class="toggle-vis" data-column="0">Request ID</a></li>
					  	<li><a class="toggle-vis" data-column="1">Employee ID</a></li>
					    <li><a class="toggle-vis" data-column="2">Request Type</a></li>
					    <li><a class="toggle-vis" data-column="3">Date Of Expense</a></li>
					    <li><a class="toggle-vis" data-column="4">Description Of Expense/Advance Payment Date</a></li>
					    <li><a class="toggle-vis" data-column="5">Payment Category</a></li>
					    <li><a class="toggle-vis" data-column="6">Payment Made To</a></li>					  
					    <li><a class="toggle-vis" data-column="7">Bill Number</a></li>					  
					    <li><a class="toggle-vis" data-column="8">Bill Type</a></li>					  
					    <li><a class="toggle-vis" data-column="9">Bill Image Link</a></li>					  
					    <li><a class="toggle-vis" data-column="10">Approver Employee ID</a></li>					  
					    <li><a class="toggle-vis" data-column="11">Project Name</a></li>		
					    <li><a class="toggle-vis" data-column="12">Comments</a></li>
					    <li><a class="toggle-vis" data-column="13">Amount</a></li>	
					    <li><a class="toggle-vis" data-column="14">Status</a></li>	
					    <li><a class="toggle-vis" data-column="15">Employee Name</a></li>					  
					  </ul>
					</div>
					<table class="display" id="MainTable">
						<thead>
							<tr>
								<th>Request ID</th>
								<th>Employee ID</th>
								<th>Request Type</th>
								<th>Date Of Expense</th>
								<th>Description Of Expense/Advance Payment Date</th>
								<th>Payment Category</th>
								<th>Payment Made To</th>
								<th>Bill Number</th>
								<th>Bill Type</th>
								<th>Bill Image Link</th>
								<th>Approver Employee ID</th>
								<th>Project Name</th>
								<th>Comments</th>
								<th>Amount</th>
								<th>Status</th>
								<th>Employee Name</th>
								<th>Revise and approve</th>
								<th>Approve</th>
								<th>Reject</th>
							</tr>
						</thead>
						<tbody>
							@foreach($StatusS1 as $SS1)
								@if($SS1->DateOfExpense !== "0000-00-00")
									<tr>
										<td>{{$SS1->ReqID}}</td>
										<td>{{$SS1->EID}}</td>
										<td>{{$SS1->RequestName}}</td>
										<td>{{$SS1->DateOfExpense}}</td>
										<td>{{$SS1->DescriptionOfExpense}}</td>
										<td>{{$SS1->PaymentCategory}}</td>
										<td>{{$SS1->PaymentMadeTo}}</td>
										<td>{{$SS1->BillNumber}}</td>
										<td>{{$SS1->BillType}}</td>
										<td><a href="{{$SS1->BillFilePath}}">Bill Image</a></td>
										<td>{{$SS1->ApproverEID}}</td>
										<td>{{$SS1->ProjectName}}</td>
										<td>{{$SS1->Comments}}</td>
										<td>{{$SS1->Amount}}</td>
										<td><p title="{{$SS1->StatusName}}">{{$SS1->StatusID}}</p></td>	
										<td>{{$SS1->Name}}</td>
										<td><button onclick="ManagerInteractions('S3','{{$SS1->ReqID}}')">Revise+Approve</button></td>
										<td><button onclick="ManagerInteractions('S4','{{$SS1->ReqID}}')">Approve</button></td>		
										<td><button onclick="ManagerInteractions('S2','{{$SS1->ReqID}}')">Reject</button></td>			
									</tr>
								@endif
					    	@endforeach

							@foreach($StatusS1 as $SS1)
								@if($SS1->DateOfExpense === "0000-00-00")
									<tr>
										<td>{{$SS1->ReqID}}</td>
										<td>{{$SS1->EID}}</td>
										<td>{{$SS1->RequestName}}</td>
										<td>{{$SS1->AdvancePaymentDate}}</td>
										<td>{{$SS1->DescriptionOfExpense}}</td>
										<td>{{$SS1->PaymentCategory}}</td>
										<td>{{$SS1->PaymentMadeTo}}</td>
										<td>{{$SS1->BillNumber}}</td>
										<td>{{$SS1->BillType}}</td>
										<td><a href="{{$SS1->BillFilePath}}">Bill Image</a></td>
										<td>{{$SS1->ApproverEID}}</td>
										<td>{{$SS1->ProjectName}}</td>
										<td>{{$SS1->Comments}}</td>
										<td>{{$SS1->Amount}}</td>
										<td><p title="{{$SS1->StatusName}}">{{$SS1->StatusID}}</p></td>	
										<td>{{$SS1->Name}}</td>	
										<td><button onclick="ManagerInteractions('S3','{{$SS1->ReqID}}')">Revise+Approve</button></td>
										<td><button onclick="ManagerInteractions('S4','{{$SS1->ReqID}}')">Approve</button></td>		
										<td><button onclick="ManagerInteractions('S2','{{$SS1->ReqID}}')">Reject</button></td>		
									</tr>
								@endif
					    	@endforeach
				    	</tbody>
			    	</table>
				   							

				</div>

		</div>
		<hr>
    </div>
@stop

@section('PageLogic')
<script type="text/javascript">


	$(document).ready(function() {
	//$('#MainTable').tableFilter();

			$(document).ready(function() {
			    var table = $('#MainTable').DataTable( {
			        "scrollY": "200px",
			        "scrollX": true,
			        "paging": false,
			        "columnDefs": [
				            {
				                "targets": [ 1,2,4,5,6,7,8,9,10,11,12,14 ],
				                "visible": false
				            }    		
	        		]
			    } );
			 
			    $('a.toggle-vis').on( 'click', function (e) {
			        e.preventDefault();
			 
			        // Get the column API object
			        var column = table.column( $(this).attr('data-column') );
			 
			        // Toggle the visibility
			        column.visible( ! column.visible() );
			    } );
				
			} );

	});


	function ManagerInteractions(InteractionType,RequestID){
		switch(InteractionType)
		{
			case "S3":
				var OverlayBody = ['<div id="NewAmountFormDiv" style="position:fixed;top:0%;left:0%;height:100%;width:100%;background:rgba(0,0,0,0.7);">',
										'<div style="position:fixed;height:50%;width:50%;background:rgba(255,255,255,0.7);top:25%;left:25%;padding:30px;">',
											'<form method="post" role="form" id="NewAmountForm">',
												  '<div class="form-group">',
												    '<label for="NewAmount">New Amount</label>',
												    '<input type="text" class="form-control" id="NewAmount" name="NewAmount" placeholder="New Amount">',
												  '</div>',
												  '<input type="hidden" class="form-control" id="InteractionType" name="InteractionType" value="S3">',
												  '<input type="hidden" class="form-control" id="RequestID" name="RequestID" value="'+RequestID+'">',
												  '<button class="btn btn-default">Submit</button>',
											'</form>',
										'</div>',
									'</div>'].join('\n');
				$('body').append(OverlayBody);
				SendStatusChangeRequest(InteractionType,RequestID);
			break;

			case "S4":
				SendStatusChangeRequest(InteractionType,RequestID);
			break;

			case "S2":
				SendStatusChangeRequest(InteractionType,RequestID);
			break;
		}
	}

	function SendStatusChangeRequest(InteractionType,RequestID)
	{ 
		if(InteractionType==="S3")
		{
			 $("#NewAmountForm").submit(function(){
	      		
				 var formData = new FormData($(this)[0]);
				 $.ajax({
			        url: 'managerapprovals',
			        type: 'POST',
			        data: formData,
			        async: false,
			        success: function (data) {
			        	if(data == "true"){
			        		alert("Success!!")
			        		location.reload();
			        	}
			        	else{
			           		alert("Unexpected error!")
			           		location.reload();
			           	}
			        },
			        cache: false,
			        contentType: false,
			        processData: false
			     });
			     return false;
		      });	
		}
		else
		{
			$.post("/managerapprovals",
			  {
			    InteractionType: InteractionType,
			    RequestID: RequestID
			  },
			  function(data,status){
			        if(data == "true"){
			       		alert("Success!!")
			       		location.reload();
			       	}
			       	else{
			       		alert("Unexpected error!")
		          		location.reload();
		          	}
			  });
		}

	}
</script>

@stop




