<div class="span12">
	
	<h2><?php echo $group->judul; ?>
		<?php if($group->created_by == $this->current_user->id): ?>
		<div class="btn-group pull-right">
			<a class="btn btn-mini" href="<?php echo site_url($module_ref.'/group/edit/'.$group->id); ?>"><i class="icon-wrench"></i> Edit Grup</a>
		</div>
		<?php endif; ?>
	</h2>

	{{ session:messages success="alert alert-success" notice="alert alert-warning" error="alert alert-error" }}

	<div>
		<div class="well well-small">
			<div class="media">
				<img src="<?php echo $group->gambar_grup['image']; ?>" class="media-object pull-left" />
				<div class="media-body">
					<p><?php echo $group->deskripsi; ?></p>
					<span class="label label-info">Total Topik: <?php echo $group->total_topik; ?></span> 
					<span class="label label-success">Total Thread: <?php echo $group->total_thread; ?></span>
				</div>
			</div>
		</div>

		<ul class="nav nav-tabs">
			<li class="active"><a href="#">Daftar Thread</a></li>
			<li><a href="#">Anggota Grup</a></li>
		</ul>

		<div>
			<div class="row">
				<div class="span3" style="margin-left:0;">
					<?php echo $template['partials']['topics']; ?>
				</div>

				<div class="span9">
					<?php echo $template['partials']['content']; ?>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>

	</div>
</div>
