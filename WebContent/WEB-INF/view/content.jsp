<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.replybut {
	color: red;
}

.sendsuccess, .sendnotsuccess, .dontshow {
	display: none;
}
</style>
<script src="js/content.js"></script>
</head>
<body>
	<c:if test="${empty all}">
		<h4 class="text-center">No Post.</h4>
	</c:if>

	<div class="alert alert-success sendsuccess">
		<button type="button" class="close closedeletealert">&times</button>
		Message sent
	</div>
	<div class="alert alert-danger sendnotsuccess">
		<button type="button" class="close closedeletealert">&times</button>
		Server problem try again later
	</div>
	<c:forEach var="allpost" items="${all }">
		<div>
			<h4 class="dontshow">${allpost.movie}</h4>
			<h4 class="msecond">${allpost.theatre}</h4>
			<h4 class="mthird">
				Tickets : ${allpost.seat}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Date :
				<span class="mfifth">${allpost.date}</span>
			</h4>
			<h4 class="last">
				Timing : <span class="mforth">${allpost.time}&nbsp;&nbsp;&nbsp;
					Price : 120-150</span>
			</h4>
			<h4 class="postby">
				Post by : <span class="to">${allpost.by}</span>
			</h4>

			<button type="button" class="close btn collapsebut"
				data-toggle="collapse" data-target="#demo">
				Reply<span class="replybut glyphicon glyphicon-share-alt"></span>
			</button>
		</div>
		<div class="page-header"></div>
	</c:forEach>
	<script>
$(document).ready(function(){
$(".collapsebut").click(function(){
	
	<%String prof = (String) session.getAttribute("profile");%>
	var profile="<%=prof%>";
				var mov = $(this).siblings(".dontshow").html();
				var send = $(this).siblings(".postby").children(".to").html();
				//alert("clicked "+send +" movie "+mov);
				$(".sendto").val(send);
				$(".from").val(profile);
				$(".movie").val(mov);
			});

		});
	</script>
	<div id="demo" class="collapse">
		<br>
		<form class="form-group">
			<input type="hidden" class="movie" readonly /> <input type="hidden"
				class="from" readonly /> <input type="text" class="form-control"
				id="msg" name="id" />
		</form>
		<div class="form-inline">
			To : <input type="text" class="sendto" class="form-control" readonly />
			<button type="button" class="btn btn-success sendmsgnow">Send</button>
		</div>
	</div>



</body>
</html>