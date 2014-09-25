<!DOCTYPE html>
<html>
	<head>
		<title>EmpMan System</title>

		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="css/Login.css">

		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


	</head>	

	<body>
		
<!--<h1>{{Config::get('GlobalVar.some_key')}}</h1> -->
				
					<div id="LoginBox" style="position:fixed;top:35%;left:35%;width:480px;">
						<a href="https://accounts.google.com/o/oauth2/auth?scope={{Config::get('GlobalVar.GV.Scope')}}&state={{Config::get('GlobalVar.GV.EmployeeState')}}&redirect_uri={{Config::get('GlobalVar.GV.BaseAddress')}}/GoogleLogin&response_type=code&client_id={{Config::get('GlobalVar.GV.ClientID')}}&approval_prompt=force"><button type="button" class="btn btn-lg btn-danger" style="width:100%;">Google Login</button></a>
						<h4 style="color:red;">{{$Reply}}</h4>
					</div>
			<!--Test-->
				
			<!-- -->
			

	</body>

</html>