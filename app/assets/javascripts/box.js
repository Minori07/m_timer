$(function(){
	$('.sbm').on('click',function(){
		$(".new_box").slideUp(300);
	})

	$('.sbm').on('click',function(){
		$(".new_box").slideUp(300);
	})

	var match = location.search.match(/taskId=(.*?)(&|$)/);

	if(match) {
	  id = decodeURIComponent(match[1]);
	  $(".new_box").slideDown(300);
	}

	var newId = location.search.match(/new=(.*?)(&|$)/);
	if(newId) {
	  $(".new_box").slideDown(300);
	}
})

$(function(){
    $('#container:not(body#index #container)').css({display:'block',marginLeft:$(window).width(),opacity:'0'});
    $('#container:not(body#index #container)').animate({marginLeft:'0px',opacity:'1'},500);
 
    $('body#index #container').css({display:'block',opacity:'0'});
    $('body#index #container').animate({opacity:'1'},500);
 
    $('.menu_icon').click(function(){
        var pass = $(this).attr("href");
        $('#container').animate({marginLeft:'-=' + $(window).width() + 'px',opacity:'0'},500,function(){
            location.href = pass;
            setTimeout(function(){
                $('#container').css({marginLeft:'0',opacity:'1'})
            },100);
        });
        return false;
    });
});