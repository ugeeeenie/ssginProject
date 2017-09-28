<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>

	<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="./resources/css/kfonts2.css" rel="stylesheet">
</head>
<body>
<div class="container-flud">


<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<section>
	<a href="carousel.sinc" 	class="btn btn-success">carousel</a><br>
	<a href="collapse.sinc" 	class="btn btn-danger">collapse</a><br>
	<a href="tab/tab.sinc" 		class="btn btn-default">tab</a><br>
	<a href="modal.sinc" 		class="btn btn-default">modal</a><br>
	<a href="thumbnail.sinc" 		class="btn btn-default">thumbnail</a><br>

	

</section>
</div>
</body>
</html>
