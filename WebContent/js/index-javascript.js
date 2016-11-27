$(document).ready(function() {

	$("#closewarn").click(function() {
		$("#showuser").hide();
	});

	$("#submitform").click(function() {
		$.ajax({
			type : "POST",
			url : "./loginform.ds",
			cache : false,
			data : {
				name : $("#name").val(),
				pass : $("#pass").val()
			},
			success : function(data) {
				if (data.trim() == "0")
					$("#shows").show();
				else {
					window.location.href = "./loginsuccess.ds";
					return false;
				}
			},
			error : function() {
				$("#showerror").show();
			}
		});

	});

	$("#showclose").click(function() {
		$("#shows").hide();
	});

	// Sign Up
	$("#idsignup").click(function() {

		$.ajax({
			url : "./signupform.ds",
			type : "GET",
			data : {
				email : $("#semail").val(),
				name : $("#sname").val(),
				pass : $("#spass").val()
			},
			success : function(data) {
				if (data.trim() == 0)
					$("#showssign").show();
				else if (data.trim() == 1)
					$("#showsuccess").show();
				else if (data.trim() == 3)
					$("#showuser").show();
				else
					$("#showssign1").show();
			},
			error : function(data) {
				$("#showerrorsign").show();
			}

		});

	});

	$("#showclose2").click(function() {
		$("#showssign").hide();
	});
	$("#showclose3").click(function() {
		$("#showssign1").hide();

	});
	$("#showclose4").click(function() {
		$("#showsuccess").hide();
	});

	// forgot
	$("#idforgot").click(function() {

		$.ajax({

			url : "./forgotform.ds",
			type : "GET",
			data : {
				email : $("#femail").val(),
				oldpass : $("#foldpass").val(),
				newpass : $("#fnewpass").val()
			},
			success : function(data) {
				if (data.trim() == "1")
					$("#showforgotsuccess").show();
				else if (data.trim() == "0")
					$("#showforgotMismatch").show();
				else
					$("#showforgotInvalid").show()
			},
			error : function(data) {
				$("#showerrorforget").show()
			}

		});

	});

	$("#showclose5").click(function() {

		$("#showforgotsuccess").hide();

	});

	$("#showclose6").click(function() {

		$("#showforgotInvalid").hide();

	});

	$("#showclose7").click(function() {

		$("#showforgotMismatch").hide();

	});

});
