<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<body>
	ssgin 로그인<br>
	패스워드 삽입창<br>
	<button>확인</button><br>
	<button id="JoinBtn">PW 찾기/재설정</button>
	
	
	
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#JoinBtn").click(function(){
				location.href="JoinForm.app";
			});
		});
	
	</script>
</body>
</html>