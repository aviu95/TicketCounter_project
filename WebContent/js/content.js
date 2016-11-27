$(document).ready(function() {
	$(".closedeletealert").click(function() {
		$(".sendsuccess").hide();
		$(".sendnotsuccess").hide();
	});

	$(".sendmsgnow").click(function() {
		var from = $(".from").val();
		var to = $(".sendto").val();
		var msg = $("#msg").val();
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
					$(".sendsuccess").show();
			},
			error : function() {
				$(".sendnotsuccess").show();

			}
		});

	});

});