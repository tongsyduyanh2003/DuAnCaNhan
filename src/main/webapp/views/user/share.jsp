
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forgot Password - Beemodut_Entertainment</title>
<%@ include file="/Common/fav.jsp"%>
<%@ include file="/Common/Head.jsp"%>
</head>
<body>
	<%@ include file="/Common/Header.jsp"%>
	<div class="container-fluid col-sm-12 tm-mt-60">
		<div class="row tm-mb-50">
			<div class="col-lg-12 col-12 mb-5">
				<center>
					<h2 class="tm-text-primary col-sm-12 col-12 mb-5">Share Video</h2>
				</center>
				 <form>
					<div class="form-group">
				       <!--  <label for="recipientEmail">Recipient's Email:</label> -->
				        <input class="form-control rounded-0" type="email" id="email" placeholder="Email" required><br>
					</div>	
					<input type="hidden" id="videoIdHidden" value="${id}">
			        <!-- Sử dụng onclick để gọi function khi nút được nhấn -->
			        <div class="form-group">
					<center><button id="shareBtn" class="btn btn-primary">Send Request</button></center>
				</div>
				<center><h5 style="color: red" id="message"></h5></center>
			    </form>

				

			</div>
		
			<%@ include file="/Common/Footer.jsp"%>
<script >
$('#shareBtn').click(function() {
	var videoId = $('#videoIdHidden').val();
	var email = $('#email').val();

	var formData = {
		'email' : email
	};

	$.ajax({
		url : 'share/send'
		type : 'GET',
		data : formData
	}).then(function(data) {
		$('#message').text('Share successfully');
	}).fail(function(error) {
		$('#message').text('Share failed');
	});
});
</script>
</body>
</html>