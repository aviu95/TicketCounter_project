$(document).ready(function() {

	
			$("#submitall").click(function() {
				alert("ok");
						var mname = $("#moviename").val();
						var mlan = $("#movielanguage").val();
						var usename = $("#use").val();
						var thename = $("#tname").val();
						var placename = $("#place").val();
						var timename = $("#time").val();
						var seatname = $("#seats").val();
						var dname = $("#dvalue").val();
						// alert("ys");

						$.ajax({
							url : "./updatepost.ds?mname=" + mname + "&mlan="
									+ mlan + "&usename=" + usename
									+ "&thename=" + thename + "&placename="
									+ placename + "&timename=" + timename
									+ "&seatname=" + seatname + "&dname="
									+ dname,
							type : "POST",
							success : function(data) {
								if (data.trim() == "1") {
									$(".updated").show();
									setTimeout(function() {
										location.reload();
									}, 2000);
								} else
									$(".errorupdate").show();

							},
							error : function(data) {
								alert("Problem with server please try later");

							}

						});

					});
			$(".closebutton").click(function() {
				$(".updated").hide();
			});
			$(".closeerrorbutton").click(function() {
				$(".errorupdate").hide();
			});
		});