<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div class="col-sm-8 col-md-9">

		<div class="page-header">
			<h1>Transfer</h1>
		</div>

		<form id="form-login"  name="f" action="add_member.jsp" method="post">
            <div class="form-group">
              <label for="fromAddress">계정 주소</label>
              <input type="text" class="form-control" id="fromAddress" name="fromAddress" value="${param.address }" placeholder="계정 주소">
            </div>
            <div class="form-group">
              <label for="fromBalance">계정 잔고 </label>
              <input type="text" class="form-control" id="fromBalance" name="fromBalance" value="${param.balance }" placeholder="계정 잔고">
            </div>
            
           <div class="form-group">
              <label for="toAddress">받는이 주소</label>
              <input type="text" class="form-control" id="toAddress" name="toAddress" placeholder="받는이 주소">
            </div>
            <div class="form-group">
              <label for="toAmount">보낼 금액</label>
              <input type="text" class="form-control" id="toAmount" name="toAmount" placeholder="보낼 금액">
            </div>
            
            <div class="form-group text-center">
            		<a href="account.jsp" class="btn btn-success" >이전(personal)<i class="fa fa-check spaceLeft"></i></a>
            		<a href="accountAll.jsp" class="btn btn-primary" >이전(All)<i class="fa fa-check spaceLeft"></i></a>
              	<button class="btn btn-warning"  id="send">송금<i class="fa fa-check spaceLeft"></i></button>
              
            </div>
          </form>

</div>
        
	<!-- modal start -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">비밀번호 </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form >
          <div class="form-group">
            <label for="account_pwd" class="form-control-label">비밀번호 :</label>
            <input type="password" class="form-control" id="account_pwd" name="account_pwd">
          </div>
          
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="addBtn">Send</button>
      </div>
    </div>
  </div>
</div>

<script >
    $('#send').bind('click',function(e){
		e.preventDefault();
		$('#exampleModal').modal('show');
});
$('#account_pwd').bind('keydown',function(e){
		//e.preventDefault();
    	var code = e.keyCode || e.which;
    	 if(code == 13) { //Enter keycode
    		 $('#addBtn').trigger('click');
    	 }
});
$("#addBtn").bind('click',function(){
	
    
    var pwd = $("#account_pwd").val();
    
    	Web3 = require('web3');
	   	web3 = new Web3();
	   	web3.setProvider(new Web3.providers.HttpProvider('http://localhost:8545')); 
	   /* 	if (typeof web3 !== 'undefined') {
	   	  web3 = new Web3(web3.currentProvider);
	   	} else {
	   	  // set the provider you want from Web3.providers
	   	  web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
	   	} */
	  	web3.personal.unlockAccount($("#fromAddress").val(),pwd);
		var fromAddress = $('#fromAddress').val();
	 	var toAddress = $('#toAddress').val();
		var sendAmount = web3.toWei($('#toAmount').val(), 'ether');

		web3.eth.sendTransaction({
	 	    from: fromAddress,
	 	    to: toAddress,
	 	    value: sendAmount
	 	},
 		function(err, transactionHash) {
	 		  if (!err){
	 			    console.log(transactionHash); 
	 			   $('#exampleModal').modal('hide');
	 			   location.href='account.jsp';
	 		  }else{
	 			 alert(err);
	 		  }
	 	});
});
    </script>
