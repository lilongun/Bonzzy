/**
 * @license Copyright (c) 2003-2018, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	    // 上传文件时浏览服务文件夹                                                                                                       
    config.filebrowserBrowseUrl ='/bonzzy/ckfinder/ckfinder.html';                                                           
    // 上传图片时浏览服务文件夹                                                                                                        
    config.filebrowserImageBrowseUrl ='/bonzzy/ckfinder/ckfinder.html?Type=Images';                                          
    // 上传Flash时浏览服务文件夹                                                                                                     
    config.filebrowserFlashBrowseUrl ='/bonzzy/ckfinder/ckfinder.html?Type=Flash';                                           
    // 上传文件按钮(标签)                                                                                                         
    config.filebrowserUploadUrl ='/bonzzy/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files';       
    // 上传图片按钮(标签)                                                                                                         
    config.filebrowserImageUploadUrl ='/bonzzy/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Images';  
    // 上传Flash按钮(标签)                                                                                                      
    config.filebrowserFlashUploadUrl ='/bonzzy/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash';  


};
