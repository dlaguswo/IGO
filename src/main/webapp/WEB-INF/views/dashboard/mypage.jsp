<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="UTF-8">
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

<!-- 배너 바 -->
		<aside class="menu-sidebar js-right-sidebar d-block d-lg-none">
  	<!--  로고 -->
			<div class="logo">
				<a href="<%=cp %>/main/ok">
					<img src="/tmi/resources/images/logo-black.png" alt="Listagram"/>	
				</a>
			</div>
	<!--  왼쪽 사이드 바 -->
			<div class="menu-sidebar__content js-scrollbar2">
		<!--  유저 이미지 -->
				<div class="account-img">
					<c:if test="${!empty sessionScope.guestInfo.profileimage }">
						<img src="/tmi/resources/tmi/profile/${sessionScope.guestInfo.profileimage}"/>
					</c:if>	
					<c:if test="${empty sessionScope.guestInfo.profileimage }">
						<img src="/tmi/resources/images/profile.png"/>
					</c:if>				
				</div>
				
				<h4 class="name">${sessionScope.guestInfo.name } </h4>
				
				<nav class="navbar-sidebar2">
				
			<!-- 사이드 리스트  -->
					<ul class="list-unstyled navbar__list">
						<!-- 공용 -->
						<li>
							<a class="active" href="<%=cp%>/guest/dashboard">
								<i class="ion-ios-gear-outline"></i>Dashboard
							</a>
						</li> 
						
					<!--  유저 정보 수정 -->
						<li>
							<a href="<%=cp %>/guest/myProfile">
								<i class="ion-ios-person-outline"></i>My profile</a>
						</li>
						
					<!--  찜목록 -->	
						<li>
							<a href="<%=cp%>/guest/wishListForm">
								<i class="ion-ios-heart-outline"></i>Wish List</a>
						</li>
						
					<!--  예약 내역 -->	
						<li>
							<a href="<%=cp%>/book/booking">
								<i class="ion-ios-copy-outline"></i>Bookings</a>
						</li>
						
					<!--  리뷰 확인 -->	
						<li>
							<a href="<%=cp%>/post/reviewPage">
								<i class="ion-ios-star-outline"></i>Reviews
							</a>
						</li>
					<!--  방추가 ( 호스트 ) -->
						<li>
							<a href="<%=cp %>/guest/addHost">
								<i class="ion-ios-plus-outline"></i>Add Hosting</a>
						</li>	
						
			<!--  호스트일경우  -->	
			<c:if test="${sessionScope.guestInfo.hostcheck=='1' }">
					
						
					<!--  방 관리 -->	
						<li class="has-sub">
							<a class="js-arrow" href="#">
								<i class="ion-social-buffer-outline"></i>Host Manager
							</a>
							<ul class="list-unstyled navbar__sub-list js-sub-list">
							
						<!-- 자신의 방 예약 확인 -->
								<li>
									<a href="<%=cp%>/guest/reservation">Reservation List</a>
								</li>
								
						<!--  방 관리 -->		
								<li>
									<a href="<%=cp%>/room/roomEdit">Room Edit</a>
								</li>
								
						<!--  호스트 리뷰 관리 -->		
								<li>
									<a href="<%=cp%>/guest/hostReviewForm">Host Review Page</a>
								</li>
							</ul>
						</li>
				</c:if>
						<!--  로그아웃 -->
						<li>
							<a href="<%=cp %>/guest/logout">
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
								<div class="site-navbar" >
									<div class="row align-items-center">
                                    	<nav class="site-navigation float-left">
                                    		<div class="container">
                                    			
                                  			</div>
                                  		</nav>
                                  	</div>
								</div>
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
									<c:if test="${!empty sessionScope.guestInfo.profileimage }">
										<img
											src="/tmi/resources/tmi/profile/${sessionScope.guestInfo.profileimage}" />
									</c:if>
									<c:if test="${empty sessionScope.guestInfo.profileimage }">
										<img src="/tmi/resources/images/profile.png" />
									</c:if>
									<span>${sessionScope.guestInfo.name } <i class="ion-arrow-down-b"></i></span>
								</div>
								<!--  로그인 시 사용 메뉴 -->
								<div class="setting-menu js-right-sidebar d-none d-lg-block">
									<div class="account-dropdown__body">
									<!--  공용 -->
							
								<!--  mypage 메인 -->
										<div class="account-dropdown__item">
											<a href="<%=cp%>/tmi/guest/dashboard">
												<i class="ion-ios-gear-outline"></i>Dashboard</a>
										</div>
										
								<!-- 회원 정보 수정 -->
										<div class="account-dropdown__item">
											<a href="<%=cp%>/guest/myProfile">
												<i class="ion-ios-person-outline"></i>My Profile</a>
										</div>
										
								<!--  찜 목록 -->
										<div class="account-dropdown__item">
											<a href="<%=cp%>/guest/wishListForm">
												<i class="ion-ios-heart-outline"></i>Wish List</a>
										</div>
										
								<!--  예약 내역 확인 -->
										<div class="account-dropdown__item">
											<a href="<%=cp%>/book/booking">
												<i class="ion-ios-copy-outline"></i>Bookings</a>
										</div>
										
								<!--  리뷰확인 -->
										<div class="account-dropdown__item">
											<a href="<%=cp%>/post/reviewPage">
												<i class="ion-ios-star-outline"></i>Reviews</a>
										</div>
								<!--  방 추가 -->
											<div class="account-dropdown__item">
												<a href="<%=cp%>/guest/addHost"> 
												<i class="ion-ios-plus-outline"></i>Add Hosting</a>
											</div>		
					<!--  호스트일 경우 -->
									<c:if test="${sessionScope.guestInfo.hostcheck=='1' }">
											
											
											<!--  자신의 방 예약 확인 -->
											<div class="account-dropdown__item">
												<a href="<%=cp%>/guest/reservation"> <i
													class="ion-social-buffer-outline"></i>Reservation List</a>
											</div>

											<!--  방 수정 -->
											<div class="account-dropdown__item">
												<a href="<%=cp%>/room/roomEdit">
												<i class="ion-social-buffer-outline"></i>Room Edit</a>
											</div>
										</c:if>
										<div class="account-dropdown__item">
											<a href="<%=cp %>/guest/logout">
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


	<!--  메뉴 -->
			<div class="dash-breadcrumb">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="dash-breadcrumb-content">
								<div class="dash-breadcrumb-left">
								
							<!--  현재 창 보여주기 -->
									<div class="breadcrumb-menu text-right sm-left">
										<ul>
											<li class="active"><a href="<%=cp%>/main/ok">Home</a></li>
											<li>Dashboard</li>
										</ul>
									</div>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>

<!--  메인 보여주는 곳 -->
			<div class="statistic-wrap">
				<div class="container-fluid">
					<div class="row">
					
				<!--  포인트 -->
						<div class="col-xl-3 col-md-6 col-12">
							<div class="statistic__item item--green">
								<h2 class="counter-value">${point }</h2>
								<span class="desc">Point</span>
								<div class="icon">
									<img src="/tmi/resources/images/dashboard/bar-chart.png">
								</div>
							</div>
						</div>
						
				<!--  리뷰 갯수 -->
						<div class="col-xl-3 col-md-6 col-12">
							<div class="statistic__item item--orange">
								<h2 class="counter-value">${postCount }</h2>
								<span class="desc">Total Reviews</span>
								<div class="icon">
									<img src="/tmi/resources/images/dashboard/review.png">
								</div>
							</div>
						</div>
						
				<!--  예약 횟수 -->		
						<div class="col-xl-3 col-md-6 col-12">
							<div class="statistic__item item--blue">
								<h2 class="counter-value">${bookCount }</h2>
								<span class="desc">Total Books</span>
								<div class="icon">
									<img src="/tmi/resources/images/dashboard/map-of-roads.png">
								</div>
							</div>
						</div>
						
				<!--  찜목록 갯수  -->
						<div class="col-xl-3 col-md-6 col-12">
							<div class="statistic__item item--red">
								<h2 class="counter-value">${count }</h2>
								<span class="desc">Total WishList</span>
								<div class="icon">
									<img src="/tmi/resources/images/dashboard/like.png">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	

<!--  그 아래 값들 보여주는 곳 -->
			<div class="dash-content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-xl-6 col-md-12">
							<div class="popular-listing">
							
					<!-- 현재 예약페이지 -->
								<div class="act-title">
									<h5><i class="icofont-eye-alt"></i>Confirm Current Reservation</h5>
								</div>
								
								<div class="profile-wrap">
								
									<div class="row">
									<c:if test="${not empty dto_re}">
										<div class="col-md-8 offset-md-2 py-4">
								<!--  방 이미지 -->				
											<div class="edit-profile-photo text-center" style="margin-bottom: 0px;" >
												<img src="/tmi/resources/tmi/room/${dto_re.r_mainimage} ">
											</div>
											
										</div>
										<div class="col-md-12">
											<div class="my-profile">
												<ul class="db-profile-info">
										<!--  방 이름 -->
													<li>
														<h6>Room Name : </h6>
														<span> ${dto_re.r_name } </span>
													</li>
													
										<!--  예약자 이름 -->
													<li>
														<h6>User Name : </h6>
														<span> ${dto_re.name } </span>
													</li>
													
										<!--  check in -->
													<li>
														<h6>Check In : </h6>
														<span> ${dto_re.checkin } </span>
													</li>
													
										<!-- check out -->
													<li>
														<h6>Check Out : </h6>
														<span> ${dto_re.checkout } </span>
													</li>
													
										<!-- 예약 인원 -->
													<li>
														<h6>People : </h6>
														<span> ${dto_re.b_inwon } </span>
													</li>
													
										<!-- 가격 -->
													<li>
														<h6>Price : </h6>
														<span> ${dto_re.b_price } </span>
													</li>
												</ul>
												
										<!--  방 이동 버튼 -->
												<div class="text-center">
													<a href="<%=cp %>/book/booking" class="btn v3">See a Room</a>
												</div>
											</div>										
										</div>
										</c:if>
										<c:if test="${empty dto_re }">
											<ul class="act-wrap">
												&nbsp;&nbsp;&nbsp;&nbsp;최근 예약 내역이 존재하지 않습니다.
											</ul>
										</c:if>
									</div>
									
										
								</div>
							</div>
						</div>
						
				<!-- 포인트적립 -->
						<div class="col-xl-6 col-md-12">

							<div class="recent-activity">
								<div class="act-title">
									<h5><i class="icofont-money"></i> Recent Point</h5>
								</div>
								<ul class="act-wrap">
									<c:forEach var="dto" items="${lists }">
									<li class="alert fade show">
										<i class=icofont-money-bag></i>
										<span class="review-stat">${dto.r_name }</span><br/>
										<span class="review-stat">${dto.m_addr }</span><br/>
										<span class="review-stat">사용포인트:${dto.usepoint }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<span class="review-stat">적립포인트: ${dto.addpoint }</span><br/>
										<button type="button" class="close" data-dismiss="alert" aria-label="Close">
											<span aria-hidden="true"><i class="ion-android-close"></i></span>
										</button>
										<p>${dto.checkin } ~ ${dto.checkout }</p>
									</li>
									</c:forEach>
									<c:if test="${empty lists}">
										사용한 포인트가 없습니다
									</c:if>
								</ul>
							</div>
						</div>

					</div>
				</div>
			</div>



			<div class="dash-footer">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="copyright">
								<p>&copy; 2020 T M I. All Rights Reserved.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
	<!-- Plugin JS-->
	<script src="/tmi/resources/js/plugin.js"></script>
	<!--Perfect Scrollbar JS-->
	<script src="/tmi/resources/s/perfect-scrollbar.min.js"></script>
	<!-- Main JS-->
	<script src="/tmi/resources/js/main.js"></script>
	<!-- Dashboard JS-->
	<script src="/tmi/resources/js/dashboard.js"></script>
</body>

</html>
