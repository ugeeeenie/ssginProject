<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Escape Velocity by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>SSGINAPP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="/resources/css/main.css" />
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/kfonts2.css" rel="stylesheet">
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<body>
	<div id="page-wrapper">
		<!-- Header -->
		<div id="header-wrapper" class="wrapper">
			<div id="header">
				<!-- Logo -->
				<div id="logo">
					<h1>SSG IN.</h1>
				</div>
			</div>
		</div>
		<!-- Main content -->
		<div class="form-group text-center">
			<div class="row">
				<!-- left column -->
				<div class="col-md-12">
					<!-- general form elements -->
					<div class="box">
						<div class="box-header with-border">
							<a href="#" class="btn btn-primary">회원가입<i
								class="fa fa-check spaceLeft"></i></a>
						</div>
						<div class="box-body" id="joinBox" style="display: block;">
							<!-- <form id="form-join" method="post"> -->
							<div class="form-group">
								<label for="name">이름</label> <input type="text"
									class="form-control" id="name" name="name" placeholder="이름">
							</div>
							<div class="form-group">
								<label for="birth">생년월일</label> <input type="text"
									class="form-control" id="birth" name="birth"
									placeholder="생년월일 6자리(ex.900101)">
							</div>
							<div class="form-group">
								<label for="gender">성별</label><br> <input type="radio"
									name="gender" value="1">남 <input type="radio"
									name="gender" value="2">여
							</div>
							<div class="form-group">
								<label for="phone">핸드폰번호</label> <select class="form-control"
									id="telecom"
									style="position: absolute; float: left; width: 10%;">
									<option value="SKT">SK</option>
									<option value="KT">KT</option>
									<option value="LGU+">LGU+</option>
								</select> <input type="text" class="form-control" id="phone" name="phone"
									placeholder="핸드폰번호 전체를 입력해주세요"
									style="position: relative; left: 10%; width: 90%;">
							</div>
							<div class="form-group text-center">
								<button id="nextBtn" class="btn btn-primary">
									다음<i class="fa fa-times spaceLeft"></i>
								</button>
							</div>
							<!-- </form> -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->

	<!-- Scripts -->
	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources/js/jquery.dropotron.min.js"></script>
	<script src="/resources/js/skel.min.js"></script>
	<script src="/resources/js/skel-viewport.min.js"></script>
	<script src="/resources/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="/resources/js/main.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#nextBtn").click(function() {
				location.href = "/ssgin/setPwd.app";
			});
		});
	</script>
</body>
</html>