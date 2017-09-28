<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<!--
	Escape Velocity by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html style="height:100%;">
<head>
<title>SSGINAPP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="/resources/css/main.css" />
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/kfonts2.css" rel="stylesheet">
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<style>
body, item, img{
	width : 100%;
	/* height : 100% !important; */
}

item {
	z-index : 1;
}
</style>
</head>
<body>
<!-- 캐러셀 시작 -->
<div class="form-group text-center">
	<div id="carousel-example-generic" class="carousel slide">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>
		<!-- Carousel items -->
		<div class="carousel-inner">
			<div class="item active">
				<img src="/resources/images/pic02.jpg" alt="First slide">
			</div>
			<div class="item">
				<img src="/resources/images/pic03.jpg" alt="Second slide">
			</div>
			<div class="item">
				<img src="/resources/images/pic04.jpg" alt="Third slide">
			</div>
		</div>
		<!-- Controls -->
		<a class="right carousel-control" href="#carousel-example-generic" data-slide="next" wrap="false"> 
		<span class="icon-next"></span>
		</a>
		<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev" wrap="false"> 
		<span class="icon-prev"></span>
		</a>
		<a href="/ssgin/joinForm.app">시작하기</a>
	</div>
</div>
	<!-- 캐러셀 끝 -->

	<!-- Scripts -->

	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources/js/jquery.dropotron.min.js"></script>
	<script src="/resources/js/skel.min.js"></script>
	<script src="/resources/js/skel-viewport.min.js"></script>
	<script src="/resources/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="/resources/js/main.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/resources/js/bootstrap.min.js"></script>
	
	<script>
      $('.carousel').carousel({wrap:false});
    </script>
</body>
</html>