<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<% 
	String pageNum = request.getParameter("pageNum");
	String orderNumber = request.getParameter("orderNumber");
	if( pageNum == null ){
		pageNum = "1";
	}
%>
<html>
<head>
<title>Order List</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="css/css-table.css" />
<script type="text/javascript" src="js/style-table.js"></script>
<script src="jquery.confirm/jquery.confirm.js"></script>
<link rel="stylesheet" type="text/css" href="jquery.confirm/jquery.confirm.css" />
</head>
<body>
<script type="text/javascript">
	access_token = $.cookie('access_token');
	if(access_token == null){
		window.location.href = '404.html';
	}
	function deleteOrder(id){
		$.confirm({
			'title'		: 'Delete Confirmation',
			'message'	: 'You are about to delete this order. <br />It cannot be restored at a later time! Continue?',
			'buttons'	: {
				'Yes'	: {
					'class'	: 'blue',
					'action': function(){
						//elem.slideUp();
						$.ajax({
							url: "http://localhost:9099/order/deleteOrder/"+ id +"?access_token="+access_token,
							type: "delete",  
							//dataType: "json",
							async: false,
							success:function (data) {
								if( data == 'success' ){
									window.location.href = 'orderlist.jsp?access_token='+access_token;
								}else{
									$.confirm({
										'title'		: 'Tips',
										'message'	: 'Delete order failed!',
										'buttons'	: {
											'OK': {
												'class'	: 'gray',
												'action': function(){}	// Nothing to do in this case. You can as well omit the action property.
											}
										}
									});
								}
							},
							error:function(data) {
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
				},
				'NO': {
					'class'	: 'gray',
					'action': function(){}	// Nothing to do in this case. You can as well omit the action property.
				}
			}
		});
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
					return;
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
						'message'	: 'Sorry, you are not a admin, cannot manage orders!',
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
				
				$.ajax({
					url: "http://localhost:9099/order/queryList?access_token="+ access_token +"&pageNum=<%=pageNum%>" + "<%=(orderNumber == null)?"":"&orderNumber="+orderNumber%>",
					type: "get",  
					dataType: "json",
					/*username: "bonzzy",
					password: "bonzzy",*/
					async: false,
					success:function (data) {
						currentPage = <%=pageNum%>;

						if(data.list.length > 0){
                            if(currentPage > 1){
                                $pageLi=$('<li><a href="orderlist.jsp?pageNum='+ (currentPage-1) + "<%=(orderNumber == null)?"":"&orderNumber="+orderNumber%>" +'" class="previous">Previous</a></li>');
                            }else{
                                $pageLi=$('<li><a href="orderlist.jsp?pageNum=1'+ "<%=(orderNumber == null)?"":"&orderNumber="+orderNumber%>" + '" class="previous">Previous</a></li>');
                            }
						}

						$('#pageUl').append($pageLi);
						
						if(data.totalPage < 9){
							for( i=0; i<data.totalPage; i++ ){
								if(currentPage == i+1){
									$pageLi=$('<li><a href="orderlist.jsp?pageNum='+ (i+1) + "<%=(orderNumber == null)?"":"&orderNumber="+orderNumber%>" + '" class="current">'+(i+1)+'</a></li>');
								}else{
									$pageLi=$('<li><a href="orderlist.jsp?pageNum='+ (i+1) + "<%=(orderNumber == null)?"":"&orderNumber="+orderNumber%>" + '">'+(i+1)+'</a></li>');
								}
								$('#pageUl').append($pageLi);
							}
						}else{
							if( currentPage < 6 ){
								for( i=0; i<6; i++ ){
									if(currentPage == i+1){
										$pageLi=$('<li><a href="orderlist.jsp?pageNum='+ (i+1) + "<%=(orderNumber == null)?"":"&orderNumber="+orderNumber%>" + '" class="current">'+(i+1)+'</a></li>');
									}else{
										$pageLi=$('<li><a href="orderlist.jsp?pageNum='+ (i+1) + "<%=(orderNumber == null)?"":"&orderNumber="+orderNumber%>" + '">'+(i+1)+'</a></li>');
									}
									$('#pageUl').append($pageLi);
								}
								$pageLi=$('<li><a href="orderlist.jsp?pageNum='+ (data.totalPage-2) + "<%=(orderNumber == null)?"":"&orderNumber="+orderNumber%>" + '">...</a></li>');
								$('#pageUl').append($pageLi);
								for( i=data.totalPage-2; i<data.totalPage; i++ ){
									if(currentPage == i+1){
										$pageLi=$('<li><a href="orderlist.jsp?pageNum='+ (i+1) + "<%=(orderNumber == null)?"":"&orderNumber="+orderNumber%>" + '" class="current">'+(i+1)+'</a></li>');
									}else{
										$pageLi=$('<li><a href="orderlist.jsp?pageNum='+ (i+1) + "<%=(orderNumber == null)?"":"&orderNumber="+orderNumber%>" + '">'+(i+1)+'</a></li>');
									}
									$('#pageUl').append($pageLi);
								}
							}else if( currentPage > data.totalPage-5 ){
								for( i=0; i<2; i++ ){
									if(currentPage == i+1){
										$pageLi=$('<li><a href="orderlist.jsp?pageNum='+ (i+1) + "<%=(orderNumber == null)?"":"&orderNumber="+orderNumber%>" + '" class="current">'+(i+1)+'</a></li>');
									}else{
										$pageLi=$('<li><a href="orderlist.jsp?pageNum='+ (i+1) + "<%=(orderNumber == null)?"":"&orderNumber="+orderNumber%>" + '">'+(i+1)+'</a></li>');
									}
									$('#pageUl').append($pageLi);
								}
								$pageLi=$('<li><a href="orderlist.jsp?pageNum=3'+ "<%=(orderNumber == null)?"":"&orderNumber="+orderNumber%>" + '">...</a></li>');
								$('#pageUl').append($pageLi);
								for( i=data.totalPage-5; i<data.totalPage+1; i++ ){
									if(currentPage == i){
										$pageLi=$('<li><a href="orderlist.jsp?pageNum='+ i + "<%=(orderNumber == null)?"":"&orderNumber="+orderNumber%>" + '" class="current">'+i+'</a></li>');
									}else{
										$pageLi=$('<li><a href="orderlist.jsp?pageNum='+ i + "<%=(orderNumber == null)?"":"&orderNumber="+orderNumber%>" + '">'+i+'</a></li>');
									}
									$('#pageUl').append($pageLi);
								}					
							}else{
								$pageLi=$('<li><a href="orderlist.jsp?pageNum=1'+ "<%=(orderNumber == null)?"":"&orderNumber="+orderNumber%>" + '">1</a></li>');
								$('#pageUl').append($pageLi);
								$pageLi=$('<li><a href="orderlist.jsp?pageNum=2'+ "<%=(orderNumber == null)?"":"&orderNumber="+orderNumber%>" + '">...</a></li>');
								$('#pageUl').append($pageLi);
								$pageLi=$('<li><a href="orderlist.jsp?pageNum='+ (currentPage-1) + "<%=(orderNumber == null)?"":"&orderNumber="+orderNumber%>" + '">'+(currentPage-1)+'</a></li>');
								$('#pageUl').append($pageLi);
								$pageLi=$('<li><a href="orderlist.jsp?pageNum='+ currentPage + "<%=(orderNumber == null)?"":"&orderNumber="+orderNumber%>" + '" class="current">'+currentPage+'</a></li>');
								$('#pageUl').append($pageLi);
								$pageLi=$('<li><a href="orderlist.jsp?pageNum='+ (currentPage+1) + "<%=(orderNumber == null)?"":"&orderNumber="+orderNumber%>" + '">'+(currentPage+1)+'</a></li>');
								$('#pageUl').append($pageLi);
								$pageLi=$('<li><a href="orderlist.jsp?pageNum='+ (data.totalPage-1) + "<%=(orderNumber == null)?"":"&orderNumber="+orderNumber%>" + '">...</a></li>');
								$('#pageUl').append($pageLi);
								$pageLi=$('<li><a href="orderlist.jsp?pageNum='+ data.totalPage + "<%=(orderNumber == null)?"":"&orderNumber="+orderNumber%>" + '">'+data.totalPage+'</a></li>');
								$('#pageUl').append($pageLi);
							}
						}

                        if(data.list.length > 0){
                            if( currentPage < data.totalPage ){
                                $pageLi=$('<li><a href="orderlist.jsp?pageNum='+ (currentPage+1) + "<%=(orderNumber == null)?"":"&orderNumber="+orderNumber%>" + '" class="next">Next</a></li>');
                            }else{
                                $pageLi=$('<li><a href="orderlist.jsp?pageNum='+ data.totalPage + "<%=(orderNumber == null)?"":"&orderNumber="+orderNumber%>" + '" class="next">Next</a></li>');
                            }
                        }

						$('#pageUl').append($pageLi);
						
						/*if(data.list.length == 0){
							$('#order').hide();
							return;
						}*/
						$('#order').show();
						for( i=0; i<data.list.length; i++){
							$orderNumber=$("<td>"+ data.list[i].orderNumber +"</td>");
							//$productModel=$("<td>"+ data.list[i].productModel +"</td>");
							//$quantity=$("<td>"+ data.list[i].quantity +"</td>");
							productArray = JSON.parse(data.list[i].product);
							parseString = '';
							for( j=0; j<productArray.length; j++ ){
								parseString += productArray[j].productModel + " : " + productArray[j].quantity;
								parseString += "<br/>";
							}
							$product=$("<td>"+ parseString +"</td>");
							$status=$("<td>"+ data.list[i].status +"</td>");
							$shipping=$("<td>"+ data.list[i].shipping +"</td>");
							$operation=$('<td><a style="color:#A67D3D" href="ordereditor.jsp?id='+ data.list[i].id +'">edit</a><font style="color:#999 !important">/</font><a style="color:#A67D3D" href="javascript:deleteOrder('+ data.list[i].id +')">delete</a></td>');
							$orderInfo=$("<tr></tr>");
							$orderInfo.append($orderNumber);
							//$orderInfo.append($productModel);
							//$orderInfo.append($quantity);
							$orderInfo.append($product);
							$orderInfo.append($status);
							$orderInfo.append($shipping);
							$orderInfo.append($operation);
							
							$("#order").children('tbody').append($orderInfo);
						}
						
						$('tbody tr').hover(function() {
						  $(this).addClass('odd');
						}, function() {
						  $(this).removeClass('odd');
						});
						
						$('tbody tr td a').hover(function() {
						  $(this).css('text-decoration','underline');
						}, function() {
						  $(this).css('text-decoration','none');
						});
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
					}
				});  
			},
			error:function(){
			    window.location.href = 'login.html';
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
			}
		});  
	});//页面加载
	
</script>
<div class="index-banner1">
  <div class="header-top">	
	<div class="wrap">
   		<!--<div class="logo">
			<a href="index.html"><img src="images/logo.png" alt=""/></a>
		</div>	-->
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
   	     <div class="wrap">
   	       <div class="abstract">
		   	  <!--<div class="map">
				 <iframe width="100%" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.co.in/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265&amp;output=embed"></iframe><br><small><a href="https://maps.google.co.in/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265" style="color:#666;text-align:left;font-size:12px">View Larger Map</a></small>
			 </div>-->
			 <div class="section group">
				<div class="cont1 span_2_of_a1">
				   
					<div class="search_box" style="border:1px solid #E1E2E2; width:35%">
						<form>
						   <input type="text" id="orderNumberInput" value="<%=(orderNumber==null)?"Order Number":orderNumber%>" onfocus="if(this.value=='Order Number')this.value = '';" onblur="if (this.value == '') {this.value = 'Order Number';}"><input id="toQuery" type="button" value="">
						</form>
					</div>
					<script type="text/javascript">
						$('#toQuery').click(function(){
							var orderNumber = $('#orderNumberInput').val();
							if( orderNumber == '' ||  orderNumber == 'Order Number'){
								window.location.href="orderlist.jsp";  
							}else{
								window.location.href="orderlist.jsp?orderNumber="+orderNumber;  
							}
						});
					</script>
				
				</div>
				
				
				<table id="order" style="width:100%">
					<caption>
					<!--<div id="qualityCheckButton" style="background: none repeat scroll 0 0 #82C400;
							width:100px; 
							height:30px; 
							border-width: 0; 
							font-size: 17px; 
							color: #FFFFFF; 
							font-weight: 500; 
							border-radius: 6px; 
							cursor:pointer;
							text-align:center;
							vertical-align:middle;
							line-height:30px;" onclick="javascript:window.location.href='ordereditor.jsp'">
					Add Order
					</div>-->
					<div class="buttonClass" onclick="javascript:window.location.href='ordereditor.jsp'">
						Add Order
					</div>
					</caption>
					 <thead>
						<tr>
							<th colspan="6">Order List</th>
						</tr>
						<tr>
							<th scope="col">Order Number</th>
							<!--<th scope="col">Product Model</th>
							<th scope="col">Quantity</th>-->
							<th scope="col">Product</th>
							<th scope="col">Status</th>
							<th scope="col">Shipping</th>
							<th scope="col">Operation</th>
						</tr>        
					</thead>
					
					<tbody>
						
					</tbody>

				</table>
				 <ul id="pageUl" class="dc_pagination dc_paginationA dc_paginationA06">
					
				  </ul>
				
		        <div class="clear"></div>	
		      </div>
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