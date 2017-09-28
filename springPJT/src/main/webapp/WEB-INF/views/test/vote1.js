Web3 = require('web3');
	web3 = new Web3();
	web3.setProvider(new Web3.providers.HttpProvider('http://localhost:8545'));
	var candidates = {"Rama": "candidate-1", "Nick": "candidate-2", "Jose": "candidate-3"}
	var candidateNames = ["Rama","Nick","Jose"];
	var abi = JSON.parse('[{"constant":false,"inputs":[{"name":"candidate","type":"bytes32"}],"name":"totalVotesFor","outputs":[{"name":"","type":"uint8"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"candidate","type":"bytes32"}],"name":"validCandidate","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"","type":"bytes32"}],"name":"votesReceived","outputs":[{"name":"","type":"uint8"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"candidateList","outputs":[{"name":"","type":"bytes32"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"candidate","type":"bytes32"}],"name":"voteForCandidate","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"inputs":[{"name":"candidateNames","type":"bytes32[]"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"}]')
	var votingContract = web3.eth.contract(abi);
	var contractInstance = votingContract.at('0x0a448b9932eb01743c707455b278aec4316fafa8');//contract address
	var userAddress = $("#userAddress").val();
	for (var i = 0; i < candidateNames.length; i++) {
			var name = candidateNames[i];
			setCandidate(name);
	} 
	function setCandidate(name){
		contractInstance.totalVotesFor.call(name, function(error, value) {
	 		if(!error){
	 			$("#" + candidates[name]).html(value.toString());
	 		}else{
	 			alert(error);
	 		}
     	});  
	}
	voteForCandidate = function () {
		$('#accountPwdModal').modal({show:true,backdrop:'static',keyboard:false});
	}
	
	$("#addBtn").bind('click',function(e){
		var pwd = $("#account_pwd").val();
		if(pwd==""){
			alert('비밀호를 입력하세요');
			$("#account_pwd").focus();
		}else{
			web3.personal.unlockAccount(userAddress,pwd,function(e1,success){
			if(!e1){
				$('.wrap-loading').removeClass('display-none');
				candidateName = $(':radio[name="vote"]:checked').val();
				contractInstance.voteForCandidate(
					candidateName, 
					{from: userAddress},
					function(e2, txHash) {
					    	if(!e2){
				    			console.log('txHash : '+txHash);
				    			$('#accountPwdModal').modal('hide');
				    			var blockFilter = web3.eth.filter('latest');
				    			blockFilter.watch(function(e3, blockHash) {
				    			    web3.eth.getBlock(blockHash,function(e4,block){
				    			    	console.log('New Block('+block.number+')['+block.hash+'] / ' + block.transactions.length + ' TXs');
					    			    for(var i=0;i<block.transactions.length;i++){
					    				    	console.log('['+block.transactions[i]+"]")
					    				    	if(txHash==block.transactions[i]){
					    				    		contractInstance.totalVotesFor.call(candidateName,function(e5, value){
					    				    			$("#" + candidates[candidateName]).html(value.toString());
						    				    		$('.wrap-loading').addClass('display-none');
					    				    		});
					    				    		blockFilter.stopWatching(function(e5,log){
					    				    			console.log(log);
					    				    		});
					    				    	}
					    			    }//end for
				    			    });//end getBlock
				    			    
				    			});	//end watch
					    	}else{
					    		$('.wrap-loading').addClass('display-none');
					    		$('#accountPwdModal').modal('hide');
					    		console.log(e2);
					    	}
					});  //end voteForCandidate
				}else{
					$('#accountPwdModal').modal('hide');
					alert(e1);
				}
			});//end unlockAccount
		}//end pwd
		
	});//end event