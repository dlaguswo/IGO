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
	<link rel="icon" type="/tmi/resources/image/png" href="#" />
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
	<title>여행을 만드는 생각 - TMI</title>
</head>

<body>

	<div class="page-wrapper">
		<!--헤더 -->
		<header class="header transparent scroll-hide">
		
			<!--Main Menu starts-->
			<div class="site-navbar-wrap v1">
				<div class="container">
					<div class="site-navbar">
						<div class="row align-items-center">
						
			<!--  로고 이미지 -->
							<div class="col-md-4 col-6">
								<a class="navbar-brand" href="<%=cp%>/main/ok" style="max-width: 250px;">
									<img src="/tmi/resources/images/logo.png" alt="logo" class="img-fluid">
								</a>
							</div>
			<!--  배너  -->				
							<div class="col-md-8 col-6">
								
								
					<!--  모바일 배너 변환 -->
								<div class="d-lg-none sm-right">
									<a href="" class="mobile-bar js-menu-toggle">
										<span class="ion-android-menu"></span>
									</a>
								</div>
								
					<!--  모바일 로그인  -->
								<div class="add-list float-right">
									<nav class="site-navigation float-left">
									<div class="container">
										<ul class="site-menu js-clone-nav d-none d-lg-block">
								<!--  로그인 아이콘 -->
											<li class="has-children">
	                              		 	 	<a class="btn v3" href="<%=cp%>/guest/dashboard">
	                                  				<img src="/tmi/resources/tmi/profile/${sessionScope.guestInfo.profileimage }" style="width: 30px; height: 30px; border-radius: 50%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.guestInfo.name }&nbsp;&nbsp;&nbsp;&nbsp;
	                               				</a>
	                               				<ul class="dropdown">
	                                  				<li><a href="<%=cp%>/guest/myProfile">My Profile&nbsp;&nbsp;&nbsp;&nbsp;<i class="ion-ios-person-outline"></i></a></li>
	                                  				<li><a href="<%=cp%>/guest/wishListForm">Wish List&nbsp;&nbsp;&nbsp;&nbsp;<i class="ion-ios-heart-outline"></i></a></li>
	                                  				<li><a href="<%=cp%>/guest/addHost">Add Hosting&nbsp;&nbsp;&nbsp;&nbsp;<i class="ion-ios-plus-outline"></i></a></li>
	                                  				<li><a href="<%=cp%>/guest/logout">Logout&nbsp;&nbsp;&nbsp;&nbsp;<i class="ion-ios-upload-outline"></i> </a></li>
	                               				</ul>
	                            			</li>								
										</ul>
									</div>
								</nav>
								</div>
							</div>
			<!--  배너 끗 -->
						</div>
					</div>
					
			<!-- 모바일 메뉴 전환 -->
					<div class="site-mobile-menu">
						<div class="site-mobile-menu-header">
							<div class="site-mobile-menu-close  js-menu-toggle">
								<span class="ion-ios-close-empty"></span>
							</div>
						</div>
						<div class="site-mobile-menu-body"></div>
					</div>
			<!-- 모바일 메뉴 끗-->
			
				</div>
			</div>
		</header>

<!--  에러시 뜨는 화면 -->
		<div class="error-section section-padding mar-top-80 pad-bot-100">
			<div class="container">
				<div class="row">
					<div class="col-md-6 offset-md-3  error-text text-center">
			<!--  검색 404  -->
						<div class="error-content">
							<i class="ion-sad-outline"></i>
							<h4>Ohh! Page Not Found</h4>
							<p>Perhaps searching can help or go back to <a href="home-v1.html">Homepage</a> </p>
						</div>
				<!--  버튼 -->
						<div class="error-search-container">
							<form action="/action_page.php">
								<input type="text" placeholder="Search.." name="search"><button type="submit"><i class="ion-ios-search"></i></button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
<!--  맨위로 -->
		<span class="scrolltotop"><i class="ion-arrow-up-c"></i></span>

	</div>
	
<!--  맨 아래 설명창 -->
	<div class="footer-wrapper no-pad-tb">
		<div class="footer-top-area section-padding" style="background-image: url(/tmi/resources/images/bg/pattern.png)">
			<div class="overlay op-9 green"></div>
			<div class="container">
				<div class="row nav-folderized">
					<div class="col-lg-3 col-md-12">
						<div class="footer-logo">
							<a href="/tmi/main/ok"> <img src="/tmi/resources/images/logo-white.png" alt="logo"></a>
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
							
								<li ><a class="link-hov style1" href="<%=cp%>/guest/dashboard">My Page</a></li>	
                   				<li><a class="link-hov style1" href="<%=cp%>/guest/myProfile">My Profile&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                   				<li><a class="link-hov style1" href="<%=cp%>/guest/wishListForm">Wish List&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                   				<li><a class="link-hov style1" href="<%=cp%>/guest/addHost">Add Hosting&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                           
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
								<li><a href="https://open.kakao.com/o/gwqk9rnc">Open Chating &nbsp;<i class="icofont-kakaotalk"></i></a></li>
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
	<!--Color switcher ends-->
	<!--Scripts starts-->
	<!--plugin js-->
	<script src="/tmi/resources/js/plugin.js"></script>
	<!--google maps-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_8C7p0Ws2gUu7wo0b6pK9Qu7LuzX2iWY&amp;libraries=places&amp;callback=initAutocomplete"></script>
	<!--Main js-->
	<script src="/tmi/resources/js/main.js"></script>
	<!--Scripts ends-->
</body>

</html>
