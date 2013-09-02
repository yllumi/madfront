<h4>Topik Diskusi
	<a href="<?php echo site_url($module_ref.'/topic/create/'.(isset($group)?$group->id:'')); ?>" class="btn btn-mini pull-right" title="Tambah Topik">
		<i class="icon-plus-sign"></i></a>
</h4>

<?php if($topics['total']>0): ?>
	<ul class="nav nav-tabs nav-stacked">
		<?php $topic_link = ($this->uri->segment(2) == 'group')
							? site_url($module_ref.'/group/'.$group->id)
							: site_url($module_ref);
		?>
		<li <?php echo (!$topic_id)? 'class="active"': ''; ?>>
			<a href="<?php echo $topic_link; ?>">General</a></li>
		<?php foreach($topics['entries'] as $topic): ?>
			<li <?php echo ($topic['id']==$topic_id)?'class="active"':'';?>><a href="<?php echo $topic_link.'/'.$topic['id']; ?>"><?php echo $topic['judul']; ?>
				&nbsp; <span class="label pull-right"><?php echo $topic['total_thread']; ?></span></a>
		</li>
		<?php endforeach; ?>
	</ul>
<?php else: ?>	
	<p>Belum ada topik.</p>
<?php endif; ?>