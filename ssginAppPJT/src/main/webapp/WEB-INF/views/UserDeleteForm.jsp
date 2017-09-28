<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
</head>
<body>
	서비스를 해지하시면 이전 데이터는 모두 삭제됩니다. 진행하시겠습니까?
	
	<input type="button" value="취소" style="width:50px;" onclick="window.close();" id="cancel"/>
	<input type="button" value="확인" style="width:50px;" onclick="window.close();" id="nextBtn"/>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#nextBtn").click(function(){
				window.opener.location="intro.app";
			});
			$("#cancel").click(function(){
				window.opener.location="MyPage.app";
			});
		});
	</script>
   
</body>
</html>