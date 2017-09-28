<%@ page pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>

	<div class="col-sm-8 col-md-9">

		<div class="page-header">
			<h1>
				Account(All) 
				<span class="copied">Copied!</span> 
				<span class="pull-right"><button type="button" class="btn btn-primary" data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#accountPwdModal">Add Account</button></span>
			</h1>
		</div>

		<div id="listAccount" class="table-responsive">
						
		</div>
	</div>			
        		
	<!-- modal start -->
	<div class="modal fade" id="accountPwdModal" tabindex="-1" role="dialog" aria-labelledby="accountPwdModalLabel" aria-hidden="true">
  		<div class="modal-dialog" role="document">
    			<div class="modal-content">
		    		<div class="modal-header">
		        		<h5 class="modal-title" id="accountPwdModalLabel">Account</h5>
		        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          	<span aria-hidden="true">&times;</span>
		        		</button>
		      </div>
	      		<div class="modal-body">
			     	<div class="form-group">
			            <label for="account_pwd" class="form-control-label">비밀번호 :</label>
			            <input type="password" class="form-control" id="account_pwd" name="account_pwd">
			          </div>
			        
	      		</div>
			    <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary" id="addBtn">Send</button>
			    </div>
    			</div>
  		</div>
	</div>
	<!-- modal end -->

	<!-- modal start -->
	<div class="modal fade" id="qrcodeModal" tabindex="-1" role="dialog" aria-labelledby="qrcodeModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
	    		<div class="modal-content">
	      		<div class="modal-header">
	        			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	        			</button>
	        			<h4 class="modal-title" id="exampleModalLabel">QR Code</h4>
	      		</div>
	      		<div class="modal-body">
	      			<div style="text-align : center;">
	       			<img src=""/>
	       		</div>
	      		</div>
	      		<div class="modal-footer">
	        				<h4>이 코드를 호환되는 모바일 앱에 입력하세요</h4>
	      			</div>
	    		</div>
	  	</div>
	</div>
	<!-- modal end -->

	<script src="accountAll.js"></script>