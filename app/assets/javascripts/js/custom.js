// JavaScript Document
var height =  $(document).height();
	jQuery(".iframeHeight").css({"height":height + 'px'});
	jQuery('.iframeHeight').css({"height":height-202});

	jQuery(".contentResult").css({"height":height + 'px'});
	jQuery('.contentResult').css({"height":height-500});
	
	jQuery('.bars-btn').click(function () {
			jQuery('.box-result').slideToggle('slow', function () {});
		});