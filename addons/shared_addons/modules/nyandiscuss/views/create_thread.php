<div class="span12">
	
<h2>Thread Diskusi <small>Post Thread Baru</small></h2>

	<div id="discussion-form">
		{{ streams:form stream="threads" mode="new" return="<?php echo $return_link; ?>" exclude="status|total_komentar" success_message="Thread berhasil dibuat" failure_message="Thread gagal dibuat" required="*" }}

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
	
</div>

<script>
	$(function(){
		$('input[type=submit]').addClass('btn btn-primary');
		$('input[type=text], select').addClass('span6');
		$('#grup').val(<?php echo $this->uri->segment(4); ?>);
		$('#topik').val(<?php echo $this->uri->segment(5); ?>);
		$('textarea').addClass('span8');
		pyro.generate_slug('#judul', '#slug', '-');
	});
</script>