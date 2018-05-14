CKEDITOR.plugins.add('jwplayer',
{
	requires:['dialog'],
	init:function(editor){
		var pluginName='jwplayer';
		CKEDITOR.dialog.add(pluginName,this.path+'jwplayer.config.js');
		editor.addCommand(pluginName,new CKEDITOR.dialogCommand(pluginName));
		editor.ui.addButton('jwplayer',{label:'视频',command:pluginName,icon:this.path+'jwplayer/jwPlayer.gif',});
	}
});