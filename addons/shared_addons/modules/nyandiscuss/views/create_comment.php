<div class="comment_form hide">
<form action="<?php echo site_url($module_ref.'/add_comment/'); ?>" method="post" class="comment-submit">
	<input type="hidden" name="thread" id="thread" value="<?php echo $thread; ?>">
	<?php if(isset($owner_id)): ?>
		<input type="hidden" name="owner" id="owner" value="<?php echo $owner_id; ?>">
	<?php endif; ?>
	<textarea name="konten" id="konten" class="comment-area"></textarea>
	<input type="submit" value="Komentari" class="btn btn-small pull-right">
</form>
<div class="clearfix"></div>
</div>