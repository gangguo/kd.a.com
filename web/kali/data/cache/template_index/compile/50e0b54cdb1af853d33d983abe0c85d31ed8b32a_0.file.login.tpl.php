<?php
/* Smarty version 3.1.32-dev-45, created on 2019-02-26 12:51:25
  from '/Users/gangkui/wwwroot/www/video.a.com/web/index/template/login.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32-dev-45',
  'unifunc' => 'content_5c74c5cdcbef49_12104564',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '50e0b54cdb1af853d33d983abe0c85d31ed8b32a' => 
    array (
      0 => '/Users/gangkui/wwwroot/www/video.a.com/web/index/template/login.tpl',
      1 => 1551064630,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:public/header.tpl' => 1,
    'file:public/footer.tpl' => 1,
  ),
),false)) {
function content_5c74c5cdcbef49_12104564 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:public/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

	<!-- /////////////////////////////////////////Content -->
	<div id="page-content" class="contact-page">
		<div class="container">
			<div class="row">
				<div id="main-content" class="col-md-12">
					<div class="box">
						<center><div class="art-header">
							<h1 class="center">login</h1>
						</div></center>

						<div class="art-content">
							<div id="contact_form">
								<form name="form1" id="ff" method="post" action="contact.php">
									<label>
									<span>Enter your name:</span>
									<input type="text"  name="name" id="name" required>
									</label>
									<label>
									<span>Enter your password:</span>
									<input type="email"  name="passwd" id="email" required>
									</label>
									<center><input class="sendButton" type="submit" name="Submit" value="Submit"></center>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<?php $_smarty_tpl->_subTemplateRender("file:public/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<?php }
}
