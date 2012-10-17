<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" rev="stylesheet" href="<?php echo base_url();?>css/login.css" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>YPOS - Yttrium Business Solutions</title>
<script src="<?php echo base_url();?>js/jquery-1.2.6.min.js" type="text/javascript" language="javascript" charset="UTF-8"></script>

<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon"/>
     	<!-- <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>css/style.css" /> -->
		<script src="<?php echo base_url();?>js/cufon-yui.js" type="text/javascript"></script>
		<script src="<?php echo base_url();?>js/ChunkFive_400.font.js" type="text/javascript"></script>
		<script type="text/javascript">
			Cufon.replace('h1',{ textShadow: '1px 1px #fff'});
			Cufon.replace('h2',{ textShadow: '1px 1px #fff'});
			Cufon.replace('h3',{ textShadow: '1px 1px #000'});
			Cufon.replace('.back');
		</script>

<script type="text/javascript">
$(document).ready(function()
{
	$("#login_form input:first").focus();
});
</script>
</head>
<body>
<h1>YPOS - <?php echo $this->config->item('application_version'); ?></h1>
<h2>Yttrium Business Solutions</h2>
<!-- <div id="welcome_message">
		<?php echo $this->lang->line('login_welcome_message'); ?>
		</div> -->
<?php echo validation_errors(); ?>

<?php echo form_open('login') ?>
<div id="container">
	<div id="login_form">
	<h3><?php echo $this->lang->line('login_login'); ?></h3>
	
		<div class="form_field_label"><?php echo $this->lang->line('login_username'); ?>: </div>
		<div class="form_field">
		<?php echo form_input(array(
		'name'=>'username', 
		'size'=>'20')); ?>
		</div>

		<div class="form_field_label"><?php echo $this->lang->line('login_password'); ?>: </div>
		<div class="form_field">
		<?php echo form_password(array(
		'name'=>'password', 
		'size'=>'20')); ?>
		
		</div>
		
		<div id="submit_button">
		<?php echo form_submit('loginButton','Entrar'); ?>
		</div>
	</div>
</div>

<?php echo form_close(); ?>
</body>
</html>
