<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
<style>
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
/*._alter
{
background-color:#333;
border:none;
color: #9d9d9d;
padding:10px;

font-size:16px;
-webkit-transition: margin-top .2s; 
-moz-transition: margin-top .2s;
    transition: margin-top .2s;
    z-index:2;
}
.move :hover
{
margin-top:5px;
}
._alterdrop
{

border:none;
}*/
._bg {
	border: 2px solid red;
}

.manage {
	margin-left: 150px;
}

._bg {
	width: 283px;
	padding: 0 !important; //
	margin: 0 !important;
	margin-top: 30px;
	margin-right: 50px;
	background-color: white;
}

.borders {
	border-radius: 10px;
}

.text-align {
	padding-left: 10px; //
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
	/*-moz-transition: margin-top .2s;
  transition: margin-top .2s;
  -webkit-transition: margin-top .2s;
*/
}

.adjust:hover { //
	margin-top: 10px;
}

/* new post alignment */
.allalign {
	margin-left: 150px;
}

._bg2 {
	width: 283px;
	background-color: white;
	padding: 0 !important;
	margin-top: 30px;
	margin-right: 50px;
}

.redg-fullbar {
	width: 100%;
	height: 3px;
	background: #d9534f;
	margin: 0px auto 0;
}

._atitleforpost {
	font-size: 18px;
	font-weight: 400;
	color: #2c3946;
}

._atitleforpost2 {
	font-size: 13px;
	font-weight: 700;
	color: #2c3946;
}

.atext-align {
	padding-left: 10px; //
	margin-left: 20px;
}

.control {
	width: 50%;
}

.cont {
	width: 100%;
}

.autocomplete {
	position: relative;
}

.updated {
	display: none;
}

.errorupdate {
	display: none;
}
</style>
<link href="css/jquery-ui.css" rel="stylesheet">
<script src="js/jquery-ui.js"></script>
</head>
<body>
	<br>
	<div class="container-fluid jumbotron">
		<c:if test="${empty all}">
			<h4 class="text-center">No New Movies.</h4>
		</c:if>

		<div class="row allalign">

			<c:forEach var="value" items="${all }">

				<div class="col-sm-3 _bg2">
					<img src="img/${value.aimg}" width="283">
					<div class="redg-fullbar"></div>
					<h4 class="_atitleforpost atext-align">${value.amovie}</h4>
					<br>
					<h5 class="_atitleforpost2 atext-align">${value.alang}</h5>
					<button type="button"
						class="btn btn-danger form-control submitpost" data-toggle="modal"
						data-target="#signn">Post Ads</button>
				</div>

			</c:forEach>
		</div>
	</div>

	<script>
$(document).ready(function(){
	<%String na = (String) session.getAttribute("profile");%>
	$(".submitpost").click(function()
			{
		var a=$(this).parent().children("h4").html();
		var b=$(this).parent().children("h5").html();
		$("#moviename").val(a);
		$("#movielanguage").val(b);
		var attr="<%=na%>";

		$("#use").val(attr);

			});

					var availableTags = [ "Sathyam Cinemas",
							"Pvr Cinemas (Ampa)", "Abirami Megamall",
							"Pvr Cinemas (Velachery)",
							"Vigneshwara Theatre (Ponamalle)",
							"Albert Theatre", "Sangam Multiplux",
							"Vetri Cinemas", "Kamala Cinemas", "Ega Theatre",
							"Rakki Theatre", "Escape Theatre", "S2 (Perambur)",
							"S2 Theyagaraja", "Devi Cineplus", ];
					$(".autocomplete").autocomplete({
						source : availableTags
					});
				});
	</script>



	<script src="js/thank.js"></script>



	<div id="signn" class="modal fade">
		<div class="modal-dialog  ">

			<!-- modal-content-->
			<div class="modal-content ">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						&times</button>
					<h4 class="modal-title">Post your Ads</h4>
				</div>

				<div class="modal-body">
					<form>
						<div class="form-group">
							<input type="text" id="moviename" class="form-control" readonly />
						</div>
						<div class="form-group">
							<input type="hidden" id="movielanguage" class="form-control" />

						</div>
						<input type="hidden" id="use" name="user" class="form-control"
							readonly />
						<div class="form-group">
							<input type="text" id="tname" class="form-control autocomplete"
								placeholder="Theatre Name" required />
						</div>
						<div class="form-inline form-group">
							<input type="text" id="place" class="form-control control"
								placeholder="Place" required /> <input type="date" id="dvalue"
								class="form-control control" required />

						</div>
						<div class="form-group form-inline">
							<input type="text" id="time" class="form-control"
								placeholder="Timing" required /> <input type="text" id="seats"
								class="form-control" placeholder="Available Tickets" required />
						</div>
						<div class="form-group"></div>
						<br>
					</form>
					<div class="alert alert-success fade in updated">
						Successfully Updated
						<button class="close closebutton">&times</button>
					</div>
					<div class="alert alert-success fade in errorupdate">
						Error in Updating
						<button class="close closeerrorbutton">&times</button>
					</div>
					<button type="button" class="btn btn-success" id="submitall">Submit</button>

				</div>
			</div>
		</div>
	</div>







</body>
</html>