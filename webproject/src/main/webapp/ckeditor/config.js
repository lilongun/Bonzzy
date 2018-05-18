/**
 * @license Copyright (c) 2003-2018, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	    // 上传文件时浏览服务文件夹                                                                                                       
    config.filebrowserBrowseUrl ='ckfinder/ckfinder.html';                                                           
    // 上传图片时浏览服务文件夹                                                                                                        
    config.filebrowserImageBrowseUrl ='ckfinder/ckfinder.html?Type=Images';                                          
    // 上传Flash时浏览服务文件夹                                                                                                     
    config.filebrowserFlashBrowseUrl ='ckfinder/ckfinder.html?Type=Flash';                                           
	// 上传文件按钮(标签) 
	config.filebrowserUploadUrl ='ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files';
	// 上传图片按钮(标签)                                                                                                         
	config.filebrowserImageUploadUrl ='ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images';
	// 上传Flash按钮(标签) 
	config.filebrowserFlashUploadUrl ='ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash';
	
	//config.extraPlugins='jwplayer';
	
	//添加video插件
	config.extraPlugins='video';
	
	//关闭标签过滤
	config.allowedContent=true;

};
