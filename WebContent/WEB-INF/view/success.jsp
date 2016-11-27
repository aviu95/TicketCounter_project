<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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
<title>Welcome</title>
<style type="text/css">
.feedbackdone {
	font-size: 15px;
	font-weight: 400;
	border: none;
	color: white;
	background-color: #d9534f;
	display: none;
}

.contact {
	font-size: 35px;
	font-weight: 400;
	font-family: century gothic;
	color: white; //
	margin-top: 30px;
	padding-left: 20%;
}

.contactform {
	color: white;
	font-size: 20px;
	font-family: century gothic;
	font-weight: 200;
}

._title {
	font-size: 22px;
	font-weight: 400;
	color: #2c3946;
}

._titleforpost {
	font-size: 18px;
	font-weight: 400;
	color: #2c3946;
}

._titleforpost2 {
	font-size: 13px;
	font-weight: 700;
	color: #2c3946;
}

.red-bar {
	width: 30px;
	height: 2px;
	background: #c80910;
	margin: 20px auto 0;
}

.red-fullbar {
	width: 100%;
	height: 3px;
	background: #2fb756;
	margin: 0px auto 0;
}

._size {
	font-size: 15px;
}

.manage {
	margin-left: 150px;
}

.bg {
	border: none;
	width: 283px;
	padding: 0 !important;
	margin-top: 30px;
	margin-right: 50px;
	background-color: white;
}

.borders {
	border-radius: 10px;
}

.text-align {
	padding-left: 10px; 
	margin-left: 20px;
}

.colorcode {
	background-color: white;
	border: none;
}

.bordernav {
	border: none;
}

.pads {
	padding-top: 20px;
}

.adjust {
	margin-right: 20px;
	-moz-transition: margin-bottom .2s;
	transition: margin-bottom .2s;
	-webkit-transition: margin-bottom .2s;
}

#all {
	padding-left: 20px;
	padding-right: 20px;
}

.adjust:hover {
	margin-bottom: 10px;
}

.modal {
	z-index: 1500;
}

#footer {
	position: relative;
	bottom: 0;
	width: 100%;
	height: 400px; 
	-webkit-animation-name: example; 
	-webkit-animation-duration: 4s; 
	-webkit-animation-iteration-count: infinite; 
	-moz-animation-name: example; 
	-moz-animation-duration: 4s; 
	-moz-animation-iteration-count: infinite; 
	animation-name: example;
	animation-duration: 8s;
	animation-iteration-count: infinite;
}

@
-webkit-keyframes example { 
0% {
	background-color: #4e49b2;
}

35%
{
background-color:#6349b2;
}
55%
{
background-color:#8a49b2;
 
}
75%{
background-color: #ad49b2;
 
}
100%
{
background-color:#4e49b2;
 }
}

@-moz-keyframes example { 
0% {
	background-color: #4e49b2;
}

35%
{
background-color: #6349b2;
}
55%
{
background-color: #8a49b2;
 
}
75%{
background-color: #ad49b2; 
}
100%
{
background-color: #4e49b2; 
}
}
@keyframes example { 
0% {
	background-color: #4e49b2;
}
35%
{
background-color: #6349b2;
}
55%
{
background-color: #8a49b2; 
}
75%{
background-color:#ad49b2; 
}
100%
{
background-color:#4e49b2; 
}
}
</style>
<script src="js/success.js"></script>

</head>
<body>
	<%
		String name = (String) session.getAttribute("user");
		String n[] = name.split("@");
		String profile = (String) session.getAttribute("profile");
	%>

	<script type="text/javascript">
    function noBack() { 	window.history.forward(); }
    noBack();
    window.onload = noBack;
    window.onpageshow = function (evt) {call('<%=profile%>'); if (evt.persisted) noBack(); }
    window.onunload = function () { void (0); }
</script>
	<nav class="navbar navbar-inverse navbar-fixed-top  pad">
		<div class="container-fluid ">
			<div class="navbar-header">
				<div class="navbar-brand newcolor">TicketCounter</div>
				<button type="button" class="btn btn-sucess navbar-toggle "
					data-toggle="collapse" data-target="#collapse1">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>





			<div id="collapse1" class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">

					<li><a href="#"> <span class="glyphicon glyphicon-user"></span>
							<%=profile%>

					</a></li>
					<li><a href="#myPost" data-toggle="modal" class="active ">
							<span class="glyphicon glyphicon-list-alt"></span> My Posts <span
							class="caret"></span>
					</a></li>
					<li><a href="#myNote" data-toggle="modal" class="allnote">
							<span class="glyphicon glyphicon-cloud"></span> Notification <span
							class="badge">1</span>
					</a></li>

					<li><a href="./logoutform.ds"> <span
							class="glyphicon glyphicon-off"></span> Logout <span
							class="caret"></span>

					</a></li>

				</ul>
			</div>
		</div>
	</nav>
	<script>
$(document).ready(function(){
	$(".allnote").click(function(){
		var name="<%=profile%>";
				$("#notes").load("./loadmynotification.ds?name=" + name)

			});
		});
	</script>

	<!--Notification modal -->

	<div id="myNote" class="modal fade">

		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						&times</button>
					<h4 class="modal-title">Notification</h4>
				</div>
				<div id="notes" class="modal-body"></div>
				<div class="modal-footer">
					<h5>Warning:Notification will be automatically removed(Limit
						5)</h5>
				</div>

			</div>

		</div>

	</div>

	<!-- My post Modal -->
	<div id="myPost" class="modal fade">

		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						&times</button>
					<h4 class="modal-title">Your Posts</h4>
				</div>
				<div id="variable" class="modal-body"></div>
			</div>

		</div>

	</div>



	<!--slide show-->
	<br>
	<br>

	<div id="myCarousel" class="carousel slide " data-ride="carousel">
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



	<!-- Available Tickets -->
	<div class="jumbotron jumb-modification ">
		<h2 class="text-center _title">TICKETS FOR YOU</h2>
		<div class="red-bar"></div>


		<div class="container-fluid jumbotron borders">
			<c:if test="${empty p}">
				<h4 class="text-center">No Recent Posts.</h4>
			</c:if>
			<div class="row manage">

				<c:forEach var="post" items="${p}">
					<input type="hidden" value="${post.movie}" />
					<div class="col-sm-3 bg">
						<!-- img size 48.79 and 65 -->
						<img class="movelittle" src="img/${post.img}" width="283">
						<div class="red-fullbar"></div>

						<h4 class="_titleforpost text-align">${post.movie}</h4>
						<br>
						<h5 class="_titleforpost2 text-align">${post.lang}</h5>
						<!-- data-toggle="modal" data-target="#getPost" -->
						<button type="button" class="btn btn-success form-control movebut"
							data-toggle="modal" data-target="#getPost">Buy</button>

					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			//alert("ready");

		});
	</script>
	<br>
	<br>
	<!--input type="text" id="driverclass" /-->

	<div id="getPost" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal">&times</button>
					<h4 id="driverclass"></h4>
				</div>
				<div class="modal-body">
					<div id="input"></div>
				</div>
			</div>
		</div>
	</div>



	<br>
	<!--/div><br>
<div class="jumbotron"-->
	<h4 class="_title text-center">ALL MOVIES</h4>
	<div class="red-bar"></div>
	<br>

	<nav class="navbar navbar-default bordernav">


		<div class="container-fluid colorcode">
			<div class="navbar-header">
				<button type="button" class="btn btn-sucess navbar-toggle "
					data-toggle="collapse" data-target="#collapse2">
					<span class="icon-bar navcolor"></span> <span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			<div id="collapse2" class="collapse navbar-collapse text-center pads">
				<button type="button" id="all" class="btn adjust">All</button>
				<button type="button" id="tamil" class="btn adjust">Tamil</button>

				<button type="button" id="english" class="btn adjust">English</button>
				<button type="button" id="hindi" class="btn adjust">Hindi</button>
				<button type="button" id="telugu" class="btn adjust">Telugu</button>
			</div>
		</div>
	</nav>

	<div id="allpost"></div>

	<div id="footer">
		<br>
		<br>
		<div class="container">
			<div class="row ">
				<div class="col-sm-6 contact">
					Contact Us <br>
					<div class="alert alert-info fade in feedbackdone">
						Successfully Updated
						<button class="close closebutton">&times</button>
					</div>
				</div>
				<div class="col-sm-6 contactform">
					<form>
						<div class="form-group">
							<input type="text" class="form-control" id="feedbackmail"
								placeholder="Your Email id" />
						</div>
						<div class="form-group">
							<label for="comment">Comment:</label>
							<textarea class="form-control" rows="5" id="comment"></textarea>
						</div>
					</form>
					<button type="button" class="btn btn-success feedback">Submit</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>