<?php 
	$c_topic_id = count($current_topic)? $current_topic->id : '';
	$group_id = isset($group)? $group->id : '';
?>

<h4><?php echo (isset($group))? 'Topik': ''; ?> 
	<?php if(count($current_topic)): ?>
		<?php echo $current_topic->judul; ?>
		<?php if($current_topic->created_by == $this->current_user->id): ?>
		<a href="<?php echo site_url($module_ref.'/topic/edit/'.$group_id.'/'.$c_topic_id); ?>" title="Edit Topik">
			<i class="icon-pencil" style="margin-top:3px;"></i></a>
		<?php endif; ?>
	<?php else : ?>
		General
	<?php endif; ?>
	<a href="<?php echo site_url($module_ref.'/thread/create/'.$group_id.'/'.$c_topic_id); ?>" class="btn btn-mini btn-success pull-right" title="Buat Thread">
		<i class="icon-plus-sign icon-white"></i> Buat Thread</a>
</h4>
<?php if(count($current_topic)): ?>
	<div class="well well-small"><?php echo $current_topic->deskripsi; ?></div>
<?php endif; ?>

<?php if($threads['total']): ?>
	<table class="table table-hover">
		<tbody>
			<?php foreach($threads['entries'] as $thread): ?>
			<tr><td>
			<div class="media">
				<a href="<?php echo site_url('user/'.$thread['created_by']['user_id']); ?>">
				<img class="pull-left media-object" src="{{ user:avatar user_id="<?php echo $thread['created_by']['user_id']; ?>" }}{{ thumb }}{{ /user:avatar }}/60" /></a>
				<div class="media-body">
					<a href="<?php echo site_url('user/'.$thread['created_by']['user_id']); ?>">
						<small><?php echo user_displayname($thread['created_by']['user_id']); ?></small></a>
						<br>
						<strong>
							<a href="<?php echo site_url($module_ref.'/thread/'.$thread['id'].'/'.$thread['slug']); ?>">
								<?php echo $thread['judul']; ?></a>
								<?php if($thread['created_by']['user_id'] == $this->current_user->id): ?>
									<a href="<?php echo site_url($module_ref.'/thread/edit/'.$thread['id']); ?>" title="Edit Thread"><i class="icon-pencil"></i></a>
								<?php endif; ?>
							</strong>
							<p class="thread-content"><?php echo nl2br($thread['konten']['normal']); ?><br>
								<span class="date">
									<?php echo date("d M Y H:i", $thread['created']); ?>, 
									<a href="#" class="total_comment" rel="<?php echo $thread['total_komentar']; ?>"><?php echo $thread['total_komentar']; ?> komentar</a> &middot; 
									<a href="#" class="toggle-comment">komentari</a>
								</span>
							</p>
							<?php echo Modules::run('nyandiscuss/comment_form', $thread['id']); ?>
							<div class="comments">
								<?php echo Modules::run('nyandiscuss/comment_list', $thread['id']); ?>
							</div>
						</div>
					</div>
				</td></tr>
			<?php endforeach; ?>
		</tbody>
	</table>

	{{ pagination }}

<?php else: ?>
	<p>Belum ada thread satupun. Buat thread <a href="<?php echo site_url($module_ref.'/thread/create/'.$group_id); ?>">disini</a>.</p>
<?php endif; ?>