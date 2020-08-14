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
	
	<!-- Document Title -->
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
    <script src="http://code.jquery.com/jquery.js"></script>
	<title>여행을 만드는 생각 - TMI</title>

<style type="text/css">
.login-ok {
    padding: 30px 50px 45px 50px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    border-radius: 5px;
    background: #fff;
    display: inline-block;
    width: 80%;
}

.btn_ok{
	background:#6ae;
    padding: 9px 20px;
    border-radius: 50px;
    border: 1px solid transparent;
    color: #fff !important;
    transition: 0.3s;
    display: inline-block;
    font-size: 15px;
    font-weight: 500 !important;
    width: 25%;
}
</style>
	
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
						
						<div class="login-ok">
							<p style="font-size: 100%; align-content: center; margin-top: 15px; width: 80%;"><h1><b>환영합니다.</b></h1></p>
							회원님의 아이디는 ${email } 입니다.<br/>
							로그인 후 TMI의 모든 서비스를 이용가능합니다.
							<br/>
							<br/>
							<a class="btn_ok" href="<%=cp%>/guest/loginForm">시작하기</a>
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
								<p>
									TMI - Travel Making Ideas.
								</p>
								<p>
									여행의 발상, 여행을 만드는 생각
								</p>
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
								<li><a href="https://open.kakao.com/o/gwqk9rnc" style="color: black;">Open Chating &nbsp;<i class="icofont-kakaotalk"></i></a></li>
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
