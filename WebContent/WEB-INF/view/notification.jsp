<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.notifysuccess, .noifynotsuccess {
	display: none;
}
</style>
<script src="js/notification.js"></script>
</head>
<body>
	<c:if test="${empty all}">
		<h4 class="text-center">No Notification.</h4>
	</c:if>

	<div class="alert alert-success notifysuccess">
		<button type="button" class="close closedeletealert">&times</button>
		Message sent
	</div>
	<div class="alert alert-danger noifynotsuccess">
		<button type="button" class="close closedeletealert">&times</button>
		Server problem try again later
	</div>
	<c:forEach var="allpost" items="${all }">
		<div>
			<h4 class="firstsib">
				Movie : <span class="pos">${allpost.movie}</span>
			</h4>
			<h4 class="">Message : ${allpost.msg}</h4>
			<h4 class="lastsib">
				From : <span class="to">${allpost.from}</span>
			</h4>

			<button type="button" class="close btn collapsebut"
				data-toggle="collapse" data-target="#demo2">
				Reply<span class="replybut glyphicon glyphicon-share-alt"></span>
			</button>
		</div>
		<div class="page-header"></div>
	</c:forEach>

	<script>
 $(document).ready(function()
	{	
	 $(".collapsebut").click(function(){
			
			<%String prof = (String) session.getAttribute("profile");%>
			var profile="<%=prof%>";
								var mov = $(this).siblings(".firstsib")
										.children(".pos").html();
								var send = $(this).siblings(".lastsib")
										.children(".to").html();
								$(".sendto").val(send);
								$(".from").val(profile);
								$(".movie").val(mov);
							});

				});
	</script>

	<div id="demo2" class="collapse">
		<br>
		<form class="form-group">
			<input type="hidden" class="movie" readonly /> <input type="hidden"
				class="from" readonly /> <input type="text" class="form-control msg"
				name="id" />
		</form>
		<div class="form-inline">
			To : <input type="text" class="sendto" class="form-control" readonly />
			<button type="button" class="btn btn-success sendreplynow">Send</button>
		</div>
	</div>



</body>
</html>