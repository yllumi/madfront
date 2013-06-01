<?php if ($comments['total']): ?>
	<?php //dump($comments); ?>
	<?php foreach($comments['entries'] as $comment): ?>
	<div class="media">
		<?php if($this->current_user->id == $comment['created_by']['user_id']): ?>
			<a href="<?php echo site_url($module_ref.'/comment/delete/'.$comment['id']); ?>" class="remove pull-right" title="Hapus komentar" style="visibility:hidden;"><i class="icon-remove-circle"></i></a>
		<?php endif; ?>
		<a href="<?php echo site_url('user/'.$comment['created_by']['user_id']); ?>">
			<img class="pull-left media-object" src="{{ user:avatar user_id="<?php echo $comment['created_by']['user_id']; ?>" }}{{ thumb }}{{ /user:avatar }}/60" style="width:50px;" /></a>
		<div class="media-body">
			<a href="<?php echo site_url('user/'.$comment['created_by']['user_id']); ?>">
				<small><?php echo user_displayname($comment['created_by']['user_id']); ?></small> &middot;
				<span class="date"><?php echo date("d M Y H:i", $comment['created']); ?></span>
			</a>
			<br>
			<p><?php echo nl2br($comment['konten']); ?></p>
		</div>
	</div>
	<?php endforeach; ?>
<?php endif; ?>