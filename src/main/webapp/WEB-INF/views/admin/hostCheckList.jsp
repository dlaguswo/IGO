<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<a href="<%=cp%>/main/ok">
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
				
				<h4 class="name">${sessionScope.guestInfo.name }</h4>
				
				<nav class="navbar-sidebar2">
				
			<!-- 사이드 리스트  -->
					<ul class="list-unstyled navbar__list">
						<!--  공용 -->
						<li>
							<a href="<%=cp%>/main/admin">
								<i class="ion-ios-gear-outline"></i>Admin
							</a>
						</li>
						
					<!--  호스팅 체크 -->
						<li>
							<a class="active" href="<%=cp%>/main/hostCheckList">
								<i class="ion-ios-plus-outline"></i>Hosting Check</a>
						</li>
						
					<!-- 방 삭제 확인 -->	
						<li>
							<a href="/tmi/room/deleteRoomForm">
								<i class="ion-ios-copy-outline"></i>Delete Room</a>
						</li>

					<!--  현재 예약 페이지 -->	
						<li>
							<a href="/tmi/main/currentReserv">
								<i class="ion-social-buffer-outline"></i>Current Reservation
							</a>
						</li>
						
						<!--  로그아웃 -->
						<li>
							<a href="<%=cp%>/guest/logout">
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
									<span>${session.guestInfo.name} <i class="ion-arrow-down-b"></i></span>
								</div>
						<!--  로그인 시 사용 메뉴 -->
								<div class="setting-menu js-right-sidebar d-none d-lg-block">
									<div class="account-dropdown__body">
									<!--  공용 -->
							
								<!--  mypage 메인 -->
										<div class="account-dropdown__item">
											<a href="<%=cp%>/main/admin">
												<i class="ion-ios-gear-outline"></i>Admin
											</a>
										</div>
										
							<!--  호스트 신청 확인 -->
										<div class="account-dropdown__item">
											<a class="active" href="<%=cp%>/main/hostCheckList">
											<i class="ion-ios-plus-outline"></i>Hosting Check</a>
										</div>
										
								<!-- 방 삭제 페이지 -->
										<div class="account-dropdown__item">
											<a href="/tmi/room/deleteRoomForm">
												<i class="ion-ios-copy-outline"></i>Delete Room</a>
										</div>

								<!--  현재 예약 페이지-->
										<div class="account-dropdown__item">
											<a href="/tmi/main/currentReserv">
											<i class="ion-social-buffer-outline"></i>Current Reservation
											</a>
										</div>
										
								<!--  로그아웃 -->
										<div class="account-dropdown__item">
											<a href="<%=cp%>/guest/logout">
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

	<!--  연결 창 -->
			<div class="dash-breadcrumb">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="dash-breadcrumb-content">
								<div class="dash-breadcrumb-left">
								
							<!--  현재 창 보여주기 -->
									<div class="breadcrumb-menu text-right sm-left">
										<ul>
									<!--  어드민 관리 페이지 -->
											<li class="active"><a href="<%=cp%>/main/ok">Home</a></li>
											<li>Hosting Check</li>
										</ul>
									</div>
								</div>							
							</div>
						</div>
					</div>
				</div>
			</div>


<!--  룸 설정 메인 -->
			<div class="dash-content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="recent-activity my-listing">
							<div class="act-title">
								<h5><i class="ion-social-buffer-outline"></i> Room Edit</h5>
							</div>

							<div class="viewd-item-wrap">
							
				<!--  리스트 1 -->
				<c:forEach var="dtoHC" items="${listsHC}">
								<div class="most-viewed-item">
				
							<!-- 방 이미지 -->	  
									<div class="most-viewed-img">
										 <a><img src="/tmi/resources/tmi/room/${dtoHC.r_mainimage }"></a> 
									</div>
									<div class="most-viewed-detail">
									
							<!-- 숙소 카테고리 -->
										<a class="category" >
									<!-- 아이콘 색 aqua, red, violate -->
											<span class="list-bg aqua">
												<i class="icofont-hotel"></i>
											</span>${dtoHC.cate_name }
										</a>
										
							<!--  방 이름 -->
										<h3><a href="#">${dtoHC.r_name }</a></h3>
										
							<!--  숙소 주소 -->			
										<p class="list-address"><i class="icofont-google-map"></i>${dtoHC.m_addr }</p>
							<!--  호스트 아이디 -->
										<p class="list-address"><i class="icofont-ui-user"></i>${dtoHC.email }</p>
										
									</div>
									
							<!-- 찜 목록 삭제 버튼 -->
									<div class="listing-button">
										<a href="/tmi/main/roomProfile?r_num=${dtoHC.r_num }" class="btn v4"><i class="icofont-ui-check"></i>&nbsp;&nbsp;Check</a>
									</div>
								</div>
				</c:forEach>
				<!--  리스트 끗 -->
						
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
