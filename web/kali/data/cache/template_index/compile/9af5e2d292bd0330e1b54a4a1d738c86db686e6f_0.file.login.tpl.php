<?php
/* Smarty version 3.1.32-dev-45, created on 2019-02-25 02:20:59
  from '/Users/gangguo/alidata/www/video.a.com/web/index/template/login.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32-dev-45',
  'unifunc' => 'content_5c72e08b215381_22020677',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '9af5e2d292bd0330e1b54a4a1d738c86db686e6f' => 
    array (
      0 => '/Users/gangguo/alidata/www/video.a.com/web/index/template/login.tpl',
      1 => 1551032400,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:public/header.tpl' => 1,
    'file:public/footer.tpl' => 1,
  ),
),false)) {
function content_5c72e08b215381_22020677 (Smarty_Internal_Template $_smarty_tpl) {
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
