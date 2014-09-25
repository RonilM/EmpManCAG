<!DOCTYPE html>
<html>
	<head>
		<title>EmpMan System</title>

		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="css/Basic.css">

		<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		@yield('PageLogic')
	</head>	

	<body>
		<div class="container-fluid">

			<div class="row">
				<div class="col-md-12 col-lg-12">
					<hr/>
					<div style="text-align:center;background:rgba(255,255,255,0.7);" class="well well-sm bg-success">
						<img src="http://indiancag.org/media/images/xlogo-cag.png.pagespeed.ic.rZaVdUXpA8.png" style="float:left"/>
						 <h2>Employee Management System <small>CAG</small>&nbsp<small><a href="LogoutLogic">Logout</a></small></h2>
					</div>	
				</div>
			</div>

			<hr></hr>

			<div class="row">
				<div class="col-md-3 col-lg-3 MenuHolderContainer">

					<div class="MenuHolder">
						<div class="btn-group-vertical btn-menu">
						  
						  <button type="button" class="btn btn-lg btn-primary">CLAIMS</button>
						<!--  <button type="button" class="btn btn-lg btn-info">LEAVE REQUEST</button>
						  <button type="button" class="btn btn-lg btn-info">TRAVEL REQUEST</button>
						  <button type="button" class="btn btn-lg btn-info">DOCUMENT REPOSITORY</button>
						  <button type="button" class="btn btn-lg btn-info">MY PROFILE</button> -->
						  

						</div>

					</div>
				</div>

				<div class="col-md-9 col-lg-9">

					@yield('InputForms')
					
				</div>


			</div>

		</div>
					

	</body>

</html>