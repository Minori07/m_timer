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
