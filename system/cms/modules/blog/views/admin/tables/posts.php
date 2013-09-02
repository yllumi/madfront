	<table cellspacing="0">
		<thead>
			<tr>
				<th width="20"><?php echo form_checkbox(array('name' => 'action_to_all', 'class' => 'check-all')) ?></th>
				<th><?php echo lang('blog:post_label') ?></th>
				<th class="collapse"><?php echo lang('blog:category_label') ?></th>
				<th class="collapse"><?php echo lang('blog:date_label') ?></th>
				<th class="collapse"><?php echo lang('blog:written_by_label') ?></th>
				<th><?php echo lang('blog:status_label') ?></th>
				<th width="180"><?php echo lang('global:actions') ?></th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($blog as $post) : ?>
				<tr>
					<td><?php echo form_checkbox('action_to[]', $post->id) ?></td>
					<td>
						<?php if($post->status=='live') : ?>
							<a href="<?php echo site_url('blog/'.date('Y/m', $post->created_on).'/'.$post->slug) ?>" title="<?php echo lang('global:view')?>" target="_blank"><?php echo $post->title ?></a>
                        <?php else: ?>
							<a href="<?php echo site_url('blog/preview/' . $post->preview_hash) ?>" title="<?php echo lang('global:preview')?>" target="_blank"><?php echo $post->title ?></a>
                        <?php endif ?>
					</td>
					<td class="collapse"><?php echo $post->category_title ?></td>
					<td class="collapse"><?php echo format_date($post->created_on) ?></td>
					<td class="collapse">
					<?php if (isset($post->display_name)): ?>
						<?php echo anchor('user/'.$post->username, $post->display_name, 'target="_blank"') ?>
					<?php else: ?>
						<?php echo lang('blog:author_unknown') ?>
					<?php endif ?>
					</td>
					<td><?php echo lang('blog:'.$post->status.'_label') ?></td>
					<td style="padding-top:10px;">
                        <?php if($post->author_id == $this->current_user->id or group_has_role('blog','edit_live')): ?>
							<a href="<?php echo site_url('admin/blog/edit/' . $post->id) ?>" title="<?php echo lang('global:edit')?>" class="button"><?php echo lang('global:edit')?></a>
						<?php endif; ?>
						<?php if($post->author_id == $this->current_user->id or group_has_role('blog','delete_live')): ?>
							<a href="<?php echo site_url('admin/blog/delete/' . $post->id) ?>" title="<?php echo lang('global:delete')?>" class="button confirm"><?php echo lang('global:delete')?></a>
						<?php endif; ?>
					</td>
				</tr>
			<?php endforeach ?>
		</tbody>
	</table>

	<?php $this->load->view('admin/partials/pagination') ?>

	<br>

	<div class="table_action_buttons">
		<?php
			$buttons = array();
			if(group_has_role('blog','delete_live')) $buttons[] = 'delete';
			if(group_has_role('blog','put_all_live')) $buttons[] = 'publish';
			$this->load->view('admin/partials/buttons', array('buttons' => $buttons));
			?>
	</div>