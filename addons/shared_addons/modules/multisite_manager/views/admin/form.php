<section class="title">
	<!-- We'll use $this->method to switch between multisite_manager.create & multisite_manager.edit -->
	<h4><?php echo lang('multisite_manager:'.$this->method); ?></h4>
</section>

<section class="item">
	<div class="content">
		<?php echo form_open_multipart($this->uri->uri_string(), 'class="crud"'); ?>

		<div class="form_inputs">

			<ul class="fields">
				<li>
					<label for="name">Site Name</label>
					<div class="input">
						<?php echo form_input("name", set_value("name", $name)); ?>
					</div>
				</li>
				<li>
					<label for="ref">Reference</label>
					<div class="input">
						<?php echo form_input("ref", set_value("ref", $ref)); ?>
					</div>
				</li>
				<li>
					<label for="domain">Domain</label>
					<div class="input">
						<?php echo form_input("domain", set_value("domain", $domain)); ?>
					</div>
				</li>
				<li>
					<label for="active">Active</label>
					<div class="input">
					<select name="active">
						<option value="1" <?php echo set_select('active', '1', TRUE); ?> >Active</option>
						<option value="0" <?php echo set_select('active', '0'); ?> >Non-Active</option>
					</select>
				</li>
			<!-- <li>
				<label for="fileinput">Fileinput
					<?php if (isset($fileinput->data)): ?>
					<small>Current File: <?php echo $fileinput->data->filename; ?></small>
					<?php endif; ?>
					</label>
				<div class="input"><?php echo form_upload('fileinput', NULL, 'class="width-15"'); ?></div>
			</li> -->
		</ul>

	</div>

	<div class="buttons">
		<?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel') )); ?>
	</div>

	<?php echo form_close(); ?>
</div>
</section>