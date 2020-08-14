<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html dir="ltr" lang="UTF-8">

<head>
	<!-- Metas -->
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="author" content="LionCoders" />
	<!-- Links -->
	<link rel="icon" type="/tmi/resources/image/png"/>
	<!-- google fonts-->	
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800" rel="stylesheet">
	<!-- Plugins CSS -->
	<link href="/tmi/resources/css/plugin.css" rel="stylesheet" />
	<!-- style CSS -->
	<link href="/tmi/resources/css/style.css" rel="stylesheet" />
	<!--color switcher css-->
	<link rel="stylesheet" href="/tmi/resources/css/switcher/skin-blue.css" media="screen" id="style-colors" />
	
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<style type="text/css">
	body{
	font-family: 'Noto Sans KR', sans-serif;
	}
	</style>
	
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
    <script src="http://code.jquery.com/jquery.js"></script>
	<title>여행을 만드는 생각 - TMI</title>
</head>
<script type="text/javascript">
	
	function sendKakao() {
		
		var f = document.myForm;
		
		f.action="https://kauth.kakao.com/oauth/authorize?client_id=cb73a41fa443b2c4495c2be87ea8b26e&redirect_uri=http://183.99.243.229/tmi/guest/what&response_type=code";
		f.submit();
	}
	
	function sendNaver() {
		
		var f = document.myForm;
		
		f.action="${url }";
		f.submit();
	}
	
</script>

<body>
	<!--Page Wrapper starts-->
	<div class="page-wrapper">
		<!--header starts-->
		<header class="transparent scroll-hide">
			<!--Main Menu starts-->
			<div class="site-navbar-wrap v2">
				<div class="container">
					<div class="site-navbar">
						<div class="row align-items-center">
							<div class="col-md-4 col-6">
								<a class="navbar-brand" href="<%=cp%>/main/ok"><img src="/tmi/resources/images/logo-black.png" alt="logo" class="img-fluid"></a>
							</div>
							<div class="col-md-8 col-6">
								<nav class="site-navigation float-left">
									<div class="container">
										<ul class="site-menu js-clone-nav d-none d-lg-block">
											<li class="d-lg-none"><a class="btn v1" href="<%=cp%>/main/ok">Main </a></li>
										</ul>
									</div>
								</nav>
								<div class="d-lg-none sm-right">
									<a href="#" class="mobile-bar js-menu-toggle">
										<span class="ion-android-menu"></span>
									</a>
								</div>
								<div class="add-list float-right">
									<a class="btn v8" href="<%=cp%>/main/ok" style="border-radius: 4px;">Main</a>
									<a class="btn v3" href="<%=cp%>/guest/register" style="border-radius: 4px;">Register </a>
								</div>
							</div>
						</div>
					</div>
					<!--mobile-menu starts -->
					<div class="site-mobile-menu">
						<div class="site-mobile-menu-header">
							<div class="site-mobile-menu-close  js-menu-toggle">
								<span class="ion-ios-close-empty"></span>
							</div>
						</div>
						<div class="site-mobile-menu-body"></div>
					</div>
					<!--mobile-menu ends-->
				</div>
			</div>
			<!--Main Menu ends-->
		</header>
		<!--Header ends-->
		<!--User Login section starts-->
		<div class="user-login-section section-padding bg-fixed" style="background-image: url('/tmi/resources/images/alfs.jpg');" >
			<div class="container">
				<div class="row">
					<div class="col-md-10 offset-md-1  text-center">
						<div class="login-wrapper">
							<ul class="ui-list nav nav-tabs justify-content-center mar-bot-30" role="tablist">
								<li class="nav-item">
									<a class="nav-link active" data-toggle="tab" href="#login" role="tab" aria-selected="true">Login</a>
								</li>
							</ul>
							<div class="ui-dash tab-content">
								<div class="tab-pane fade show active" id="login" role="tabpanel">
									<form id="login-form" action="<%=cp %>/guest/login" name="myForm" method="post">
										<div class="form-group">
											<input type="text" name="email" id="username" tabindex="1" class="form-control" placeholder="email" required>
										</div>
										<div class="form-group">
											<input type="password" name="pwd" id="password" tabindex="2" class="form-control" placeholder="Password">
										</div>
										
										<span id = "s_result1" style="font-size: 10px; color: red">${message }</span>
										<div class="row mar-top-20">
											<div class="col-12 text-right">
												<div class="res-box sm-left">
													<a href="<%=cp %>/guest/findpwdForm" tabindex="3" class="forgot-password"><i class="icofont-question-circle"></i> Forgot Account</a>
												</div>
											</div>
										</div>
										<div class="res-box text-center mar-top-30">
											<button type="submit" class="btn v3"><i class="ion-log-in"></i> Log In</button>
										</div>
									<div class="social-profile-login text-center mar-top-30">
										<h5>or Login with</h5>
										<ul class="social-btn">
											<li><a onclick="sendKakao();"><img src="<%=cp %>/resources/kakao/kakaolink_btn_small.png"/></a></li>
											<li><a onclick="sendNaver();"><img src="<%=cp %>/resources/kakao/네이버 아이디로 로그인_아이콘형_Green.PNG"/></a></li>
											<!-- <li class="bg-ig"><a href="#"><i class="ion-social-instagram"></i></a></li> -->
										</ul>
									</div>
									</form>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--User login section ends-->
		<!--Login section ends-->
		<!-- Scroll to top starts-->
		<span class="scrolltotop"><i class="ion-arrow-up-c"></i></span>
		<!-- Scroll to top ends-->
	</div>

<!--  설명 창 -->
	<div class="footer-wrapper no-pad-tb v2">
		<div class="footer-top-area section-padding">
			<div class="container">
				<div class="row nav-folderized">
					<div class="col-lg-3 col-md-12">
						<div class="footer-logo">
							<a href="/tmi/main/ok"> <img src="/tmi/resources/images/logo-black.png" alt="logo"></a>
							<div class="company-desc">
								<p>TMI - Travel Making Ideas.</p>
								<p>여행의 발상, 여행을 만드는 생각</p>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-12">
						<div class="footer-content nav">
						
							<h2 class="title">Helpful Links</h2>
							<ul class="list">
							
								<li><a class="link-hov style1" href="<%=cp%>/guest/loginForm" style="border-radius: 4px; color: black;">Login </a></li>
								<li><a class="link-hov style1" href="<%=cp%>/guest/register" style="border-radius: 4px; color: black;">Register </a></li>
							
							</ul>
						</div>
					</div>
					<div class="col-lg-4 col-md-12">
						<div class="footer-content nav">
							<h2 class="title">Contact us</h2>
							<ul class="list footer-list">
								<li>
									<div class="contact-info">
										<div class="icon">
											<i class="ion-ios-location"></i>
										</div>
										<div class="text">서울 강남구 테헤란로 124 4층</div>
									</div>
								</li>
								<li>
									<div class="contact-info">
										<div class="icon">
											<i class="ion-email"></i>
										</div>
										<div class="text"><a href="#">javaWeb @ TMI.com</a></div>
									</div>
								</li>
								<li>
									<div class="contact-info">
										<div class="icon">
											<i class="ion-ios-telephone"></i>
										</div>
										<div class="text">+82 010 4509 2881</div>
									</div>
								</li>
							</ul>
							<ul class="social-buttons style2">
								<li><a href="https://open.kakao.com/o/gwqk9rnc" style="color: black;">문의 및 상담 &nbsp;<i class="icofont-kakaotalk"></i> </a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-bottom-area">
			<div class="container">
				<div class="row">
					<div class="col-md-8 offset-md-2 text-center">
						<p>&copy; 2020 T M I. All Rights Reserved.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Scripts starts-->
	<!--plugin js-->
	<script src="/tmi/resources/js/plugin.js"></script>
	<!--google maps-->
	<script src="/tmi/resources/https://maps.googleapis.com/maps/api/js?key=AIzaSyD_8C7p0Ws2gUu7wo0b6pK9Qu7LuzX2iWY&amp;libraries=places&amp;callback=initAutocomplete"></script>
	<!--Main js-->
	<script src="/tmi/resources/js/main.js"></script>
	<!--Scripts ends-->
</body>

</html>
