<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<!--  사이드 배너 -->
		<aside class="menu-sidebar js-right-sidebar d-block d-lg-none">
		
  	<!--  로고 -->
			<div class="logo">
				<a href="<%=cp %>/main/ok">
					<img src="/tmi/resources/images/logo-black.png" alt="Listagram" />
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
						<!--  공용 -->
						<li>
							<a href="<%=cp%>/guest/dashboard">
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
								<i class="ion-ios-star-outline"></i>Reviews</a>
						</li>
						
			<!--  호스트일경우  -->	
			<c:if test="${sessionScope.guestInfo.hostcheck=='1' }">
					<!--  방추가 ( 호스트 ) -->
						<li>
							<a href="<%=cp %>/guest/addHost">
								<i class="ion-ios-plus-outline"></i>Add Hosting</a>
						</li>
						
					<!--  방 관리 -->	
						<li class="has-sub">
							<a class="active js-arrow" href="#">
								<i class="ion-social-buffer-outline"></i>Host Manager</a>
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
								
						<!--  로그인 시 우측 아이콘 -->
								<div class="header-button-item js-sidebar-btn">
									<c:if test="${!empty sessionScope.guestInfo.profileimage }">
										<img src="/tmi/resources/tmi/profile/${sessionScope.guestInfo.profileimage}" />
									</c:if>
									<c:if test="${empty sessionScope.guestInfo.profileimage }">
										<img src="/tmi/resources/images/profile.png">
									</c:if>
									<span>${sessionScope.guestInfo.name } <i class="ion-arrow-down-b"></i></span>
								</div>
						<!--  로그인 시 사용 메뉴 -->
								<div class="setting-menu js-right-sidebar d-none d-lg-block">
									<div class="account-dropdown__body">
									<!--  공용 -->
							
								<!--  mypage 메인 -->
										<div class="account-dropdown__item">
											<a href="<%=cp%>/guest/dashboard">
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
											<a href="<%=cp %>/book/booking">
												<i class="ion-ios-copy-outline"></i>Bookings</a>
										</div>
										
								<!--  리뷰확인 -->
										<div class="account-dropdown__item">
											<a href="<%=cp%>/post/reviewPage">
												<i class="ion-ios-star-outline"></i>Reviews</a>
										</div>
					<!--  호스트일 경우 -->
										<c:if test="${sessionScope.guestInfohostCheck=='1'}">
											<!--  방 추가 -->
											<div class="account-dropdown__item">
												<a class="active" href="<%=cp%>/guest/addHost"> 
												<i class="ion-ios-plus-outline"></i>Add Hosting</a>
											</div>
											
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

	<!--  Home / Dashboard / Host Manager / Host Review Page-->
			<div class="dash-breadcrumb">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="dash-breadcrumb-content">
								<div class="dash-breadcrumb-left">
									<div class="breadcrumb-menu text-right sm-left">
						<!--  글자 이동 -->
										<ul>
											<li class="active"><a href="<%=cp%>/main/ok">Home</a></li>
											<li class="active"><a href="<%=cp%>/guest/hostReviewPage">Host Manager</a></li>
											<li>Host Review Page</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


<!--  호스트 리뷰 메인 -->
			<div class="dash-content">
				<div class="container-fluid">
					<div class="row">
						<div class="dash-review-wrap" style="margin-left:300px;">
						
					<!--   -->
							<div class="act-title" style="width:1000px;" id = "wrap">
								<h5><i class="ion-ios-star-outline"></i> Host Room Review</h5>
							</div>
							<div class="db-review-item-wrap">
							
					<!-- 리뷰 리스트 1  -->
					<c:forEach var="dto" items="${lists }">
								<div class="single-review-item">
									<div class="customer-review_wrap">
										<c:if test="${not empty dto.profileimage }">
											<div class="reviewer-img">
											<img src="/tmi/resources/images/clients/reviewer-1.png" class="img-fluid">
												<p>${dto.name }</p>
											</div>
										</c:if>
										<c:if test="${empty dto.profileimage }">
											<div class="reviewer-img">
											<img src="/tmi/resources/images/profile.png" class="img-fluid">
												<p>${dto.name }</p>
											</div>
										</c:if>
										
										<div class="customer-content-wrap">
											<div class="customer-content">
												<div class="customer-review">
													<p>${dto.p_created }</p>
												<div class="customer-rating" style="background-color: white;">
													<!-- 정수부분개수만큼 표시 -->
														<fmt:parseNumber var="i" value="${dto.p_grade }"
															integerOnly="true" />
														<c:forEach begin="1" end="${i }">
															<p><i class="ion-ios-star" style="color:#FFCD12;"></i></p>
														</c:forEach>
														<!-- 소수값이면 -->
														<c:if test="${(dto.p_grade mod 1) ne 0}">
															<p><i class="ion-ios-star" style="color:#FFCD12;"></i></p>
														</c:if>
												</div>
												</div>
											</div>
										<p class="customer-text">${dto.p_content }</p>													
										<c:if test="${not empty dto.p_imagename }">
											<div class="review-img">						
												<img src="/tmi/resources/tmi/review/${dto.p_imagename }">
											</div>
										</c:if>
										</div>
									</div>
									
									<!-- 리뷰 끝 -->
								</div>
						</c:forEach>

							</div>
							
				<!--  리뷰 답변 등록 -->
							<div class="modal fade" id="reply-review">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
									
										<div class="modal-header">
											<h4 class="modal-title" id="myModalLabel">Reply To Review</h4>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="ion-ios-close-empty"></i></span></button>
										</div>
								<!--  답변 내용 -->
										<div class="modal-body">
											<div class="modal-reply-review">
												<textarea class="reply-review__textarea" rows="5"></textarea>
											</div>
								<!-- 답변 버튼 -->
											<div class="mar-top-30"><a href="single-listing-one.html" class="btn v4">Reply</a></div>
										</div>

									</div>
								</div>
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
	<script src="/tmi/resources/js/perfect-scrollbar.min.js"></script>
	<!-- Main JS-->
	<script src="/tmi/resources/js/main.js"></script>
	<!-- Dashboard JS-->
	<script src="/tmi/resources/js/dashboard.js"></script>

</body>

</html>
