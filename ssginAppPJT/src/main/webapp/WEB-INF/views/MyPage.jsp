<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<ul>
		<li><a href="main.app">뒤로</a>설정</li>

		<ul>
			<li><a href="UpdatePwd.app">비밀번호 변경</a></li>
			<li><a href="AdsAgree.app">광고성 정보 수신동의</a></li>
			<li><a href="Policy.app">이용약관 및 정책</a></li>
			<li>앱 정보</a></li>
			<li><a href="javascript:popupOpen()">ssg in 계정 해지</a></li>

		</ul>
		</li>

	</ul>


	<script type="text/javascript">
		function popupOpen() {
			var popUrl = "UserDelete.app"; //팝업창에 출력될 페이지 URL
			var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)
			window.open(popUrl, "", popOption);
		}
	</script>



</body>
</html>