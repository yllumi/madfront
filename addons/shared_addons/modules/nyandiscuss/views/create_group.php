<div class="span12">
	
	<h2>Grup Diskusi <small>Buat Grup Baru</small></h2>

		{{ streams:form stream="groups" mode="new" return="<?php echo $module_ref.'/group/-id-'; ?>" exclude="status|total_topik|total_thread" success_message="Grup berhasil dibuat" failure_message="Grup gagal dibuat" required="*" }}

		{{ form_open }}
		<div id="group-form" class="well">

			{{ fields }}

			<div class="controls">
				<label for="{{ input_slug }}"><strong>{{ input_title }}</strong> 
					<span class="red">{{ required }}</span> </label>

				{{ input }}
    			<span class="help-inline red">{{ error }}</span>
			</div>

			{{ /fields }}

			<hr>
			<small>Ket: <span class="red">*</span>) harus diisi</small><br><br>

			{{ form_submit }}

		</div>
		{{ form_close }}
		{{ /streams:form }}
	
</div>

<script>
	$(function(){
		$('input[type=submit]').addClass('btn btn-primary');
		$('input[type=text], select').addClass('span6');
		$('textarea').addClass('span8');
		pyro.generate_slug('#judul', '#slug', '-');
	});
</script>