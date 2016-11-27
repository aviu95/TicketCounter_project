$(document).ready(function() {

	$(".closedeletealert").click(function() {
		$(".notifysuccess").hide();
		$(".noifynotsuccess").hide();
	});

	$(".sendreplynow").click(function() {

		var from = $(".from").val();
		var to = $(".sendto").val();
		var msg = $(".msg").val();
		var movie = $(".movie").val();
		$.ajax({
			url : "./sendmsg.ds",
			type : "GET",
			data : {
				from : from,
				to : to,
				msg : msg,
				movie : movie
			},
			success : function(data) {
				if (data.trim() == "1")
					$(".notifysuccess").show();
			},
			error : function() {
				$(".noifynotsuccess").show();

			}
		});

	});

});