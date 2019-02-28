<?php
/* Smarty version 3.1.32-dev-45, created on 2019-02-26 20:26:01
  from '/Users/gangkui/wwwroot/www/kd.a.com/web/index/template/login.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32-dev-45',
  'unifunc' => 'content_5c753059f371a6_39351111',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '166699ab19a5c96a9a2dae9cb293c91c4c4ea556' => 
    array (
      0 => '/Users/gangkui/wwwroot/www/kd.a.com/web/index/template/login.tpl',
      1 => 1551183615,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:public/header.tpl' => 1,
    'file:public/footer.tpl' => 1,
  ),
),false)) {
function content_5c753059f371a6_39351111 (Smarty_Internal_Template $_smarty_tpl) {
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
								<form name="form1" id="ff" method="post" action="login.html">
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
