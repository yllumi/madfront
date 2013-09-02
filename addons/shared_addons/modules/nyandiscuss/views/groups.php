<h4>Grup Diskusi
	<a href="<?php echo site_url($module_ref.'/group/create'); ?>" class="btn btn-mini pull-right" title="Tambah Grup"><i class="icon-plus-sign"></i></a>
</h4>

<?php if($groups['total']>0): ?>
	<ul class="nav nav-list well well-small">
		<li class="nav-header">Grup Teraktif</li>
		<?php foreach($groups['entries'] as $group): ?>
			<li><a href="<?php echo site_url($module_ref.'/group/'.$group['id']); ?>">
					<?php echo $group['judul']; ?></a>
			</li>
		<?php endforeach; ?>
		<li class="divider"></li>
		<li><a href="<?php echo site_url($module_ref.'/groups'); ?>" title="Tampilkan grup lainnya">Grup lainnya..</a></li>
	</ul>
<?php else: ?>
	<p>Belum ada Grup.</p>
<?php endif; ?>