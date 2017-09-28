Web3 = require('web3');
web3 = new Web3();
web3.setProvider(new Web3.providers.HttpProvider('http://localhost:8545')); 
/*
var accounts = web3.eth.accounts;
var html ='';
	for(var i=0;i<accounts.length;i++){	
		var address = web3.eth.accounts[i];
		var balance = web3.fromWei(web3.eth.getBalance(address), 'ether');
		html +='<div class="row">';
		html += '<div class="col "><h4><a href="transfer.jsp?address='+address+'&balance='+balance+'" id="copy'+i+'" >'+address+'</a>('+balance+' ETH)</h4></div>';
		html += '<div class="col "><a href="transfer.jsp?address='+address+'&balance='+balance+'" class="btn btn-primary btn-space">송금하기</a>';
		html += '<a href="javascript:copyboard(\''+i+'\');" id="clip'+i+'" aria-label="complete" data-clipboard-target="#copy'+i+'" class="btn btn-info btn-space ">주소복사</a>';
		html += '<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#qrcodeModal" data-img-src="/ethereum//images/qrcode/'+address+'.png">QR Code</button></div>';
		html +='</div>';
	} 
	$('#listAccount').append(html);
	*/
	
	var html ='';
	web3.eth.getAccounts(function(error, accounts){
		if(!error){
    		html +='<table class="table table-striped">';
   		for(var i=0;i<accounts.length;i++){	
   	   		var address = accounts[i];
   	   		var balance = web3.fromWei(web3.eth.getBalance(address), 'ether');
   	   		html +='<tr>';
   	   		html +='<td>';
   	   		html += '<h4>Address : <a href="transfer.jsp?address='+address+'&balance='+balance+'" id="copy'+i+'" >'+address+'</a></h4>';
   	   		html += '<h4>Blance : ('+balance+' ETH)</h4>';
   	   		html +='</td><td><div class="row">';
   	   		html += '<div class="col-lg-4" style="margin-top:10px;"><a href="transfer.jsp?address='+address+'&balance='+balance+'" class="btn btn-primary btn-space">송금하기</a></div>';
   	   		html += '<div class="col-lg-4" style="margin-top:10px;"><a href="javascript:copyboard(\''+i+'\');" id="clip'+i+'" aria-label="complete" data-clipboard-target="#copy'+i+'" class="btn btn-info btn-space ">주소복사</a></div>';
   	   		html += '<div class="col-lg-4" style="margin-top:10px;"><button type="button" class="btn btn-warning" data-toggle="modal" data-target="#qrcodeModal" data-img-src="/ethereum//images/qrcode/'+address+'.png">QR Code</button></div>';
   	   		html +='</div></td></tr>';
   	   	}// end for
	   	html +='</table>';
   	   	$('#listAccount').append(html);
		}else{
			alert(error);
		}
		
	});//end getAccounts
	
	
$('#accountPwdModal').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget);
	  	var modal = $(this)
	 });
	$('#qrcodeModal').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget); 
		var value = button.data('img-src');
		var modal = $(this);
		modal.find('.modal-body img').attr('src',value);
	});
	$("#addBtn").bind('click',function(e){
	var pwd = $("#account_pwd").val();
	if(pwd==""){
		alert('비밀번호를 입력하세요');
		$("#account_pwd").focus();
	}else{
    		web3.personal.newAccount(pwd,function(error,result){
	        if(!error){
	        		$('#accountPwdModal').modal('hide');
	     	   	location.href="add_qrcode.jsp?address="+result;
	        }else{
	        		alert(error);
	        }
    		});
	}
});
$("#account_pwd").bind('keypress',function(e){
	var keycode = e.keyCode || e.which;
	if(keycode ==13){
		$('#addBtn').trigger('click');
	}
});
copyboard = function (i){
	var clip = new Clipboard('#clip'+i);
	clip.on('success', function(e) {
  		$('.copied').show();
		$('.copied').fadeOut(1000);
	});
	
}