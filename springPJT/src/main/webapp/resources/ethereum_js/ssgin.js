Web3 = require('web3');
web3 = new Web3();
web3.setProvider(new Web3.providers.HttpProvider('http://localhost:8545'));

var adminAddr = "0xa3cf1b84ee70fcf4db335e3e7d8f0fd3aa5045ca";
var adminPwd = "1111";

var abi = JSON.parse('[{"constant":true,"inputs":[{"name":"userId","type":"bytes32"}],"name":"existID","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"","type":"bytes32"}],"name":"ssginAuth","outputs":[{"name":"id","type":"bytes32"},{"name":"pwd","type":"bytes32"},{"name":"flag","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"userId","type":"bytes32"}],"name":"leave","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"userId","type":"bytes32"},{"name":"userPwd","type":"bytes32"}],"name":"join","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"userId","type":"bytes32"},{"name":"userPwd","type":"bytes32"}],"name":"ssginWithID","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"userId","type":"bytes32"}],"name":"memberJoin","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"userId","type":"bytes32"}],"name":"memberLeave","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"inputs":[],"payable":false,"stateMutability":"nonpayable","type":"constructor"}]');
var ssginContract = web3.eth.contract(abi);
/*var contractInstance = ssginContract.new({
						     from: adminAddr, 
						     data: '0x6060604052341561000f57600080fd5b6000600260006101000a81548160ff021916908360ff1602179055506108ec8061003a6000396000f30060606040523615610081576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680633a106941146100865780634606c6e6146100c55780635265303c146101225780635b419a6514610149578063628d19cf1461017d578063a7fca3281461022a578063b4bc1e20146102ca575b600080fd5b341561009157600080fd5b6100ab60048080356000191690602001909190505061036a565b604051808215151515815260200191505060405180910390f35b34156100d057600080fd5b6100ea6004808035600019169060200190919050506103d0565b604051808460001916600019168152602001836000191660001916815260200182151515158152602001935050505060405180910390f35b341561012d57600080fd5b610147600480803560001916906020019091905050610407565b005b341561015457600080fd5b61017b60048080356000191690602001909190803560001916906020019091905050610440565b005b341561018857600080fd5b6101af60048080356000191690602001909190803560001916906020019091905050610547565b6040518080602001828103825283818151815260200191508051906020019080838360005b838110156101ef5780820151818401526020810190506101d4565b50505050905090810190601f16801561021c5780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b341561023557600080fd5b61024f6004808035600019169060200190919050506106b0565b6040518080602001828103825283818151815260200191508051906020019080838360005b8381101561028f578082015181840152602081019050610274565b50505050905090810190601f1680156102bc5780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b34156102d557600080fd5b6102ef6004808035600019169060200190919050506107ae565b6040518080602001828103825283818151815260200191508051906020019080838360005b8381101561032f578082015181840152602081019050610314565b50505050905090810190601f16801561035c5780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b600080600090505b6001805490508160ff1610156103c557826000191660018260ff1681548110151561039957fe5b9060005260206000209001546000191614156103b857600191506103ca565b8080600101915050610372565b600091505b50919050565b60006020528060005260406000206000915090508060000154908060010154908060020160009054906101000a900460ff16905083565b6000806000836000191660001916815260200190815260200160002060020160006101000a81548160ff02191690831515021790555050565b600060018160020160006101000a81548160ff0219169083151502179055508281600001816000191690555081816001018160001916905550806000015460016002600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff16021790555060ff168154811015156104c057fe5b906000526020600020900181600019169055508060008083600001546000191660001916815260200190815260200160002060008201548160000190600019169055600182015481600101906000191690556002820160009054906101000a900460ff168160020160006101000a81548160ff021916908315150217905550905050505050565b61054f6108ac565b6105588361036a565b1561067157600080846000191660001916815260200190815260200160002060020160009054906101000a900460ff16156106345781600019166000808560001916600019168152602001908152602001600020600101546000191614156105f7576040805190810160405280600c81526020017f737367696e53756363657373000000000000000000000000000000000000000081525090506106aa565b6040805190810160405280600d81526020017f77726f6e6750617373776f72640000000000000000000000000000000000000081525090506106aa565b6040805190810160405280600681526020017f6e6f55736572000000000000000000000000000000000000000000000000000081525090506106aa565b6040805190810160405280600681526020017f6e6f55736572000000000000000000000000000000000000000000000000000081525090505b92915050565b6106b86108ac565b6106c18261036a565b1561077057600080836000191660001916815260200190815260200160002060020160009054906101000a900460ff1615610733576040805190810160405280600e81526020017f6964416c7265616479457869737400000000000000000000000000000000000081525090506107a9565b6040805190810160405280600c81526020017f6a6f696e506f737369626c65000000000000000000000000000000000000000081525090506107a9565b6040805190810160405280600c81526020017f6a6f696e506f737369626c65000000000000000000000000000000000000000081525090505b919050565b6107b66108ac565b6107bf8261036a565b1561086e57600080836000191660001916815260200190815260200160002060020160009054906101000a900460ff1615610831576040805190810160405280600d81526020017f6c65617665506f737369626c650000000000000000000000000000000000000081525090506108a7565b6040805190810160405280600681526020017f6e6f55736572000000000000000000000000000000000000000000000000000081525090506108a7565b6040805190810160405280600681526020017f6e6f55736572000000000000000000000000000000000000000000000000000081525090505b919050565b6020604051908101604052806000815250905600a165627a7a72305820f72a0c698aeb3761ae1c9eb7ecbdc485e5c8aca8c6aeae13ac7bf97c63f0ae3e0029', 
						     gas: '4700000'
						   }, function (e, contract){
							   console.log(e, contract);
						    if (typeof contract.address !== 'undefined') {
						         console.log('Contract mined! address: ' + contract.address + ' transactionHash: ' + contract.transactionHash);
						    }
						});*/
var contractInstance = ssginContract.at('0xd42f6aa2c962a33f2992dcf8ec648ee41ed853b6');

$('#register').bind('click',function(){
	console.log("register");
	var userId = $('#name').val();
	var birth = $('#birth').val();
	var gender = $('input[name=gender]:checked').val();
	var phone = $('#phone').val();
	console.log(userId, birth, gender, phone);
    	
	var originPwd = $('#pwd').val();
	var newPwd = originPwd.substring(0,1) + "s"
				+ originPwd.substring(1,2) + "s"
				+ originPwd.substring(2,3) + "g"
				+ originPwd.substring(3,4) + "i"
				+ originPwd.substring(4,5) + "n"
				+ originPwd.substring(5);
	
	var id = web3.sha3(userId+birth+gender+phone);
	var pwd = web3.sha3(newPwd);
	console.log(id);
	console.log(pwd);
	
	contractInstance.memberJoin.call(id, function(e1, result){
		console.log("memberJoin");
		if(!e1){
			if(result == "joinPossible"){
				console.log(result);
				web3.personal.unlockAccount(adminAddr, adminPwd, function(e2, success){
					contractInstance.join(id, pwd, {from: adminAddr}, function(e3, txHash){
						if(!e3){
							$("#filter").append('Smart Contract Transation ID  : <span style="background:#C0FFFF;">' + txHash +' </span><br>');
							var blockFilter = web3.eth.filter('latest');
							$("#filter").append('Transaction Start <br>');
							blockFilter.watch(function(e4, blockHash) {
								if(!e4){
									web3.eth.getBlock(blockHash, function(e5,block){
										if(!e5){
											$("#filter").append('New Block('+block.number+')['+block.hash+'] / ' + block.transactions.length + ' TXs <br>');
											for(var i = 0 ; i < block.transactions.length ; i++){
												if(txHash == block.transactions[i]){	
													$("#filter").append('<span style="background:#C0FFFF;">[' + block.transactions[i] + "] -- checked</span><br>");
													$("#filter").append('Transaction End <br>');
													blockFilter.stopWatching(function(e6,log){
														if(!e6){
															console.log(log);
															console.log("Join Success. hash : " + txHash);
															alert("블록체인 SSG IN 시스템 가입을 환영합니다^^");
														}
														
														else{
															console.log("e6");
															alert(e6);
														}
													});
												}else{
													$("#filter").append('['+block.transactions[i]+"] <br>");
												}
											}//end for
										}
										
										else{
											console.log("e5");
											alert(e5);
										}
									});//end getBlock()
								}
								else{
									console.log("e4");
									alert(e4);
								}
							});//end watch
						}
						else{
							console.log("e3");
							alert(e3);
						}
					});
				});
			}
			
			if(result == "idAlreadyExist"){
				console.log(result);
				alert("사용자가 시스템에 존재합니다.");
			}
		}
		
		else{
			console.log("e1");
			alert(e1);
		}
	});
});

$('#ssgin').bind('click',function(){
	console.log("ssgin");
	var ssginId = $('#ssginName').val();
	var ssginBirth = $('#ssginBirth').val();
	var ssginGender = $('#ssginGender').val();
	var ssginPhone = $('#ssginPhone').val();
	console.log(ssginId, ssginBirth, ssginGender, ssginPhone);
    	
	var ssginPwd = $('#ssginPwd').val();
	var realPwd = ssginPwd.substring(0,1) + "s"
				+ ssginPwd.substring(1,2) + "s"
				+ ssginPwd.substring(2,3) + "g"
				+ ssginPwd.substring(3,4) + "i"
				+ ssginPwd.substring(4,5) + "n"
				+ ssginPwd.substring(5);
	
	var s_id = web3.sha3(ssginId+ssginBirth+ssginGender+ssginPhone);
	var s_pwd = web3.sha3(realPwd);
	console.log(s_id);
	console.log(s_pwd);
	
	
	contractInstance.ssginAuth.call(s_id, s_pwd, function(err,value){
		if(!err){
			console.log(value);
			alert(value);
		}else{
			console.log(err);
			alert(err);
		}
	});
	
	/*contractInstance.existID(s_id, function(err,value){
		if(!err){
			console.log(value);
			alert(value);
		}else{
			console.log(err);
			alert(err);
		}
	});*/
});

$('#leave').bind('click',function(){
	console.log("leave");
	var ssginId = $('#ssginName').val();
	var ssginBirth = $('#ssginBirth').val();
	var ssginGender = $('#ssginGender').val();
	var ssginPhone = $('#ssginPhone').val();
	console.log(ssginId, ssginBirth, ssginGender, ssginPhone);
    	
	var s_id = web3.sha3(ssginId+ssginBirth+ssginGender+ssginPhone);
	console.log(s_id);
	
	contractInstance.memberLeave.call(s_id, function(e1, result){
		if(!e1){
			if(result == "leavePossible"){
				console.log(result);
				web3.personal.unlockAccount(adminAddr, adminPwd, function(e2, success){
					contractInstance.leave(s_id, {from: adminAddr}, function(e3, txHash){
						if(!e3){
							$("#filter").append('Smart Contract Transation ID  : <span style="background:#C0FFFF;">' + txHash +' </span><br>');
							var blockFilter = web3.eth.filter('latest');
							$("#filter").append('Transaction Start <br>');
							blockFilter.watch(function(e3, blockHash) {
								web3.eth.getBlock(blockHash, function(e3,block){
									$("#filter").append('New Block('+block.number+')['+block.hash+'] / ' + block.transactions.length + ' TXs <br>');
									for(var i = 0 ; i < block.transactions.length ; i++){
										if(txHash == block.transactions[i]){	
											$("#filter").append('<span style="background:#C0FFFF;">[' + block.transactions[i] + "] -- checked</span><br>");
											$("#filter").append('Transaction End <br>');
											blockFilter.stopWatching(function(e5,log){
												console.log(log);
											});
											
											console.log("Leave Success. hash : " + txHash);
											alert("블록체인 SSG IN 시스템 탈퇴를 완료하였습니다.");
										}else{
											$("#filter").append('['+block.transactions[i]+"] <br>");
										}
									}//end for
								});//end getBlock()
							});//end watch
						}
						else{
							alert(e3);
						}
					});
				});
			}
			
			if(result == "noUser"){
				console.log(result);
				alert("존재하지 않는 사용자입니다.");
			}
		}
		
		else{
			console.log(e1);
			alert(e1);
		}
	});
});
