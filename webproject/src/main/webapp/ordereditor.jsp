<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<% 
	String id = request.getParameter("id");
%>
<html>
<head>
<title>Single</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script src="jquery.confirm/jquery.confirm.js"></script>
<link rel="stylesheet" type="text/css" href="jquery.confirm/jquery.confirm.css" />
</head>
<body>
<script type="text/javascript">
	access_token = $.cookie('access_token');
	if(access_token == null){
		window.location.href = '404.html';
	}
	//Ajax调用处理
	$(document).ready(function(){
		$.ajax({
			url: "http://localhost:9099/auth/user?access_token="+access_token,   
			type: "get",  
			dataType: "json",
			/*username: "bonzzy",
			password: "bonzzy",*/
			async: false,
			type: "GET",
			success:function (data) {
				if(data.authorities == null || data.authorities == '' || data.authorities == undefined){
					$.confirm({
						//'title'		: 'Delete Confirmation',
						'title'		: 'Tips',
						//'message'	: 'You are about to delete this item. <br />It cannot be restored at a later time! Continue?',
						'message'	: 'Sorry, server exception!',
						'buttons'	: {
							/*'Yes'	: {
								'class'	: 'blue',
								'action': function(){
									elem.slideUp();
								}
							},*/
							'OK': {
								'class'	: 'gray',
								'action': function(){}	// Nothing to do in this case. You can as well omit the action property.
							}
						}
					});
					window.location.href="404.html";
				}
				isAdmin = false;
				for( i=0; i<data.authorities.length; i++ ){
					if(data.authorities[i].authority == 'admin'){
						isAdmin = true;
						break;
					}
				}
				if(!isAdmin){
					$.confirm({
						//'title'		: 'Delete Confirmation',
						'title'		: 'Tips',
						//'message'	: 'You are about to delete this item. <br />It cannot be restored at a later time! Continue?',
						'message'	: 'Sorry, you are not a admin, cannot manage orders!"',
						'buttons'	: {
							/*'Yes'	: {
								'class'	: 'blue',
								'action': function(){
									elem.slideUp();
								}
							},*/
							'OK': {
								'class'	: 'gray',
								'action': function(){}	// Nothing to do in this case. You can as well omit the action property.
							}
						}
					});
					window.location.href="404.html";
				}
				
				<% 
				if(id != null && id.trim() != "" ){
				%>
					$.ajax({
						url: "http://localhost:9099/order/queryList?access_token="+ access_token +"&id=<%=id%>",   
						type: "get",  
						dataType: "json",
						async: false,
						type: "GET",
						success:function (data) {
							if( data == null || data.list == null || data.list == undefined || data.list.length == 0 ){
								$.confirm({
									'title'		: 'Tips',
									'message'	: 'Sorry, there is no the order information!',
									'buttons'	: {
										'OK': {
											'class'	: 'gray',
											'action': function(){}	// Nothing to do in this case. You can as well omit the action property.
										}
									}
								});
							}else{
								$('#orderNumber').val(data.list[0].orderNumber);
								$('#productModel').val(data.list[0].productModel);
								$('#quantity').val(data.list[0].quantity);
								$('#status').val(data.list[0].status);
								$('#shipping').val(data.list[0].shipping);
								$('#id').val(data.list[0].id);
								//$('#qualityCheck').val(data.list[0].qualityCheck);
								
								CKEDITOR.instances.qualityCheck.setData(data.list[0].qualityCheck);
							}
						},
						error:function(data){
							$.confirm({
								'title'		: 'Tips',
								'message'	: 'Sorry, server exception!',
								'buttons'	: {
									'OK': {
										'class'	: 'gray',
										'action': function(){}	// Nothing to do in this case. You can as well omit the action property.
									}
								}
							});
						}
					});
				<%
				}
				%>
			},
			error:function(){
				$.confirm({
					//'title'		: 'Delete Confirmation',
					'title'		: 'Tips',
					//'message'	: 'You are about to delete this item. <br />It cannot be restored at a later time! Continue?',
					'message'	: 'Sorry, server exception!',
					'buttons'	: {
						/*'Yes'	: {
							'class'	: 'blue',
							'action': function(){
								elem.slideUp();
							}
						},*/
						'OK': {
							'class'	: 'gray',
							'action': function(){}	// Nothing to do in this case. You can as well omit the action property.
						}
					}
				});
				window.location.href="404.html";
			}
		});  
	});//页面加载
	
</script>

<div class="index-banner1">
  <div class="header-top">	
	<div class="wrap">
   		<div class="logo">
			<!--<a href="index.html"><img src="images/logo.png" alt=""/></a>-->
		</div>	
		<div class="menu">																
			<a href="#" class="right_bt" id="activator"><img src="images/nav_icon.png" alt=""></a>
				<div class="box" id="box">
				  	<div class="box_content_center1">
					    <div class="menu_box_list1">
							<ul>
								<li><a href="index.html">Home</a></li>
								<li><a href="login.html">Management</a></li>
								<li class="active"><a href="about.html">About</a></li> 
								<!--<li><a href="blog.html">Blog</a></li> -->
								<!--<li><a href="gallery.html">Gallery</a></li>-->
								<!--<li><a href="contact.html">Contact</a></li>-->
								<!--<li><a href="404.html">404</a></li>-->
							</ul>
					     </div>
						 <a class="boxclose" id="boxclose"><img src="images/close.png" alt=""></a>
					 </div>                
			      </div>
			                 <script type="text/javascript">
								var $ = jQuery.noConflict();
									$(function() {
										$('#activator').click(function(){
												$('#box').animate({'top':'0px'},500);
										});
										$('#boxclose').click(function(){
												$('#box').animate({'top':'-700px'},500);
										});
									});
									$(document).ready(function(){
									
									//Hide (Collapse) the toggle containers on load
									$(".toggle_container").hide(); 
									
									//Switch the "Open" and "Close" state per click then slide up/down (depending on open/close state)
									$(".trigger").click(function(){
										$(this).toggleClass("active").next().slideToggle("slow");
										return false; //Prevent the browser jump to the link anchor
									});
									
									});
							</script>
			         </div> 	
			         <div class="clear"></div>		
		  </div>	
		</div>	
	   </div>
   	   <div class="main">
   	     <div class="wrap" >
			<div class="quality-area">
				<form>
					<input type="hidden" id="id" >
					<p>
						<label>Order Number</label>
						<!--<span>*</span>-->
						<input id="orderNumber" type="text" value="">
					</p>
					<p>
						<label>productModel</label>
						<!--<span>*</span>-->
						<input id="productModel" type="text" value="">
					</p>
					<p>
						<label>quantity</label>
						<input id="quantity" type="text" value="">
					</p>
					<p>
						<label>status</label>
						<input id="status" type="text" value="">
					</p>
					<p>
						<label>shipping</label>
						<input id="shipping" type="text" value="">
					</p>
					<p>
						<label>Quality Check</label>
						<!--<span>*</span>-->
						<textarea id="qualityCheck" name="editor"></textarea>
					</p>
					<p>
						<input id="submitOrder" type="button" value="Submit">
						<input type="button" value="Cancel" onclick="window.location.href='orderlist.jsp'">
					</p>
				</form>
				<ckeditor:replace replace="qualityCheck" basePath="ckeditor/" />
				<script type="text/javascript">
					var $ = jQuery.noConflict();
					$(function() {
						$('#submitOrder').click(function(){
							var orderNumber = $('#orderNumber').val();
							var productModel = $('#productModel').val();
							var quantity = $('#quantity').val();
							var status = $('#status').val();
							var shipping = $('#shipping').val();
							var id = $('#id').val();
							var reg=/\n/g;
							var reg2=/\"/g;
							var check = CKEDITOR.instances.qualityCheck.getData().replace(reg , "").replace(reg2, "'");
							if(id == ''){
								$.ajax({
									url: "http://localhost:9099/order/saveOrder?access_token="+access_token,   
									type: "put",  
									//dataType: "json",
									contentType: "application/json; charset=UTF-8",
									data: 
									'{"orderNumber" : "'+orderNumber+'","productModel" : "'+ productModel + '","quantity" : "' + quantity + '","status" : "' + status + '","shipping" : "' + shipping + '","qualityCheck" : "' + check + '"}',
									async: false,
									success:function (data) {
										if(data == null || data == '' || data == undefined){
											$.confirm({
												//'title'		: 'Delete Confirmation',
												'title'		: 'Tips',
												//'message'	: 'You are about to delete this item. <br />It cannot be restored at a later time! Continue?',
												'message'	: 'Sorry, server exception!',
												'buttons'	: {
													/*'Yes'	: {
														'class'	: 'blue',
														'action': function(){
															elem.slideUp();
														}
													},*/
													'OK': {
														'class'	: 'gray',
														'action': function(){}	// Nothing to do in this case. You can as well omit the action property.
													}
												}
											});
											return;
										}
										if(data == 'success'){
											window.location.href = 'orderlist.jsp';
										}else{
											$.confirm({
												'title'		: 'Tips',
												'message'	: 'Sorry, submit order failed!',
												'buttons'	: {
													'OK': {
														'class'	: 'gray',
														'action': function(){}	// Nothing to do in this case. You can as well omit the action property.
													}
												}
											});
										}
									},
									error:function(data){
										$.confirm({
											'title'		: 'Tips',
											'message'	: 'Sorry, server exception!',
											'buttons'	: {
												'OK': {
													'class'	: 'gray',
													'action': function(){}	// Nothing to do in this case. You can as well omit the action property.
												}
											}
										});
									}
								});
							}else{
								$.ajax({
									url: "http://localhost:9099/order/updateOrder?access_token="+access_token,   
									type: "post",  
									//dataType: "json",
									contentType: "application/json; charset=UTF-8",
									data: 
									'{"id": "'+ id +'", "orderNumber" : "'+orderNumber+'","productModel" : "'+ productModel + '","quantity" : "' + quantity + '","status" : "' + status + '","shipping" : "' + shipping + '","qualityCheck" : "' + check + '"}',
									async: false,
									success:function (data) {
										if(data == null || data == '' || data == undefined){
											$.confirm({
												//'title'		: 'Delete Confirmation',
												'title'		: 'Tips',
												//'message'	: 'You are about to delete this item. <br />It cannot be restored at a later time! Continue?',
												'message'	: 'Sorry, server exception!',
												'buttons'	: {
													/*'Yes'	: {
														'class'	: 'blue',
														'action': function(){
															elem.slideUp();
														}
													},*/
													'OK': {
														'class'	: 'gray',
														'action': function(){}	// Nothing to do in this case. You can as well omit the action property.
													}
												}
											});
											return;
										}
										if(data == 'success'){
											window.location.href = 'orderlist.jsp';
										}else{
											$.confirm({
												'title'		: 'Tips',
												'message'	: 'Sorry, submit order failed!',
												'buttons'	: {
													'OK': {
														'class'	: 'gray',
														'action': function(){}	// Nothing to do in this case. You can as well omit the action property.
													}
												}
											});
										}
									},
									error:function(data){
										$.confirm({
											'title'		: 'Tips',
											'message'	: 'Sorry, server exception!',
											'buttons'	: {
												'OK': {
													'class'	: 'gray',
													'action': function(){}	// Nothing to do in this case. You can as well omit the action property.
												}
											}
										});
									}
								});
							}
						});
					});
				</script>
			</div>
		 </div>
		</div>
	<div class="footer">
	   	<div class="wrap">
	   		<div class="copy">
			   <p>
			   Copyright &copy; 2018.Bonzzy All rights reserved.
			   <!--<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>-->
			   </p>
		    </div>
	   	</div>
    </div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>