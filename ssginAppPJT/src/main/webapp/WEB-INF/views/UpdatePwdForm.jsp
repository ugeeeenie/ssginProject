<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<body>
	<input type="password" placehoder="비밀번호">
	<button type="submit" id="nextBtn1">다음</button>
	
	<!-- ajax로 할지 a href로 할지 결정해야합니다~~~~~~ -->
	
	<script>
		$(document).ready(function(){
			$("#nextBtn1").click(function(){
				location.href="main.app"
			});
		});
	</script>
</body>
</html>