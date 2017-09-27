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
	약관동의
 	<input type="checkbox" value="동의">동의 
	<input type="checkbox" value="미동의">미동의
	<button id="nextBtn">다음</button>
	
	<script>
		$(document).ready(function(){
			$("#nextBtn").click(function(){
				location.href="LoginForm.app";
			});
		});
	</script>
</body>
</html>