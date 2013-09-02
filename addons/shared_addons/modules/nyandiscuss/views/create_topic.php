<div class="span12">
	
<h2>Topik Diskusi <small>Tambah Topik</small></h2>

		{{ streams:form stream="topics" mode="new" return="<?php echo $return_link;?>/-id-" exclude="status|total_thread" success_message="Topik berhasil dibuat" failure_message="Topik gagal dibuat" required="*" }}

		{{ form_open }}
		<div id="topic-form" class="well">

			{{ fields }}

			<div class="controls">
				<label for="{{ input_slug }}"><strong>{{ input_title }}</strong> 
					<span class="red">{{ required }}</span> <br><small>{{ instructions }}</small></label>

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
		$('#grup').val(<?php echo $this->uri->segment(4); ?>);
		$('textarea').addClass('span8');
		pyro.generate_slug('#judul', '#slug', '-');
	});
</script>