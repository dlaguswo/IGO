<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
<link rel="icon" type="/tmi/resources/image/png" />
<!-- google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800"
	rel="stylesheet">
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

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
<script src="http://code.jquery.com/jquery.js"></script>
<title>여행을 만드는 생각 - TMI</title>

</head>

<script type="text/javascript">
	$(document).ready(function() {
		deleteRoomForm();
		deleteRoomList();
	});

	function deleteRoomData(r_num) {
		$.ajax({
			type : "POST",
			async : false,
			url : "${contextPath}/room/deleteRoomData",
			dataType : "text",
			data : {
				r_num : r_num
			},
			success : function(data) {
				deleteRoomList();
			}
		})
	}

	function deleteRoomForm() {
		$.ajax({
			type : "GET",
			dataType : "json",
			contentType : "application/json",
			url : "${contextPath}/room/deleteRoomForm",
			success : function(result) {

			}
		});
	}

	function deleteRoomList() {
		$
				.ajax({
					type : "GET",
					dataType : "json",
					contentType : "application/json",
					url : "${contextPath}/room/deleteRoom",
					success : function(result) {
						var output = "";
						$(result)
								.each(
										function() {
											output += "<div class=\"most-viewed-item\">";
											output += "<div class=\"most-viewed-img\">";
											output += "<img src=\"/tmi/resources/tmi/room/" + this.r_mainimage + "\">";
											output += "</div>";
											output += "<div class=\"most-viewed-detail\">";
											output += "<a class=\"category\">";
											output += "<span class=\"list-bg aqua\">";
											output += "<i class=\"icofont-hotel\"></i>";
											output += "</span>"
													+ this.cate_name;
											output += "</a>";
											output += "<h3>" + this.r_name
													+ "</h3>";
											output += "<p class=\"list-address\"><i class=\"icofont-google-map\"></i>"
													+ this.m_addr + "</p>";
											output += "<ul class=\"product-rating\">";
											if (this.r_grade % 1 == 0) {
												for (var i = 0; i < this.r_grade; i++) {
													output += "<li><i class=\"ion-android-star\"></i></li>";
												}
											} else {
												for (var i = 0; i < this.r_grade; i++) {
													output += "<li><i class=\"ion-android-star\"></i></li>";
												}
											}
											output += "</ul>";
											output += "<div class=\"views\">Views : <span>"
													+ this.hitcount
													+ "</span></div>";
											output += "</div>";
											output += "<div class=\"listing-button\">";
											output += '<a href=\"javascript:void(0)\" class=\"btn v4\" style=\"background-color: red;\" onclick = \"deleteRoomData('
													+ this.r_num
													+ ')\"><i class=\"icofont-ui-close\"></i>&nbsp;&nbsp;Delete</a>';
											output += "</div>";
											output += "</div>";
										});
						$(".viewd-item-wrap").html(output);
					},
					error : function(result) {
						alert(result);
					}
				});
	}
</script>

<body>
	<div class="page-wrapper">

		<!--  사이드 배너 -->
		<aside class="menu-sidebar js-right-sidebar d-block d-lg-none">
			<!--  로고 -->
			<div class="logo">
				<a href="<%=cp%>/main/ok"> <img
					src="/tmi/resources/images/logo-black.png" alt="Listagram" />
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
						<li><a href="<%=cp%>/main/admin"> <i
								class="ion-ios-gear-outline"></i>Admin
						</a></li>

						<!--  호스팅 체크 -->
						<li><a href="/tmi/main/hostCheckList"> <i
								class="ion-ios-plus-outline"></i>Hosting Check
						</a></li>

						<!-- 방 삭제 확인 -->
						<li><a class="active"  href="/tmi/room/deleteRoomForm"> <i
								class="ion-ios-copy-outline"></i>Delete Room
						</a></li>
						<!--  현재 예약 페이지 -->
						<li><a href="/tmi/main/currentReserv"> <i
								class="ion-social-buffer-outline"></i>Current Reservation
						</a></li>

						<!--  로그아웃 -->
						<li><a href="<%=cp%>/guest/logout"> <i
								class="ion-ios-upload-outline"></i>Logout
						</a></li>
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
								<div class="site-navbar">
									<div class="row align-items-center">
										<nav class="site-navigation float-left">
											<div class="container"></div>
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
												<p>
													Your listing <b>Hotel Ocean Paradise</b> has been approved!
												</p>
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
											<a class="active" href="/tmi/main/admin"> <i
												class="ion-ios-gear-outline"></i>Admin
											</a>
										</div>

										<!--  호스트 신청 확인 -->
										<div class="account-dropdown__item">
											<a href="/tmi/main/hostCheckList"> <i
												class="ion-ios-plus-outline"></i>Hosting Check
											</a>
										</div>

										<!-- 방 삭제 페이지 -->
										<div class="account-dropdown__item">
											<a href="/tmi/room/deleteRoomForm"> <i
												class="ion-ios-copy-outline"></i>Delete Room
											</a>
										</div>


										<!--  현재 예약 페이지-->
										<div class="account-dropdown__item">
											<a href="/tmi/main/currentReserv"> <i
												class="ion-social-buffer-outline"></i>Current Reservation
											</a>
										</div>

										<!--  로그아웃 -->
										<div class="account-dropdown__item">
											<a href="<%=cp%>/guest/logout"> <i
												class="ion-ios-upload-outline"></i>Logout
											</a>
										</div>
									</div>
								</div>
								<!--  아이콘 사용 끗 -->
							</div>
						</div>
					</div>
				</div>
			</header>

			<!--  Home / Dashboard / Wish List -->
			<div class="dash-breadcrumb">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="dash-breadcrumb-content">
								<div class="dash-breadcrumb-left">
									<div class="breadcrumb-menu text-right sm-left">
										<!--  글자 이동 -->
										<ul>
											<li class="active"><a href="/tmi/main/ok">Home</a></li>
											<li>Delete Room</li>
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
									<h5>
										<i class="ion-ios-copy-outline"></i> Delete Room
									</h5>
								</div>

								<div class="viewd-item-wrap">

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
