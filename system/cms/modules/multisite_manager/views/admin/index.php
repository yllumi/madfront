<section class="title">
	<h4><?php echo lang('madfront_multisite_manager:item_list'); ?></h4>
</section>

<section class="item">
	<div class="content">
	<?php echo form_open('admin/madfront_multisite_manager/delete');?>
	<?php if (!empty($madfront_multisite_manager)): ?>
		<table border="0" class="table-list" cellspacing="0">
			<thead>
				<tr>
					<th><?php echo form_checkbox(array('name' => 'action_to_all', 'class' => 'check-all'));?></th>
					<th><?php echo lang('madfront_multisite_manager:name'); ?></th>
					<th></th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="5">
						<div class="inner"><?php $this->load->view('admin/partials/pagination'); ?></div>
					</td>
				</tr>
			</tfoot>
			<tbody>
				<?php foreach( $madfront_multisite_manager as $item ): ?>
				<tr id="item_<?php echo $item->id; ?>">
					<td><?php echo form_checkbox('action_to[]', $item->id); ?></td>
					<td><?php echo $item->site_name; ?></td>
					<td class="actions">
						<?php echo
						//anchor('madfront_multisite_manager', lang('madfront_multisite_manager:view'), 'class="button" target="_blank"').' '.
						anchor('admin/madfront_multisite_manager/edit/'.$item->id, lang('madfront_multisite_manager:edit'), 'class="button"').' '.
						anchor('admin/madfront_multisite_manager/delete/'.$item->id, 	lang('madfront_multisite_manager:delete'), array('class'=>'button')); ?>
					</td>
				</tr>
				<?php endforeach; ?>
			</tbody>
		</table>
		<div class="table_action_buttons">
			<?php $this->load->view('admin/partials/buttons', array('buttons' => array('delete'))); ?>
		</div>
	<?php else: ?>
		<div class="no_data"><?php echo lang('madfront_multisite_manager:no_items'); ?></div>
	<?php endif;?>
	<?php echo form_close(); ?>
</div>
</section>