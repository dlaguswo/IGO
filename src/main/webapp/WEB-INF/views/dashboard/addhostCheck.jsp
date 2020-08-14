<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	boolean hostcheck = true;
%>


<!DOCTYPE html>
<html lang="UTF-8">

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
	<!-- Perfect scrollbar CSS-->
	<link href="/tmi/resources/css/perfect-scrollbar.css" rel="stylesheet">
	<!-- style CSS -->
	<link href="/tmi/resources/css/style.css" rel="stylesheet" />
	<!-- Dashboard CSS -->
	<link href="/tmi/resources/css/dashboard.css" rel="stylesheet" />
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

<!--  사이드 배너 -->
		<aside class="menu-sidebar js-right-sidebar d-block d-lg-none">
  	<!--  로고 -->
			<div class="logo">
				<a href="#">
					<img src="/tmi/resources/images/logo-black.png" alt="Listagram" />
				</a>
			</div>
	<!--  왼쪽 사이드 바 -->
			<div class="menu-sidebar__content js-scrollbar2">
		<!--  유저 이미지 -->
				<div class="account-img">
					<img src="/tmi/resources/images/clients/reviewer-4.png" alt="Steve Austin" />
				</div>
				
				<h4 class="name">안녕 4조 </h4>
				
				<nav class="navbar-sidebar2">
				
			<!-- 사이드 리스트  -->
					<ul class="list-unstyled navbar__list">
						<!--  공용 -->
						<li>
							<a class="active" href="db.html">
								<i class="ion-ios-gear-outline"></i>Dashboard
							</a>
						</li>
						
					<!--  유저 정보 수정 -->
						<li>
							<a href="db-my-profile.html">
								<i class="ion-ios-person-outline"></i>My profile</a>
						</li>
						
					<!--  찜목록 -->	
						<li>
							<a href="db-favourites.html">
								<i class="ion-ios-heart-outline"></i>Wish List</a>
						</li>
						
					<!--  예약 내역 -->	
						<li>
							<a href="db-bookings.html">
								<i class="ion-ios-copy-outline"></i>Bookings</a>
						</li>
						
					<!--  리뷰 확인 -->	
						<li>
							<a href="db-bookings.html">
								<i class="ion-ios-star-outline"></i>Reviews
							</a>
						</li>
						
			<!--  호스트일경우  -->	
			<c:if test="<%=hostcheck %>">
					<!--  방추가 ( 호스트 ) -->
						<li>
							<a href="<%=cp%>/guest/addHost">
								<i class="ion-ios-plus-outline"></i>Add Hosting</a>
						</li>
						
					<!--  방 관리 -->	
						<li class="has-sub">
							<a class="js-arrow" href="#">
								<i class="ion-social-buffer-outline"></i>Host Manager
							</a>
							<ul class="list-unstyled navbar__sub-list js-sub-list">
							
						<!-- 자신의 방 예약 확인 -->
								<li>
									<a href="db-my-listing.html">Reservation List</a>
									<span class="inbox-num active">6</span>
								</li>
								
						<!--  방 관리 -->		
								<li>
									<a href="db-my-listing.html">Room Edit</a>
									<span class="inbox-num expired">12</span>
								</li>
								
						<!--  호스트 리뷰 관리 -->		
								<li>
									<a href="<%=cp%>/guest/hostReviewForm">Host Review Page</a>
									<span class="inbox-num expired">12</span>
								</li>
								
							</ul>
						</li>
				</c:if>
						<!--  로그아웃 -->
						<li>
							<a href="#">
								<i class="ion-ios-upload-outline"></i>Logout</a>
						</li>
					</ul>

				</nav>
			</div>
		</aside>
		
		<div class="dash-content-wrap">

<!--  배너 -->	
			<header class="db-top-header">
				<div class="container-fluid">
					<div class="row align-items-center" style="padding: 10px;">
						<div class="col-md-9 col-sm-6 col-4">
							<div class="site-navbar-wrap v2">
					<!--  모바일 배너 -->
								<div class="site-mobile-menu">
									<div class="site-mobile-menu-header">
										<div class="site-mobile-menu-close  js-menu-toggle">
											<span class="ion-ios-close-empty"></span>
										</div>
									</div>
					<!--  모바일 메뉴 -->
									<div class="site-mobile-menu-body"></div>
								</div>
							</div>
						</div>
						

						<div class="col-md-3 col-sm-6 col-8">
							<div class="header-button">
							
						<!--  알람 값  -->
								<div class="header-button-item has-noti js-item-menu">
									<i class="ion-ios-bell-outline"></i>
									<div class="notifi-dropdown js-dropdown">
										<div class="notifi__title">
											<p>You have 2 Notifications</p>
										</div>
										<div class="notifi__item">
											<div class="bg-c1 red">
												<i class="icofont-check"></i>
											</div>
											<div class="content">
												<p>Your listing <b>Hotel Ocean Paradise</b> has been approved!</p>
												<span class="date">5min ago</span>
											</div>
										</div>
										<div class="notifi__item">
											<div class="bg-c1 green">
												<i class="icofont-ui-message"></i>
											</div>
											<div class="content">
												<p>You have 3 unread Messages</p>
												<span class="date">5min ago</span>
											</div>
										</div>
										<div class="notify-bottom text-center pad-tb-20">
											<a href="#">View All Notification</a>
										</div>
									</div>
								</div>
								
						<!--  로그인 시 아이콘 -->
								<div class="header-button-item js-sidebar-btn">
									<img src="/tmi/resources/images/clients/reviewer-4.png" alt="...">
									<span>${sessionScope.guestInfo.name } <i class="ion-arrow-down-b"></i></span>
								</div>
						<!--  로그인 시 사용 메뉴 -->
								<div class="setting-menu js-right-sidebar d-none d-lg-block">
									<div class="account-dropdown__body">
										<!--  공용 -->
							
								<!--  mypage 메인 -->
										<div class="account-dropdown__item">
											<a href="db.html">
												<i class="ion-ios-gear-outline"></i>Dashboard</a>
										</div>
										
								<!-- 회원 정보 수정 -->
										<div class="account-dropdown__item">
											<a href="db-my-profile.html">
												<i class="ion-ios-person-outline"></i>Profile</a>
										</div>
										
								<!--  찜 목록 -->
										<div class="account-dropdown__item">
											<a href="db-my-listing.html">
												<i class="ion-ios-heart-outline"></i>Favourites</a>
										</div>
										
								<!--  예약 내역 확인 -->
										<div class="account-dropdown__item">
											<a href="db-bookings.html">
												<i class="ion-ios-copy-outline"></i>Bookings</a>
										</div>
										
								<!--  리뷰확인 -->
										<div class="account-dropdown__item">
											<a href="db-recieve-reviews.html">
												<i class="ion-ios-star-outline"></i>Reviews</a>
										</div>
							<!--  호스트일 경우 -->
							<c:if test="<%=hostcheck %>">
								<!--  방 추가 -->
										<div class="account-dropdown__item">
											<a href="db-messages.html">
												<i class="ion-ios-plus-outline"></i>Add Hosting</a>
										</div>
								<!--  방 관리 -->		
										<div class="account-dropdown__item">
											<a href="db-messages.html">
												<i class="ion-social-buffer-outline"></i>Host Manager</a>
										</div>
								
							</c:if>
										<div class="account-dropdown__item">
											<a href="#">
												<i class="ion-ios-upload-outline"></i>Logout</a>
										</div>
									</div>
								</div>
						<!--  아이콘 사용 끗 -->
							</div>
						</div>
					</div>
				</div>
			</header>

<!--  대쉬보드  -->
			<div class="dash-content bodyContents">
				
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6">
							<div class="db-add-list-wrap">
								<div class="act-title">
									<h5><i class="ion-clock"> Administrator approval requested</i></h5>
								</div>
								<div class="db-add-listing" >
									<div class="row" style="vertical-align: middle; text-align: center;">
										<div class="col-md-12" >	
											<div class="form-group">
											<p style="font-size: 13pt;"><b>호스팅 신청완료</b></p>
											</div>
											<div>
											<p style="font-size: 12pt;">관리자의 승인이 필요합니다.</p>
											<p style="font-size: 12pt;">1 ~ 3일의 기간이 소요됩니다.</p>	
											</div>
										</div>
									</div>
								</div>
								<hr>
								<div class="db-add-listing" >
									<div class="row" style="vertical-align: middle; text-align: center;">
										<div class="col-md-12" >	
											<div class="form-group">
											<p style="font-size: 13pt;"><b>Hosting Request Completed</b></p>
											</div>
											<div>
											<p style="font-size: 12pt;">Administrator approval is required</p>
											<p style="font-size: 12pt;">It takes 1-3 days.</p>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-md-6 text-right sm-left">
								<input type="button" class="btn v8" onclick="" style="font-weight: bold;" value="확인"/>
							</div>					
				

							<span class="scrolltotop"><i class="ion-arrow-up-c"></i></span>
						</div>
							
					</div>
				</div>
				
				
			</div>
		
		</div>
		<!--Dashboard content Wrapper ends-->

	</div>
	<!-- Plugin JS-->
	<script src="/tmi/resources/js/plugin.js"></script>
	<!--Perfect Scrollbar JS-->
	<script src="/tmi/resources/js/perfect-scrollbar.min.js"></script>
	<!--google maps-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_8C7p0Ws2gUu7wo0b6pK9Qu7LuzX2iWY&amp;libraries=places&amp;callback=initAutocomplete"></script>
	<!-- Main JS-->
	<script src="/tmi/resources/js/main.js"></script>
	<!-- Dashboard JS-->
	<script src="/tmi/resources/js/dashboard.js"></script>
</body>

</html>
