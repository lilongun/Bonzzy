<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<html>
<head>
<title>Single</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/jquery.min.js"></script>
</head>
<body>
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
			<div class="quality-area">
				<form>
					<p>
						<label>Subject</label>
						<span>*</span>
						<textarea id="editor" name="editor"></textarea>
					</p>
					<p>
						<input type="submit" value="Submit Comment">
					</p>
				</form>
				<ckeditor:replace replace="editor" basePath="ckeditor/" />
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