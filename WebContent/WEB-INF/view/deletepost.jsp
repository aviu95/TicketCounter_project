<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="js/deletepost.js"></script>
<style>
.glyphicon-trash {
	color: red;
}

.closedelete {
	display: none;
}

.successclosedelete {
	display: none;
}
</style>
</head>
<body>
	<c:if test="${empty all}">
		<h4 class="text-center">No Post.</h4>
	</c:if>
	<script>
<%String users = (String) session.getAttribute("profile");%>
$(document).ready(function(){
	
	$(".deletebut").click(function(){
		var user='<%=users%>';
		var first = $(this).siblings(".msecond").html();
		var second = $(this).siblings(".mthird").html();
		var third = $(this).siblings(".last").children(".mforth").html();
		var forth = $(this).siblings(".last").children(".mfifth").html();
		var get = confirm("Are you sure you want to delete");
		if (get) {
		$.ajax({
				url : "./deletemypost.ds?user='"
					+ user+ "'&first='"+ first+ "'&second='"+ second+ "'&third='"
					+ third+ "'&forth='"+ forth+ "'",
				type : "Post",
				success : function(data) {
						if (data.trim() == "1") {
							$(".successclosedelete").show();
							setTimeout(function() {
							location.reload();
							},2000);
						} else
						$(".closedelete").show();
						},
				error : function() {
							alert("Error with the server");
									}

				});
			}

			});
			});
	</script>
	<div class="alert alert-danger successclosedelete">
		<button type="button" class="close closedeletealert">&times</button>
		Deleted Successfully
	</div>
	<div class="alert alert-danger closedelete">
		<button type="button" class="close closedeletealert">&times</button>
		Sorry cannot delete
	</div>
	<c:forEach var="allpost" items="${all }">
		<div>
			<button type="button" class="close btn deletebut">
				<span class="glyphicon glyphicon-trash"></span>
			</button>
			<h4 class="msecond">${allpost.mname}</h4>
			<h4 class="mthird">${allpost.theatre}</h4>
			<h4 class="last">
				Timing : <span class="mforth">${allpost.timing} </span> Date :<span
					class="mfifth">${allpost.date}</span>
			</h4>
		</div>

		<div class="page-header"></div>
	</c:forEach>

</body>
</html>