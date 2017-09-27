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
	SSGIN 계정 등록<br>
	<input type="text" name="name" placeholder="이름"><br>
	<input type="date" name="date" placeholder="생년월일">
	<input type="radio" name="sex" value="남">남
	<input type="radio" name="sex" value="여">여
	<input type="text" name="phone" placeholder="핸드폰번호">
	<button type="submit" >인증번호 받기</button><br>
	<input type="text" name="ident" placeholder="인증번호">
	<button type="submit" >인증번호 확인</button><br>
	<button type="submit" id="nextBtn">다음</button><br>
	
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#nextBtn").click(function(){
				location.href="SetPwd.app";
			});
		});
	</script>
</body>
</html>