<section class="title">
	<!-- We'll use $this->method to switch between madfront_multisite_manager.create & madfront_multisite_manager.edit -->
	<h4><?php echo lang('madfront_multisite_manager:'.$this->method); ?></h4>
</section>

<section class="item">
	<div class="content">
		<?php echo form_open_multipart($this->uri->uri_string(), 'class="crud"'); ?>

		<div class="form_inputs">

			<ul class="fields">
				<li>
					<label for="site_name">Site Name</label>
					<div class="input">
						<?php echo form_input("site_name", set_value("site_name", $site_name)); ?>
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
						<?php echo form_radio("active", set_value("active", $active)); ?>
					</div>
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