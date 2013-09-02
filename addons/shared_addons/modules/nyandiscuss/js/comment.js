$(function(){
	// when comment toggle link clicked
	$('.toggle-comment').live('click', function(){
		$container = $(this).parent().parent().siblings('.comment_form');
		$container.toggle();
		$container.children().children('#konten').focus();
		return false;
	})

	$('.comment-submit').live('submit', function(e){
		e.preventDefault();
		$form = $(this);
		$form.children('input.btn').attr('disabled','disabled');
		var url = $form.attr('action');
		var data = $form.serialize();
		$comment_container = $form.parent().siblings('.comments');
		$total_comment = $(this).parent().siblings('.thread-content')
							.children('.date').children('.total_comment');
		var total_comment = $total_comment.attr('rel');
		if(jQuery.trim($form.children('textarea').val()) != ''){
			$.ajax({
				type: 'POST',
				url: url,
				data: data,
				success: function(result){
					//alert(result);
					$comment_container.prepend(result);
					$form.children('textarea').val('');
					$form.parent().hide();
					$comment_container.children(':first').css('border-left','2px solid lightsteelblue');
					$form.children('.btn').removeAttr('disabled');
					total_comment = parseInt(total_comment)+1;
					$total_comment.html(total_comment + ' komentar').attr('rel', total_comment);
				}
			})
		}
		return false;
	})

	$('.media').live('mouseover', function(){
		$(this).children('.remove').css('visibility','visible');
	});
	$('.media').live('mouseout', function(){
		$(this).children('.remove').css('visibility','hidden');
	})

	$('.remove').live('click', function(){
		$elm = $(this).parent();
		$total_comment = $(this).parent().parent().siblings('.thread-content')
							.children('.date').children('.total_comment');
		var total_comment = $total_comment.attr('rel');
		var url = $(this).attr('href')+'/1';
		if(confirm('Anda yakin akan menghapus kometar ini?')){
			$.ajax({
				type: 'POST',
				url: url,
				success: function(result){
					$elm.hide();
					total_comment = parseInt(total_comment)-1;
					$total_comment.html(total_comment + ' komentar').attr('rel', total_comment);
				}
			})
		}
		return false;
	})
})