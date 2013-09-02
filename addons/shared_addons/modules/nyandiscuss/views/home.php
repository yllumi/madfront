<div class="span12">

	<h2>Forum Diskusi</h2>
	{{ session:messages success="alert alert-success" notice="alert alert-warning" error="alert alert-error" }}

	<div>
		<div>
			<div class="row">
				<div class="span3" style="margin-left:0;">
					<?php echo $template['partials']['topics']; ?>
					<br>
					<?php echo $template['partials']['groups']; ?>
				</div>

				<div class="span9">
					<?php echo $template['partials']['content']; ?>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>

	</div>

</div>

<style>
	.group-icon {
		display: inline-block;
		margin-bottom: 5px;
	}
	.span3:first {
		margin-left: 0;
	}
</style>