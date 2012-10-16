function get_dimensions() 
{
	var dims = {width:0,height:0};
	
  if( typeof( window.innerWidth ) == 'number' ) {
    //Non-IE
    dims.width = window.innerWidth;
    dims.height = window.innerHeight;
  } else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) {
    //IE 6+ in 'standards compliant mode'
    dims.width = document.documentElement.clientWidth;
    dims.height = document.documentElement.clientHeight;
  } else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) {
    //IE 4 compatible
    dims.width = document.body.clientWidth;
    dims.height = document.body.clientHeight;
  }
  
  return dims;
}

function set_feedback(text, classname, keep_displayed)
{
	if(text!='')
	{
		$('#feedback_bar').removeClass();
		$('#feedback_bar').addClass(classname);
		$('#feedback_bar').text(text);
		$('#feedback_bar').css('opacity','1');

		if(!keep_displayed)
		{
			$('#feedback_bar').fadeTo(5000, 1);
			$('#feedback_bar').fadeTo("fast",0);
		}
	}
	else
	{
		$('#feedback_bar').css('opacity','0');
	}
}

//keylisteners

$(window).jkey('ctrl+1',function(){
window.location = BASE_URL + '/customers/index';
});


$(window).jkey('ctrl+2',function(){
window.location = BASE_URL + '/items/index';
});


$(window).jkey('ctrl+3',function(){
window.location = BASE_URL + '/reports/index';
});

$(window).jkey('ctrl+4',function(){
window.location = BASE_URL + '/suppliers/index';
});

$(window).jkey('ctrl+5',function(){
window.location = BASE_URL + '/receivings/index';
});


$(window).jkey('ctrl+6',function(){
window.location = BASE_URL + '/sales/index';
});

$(window).jkey('f2',function(){
window.location = BASE_URL + '/sales/index';
});

$(window).jkey('ctrl+7',function(){
window.location = BASE_URL + '/employees/index';
});

$(window).jkey('ctrl+8',function(){
window.location = BASE_URL + '/config/index';
});

$(window).jkey('ctrl+9',function(){
window.location = BASE_URL + '/giftcards/index';
});
