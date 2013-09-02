<h2>Discussion
	<div class="btn-group pull-right">
		<a href="<?php echo site_url('activity/discussion/create_thread'); ?>" class="btn btn-mini" title="Create Thread">+ Create Thread</a>
		<?php if (group_has_role('chequest', 'create_topic')): ?>
			<a href="<?php echo site_url('activity/discussion/create_topic'); ?>" class="btn btn-mini" title="Create Topic">+ Create Topic</a>
		<?php endif; ?>
		<?php if (group_has_role('chequest', 'create_group')): ?>
			<a href="<?php echo site_url('activity/discussion/create_group'); ?>" class="btn btn-mini" title="Create Group">+ Create Group</a>
		<?php endif; ?>
</div></h2>

<div class="tabbable">
	<div class="tab-content-inner">

		<!-- groups -->
		<div class="page-header">
			<h4>Groups</h4>
		</div>
		<div id="groups">
		<?php if($groups['total']>0): ?>
			<?php foreach($groups['entries'] as $group): ?>
			<div class="pull-left thumbnail group-icon">
				<a href="<?php echo site_url('group/'.$group['slug']); ?>" title="<?php echo $group['deskripsi']; ?>">
					<img src="<?php echo ($group['gambar_grup']['thumb'])? $group['gambar_grup']['thumb'].'/160' : 'holder.js/160x100'; ?>" alt=""><br>
					<?php echo $group['judul']; ?>
				</a>
				<a href="#" class="btn btn-mini btn-primary btn-hover" title="join this group">join</a>
			</div>
			<?php endforeach; ?>
		<?php else: ?>
			<p>There's no any group yet. Create <a>one</a>.</p>
		<?php endif; ?>
		</div>
		<div class="clearfix"></div>

	</div>
</div>
