<div class="span12">
	
<h2>Thread Diskusi <small>Post Thread Baru</small></h2>

		{{ streams:form stream="topics" mode="edit" edit_id="[segment_5]" return="<?php echo $return_link; ?>" exclude="status|total_thread" success_message="Topik berhasil diperbaharui" failure_message="Topik gagal diperbaharui" required="*" creator_only="yes" }}

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
		$('textarea').addClass('span8');
		pyro.generate_slug('#judul', '#slug', '-');
	});
</script>