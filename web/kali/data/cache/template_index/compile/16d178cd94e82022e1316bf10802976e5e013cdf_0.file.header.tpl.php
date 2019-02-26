<?php
/* Smarty version 3.1.32-dev-45, created on 2019-02-26 20:26:01
  from '/Users/gangkui/wwwroot/www/kd.a.com/web/index/template/public/header.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32-dev-45',
  'unifunc' => 'content_5c753059f3cbe0_76467349',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '16d178cd94e82022e1316bf10802976e5e013cdf' => 
    array (
      0 => '/Users/gangkui/wwwroot/www/kd.a.com/web/index/template/public/header.tpl',
      1 => 1551183615,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c753059f3cbe0_76467349 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="">
    <meta name="author" content="">

    <title>KoolTube</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="static/css/bootstrap.min.css"  type="text/css">

	<!-- Custom CSS -->
    <link rel="stylesheet" href="static/css/style.css">

	<!-- Owl Carousel Assets -->
    <link href="static/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="static/owl-carousel/owl.theme.css" rel="stylesheet">

	<!-- Custom Fonts -->
    <link rel="stylesheet" href="static/font-awesome-4.4.0/css/font-awesome.min.css"  type="text/css">

	<!-- jQuery -->
	<?php echo '<script'; ?>
 src="static/js/jquery-2.1.1.js"><?php echo '</script'; ?>
>

	<!-- Core JavaScript Files -->
    <?php echo '<script'; ?>
 src="static/js/bootstrap.min.js"><?php echo '</script'; ?>
>

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <?php echo '<script'; ?>
 src="static/js/html5shiv.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="static/js/respond.min.js"><?php echo '</script'; ?>
>
    <![endif]-->
</head>

<body>
<header>
	<!--Top-->
	<!--nav id="top">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-sm-6">
					<strong>Welcome to KOOLTUBE!</strong>
				</div>
				<div class="col-md-6 col-sm-6">
					<ul class="list-inline top-link link">
						<li><a href="index.html"><i class="fa fa-home"></i> Home</a></li>
						<li><a href="contact.html"><i class="fa fa-comments"></i> Contact</a></li>
						<li><a href="#"><i class="fa fa-question-circle"></i> FAQ</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav-->

	<!--Navigation-->
    <nav id="menu" class="navbar">
		<div class="container">
			<div class="navbar-header"><span id="heading" class="visible-xs">Categories</span>
			  <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav">
					<li><a href="index.html"><i class="fa fa-home"></i> 首页</a></li>
					<li><a href="index.html"><i class="fa fa-home"></i> 车牌号</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> 视频</a>
						<div class="dropdown-menu">
							<div class="dropdown-inner">
								<ul class="list-unstyled">
									<li><a href="archive.html">下载</a></li>
									<li><a href="archive.html">在线观看</a></li>
								</ul>
							</div>
						</div>
					</li>

					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-play-circle-o"></i> Video</a>
						<div class="dropdown-menu">
							<div class="dropdown-inner">
								<ul class="list-unstyled">
									<li><a href="archive.html">Text 201</a></li>
									<li><a href="archive.html">Text 202</a></li>
									<li><a href="archive.html">Text 203</a></li>
									<li><a href="archive.html">Text 204</a></li>
									<li><a href="archive.html">Text 205</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-list"></i> Category</a>
						<div class="dropdown-menu" style="margin-left: -203.625px;">
							<div class="dropdown-inner">
								<ul class="list-unstyled">
									<li><a href="archive.html">Text 301</a></li>
									<li><a href="archive.html">Text 302</a></li>
									<li><a href="archive.html">Text 303</a></li>
									<li><a href="archive.html">Text 304</a></li>
									<li><a href="archive.html">Text 305</a></li>
								</ul>
								<ul class="list-unstyled">
									<li><a href="archive.html">Text 306</a></li>
									<li><a href="archive.html">Text 307</a></li>
									<li><a href="archive.html">Text 308</a></li>
									<li><a href="archive.html">Text 309</a></li>
									<li><a href="archive.html">Text 310</a></li>
								</ul>
								<ul class="list-unstyled">
									<li><a href="archive.html">Text 311</a></li>
									<li><a href="archive.html">Text 312</a></li>
									<li><a href="archive.html#">Text 313</a></li>
									<li><a href="archive.html#">Text 314</a></li>
									<li><a href="archive.html">Text 315</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li><a href="archive.html"><i class="fa fa-cubes"></i> Blocks</a></li>
					<li><a href="contact.html"><i class="fa fa-envelope"></i> Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!--div class="header-slide">
		<div id="owl-demo" class="static/owl-carousel">
			<div class="item">
				<div class="zoom-container">
					<div class="zoom-caption">
						<span>Video's Tag</span>
						<a href="single.html">
							<i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
						</a>
						<p>Video's Name</p>
					</div>
					<img src="static/images/2.jpg" />
				</div>
			</div>
			<div class="item">
				<div class="zoom-container">
					<div class="zoom-caption">
						<span>Video's Tag</span>
						<a href="single.html">
							<i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
						</a>
						<p>Video's Name</p>
					</div>
					<img src="static/images/3.jpg" />
				</div>
			</div>
			<div class="item">
				<div class="zoom-container">
					<div class="zoom-caption">
						<span>Video's Tag</span>
						<a href="single.html">
							<i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
						</a>
						<p>Video's Name</p>
					</div>
					<img src="static/images/4.jpg" />
				</div>
			</div>
			<div class="item">
				<div class="zoom-container">
					<div class="zoom-caption">
						<span>Video's Tag</span>
						<a href="single.html">
							<i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
						</a>
						<p>Video's Name</p>
					</div>
					<img src="static/images/5.jpg" />
				</div>
			</div>
			<div class="item">
				<div class="zoom-container">
					<div class="zoom-caption">
						<span>Video's Tag</span>
						<a href="single.html">
							<i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
						</a>
						<p>Video's Name</p>
					</div>
					<img src="static/images/6.jpg" />
				</div>
			</div>
			<div class="item">
				<div class="zoom-container">
					<div class="zoom-caption">
						<span>Video's Tag</span>
						<a href="single.html">
							<i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
						</a>
						<p>Video's Name</p>
					</div>
					<img src="static/images/7.jpg" />
				</div>
			</div>
			<div class="item">
				<div class="zoom-container">
					<div class="zoom-caption">
						<span>Video's Tag</span>
						<a href="single.html">
							<i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
						</a>
						<p>Video's Name</p>
					</div>
					<img src="static/images/8.jpg" />
				</div>
			</div>
			<div class="item">
				<div class="zoom-container">
					<div class="zoom-caption">
						<span>Video's Tag</span>
						<a href="single.html">
							<i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
						</a>
						<p>Video's Name</p>
					</div>
					<img src="static/images/9.jpg" />
				</div>
			</div>
		</div>
	</div-->
</header>
<!-- Header --><?php }
}
