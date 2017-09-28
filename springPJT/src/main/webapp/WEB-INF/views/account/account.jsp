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
					  	<a href="#" class="btn btn-primary">송금하기<i class="fa fa-check spaceLeft"></i></a>
					</div>
					<div class="box-body" id="joinBox" style="display:block;">
			        <!-- <form id="form-join" method="post"> -->
			          <div class="form-group">
			            <label for="name">내 계좌</label>
			            <input type="text" class="form-control" id="fromAccount" name="fromAccount" value="0xa3cf1b84ee70fcf4db335e3e7d8f0fd3aa5045ca" readonly>
			          </div>
			          <div class="form-group">
			            <label for="birth">잔액</label>
			            <input type="text" class="form-control" id="balance" name="balance" readonly>
			          </div>
			          <div class="form-group">
			            <label for="gender">송금할 계좌</label>
			            <input type="text" class="form-control" id="toAccount" name="toAccount">
			          </div>
			          <div class="form-group">
			            <label for="gender">보낼 금액</label>
			            <input type="number" class="form-control" id="amount" name="amount">
			          </div>
			          <div class="form-group">
			            <label for="gender">비밀번호</label>
			            <input type="password" class="form-control" id="pwd" name="pwd">
			          </div>
			          <div class="form-group text-center">
			           <button id="transfer" class="btn btn-primary">송금하기<i class="fa fa-times spaceLeft"></i></button>
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
	<!-- modal end -->
	<%@ include file="../include/footer.jsp"%>

	<script src="/resources/ethereum_js/jquery-1.12.0.min.js"></script>
	<script src="/resources/ethereum_js/bootstrap.min.js"></script>
	<script src="/resources/ethereum_js/web3.js"></script>
	<script src="/resources/ethereum_js/clipboard.min.js"></script>
	<script src="/resources/ethereum_js/ethereum.js"></script>
	<!-- <script src="/resources/ethereum_js/account.js"></script> -->
	<script type="text/javascript">
	Web3 = require('web3');
	web3 = new Web3();
	web3.setProvider(new Web3.providers.HttpProvider('http://localhost:8545'));
	/* if (typeof web3 !== 'undefined') {
		  web3 = new Web3(web3.currentProvider);
		  console.log('first')
		} else {
		  // set the provider you want from Web3.providers
		  web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
		  console.log('second')
		} */
		
	web3.eth.getBalance($('#fromAccount').val(), function(error, result){
	    if(!error){
	        var balance = web3.fromWei(result, 'ether');
	        console.log('balance : '+balance);
			$('#balance').val(balance);
		}else{
	        console.error(error);
		}
	});
		
	$('#transfer').bind('click', function(){
		console.log("transfer");
		var from = $("#fromAccount").val();
		var to = $("#toAccount").val();
		var amount = web3.toWei($('#amount').val(), 'ether');
		var pwd = $('#pwd').val();
		
		console.log(from);
		console.log(to);
		console.log($('#balance').val());
		console.log(amount);
		console.log(pwd);
		
		web3.personal.unlockAccount(from, pwd, function(e, result){
			web3.eth.sendTransaction({
			    from: from,
			    to: to,
			    value: amount
			}, function(e1, txHash) {
				  if (!e1){
					   $("#filter").append('Smart Contract Transation ID  : <span style="background:#C0FFFF;">' + txHash +' </span><br>');
						var blockFilter = web3.eth.filter('latest');
						$("#filter").append('Transaction Start <br>');
						blockFilter.watch(function(e2, blockHash) {
							if(!e2){
								web3.eth.getBlock(blockHash, function(e3,block){
									if(!e3){
										$("#filter").append('New Block('+block.number+')['+block.hash+'] / ' + block.transactions.length + ' TXs <br>');
										for(var i = 0 ; i < block.transactions.length ; i++){
											if(txHash == block.transactions[i]){	
												$("#filter").append('<span style="background:#C0FFFF;">[' + block.transactions[i] + "] -- checked</span><br>");
												$("#filter").append('Transaction End <br>');
												blockFilter.stopWatching(function(e4,log){
													if(!e4){
														console.log(log);
														console.log("Tranasfer Success. hash : " + txHash);
														alert("송금을 완료하였습니다.");
													}else{
														console.log("e4");
														alert(e4);
													}
												});
											}else{
												$("#filter").append('['+block.transactions[i]+"] <br>");
											}
										}//end for
									}else{
										console.log("e3");
										alert(e3);
									}
								});//end getBlock()
							}else{
								console.log("e2");
								alert(e2);
							}
						});//end watch
				  }else{
					  console.log("e1");
					  alert(e1);
				  }
			});
		});
	});
	</script>
  </body>
</html>

	