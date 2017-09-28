<%@ page pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<html>
  <head>
    <!-- <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     --><!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>bootstrap template</title>

    <!-- Bootstrap -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome -->
    <!-- <link rel="stylesheet" href="/resources/bootstrap/css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
    Custom style
    <link rel="stylesheet" href="/resources/bootstrap/css/style.css" media="screen" title="no title" charset="utf-8">
 -->
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
	.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
		position: fixed;
		left:0;
		right:0;
		top:0;
		bottom:0;
		background: rgba(0,0,0,0.2); 
		filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
		z-index : 99999;
	}
	.wrap-loading div{ /*로딩 이미지*/
		position: fixed;
        top:50%;
        left:50%;
        margin-left: -21px;
        margin-top: -21px;
    }
    .display-none{ /*감추기*/
        display:none;
    }
	</style>
  </head>
  <body>
  	<!-- Main content -->
	<section class="content">
		<div class="row">
			<!-- left column -->
			<div class="col-md-12">
				<!-- general form elements -->
				<div class="box">
					<div class="box-header with-border">
					  	<a href="javascript:join();" class="btn btn-primary">회원가입<i class="fa fa-check spaceLeft"></i></a>
					  	<a href="javascript:ssgin();" class="btn btn-success">SSG IN.<i class="fa fa-check spaceLeft"></i></a>
					  	<a href="javascript:leave();" class="btn btn-warning">회원탈퇴<i class="fa fa-check spaceLeft"></i></a>
					</div>
					<div class="box-body" id="joinBox" style="display:block;">
			        <!-- <form id="form-join" method="post"> -->
			          <div class="form-group">
			            <label for="name">이름</label>
			            <input type="text" class="form-control" id="name" name="name" placeholder="이름">
			          </div>
			          <div class="form-group">
			            <label for="birth">생년월일</label>
			            <input type="text" class="form-control" id="birth" name="birth" placeholder="생년월일 6자리(ex.900101)">
			          </div>
			          <div class="form-group">
			            <label for="gender">성별</label><br>
			            <input type="radio" name="gender" value="1">남
			            <input type="radio" name="gender" value="2">여
			          </div>
			          <div class="form-group">
			            <label for="phone">핸드폰번호</label>
			            <select class="form-control" id="telecom" style="position:absolute;float:left;width:10%;">
			            	<option value="SKT">SK</option>
			            	<option value="KT">KT</option>
			            	<option value="LGU+">LGU+</option>
			            </select>
			            <input type="text" class="form-control" id="phone" name="phone" placeholder="핸드폰번호 전체를 입력해주세요" style="position:relative;left:10%;width:90%;">
			          </div>
			          <div class="form-group">
			            <label for="pwd">비밀번호</label>
			            <input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호">
			          </div>
			          <div class="form-group text-center">
			           <button id="register" class="btn btn-primary">회원가입<i class="fa fa-times spaceLeft"></i></button>
			          </div>
			        <!-- </form> -->
			 		 </div>
			 		 
			 		 <div class="box-body" id="ssginBox" style="display:none;">
			        <!-- <form id="form-join" method="post"> -->
			            <input type="hidden" id="ssginName" value="유지은">
			          	<input type="hidden" id="ssginBirth" value="920528">
			          	<input type="hidden" id="ssginGender" value="2">
			            <input type="hidden" id="ssginPhone" value="01044883094">
			          <div class="form-group">
			            <label for="pwd">비밀번호</label>
			            <input type="password" class="form-control" id="ssginPwd" name="pwd" placeholder="비밀번호">
			          </div>
			          <div class="form-group text-center">
			           <button id="ssgin" class="btn btn-success">로그인<i class="fa fa-check spaceLeft"></i></button>
			          </div>
			        <!-- </form> -->
			 		 </div>
			 		 
			 		 <div class="box-body" id="leaveBox" style="display:none;">
			        <!-- <form id="form-join" method="post"> -->
			            <input type="text" class="form-control" value="유지은">
			          <div class="form-group text-center">
			           <button id="leave" class="btn btn-warning">회원탈퇴<i class="fa fa-sign-out" aria-hidden="true"></i></button>
			          </div>
			        <!-- </form> -->
			 		 </div>
	      
					  <div class="panel panel-info">
						<div class="panel-heading">
							<h3 class="panel-title">Filter</h3>
						</div>
						<div class="panel-body" id="filter">
						</div>
					  </div>
					</div>
				</div>
			</div>
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->

	<input type="hidden" id="fromAddress" value="0xa4baf95b60c99542de74c3a740758049149457b4" placeholder="계정 주소">
	<!-- modal end -->
	<%@ include file="../include/footer.jsp"%>

	<script src="/resources/ethereum_js/jquery-1.12.0.min.js"></script>
	<script src="/resources/ethereum_js/bootstrap.min.js"></script>
	<script src="/resources/ethereum_js/web3.js"></script>
	<script src="/resources/ethereum_js/clipboard.min.js"></script>
	<script src="/resources/ethereum_js/ethereum.js"></script>
	<script src="/resources/ethereum_js/ssgin.js?ver=1.0"></script>
	<script type="text/javascript">
		function join(){
			$('#joinBox').css('display', 'block');
			$('#ssginBox').css('display', 'none');
			$('#leaveBox').css('display', 'none');
			$('#cntBox').css('display', 'none');
			$('#filter').empty();
		}
		
		function ssgin(){
			$('#joinBox').css('display', 'none');
			$('#ssginBox').css('display', 'block');
			$('#leaveBox').css('display', 'none');
			$('#cntBox').css('display', 'none');
			$('#filter').empty();
		}
		
		function leave(){
			$('#joinBox').css('display', 'none');
			$('#ssginBox').css('display', 'none');
			$('#leaveBox').css('display', 'block');
			$('#cntBox').css('display', 'none');
			$('#filter').empty();
		}
	</script>
  </body>
</html>

	