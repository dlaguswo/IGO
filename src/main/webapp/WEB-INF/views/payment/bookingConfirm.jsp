<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	body,a{
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
									<img src="/tmi/resources/images/logo-black.png" alt="logo" class="img-fluid">
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
											<c:if test="${not empty sessionScope.guestInfo}">
										
											<c:if test="${sessionScope.guestInfo.hostcheck eq 0 || sessionScope.guestInfo.hostcheck eq 1}">
											<li class="has-children">
                                		 	 	<a class="btn v3" href="<%=cp%>/guest/dashboard">
                                		 	 		<c:if test="${not empty sessionScope.guestInfo.profileimage}">
                                		 	 			<img src="/tmi/resources/tmi/profile/${sessionScope.guestInfo.profileimage }" style="width: 30px; height: 30px; border-radius: 50%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.guestInfo.name }&nbsp;&nbsp;&nbsp;&nbsp;
                                		 	 		</c:if>                                    				
                                		 	 		<c:if test="${empty sessionScope.guestInfo.profileimage}">
                                		 	 			<img src="/tmi/resources/images/profile.png" style="width: 30px; height: 30px; border-radius: 50%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.guestInfo.name }&nbsp;&nbsp;&nbsp;&nbsp;
                                		 	 		</c:if>
                                 				</a>
                                 				<ul class="dropdown">
                                    				<li><a href="<%=cp%>/guest/myProfile">My Profile&nbsp;&nbsp;&nbsp;&nbsp;<i class="ion-ios-person-outline"></i></a></li>
                                    				<li><a href="<%=cp%>/guest/wishListForm">Wish List&nbsp;&nbsp;&nbsp;&nbsp;<i class="ion-ios-heart-outline"></i></a></li>
                                    				<li><a href="<%=cp%>/guest/addHost">Add Hosting&nbsp;&nbsp;&nbsp;&nbsp;<i class="ion-ios-plus-outline"></i></a></li>
                                    				<li><a href="<%=cp%>/guest/logout">Logout&nbsp;&nbsp;&nbsp;&nbsp;<i class="ion-ios-upload-outline"></i> </a></li>
                                 				</ul>
                              				</li>
                              			</c:if>
                              			</c:if>						
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

<!--  결제 완료 -->
	<div class="list-details-section section-padding add_list mar-top-40">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <div class="booking-confirmation-page">
                            <i class="ion-android-checkmark-circle"></i>
                            <h2 class="margin-top-30">예약신청 되었습니다. </h2>
                            <p>호스트의 확인 후 예약 확정 문자가 전송됩니다. </p>
                            <a href="<%=cp %>/book/booking" class="button margin-top-30">예약확인</a>
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
								<li><a href="https://open.kakao.com/o/gwqk9rnc">문의 및 상담 &nbsp;<i class="icofont-kakaotalk"></i></a></li>
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
