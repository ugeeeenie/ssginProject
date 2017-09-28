			Web3 = require('web3');
  			var	web3 = new Web3();
  			web3.setProvider(new Web3.providers.HttpProvider('http://localhost:8545'));
  			var adminAddress = $('#adminAddress').val();
  			var userAddress = $('#userAddress').val();
  			var 	abi = JSON.parse($('#abi').val());
  			var	votingContract = web3.eth.contract(abi);
  			var 	contractAddress = $('#txAddress').val();;
  			var 	tempCandidates = $('#candidates').val();
  			var	contractInstance = votingContract.at(contractAddress);//contract address
  			var 	candidates = {}//{"Rama":"candidate-0","Nick":"candidat-1","Jose":"candidat-2"}
  			var 	candidateNames = tempCandidates.split(",");//['Rama','Nick','Jose']
  			var restTokens = 0;
  			var totalTokens = 0;
  			var 	tokenPrice  = null;
  			
  			for(var i=0;i<candidateNames.length;i++){
  				candidates[candidateNames[i]] = "candidate-"+i;
  			}
  			voteForCandidate = function(candidate) {
				var candidateName = $("#candidate option:selected").val();
				if(candidateName=="nobody"){
					alert("후보자를 선택하세요");
					$("#candidate").focus();
					return;
				}
				var voteTokens = $("#vote-tokens").val();
				if(voteTokens==""){
					alert("토큰을 입력하세요");
					$("#vote-tokens").focus();
					return;
				}else{
					voteTokens = parseInt(voteTokens);
					console.log('restTokens : '+restTokens);
					console.log('voteTokens : '+voteTokens);
					if(restTokens >=voteTokens){
						$("#msg").text("Vote has been submitted. The vote count will increment as soon as the vote is recorded on the blockchain. Please wait...")
		  				$("#candidate option:eq(0)").attr("selected", "selected");
		  				$("#vote-tokens").val("");
		  				  
 				  		contractInstance.voteForCandidate(candidateName, voteTokens, {gas: 140000, from: userAddress},
 				  			function(e1, txHash) {
	  					    	if(!e1){
	  				    			console.log('txHash : '+txHash);
	  				    			var blockFilter = web3.eth.filter('latest');
  								blockFilter.watch(function(e2, blockHash) {
  						    			var block = web3.eth.getBlock(blockHash);
  						    			console.log('New Block('+block.number+')['+block.hash+'] / ' + block.transactions.length + ' TXs');
		  						    for(var i=0;i<block.transactions.length;i++){
		  							    	console.log('['+block.transactions[i]+"]")
		  							    	if(txHash==block.transactions[i]){
		  							    		$("#msg").text(""); 
		  					  				var votesArray = contractInstance.voterDetails.call(userAddress);
		  									restTokens =  votesArray[0];
		  								    var votesPerCandidate = votesArray[1];
		  								    var allCandidates = Object.keys(candidates);
		  								    for(var i=0; i < allCandidates.length; i++) {
		  								    		var count = votesPerCandidate[i];
		  								    		if (typeof count == "undefined") {
		  								    			count = 0;
		  								    		}
		  								        restTokens -= count;
		  								    }
		  					  				populateCandidateVotes();
		  					  				setUpUserRows();
		  							    		blockFilter.stopWatching(function(e5,log){console.log(log);});
		  							    	}//end if
		  						    }//end for
  								});	//end watch
	  					    	}else{
	  					    		console.log(e1);
	  					    	}
 						}); //end voteForCandidate
					}else{
						alert('토큰을 구매하셔야 합니다.');
					}
				}
			}
  				
			buyTokens = function() {
				var tokensToBuy = $("#buy").val();
				if(tokensToBuy==""){
					alert("토큰을 입력하세요");
					$("#buy").focus();
					//return;
				}else{
					var price = tokensToBuy * tokenPrice;
					$('#accountPwdModal').modal({show:true,backdrop:'static',keyboard:false});
				}
			}
			$("#addBtn").bind('click',function(e){
				var tokensToBuy = $("#buy").val();
				var price = tokensToBuy * tokenPrice;
				var pwd = $("#account_pwd").val();
				if(pwd==""){
					alert('비밀호를 입력하세요');
					$("#account_pwd").focus();
				}else{
					web3.personal.unlockAccount(userAddress,pwd,60*60*24,function(e1,result){
				        if(!e1){
				        	$("#buy-msg").text("Purchase order has been submitted. Please wait...");
				        	$("#buy").val("");
						$('#accountPwdModal').modal('hide');
				        	contractInstance.buy({value: web3.toWei(price, 'ether'), from:userAddress },
				        		function(e2, txHash) {
		  					    	if(!e2){
		  				    			console.log('txHash : '+txHash);
		  				    			var blockFilter = web3.eth.filter('latest');
									blockFilter.watch(function(e3, blockHash) {
							    			var block = web3.eth.getBlock(blockHash);
							    			console.log('New Block('+block.number+')['+block.hash+'] / ' + block.transactions.length + ' TXs');
			  						    for(var i=0;i<block.transactions.length;i++){
			  							    	console.log('['+block.transactions[i]+"]")
			  							    	if(txHash==block.transactions[i]){
			  							    		$("#buy-msg").text(""); 
			  					  				setUpUserRows();
			  									populateTokenData();
			  									blockFilter.stopWatching(function(e4,log){console.log(log);});
			  							    	}//end if
			  						    }//end for
									});	//end watch
		  					    	}else{
		  					    		console.log(e2);
		  					    	}
							});  //end buy
				        }else{
				        		alert(e1);
				        }
			    		});//end unlockAccount
				}//end if
			});//end event
			$("#account_pwd").bind('keypress',function(e){
  				//e.preventDefault();
  				var keycode = e.keyCode || e.which;
  				if(keycode ==13){
  					$('#addBtn').trigger('click');
  					return;
  				}
  			});
			lookupVoterInfo = function() {
				var address = $("#voter-info").val();
				if(address==""){
					alert("사용자계정(주소)을 입력하세요");
					$("#voter-info").focus();
					return;
				}
				var votesArray = contractInstance.voterDetails.call(address);
				restTokens =  votesArray[0];
			    $("#tokens-bought").text("Total Tokens bought: " + votesArray[0]);
			    var votesPerCandidate = votesArray[1];
			    $("#votes-cast").empty();
			    $("#votes-cast").append("Votes cast per candidate: <br>");
			    var allCandidates = Object.keys(candidates);
			    for(var i=0; i < allCandidates.length; i++) {
			    		var count = votesPerCandidate[i];
			    		if (typeof count == "undefined") {
			    			count = 0;
			    		}
			        $("#votes-cast").append(allCandidates[i] + ": " +count + "<br>");
			      	restTokens -= count;
			    }
			}
  			populateCandidates = function () {
				var candidateArray =  contractInstance.allCandidates();
				for(var i=0; i < candidateArray.length; i++) {
					candidates[web3.toUtf8(candidateArray[i])] = "candidate-" + i;
			    }
				setUpUserRows();
			    setupCandidateRows();
			    setupCandidateSelect();
			    populateCandidateVotes();
			    populateTokenData();
			}
			setUpUserRows = function () {
				var balance = web3.fromWei(web3.eth.getBalance(userAddress), 'ether');
				$("#user-rows").empty();
				$("#user-rows").append("<tr><td>"+userAddress+"</td><td>"+balance+"</td></tr>");
			}
			setupCandidateRows = function () {
				Object.keys(candidates).forEach(function (candidate) { 
					$("#candidate-rows").append("<tr><td>" + candidate + "</td><td id='" + candidates[candidate] + "'></td></tr>");
				});
			}
			setupCandidateSelect = function(){
				for(var i=0;i<candidateNames.length;i++){
					$("#candidate").append("<option value='"+candidateNames[i]+"'>"+candidateNames[i]+"</option>");
				}
			}
			populateCandidateVotes = function () {
				for (var i = 0; i < candidateNames.length; i++) {
					var name = candidateNames[i];
					var val = contractInstance.totalVotesFor(name).toString();
					$("#" + candidates[name]).text(val);
				} 
			}
			
			populateTokenData = function () {
				totalTokens = contractInstance.totalTokens();
			    $("#tokens-total").text(totalTokens);
			    var tokensSold = contractInstance.tokensSold();
			    $("#tokens-sold").text(tokensSold);
			    tokenPrice = contractInstance.tokenPrice();
			    tokenPrice = parseFloat(web3.fromWei(tokenPrice));
			    $("#token-cost").text(tokenPrice + " Ether");
			    var balance = web3.eth.getBalance(contractInstance.address);
			    $("#contract-balance").text(web3.fromWei(balance) + " Ether");
			    
				var votesArray = contractInstance.voterDetails.call(userAddress);
				restTokens =  votesArray[0];
			    var votesPerCandidate = votesArray[1];
			    var allCandidates = Object.keys(candidates);
			    for(var i=0; i < allCandidates.length; i++) {
			    		var count = votesPerCandidate[i];
			    		if (typeof count == "undefined") {
			    			count = 0;
			    		}
			       	restTokens -= count;
			    }
			}
			$('#refreshUser').bind('click', function(){
				setUpUserRows();
			});
			$('#refreshCandidate').bind('click', function(){
				populateCandidateVotes();
			});
			
			$('#refreshToken').bind('click', function(){
				populateTokenData();
			});
  			
  	  		$("#transferBalanace").bind('click',function(e){
  	  			$("#user").text("Balance has been submitted. The balanace amount will increment as soon as  on the blockchain. Please wait....")
				contractInstance.transferTo(userAddress,{from : userAddress}, function(e1, txHash) {
					if(!e1){
			    			console.log('txHash : '+txHash);
			    			var blockFilter = web3.eth.filter('latest');
						blockFilter.watch(function(error, blockHash) {
				    			var block = web3.eth.getBlock(blockHash);
				    			console.log('New Block('+block.number+')['+block.hash+'] / ' + block.transactions.length + ' TXs');
	 						    for(var i=0;i<block.transactions.length;i++){
	 							    	console.log('['+block.transactions[i]+"]")
	 							    	if(txHash==block.transactions[i]){
	 							    		$("#user").text(""); 
	 					  				setUpUserRows();
	 									populateTokenData();
	 									blockFilter.stopWatching(function(e2,log){console.log(log);});
	 							    	}//end if
	 						    }//end for
						});	//end watche
				    	}else{
				    		console.log(e1);
				    	}
				});
	  		});	
  	  		
			$( document ).ready(function() {
				populateCandidates();
			});