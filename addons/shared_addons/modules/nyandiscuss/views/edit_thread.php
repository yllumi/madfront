<div class="span12">
	
	<h2>Grup Diskusi <small>Buat Grup Baru</small></h2>

		{{ streams:form stream="threads" mode="edit" edit_id="[segment_4]" return="nyandiscuss" exclude="status|total_komentar" success_message="Thread berhasil diperbaharui" failure_message="Thread gagal diperbaharui" required="*" creator_only="yes" }}

		{{ form_open }}
		<div id="thread-form" class="well">

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