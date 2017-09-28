<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko-kr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>부트스트랩</title>

    <!-- Bootstrap -->
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/css/kfonts2.css" rel="stylesheet">
    <style>
    h2 { margin: 20px 0}
    .tab-content {padding: 10px 0;}

    </style>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
<body>
 <div class="container">  
    <h2>토글되는 탭 </h2>
    <ul class="nav nav-tabs">
      <li class="active"><a href="#home" data-toggle="tab">홈</a></li>
      <li><a href="#tab1" data-toggle="tab">탭 1</a></li>
      <li><a href="#tab2" data-toggle="tab">탭 2</a></li>
      <li><a href="#tab3" data-toggle="tab">탭 3</a></li>
    </ul>
   
  <div class="tab-content">
    <div class="tab-pane active" id="home">
      <h3>홈 </h3>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam tempor lectus nec condimentum tempor. Nullam ornare lobortis nisl, ac rhoncus eros blandit in. Suspendisse vel rutrum mi. Vestibulum nec pulvinar odio, eu vulputate turpis. Nam adipiscing euismod lectus, non dapibus mi aliquam in. Donec in magna nisi. Integer vel rutrum tellus, in porta libero. Nunc condimentum, neque vel consectetur scelerisque, diam nisi ultrices lectus, a auctor dui felis sed ligula. Integer pellentesque diam vitae dui placerat condimentum. Sed tempor non erat sed venenatis. Nulla eu elit id felis laoreet eleifend. Praesent quis adipiscing sapien, vitae sollicitudin augue. Maecenas non lacus in massa faucibus pretium auctor sit amet leo.</div>

    <div class="tab-pane" id="tab1">
      <h3>탭 1</h3>
      	<table class="table">
      		<thead>
	      		<tr>
	      			<td>아이디</td>
	      			<td>비밀번호</td>
	      			<td>이름</td>
	      		</tr>
	      	</thead>
	      	
	      	<c:forEach items="${list}" var="data">
	      	<tr>
	      		<td><a href="javascript:showModal('${data.id}', '${data.pwd}','${data.name}')"> ${data.id}</td>
	      		<td>${data.pwd}</td>
	      		<td>${data.name}</td>
	      	</tr>
	      	</c:forEach>
	      	
      	</table>
     </div>
      
    <div class="tab-pane" id="tab2">
      <h3>탭 2</h3>
      Donec rhoncus vehicula quam, nec dictum nibh ultricies ac. Proin venenatis dolor et mi facilisis pharetra. Suspendisse tincidunt at sapien quis posuere. Duis tempus commodo mi eget aliquam. Pellentesque eget convallis enim. Mauris tincidunt est non feugiat rhoncus. Quisque eros nisl, blandit egestas venenatis sit amet, congue a urna. Duis ante elit, ultrices congue libero a, tristique pellentesque orci. Praesent sed massa vitae tortor placerat porttitor. Donec sit amet dolor purus. Cras felis risus, molestie non rhoncus nec, dignissim a purus. Fusce ultricies pretium lacus, sed tristique massa vehicula sit amet.</div>

    <div class="tab-pane" id="tab3">
      <h3>탭 3</h3>
      Duis suscipit a ipsum sed fringilla. Vivamus sit amet urna id urna faucibus blandit. Fusce at urna vel arcu scelerisque ultrices. Vivamus congue scelerisque tortor non condimentum. Phasellus eu suscipit felis. Praesent tincidunt venenatis laoreet. Duis non leo hendrerit, facilisis ligula id, mollis ligula. Sed vitae magna ante. Cras pellentesque tempor rhoncus. Sed bibendum, neque non euismod ultrices, lorem leo facilisis diam, ornare posuere sapien dui et velit. Morbi a nibh nec nulla feugiat egestas ac vel purus. Aliquam dignissim bibendum interdum. Vestibulum vel mi condimentum, ullamcorper lectus at, scelerisque nunc.</div>
</div>



<!-- Modal -->
<div class="modal fade" id="msgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">메세지</h4>
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
		
		        <label for="Pwd">이름</label>
		        <input type="name" id="name" name="name" class="form-control" placeholder="이름"> 
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
    <script src="../resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
		function showModal(id, pwd, name){
			$.ajax({
				url		: "../modalAjax.sinc",
				type	: "post",
				data 	: {"id" : id},
				dataType: "json",
				success : function(map){
					$("#msgModal").modal('show');
					$("#id").val(map.id);
					$("#pwd").val(map.pwd);
					$("#name").val(map.name);
				}
			});
		}
		
		
	</script>
</body>
</html>