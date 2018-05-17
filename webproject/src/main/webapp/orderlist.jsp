<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<% 
	String access_token = request.getParameter("access_token");
	if(access_token == null){
		out.write("Sorry, please login first!");
		return ;
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
</head>
<body>
<script type="text/javascript">
	//Ajax调用处理
	$(document).ready(function(){
		$.ajax({
			url: "http://localhost:9099/auth/user?access_token=<%=access_token%>",   
			type: "get",  
			dataType: "json",
			/*username: "bonzzy",
			password: "bonzzy",*/
			async: false,
			type: "GET",
			success:function (data) {
				if(data.authorities == null || data.authorities == '' || data.authorities == undefined){
					alert("Sorry, server exception!");
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
					alert("Sorry, you are not a admin, cannot manage orders!");
					return;
				}
			},
			error:function(){
				alert("Sorry, server exception!");
			}
		});  
	});//页面加载
	
</script>
<div class="index-banner1">
  <div class="header-top">	
	<div class="wrap">
   		<div class="logo">
			<a href="index.html"><img src="images/logo.png" alt=""/></a>
		</div>	
		<div class="menu">																
			<a href="#" class="right_bt" id="activator"><img src="images/nav_icon.png" alt=""></a>
				<div class="box" id="box">
				  	<div class="box_content_center1">
					    <div class="menu_box_list1">
							<ul>
								<li><a href="index.html">Home</a></li>
								<li class="active"><a href="about.html">About</a></li> 
								<li><a href="blog.html">Blog</a></li> 
								<li><a href="gallery.html">Gallery</a></li>
								<li><a href="contact.html">Contact</a></li>
								<li><a href="404.html">404</a></li>
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
		   	 <ul class="breadcrumb breadcrumb__t"><a class="home" href="#">Blog</a>  / About</ul>
		   	 <div class="blog-top">
				<div class="col_1_of_b span_1_of_b">
					<h3><a href="single.html">Lorem Ipsum is simply</a></h3>
					<a href="single.html"><img src="images/b1.jpg" alt=""/></a>
					<div class="links">
			  		    <ul>
			  			   <li><img src="images/date.png" title="date"><span>Feb 14, 2014</span></li>
			  			   <li><img src="images/author.png" title="Admin"><span>admin</span></li>
			  			   <li><img src="images/comments.png" title="Comments"><span>No comments</span></li>
			  			</ul>
		  		    </div>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					<div class="button"><a href="#">Read More</a></div>
				</div>
				<div class="col_1_of_b span_1_of_b">
					<h3><a href="single.html">Lorem Ipsum is simply</a></h3>
					<a href="single.html"><img src="images/b2.jpg" alt=""/></a>
					<div class="links">
			  		    <ul>
			  			   <li><img src="images/date.png" title="date"><span>Feb 14, 2014</span></li>
			  			   <li><img src="images/author.png" title="Admin"><span>admin</span></li>
			  			   <li><img src="images/comments.png" title="Comments"><span>No comments</span></li>
			  			</ul>
		  		    </div>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					<div class="button"><a href="#">Read More</a></div>
				</div>
				<div class="clear"></div>
		     </div>
		     <div class="blog-top">
				<div class="col_1_of_b span_1_of_b">
					<h3><a href="single.html">Lorem Ipsum is simply</a></h3>
					<a href="single.html"><img src="images/b3.jpg" alt=""/></a>
					<div class="links">
			  		    <ul>
			  			   <li><img src="images/date.png" title="date"><span>Feb 14, 2014</span></li>
			  			   <li><img src="images/author.png" title="Admin"><span>admin</span></li>
			  			   <li><img src="images/comments.png" title="Comments"><span>No comments</span></li>
			  			</ul>
		  		    </div>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					<div class="button"><a href="#">Read More</a></div>
				</div>
				<div class="col_1_of_b span_1_of_b">
					<h3><a href="single.html">Lorem Ipsum is simply</a></h3>
					<a href="single.html"><img src="images/b4.jpg" alt=""/></a>
					<div class="links">
			  		    <ul>
			  			   <li><img src="images/date.png" title="date"><span>Feb 14, 2014</span></li>
			  			   <li><img src="images/author.png" title="Admin"><span>admin</span></li>
			  			   <li><img src="images/comments.png" title="Comments"><span>No comments</span></li>
			  			</ul>
		  		    </div>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					<div class="button"><a href="#">Read More</a></div>
				</div>
				<div class="clear"></div>
		     </div>
		     <div class="blog-top1">
				<div class="col_1_of_b span_1_of_b">
					<h3><a href="single.html">Lorem Ipsum is simply</a></h3>
					<a href="single.html"><img src="images/b5.jpg" alt=""/></a>
					<div class="links">
			  		    <ul>
			  			   <li><img src="images/date.png" title="date"><span>Feb 14, 2014</span></li>
			  			   <li><img src="images/author.png" title="Admin"><span>admin</span></li>
			  			   <li><img src="images/comments.png" title="Comments"><span>No comments</span></li>
			  			</ul>
		  		    </div>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					<div class="button"><a href="#">Read More</a></div>
				</div>
				<div class="col_1_of_b span_1_of_b">
					<h3><a href="single.html">Lorem Ipsum is simply</a></h3>
					<a href="single.html"><img src="images/b6.jpg" alt=""/></a>
					<div class="links">
			  		    <ul>
			  			   <li><img src="images/date.png" title="date"><span>Feb 14, 2014</span></li>
			  			   <li><img src="images/author.png" title="Admin"><span>admin</span></li>
			  			   <li><img src="images/comments.png" title="Comments"><span>No comments</span></li>
			  			</ul>
		  		    </div>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					<div class="button"><a href="#">Read More</a></div>
				</div>
				<div class="clear"></div>
		      </div>
		      <ul class="dc_pagination dc_paginationA dc_paginationA06">
				<li><a href="#" class="previous">Previous</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#" class="current">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
			    <li><a href="#">...</a></li>
				<li><a href="#">19</a></li>
			    <li><a href="#">20</a></li>
				<li><a href="#" class="next">Next</a></li>
		      </ul>
		</div>
   	  </div>
   	</div>
	<div class="footer">
	   	<div class="wrap">
	   		<div class="copy">
			   <p>Copyright &copy; 2014.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
		    </div>
	   	</div>
    </div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>