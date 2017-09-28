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
						<div class="box-header with-border">
							<a href="main.app" class="btn btn-primary">뒤로<i class="fa fa-check spaceLeft"></i></a>
						</div>
						<div class="box-body" id="joinBox" style="display: block;">
							<ul>
								<li><a href="/ssgin/updatePwd.app">비밀번호 변경</a></li>
								<li><a href="AdsAgree.app">광고성 정보 수신동의</a></li>
								<li><a href="Policy.app">이용약관 및 정책</a></li>
								<li>앱 정보</a></li>
								<li><a href="javascript:popupOpen()">SSG IN. 계정 해지</a></li>
							</ul>
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
		function popupOpen() {
			var popUrl = "userDelete.app"; //팝업창에 출력될 페이지 URL
			var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)
			window.open(popUrl, "", popOption);
		}
	</script>

</body>
</html>