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
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/css/kfonts2.css" rel="stylesheet">
<style>
body {
	padding-top: 20px;
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
		<h1>썸네일</h1>
		<div class="row">
			<c:forEach items="${imgMap.row01}" var="map">
				<div class="col-sm-6 col-md-3">
					<a href="#" class="thumbnail"> 
						<img	src="./resources/img/${map.imgPath}" alt="...">
					</a>
				</div>
			</c:forEach>

		</div>
		<hr>
		<div class="row">
			<c:forEach items="${imgMap.row01}" var="map">
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="./resources/img/${map.imgPath}" alt="...">
						<div class="caption">
							<h3>${map.title}</h3>
							<p>${map.content}</p>
							<p>
								<a href="#" class="btn btn-primary" role="button">Button</a> <a
									href="#" class="btn btn-default" role="button">Button</a> 
									<span class="badge pull-right">${map.badgeValue}</span>메뉴1</a>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>

	<div class="row">
		<div class="col-md-12">
			<select class="form-control selImg">
				<c:forEach items="${imgMap.row01 }" var="data">
					<option value="${data.imgPath }">${data.imgPath }</option>
				</c:forEach>
			</select>
		</div>

		<div class="row">
			<div class="col-sm-6 col-md-3">
				<a href="#" class="thumbnail" > 
				<img src="./resources/img/DSC_6305.jpg" alt="..." id="changeimg">
				</a>
			</div>
		</div>

		<!-- container 끝 -->
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="./resources/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$(".selImg").change(function(){
					$("#changeimg")
					.prop("src", "./resources/img/"+$(this).val());
					alert(this.value);
					alert($(this).val());
				});
			});
		</script>
</body>
</html>