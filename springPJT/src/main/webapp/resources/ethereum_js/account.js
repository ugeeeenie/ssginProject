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
var from = $("#fromAccount").val();
var to = $("#toAccount").val();
web3.eth.getBalance(from, function(error, result){
    if(!error){
        var balance = web3.fromWei(result, 'ether');
        console.log('balance : '+balance);
		$('#balance').val(balance);
	}else{
        console.error(error);
	}
});
var amount = $('#amount').val();
var pwd = web3.toWei($('#amount').val(), 'ether');

web3.personal.unlockAccount($("#fromAccount").val(), pwd, function(e, result){
	web3.eth.sendTransaction({
	    from: from,
	    to: to,
	    value: amount
	}, function(err, transactionHash) {
		  if (!err){
			   $("#filter").append('Smart Contract Transation ID  : <span style="background:#C0FFFF;">' + txHash +' </span><br>');
				var blockFilter = web3.eth.filter('latest');
				$("#filter").append('Transaction Start <br>');
				blockFilter.watch(function(e1, blockHash) {
					web3.eth.getBlock(blockHash, function(e2,block){
						$("#filter").append('New Block('+block.number+')['+block.hash+'] / ' + block.transactions.length + ' TXs <br>');
						for(var i = 0 ; i < block.transactions.length ; i++){
							if(txHash == block.transactions[i]){	
								$("#filter").append('<span style="background:#C0FFFF;">[' + block.transactions[i] + "] -- checked</span><br>");
								$("#filter").append('Transaction End <br>');
								blockFilter.stopWatching(function(e3,log){
									console.log(log);
								});
								
								console.log("Tranasfer Success. hash : " + txHash);
								alert("송금을 완료하였습니다.");
							}else{
								$("#filter").append('['+block.transactions[i]+"] <br>");
							}
						}//end for
					});//end getBlock()
				});//end watch
		  }else{
			 alert(err);
		  }
	});
});

