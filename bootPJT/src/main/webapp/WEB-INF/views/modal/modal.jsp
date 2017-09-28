<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!doctype html>
<html lang="ko-kr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>부트스트랩</title>

    <!-- Bootstrap -->
    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="./resources/css/kfonts2.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
<body>
 <div class="container">  


<h1> 모달  </h1>

<hr>
<!-- Button trigger modal -->
<button id="modalShowBtn" class="btn btn-primary btn-lg" >
여기를 클릭하시면 모달 윈도우가 실행됩니다.  
</button>

<hr>


<a href="javascript:linkFunction('jslim', 10)">
  여기를 클릭하시면 모달 윈도우가 실행됩니다. 
</a>



<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">로그인</h4>
      </div>
      <div class="modal-body">
     	<form role="form" id="loginFmt">  
		    <div class="form-group">   
		        <label for="Name">아이디</label>
		        <input type="text" id="id" name="id" class="form-control" placeholder="아이디"> 
		    </div>       
		    <div class="form-group">  
		
		        <label for="Pwd">비밀번호</label>
		        <input type="password" id="pwd" name="pwd" class="form-control" placeholder="비밀번호"> 
		    </div> 
		    <div class="form-group">     
		        <button id="sendBtn" type="submit" class="btn"> 확인</button>    
		    </div>    
           
    </form>
     
      </div>
    </div> <!-- 모달 콘텐츠 -->
  </div> <!-- 모달 다이얼로그 -->
</div> <!-- 모달 전체 윈도우 -->



</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="./resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#modalShowBtn").click(function(){
				$("#myModal").modal('show');
			});
			
			$("#sendBtn").click(function(){
				$("#loginFmt")
				.prop("action", "modal.sinc")
				.prop("method", "post")
				.submit();
			});
			
		});
		
		function linkFunction(id, pwd){
			alert(id+"    "+pwd);
		}
	</script>
</body>
</html>