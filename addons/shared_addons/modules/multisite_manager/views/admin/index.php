<section class="title">
	<h4><?php echo lang('multisite_manager:item_list'); ?></h4>
</section>

<section class="item">
	<div class="content">
	<?php echo form_open('admin/multisite_manager/delete');?>
	<?php if (!empty($sites)): ?>
		<table border="0" class="table-list" cellspacing="0">
			<thead>
				<tr>
					<th>Created On</th>
					<th>Site Name</th>
					<th>Reference</th>
					<th>Domain</th>
					<th>Status</th>
					<th></th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="6">
						<div class="inner"><?php $this->load->view('admin/partials/pagination'); ?></div>
					</td>
				</tr>
			</tfoot>
			<tbody>
				<?php foreach( $sites as $item ): ?>
				<tr id="item_<?php echo $item->id; ?>">
					<td><?php echo date("d F Y H:i", $item->created_on); ?></td>
					<td><strong><?php echo $item->name; ?></strong></td>
					<td><?php echo $item->ref; ?></td>
					<td><a href="http://<?php echo $item->domain; ?>" title=""><?php echo $item->domain; ?></a></td>
					<td><?php echo ($item->active == 1)?'Active' : 'Inactive'; ?></td>
					<td class="actions">
						<?php echo
						//anchor('multisite_manager', lang('multisite_manager:view'), 'class="button" target="_blank"').' '.
						anchor('admin/multisite_manager/edit/'.$item->id, 'Manage', 'class="button"'); ?>
					</td>
				</tr>
				<?php endforeach; ?>
			</tbody>
		</table>
	<?php else: ?>
		<div class="no_data"><?php echo lang('multisite_manager:no_items'); ?></div>
	<?php endif;?>
	<?php echo form_close(); ?>
</div>
</section>