{{ user:profile user_id= _user:id }}
	<div class="span2" id="main-content">
		<img src="{{ avatar:image }}" class="img-polaroid">
	</div>
	<div class="span7">
		<h3 class="page-title">{{ display_name }}
			{{ if _user:id == user:id }}
			<a href="{{ url:site }}edit-profile" class="btn btn-mini"><i class="icon icon-pencil"></i> Edit</a>
			{{ endif }}
		</h3>
		<fieldset><legend>Data Akun</legend>
			<label for="username"><strong>Username:</strong> {{ username }}</label>
			<label for="grup"><strong>Grup:</strong> {{ group_description }}</label>
			<label for="komisariat"><strong>Komisariat:</strong> {{ komisariat:judul }}</label>
		</fieldset>

		<fieldset><legend>Profil</legend>
			<label for="namalengkap"><strong>Nama Lengkap:</strong> {{ first_name }} {{ last_name }}</label>
			<label for="dob"><strong>Tanggal Lahir:</strong> 
				{{ helper:date format="d F Y" timestamp=tanggal_lahir }}</label>
			<label for="jk"><strong>Gender:</strong> {{ gender:value }}</label>
			<label for="aboutme"><strong>Tentang {{ first_name }}:</strong> {{ bio }}</label>
		</fieldset>

		<fieldset><legend>Kontak</legend>
			<label for="email"><strong>Email:</strong> {{ email }}</label>
			<label for="website"><strong>Situs:</strong> {{ website }}</label>
			<label for="facebook"><strong>Facebook:</strong> http://facebook.com/{{ facebook }}</label>
			<label for="twitter"><strong>Twitter:</strong> http://twitter.com/{{ twitter }}</label>
		</fieldset>
{{ /user:profile }}
		<fieldset><legend>Achievement</legend>
			belum ada achievement
		</fieldset>
	</div>

<div class="span3">
	{{ widgets:area slug="sidebar" }}
</div>