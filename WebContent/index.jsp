<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="img/cut2.jpg" type="image/jpg">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- jquery forwarder -->
<script src="js/index-javascript.js"></script>
<script type="text/javascript">
	function noBack() {
		window.history.forward();
	}
	noBack();
	window.onload = noBack;
	window.onpageshow = function(evt) {
		if (evt.persisted)
			noBack();
	}
	window.onunload = function() {
		void (0);
	}
</script>
<style>
@media ( max-width : @screen-xs-min) {
	.modal-xs {
		width: @modal-sm;
	}
}

.content {
	margin-top: 30px;
	margin-left: 0px;
}

.total {
	margin-top: 40px;
}

._title {
	font-size: 22px;
	font-weight: 400;
	color: #2c3946;
}

.red-bar {
	width: 30px;
	height: 2px;
	background: #c80910;
	margin: 20px auto 0;
}

._color {
	color: black;
}

._color: hover {
	color: black;
}

._align {
	margin: 0px 0px 20px 30%;
}

.grey-bar {
	width: 500px;
	height: 2px;
	background: grey;
	margin: 20px auto 20px;
}

._manage {
	color: white;
}

._manage :hover {
	text-decoration: none;
}

#shows {
	display: none;
}

#showerror {
	display: none;
}

#showssign {
	display: none;
}

#showerrorsign {
	display: none;
}

#showssign1 {
	display: none;
}

#showsuccess {
	display: none;
}

#showforgotsuccess {
	display: none;
}

#showforgotInvalid {
	display: none;
}

#showforgotMismatch {
	display: none;
}

#showerrorforget {
	display: none;
}

#showuser {
	display: none;
}
</style>
<title>Welcome</title>
</head>
<body>

	<!--navbar-->
	<nav class="navbar navbar-inverse navbar-fixed-top  pad">
		<div class="container-fluid ">
			<div class="navbar-header">
				<a href="" class="navbar-brand newcolor">TicketCounter</a>
				<button type="button" class="btn btn-sucess navbar-toggle"
					data-toggle="collapse" data-target="#collapse1">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>

			<div id="collapse1" class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="" class="active ">Home</a></li>
					<!-- li><a href="" class="">Post Ads</a></li-->
					<li><a data-toggle="modal" href="#signup"><span
							class="glyphicon glyphicon-user"></span> Sign Up</a></li>
					<li><a data-toggle="modal" href="#signin"><span
							class="glyphicon glyphicon-log-in"></span> Log in</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- sign in modal-->
	<div id="signin" class="modal fade">
		<div class="modal-dialog  modal-xs">

			<!-- modal-content-->
			<div class="modal-content ">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						&times</button>
					<h4 class="modal-title">Sign in</h4>
				</div>
				<div class="modal-body">

					<!--method="post" action="./loginform.ds"  -->
					<form>
						<div class="form-group">
							<input type="text" class="form-control" id="name"
								placeholder="Enter your Email" required>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="pass"
								placeholder="Enter the Password" required>
						</div>

						<!--  	<div class="form-group">
						<input type="submit" class="btn btn-info"/>
						<a href="#forgot" data-dismiss="modal" data-toggle="modal"> Forgot Password</a>
					</div>-->


						<div class="alert alert-danger fade in" id="shows">
							<button class="close " type="button" id="showclose">&times</button>
							Check your User name and Password
						</div>

						<div class="alert alert-danger fade in" id="showerror">
							<div class="close " data-dismiss="alert" arial-label="close">&times</div>
							Sorry error while validating
						</div>

						<button id="submitform" type="button" class="btn btn-info">
							Submit</button>
						<a href="#forgot" data-dismiss="modal" data-toggle="modal">
							Forgot Password</a>



					</form>


				</div>

				<div class="modal-footer">
					<a href="#signup" data-dismiss="modal" data-toggle="modal">New
						User?</a>
				</div>

			</div>
		</div>
	</div>

	<!--Sign up modal-->

	<div id="signup" class="modal fade">
		<div class="modal-dialog   modal-xs">

			<!-- sign up modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						&times</button>
					Register
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<input type="text" id="semail" class="form-control"
								placeholder="Enter your Emailid" required>
						</div>
						<div class="form-group">
							<input type="text" id="sname" class="form-control"
								placeholder="Enter your Username (Only characters)" required>
						</div>
						<div class="form-group">
							<input type="password" id="spass" class="form-control"
								placeholder="Enter your password" required>
						</div>
						<!--  div class="form-group">
						<input type="date" id="sdate" class="form-control" required>
					</div-->

						<div class="form-group">
							<div class="alert alert-danger fade in" id="showssign">
								<button class="close " type="button" id="showclose2">&times</button>
								Enter Valid Email-Id
							</div>

							<div class="alert alert-warning fade in" id="showssign1">
								<button class="close " type="button" id="showclose3">&times</button>
								Email Id Already exists
							</div>
							<div class="alert alert-danger alert-dismissable fade in"
								id="showuser">
								<button class="close" type="button" id="closewarn">&times</button>
								Username Should not contain symbols (!,@,. etc)
							</div>
							<div class="alert alert-danger fade in" id="showerrorsign">
								<div class="close " data-dismiss="alert" arial-label="close">&times</div>
								Sorry error while validating
							</div>
							<div class="alert alert-success fade in" id="showsuccess">
								<button class="close" type="button" id="showclose4">&times</button>
								Registered Successfully
							</div>

						</div>
					</form>
					<button id="idsignup" type="button" class="btn btn-info">
						Submit</button>
				</div>

				<div class="modal-footer">
					<a href="#signin" data-dismiss="modal" data-toggle="modal">Sign
						in</a>
				</div>
			</div>
		</div>

	</div>

	<!-- Forgot password-->
	<div id="forgot" class="modal fade">
		<div class="modal-dialog  modal-xs">

			<!-- modal-content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times
					</button>
					Forgot password
				</div>

				<div class="modal-body">
					<form>
						<div class="form-group">
							<input type="text" class="form-control" id="femail"
								placeholder="Enter your Email Id" required>
						</div>
						<!--<div class="form-group">
				<input type="date" class="form-control" required>
				</div-->
						<div class="form-group">
							<input type="password" class="form-control" id="foldpass"
								placeholder="Enter New Password" required>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="fnewpass"
								placeholder="Re-enter New Password" required>
						</div>
						<div class="form-group">
							<div class="alert alert-success fade in" id="showforgotsuccess">
								<button class="close" type="button" id="showclose5">&times</button>
								Updated Successfully Successfully
							</div>
							<div class="alert alert-danger fade in" id="showforgotInvalid">
								<button class="close" type="button" id="showclose6">&times</button>
								Email ID not Found
							</div>
							<div class="alert alert-warning fade in" id="showforgotMismatch">
								<button class="close" type="button" id="showclose7">&times</button>
								Password Mismatch
							</div>
							<div class="alert alert-danger fade in" id="showerrorforget">
								<div class="close " data-dismiss="alert" arial-label="close">&times</div>
								Sorry error while validating
							</div>

							<button id="idforgot" type="button" class="btn btn-info">
								Submit</button>
						</div>
					</form>

				</div>

				<div class="modal-footer">
					<a href="#signin" data-dismiss="modal" data-toggle="modal">Sign
						in</a>
				</div>

			</div>
		</div>
	</div>

	<!--slide show-->
	<div class="total">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li class="active" data-target="#myCarousel" data-slide-to="0"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="img/achamas.jpg" height="" width="100%">
				</div>

				<div class="item">
					<img src="img/doctorstrange2.jpg " height="" width="100%">
				</div>
				<div class="item">
					<img src="img/fant1.jpg " height="" width="100%">
				</div>
				<!-- photoshop 50.24 and 18.20-->
				<a class="left carousel-control" href="#myCarousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>










	<!-- New Release-->
	<div class="jumbotron jumb-modification">
		<h2 class="text-center _title">NEW RELEASE</h2>
		<div class="red-bar"></div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<img src="img/main1.jpg " class="img-responsive" width="350">
				<br>
				<button type="button" class="btn btn-danger _align"
					data-toggle="modal" data-target="#signin">Buy Ticket</button>

			</div>
			<div class="col-sm-4">
				<img src="img/newfan1.jpg " class="img-responsive" width="350"><br>
				<button type="button" class="btn btn-danger _align"
					data-toggle="modal" data-target="#signin">Buy Ticket</button>
			</div>
			<div class="col-sm-4">
				<img src="img/achampost1.jpg " class="img-responsive" width="350"><br>
				<button type="button" class="btn btn-danger _align"
					data-toggle="modal" data-target="#signin">Buy Ticket</button>
			</div>
		</div>
		<br>
		<div class="grey-bar"></div>
		<br>
		<div class="row">
			<div class="col-sm-4">
				<img src="img/ds1.jpg " class="img-responsive" width="350"> <br>
				<button type="button" class="btn btn-danger _align"
					data-toggle="modal" data-target="#signin">Buy Ticket</button>

			</div>
			<div class="col-sm-4">
				<img src="img/kaash1.jpg " class="img-responsive" width="350">
				<br>
				<button type="button" class="btn btn-danger _align"
					data-toggle="modal" data-target="#signin">Buy Ticket</button>
			</div>
			<div class="col-sm-4">
				<img src="img/kodi1.jpg " class="img-responsive" width="350">
				<br>
				<button type="button" class="btn btn-danger _align"
					data-toggle="modal" data-target="#signin">Buy Ticket</button>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>


</body>
</html>