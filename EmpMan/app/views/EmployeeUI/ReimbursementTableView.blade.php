

@if(count($finrequests)>0)
<table class="table table-striped">
					<tr>
						<th>Request ID</th>
						<th>Payment Category</th>
						<th>Payment Made To</th>
						<th>Bill Number</th>
						<th>Bill Type</th>
						<th>Bill Copy Link</th>
						<th>Amount</th>
						<th>Status</th>
					</tr>
	@foreach($finrequests as $finrequest)
        			<tr>
        				<td>{{ $finrequest->ReqID }}</td>
        				<td>{{ $finrequest->PaymentCategory }}</td>
        				<td>{{ $finrequest->PaymentMadeTo }}</td>
        				<td>{{ $finrequest->BillNumber }}</td>
        				<td>{{ $finrequest->BillType }}</td>
        				<td><a href="{{ $finrequest->BillFilePath }}">Bill Soft Copy</a></td>
        				<td>{{ $finrequest->Amount }}</td>
        				<td>{{ $finrequest->StatusName }}</td>
        			</tr>
 	@endforeach
</table>
@else
<h3>No Pending Requests</h3>
@endif

