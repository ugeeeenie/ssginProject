<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/main.css" />
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/kfonts2.css" rel="stylesheet">
</head>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
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
						<div class="box-body" id="joinBox" style="display: block;">
							<input type="button" value="취소" style="width:50px;" onclick="window.close();" id="cancel"/>
							<input type="button" value="확인" style="width:50px;" onclick="window.close();" id="nextBtn"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources/js/jquery.dropotron.min.js"></script>
	<script src="/resources/js/skel.min.js"></script>
	<script src="/resources/js/skel-viewport.min.js"></script>
	<script src="/resources/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="/resources/js/main.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/resources/js/bootstrap.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function(){
			$("#nextBtn").click(function(){
				window.opener.location="../intro.app";
			});
			$("#cancel").click(function(){
				window.opener.location="/ssgin/mypaging.app";
			});
		});
	</script>

</body>
</html>