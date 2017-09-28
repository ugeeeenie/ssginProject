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
<style>
h2 {
	margin: 20px 0
}
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

		<h2>컬랩스 아코디언 효과</h2>
		<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseOne"> 여기를 클릭해 보세요. #1 </a>
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse in">
					<div class="panel-body" id="body1">aaa</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseTwo"> 여기를 클릭해 보세요. #2 </a>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse ">
					<div class="panel-body" id="body2">bbb</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseThree"> 여기를 클릭해 보세요. #3 </a>
					</h4>
				</div>
				<div id="collapseThree" class="panel-collapse collapse">
					<div class="panel-body" id="body3"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="./resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$.ajax({
			url	: "collapseAjax.sinc",
			type 	: "post",
			dataType: "json",
			success : function(map) {
				$("#body1").html(map.msg1);
				$("#body2").html(map.msg2);
				$("#body3").html(map.msg3);
			}
		});
	</script>
</body>
</html>