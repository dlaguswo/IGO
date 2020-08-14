<%@page import="com.exe.tmi.guest.dto.GuestDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	GuestDTO dto = (GuestDTO)session.getAttribute("guestInfo");
	String firstName = dto.getName().substring(0, 1);
	String lastName = dto.getName().substring(1);
	
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

<script type="text/javascript">

	function addBookingList(email,r_num,checkin,checkout,b_num) {
		
		$.ajax({
			type:"post",
			url : "/tmi/guest/reservationUpdate",
			dataType : "text",
			data : {
				email : email,
				r_num : r_num,
				checkin : checkin,
				checkout : checkout
			},
			success:function(data) {
				if(data == 'true'){
					bookingList();
					bookingListA();
					reservationOK(b_num);
				} else {
					alert("로그인 해 주세요");
				}
			}
		});
		
	}
	
	function reservationOK(b_num) {
		
		$.ajax({
			type:"post",
			url : "/tmi/guest/reservationOK",
			dataType : "text",
			data : {
				b_num : b_num
			},
			success:function(data){
				if(data == 'true'){
					alert("예약문자를 발송 하였습니다.");
				} else {
					alert("로그인 해 주세요");
					location.href = "<%=cp%>/guest/loginForm";
					return;
				}
			}
		});
	
	}
	
	function reservationNO(b_num) { //DB값 지워지지 않도록 이거 먼저 실행하고 delete 실행될거임
		
		$.ajax({
			type:"post",
			url : "/tmi/guest/reservationNO",
			dataType : "text",
			data : {
				b_num : b_num
			},
			success:function(data){
				if(data == 'true'){
					alert("예약 취소 문자를 발송 하였습니다.");
					bookingDelete(b_num);
				} else {
					alert("로그인 해 주세요");
					location.href = "<%=cp%>/guest/loginForm";
					return;
				}
			}
		});
	
	}
	
	function bookingDelete(b_num) {
		
		$.ajax({
			type:"post",
			url : "/tmi/guest/reservationDelete",
			dataType : "text",
			data : {
				b_num : b_num
			},
			success:function(data){
				if(data == 'true'){
					bookingList();
					bookingListA();
				} else {
					alert("로그인 해 주세요");
					location.href = "<%=cp%>/guest/loginForm";
					return;
				}
			}
		});
	
	}
	
	function bookingList() {
		$.ajax({
			type:"GET",
			dataType : "json",
			contentType: "application/json",
			url : "/tmi/guest/reservationList",
			success:function(result){
				var output = "";
				$(result).each(function(){
					output += "<div class=\"db-booking-item\">";
					output += "<div class=\"booking-img\">";
					output += "<img  src=\"/tmi/resources/tmi/room/" + this.r_mainimage + "\">";
					output += "</div>";
					output += "<h4>"+ this.r_name +"</h4>";
					output += "<div class=\"booking-info\">";
					output += "<h6>Booking date: </h6>";
					output += "<ul class=\"booking_list\">";
					output += "<li><span>"+ this.checkin + " ~ " + this.checkout +"</span></li>";
					output += "</ul>";
					output += "</div>";
					output += "<div class=\"booking-info\">";
					output += "<h6>people: </h6>";
					output += "<ul class=\"booking_list\">";
					output += "<li><span>"+ this.b_inwon +"</span></li>";
					output += "</ul>";
					output += "</div>";			
					output += "<div class=\"booking-info\">";
					output += "<h6>Guests: </h6>";
					output += "<ul class=\"booking_list transparent\">";
					output += "<li><span>"+ this.name +"</span></li>";
					output += "</ul>";
					output += "</div>";
					output += "<div class=\"booking-info\">";
					output += "<h6>Price: </h6>";
					output += "<ul class=\"booking_list\">";
					output += "<li><span>"+ this.b_price +"</span></li>";
					output += "</ul>";
					output += "</div>";
					output += "<ul class=\"buttons\">";
					output += "<li><a href=\"javascript:addBookingList('"+ this.email +"','"+ this.r_num +"','"+ this.checkin +"','"+ this.checkout +"','"+ this.b_num +"');\" class=\"btn v2\" type=\"submit\"><i class=\"ion-ios-checkmark-outline\"></i> Approve</a></li>";
					output += "<li><a href=\"javascript:reservationNO('"+ this.b_num +"');\" class=\"btn v4\" type=\"submit\"><i class=\"ion-ios-close-outline\"></i> Reject</a></li>";
					output += "</ul>";
					output += "</div>";
					output += "</div>";
				 });	
				 $("#bookingList-json").html(output);
			},
			error : function(request,status,error){
				alert("(code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error+")");
			}
		});
	}
	
	function bookingListA() {
		$.ajax({
			type:"GET",
			dataType : "json",
			contentType: "application/json",
			url : "/tmi/guest/reservationList_A",
			success:function(result){
				var output = "";
				$(result).each(function(){
					output += "<div class=\"db-booking-item\">";
					output += "<div class=\"booking-img\">";
					output += "<img  src=\"/tmi/resources/tmi/room/" + this.r_mainimage + "\">";
					output += "</div>";
					output += "<h4>"+ this.r_name +"<span class=\"book-approved\">Approve</span></h4>";
					output += "<div class=\"booking-info\">";
					output += "<h6>Booking date: </h6>";
					output += "<ul class=\"booking_list\">";
					output += "<li><span>"+ this.checkin + " ~ " + this.checkout +"</span></li>";
					output += "</ul>";
					output += "</div>";
					output += "<div class=\"booking-info\">";
					output += "<h6>people: </h6>";
					output += "<ul class=\"booking_list\">";
					output += "<li><span>"+ this.b_inwon +"</span></li>";
					output += "</ul>";
					output += "</div>";			
					output += "<div class=\"booking-info\">";
					output += "<h6>Guests: </h6>";
					output += "<ul class=\"booking_list transparent\">";
					output += "<li><span>"+ this.name +"</span></li>";
					output += "</ul>";
					output += "</div>";
					output += "<div class=\"booking-info\">";
					output += "<h6>Price: </h6>";
					output += "<ul class=\"booking_list\">";
					output += "<li><span>"+ this.b_price +"</span></li>";
					output += "</ul>";
					output += "</div>";
					output += "</div>";
					output += "</div>";
				 });	
				 $("#bookingListA-json").html(output);
			},
			error : function(request,status,error){
				alert("(code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error+")");
			}
		});
	}
	
	window.onload = function(){
		bookingList();
		bookingListA();
	}
</script>

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
						<img src="/tmi/resources/images/profile.png">
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
							<a href="<%=cp%>/guest/hostReviewForm">
								<i class="ion-ios-star-outline"></i>Reviews
							</a>
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
										<c:if test="${sessionScope.guestInfo.hostcheck=='1' }">
											<!--  방 추가 -->
											<div class="account-dropdown__item">
												<a href="<%=cp%>/guest/addHost"> 
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

	<!--  Home / Dashboard / Booking -->
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
											<li class="active"><a href="#">Host Manager</a></li>
											<li>Reservation list</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


<!--  예약 내역 메인 -->
			<div class="dash-content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="dash-bookings">
							
					<!--  Booking 이름 -->		
								<div class="act-title">
									<h5><i class="ion-ios-copy-outline"></i> Reservation List</h5>
								</div>
					<!--  예약내역 -->
								<div class="db-booking-wrap">
								
						<!--  List 1 -->
								<div id="bookingList-json"></div>
								
								<br/>
								<div style="border-top-style: solid; #f5f6f7; 3px"></div>
								<br/>
								
						<!--  예약 확정 리스트 -->
								<div id="bookingListA-json"></div>
									
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
			<!--Dashboard footer ends-->
		</div>
		<!--Dashboard content Wrapper ends-->

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