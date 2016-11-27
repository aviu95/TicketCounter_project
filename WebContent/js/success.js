$(document).ready(function() {


	$(".adjust").click(function() {
		var a = $(this).html();
		$("#allpost").fadeOut();
		$("#allpost").load("./loadall.ds?name=" + a);
		setTimeout(function() {
			$("#allpost").fadeIn();
		}, 300);
	});

	$(".closebutton").click(function() {
		$(".feedbackdone").fadeOut();
	});

	$(".feedback").click(function() {
		var a = $("#feedbackmail").val();
		var b = $("#comment").val();		
		if (a.trim() != "" && b.trim() != "") {
			$.ajax({
				url : "./feedback.ds",
				type : "GET",
				data : {
					a : a,
					b : b
				},
				success : function(data) {
					if (data.trim() == "1")
						$(".feedbackdone").show();
					else
						alert("Try again later");
				},
				error : function() {
					alert("Server problem try again later");
				}
			});

		}
	});

	$(".movebut").click(function() {
		var a = $(this).siblings("._titleforpost").html();
		var b = encodeURIComponent(a);
		$("#driverclass").html(a);
		$("#input").load("./showpost.ds?name=" + b);

	});

});

function call(arr) {
	$(document).ready(function() {

		$("#allpost").load("./loadall.ds?name=All");
		$("#variable").load("./deletepost.ds?name=" + arr);
	});
}
