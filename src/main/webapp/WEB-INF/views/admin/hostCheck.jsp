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
	
<script>

	function check(){
		
		var checkboxValues = [${dto.f_num}];
		var checkboxValues2 = [${dto.s_num}];

		
		
		for(var i=0;i<checkboxValues.length;i++){
				
			$("input:checkbox[id='check-"+ checkboxValues[i] +"']").prop("checked", true);
			
		}
		
		for(var i=0;i<checkboxValues2.length;i++){
				
			$("input:checkbox[id='check-space-"+ checkboxValues[i] +"']").prop("checked", true);
			
		}
		
	}  
	
	function Agree() {
		
		document.action = "/tmi/main/agreeHost";
		document.submit();
	}
</script>

	<!-- Document Title -->
	<title>여행을 만드는 생각 - TMI </title>

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
											<a class="active" href="<%=cp%>/main/admin">
												<i class="ion-ios-gear-outline"></i>Admin
											</a>
										</div>
										
							<!--  호스트 신청 확인 -->
										<div class="account-dropdown__item">
											<a href="<%=cp%>/main/hostCheckList">
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
									<!--  어드민 관리 페이지 -->
											<li class="active"><a href="<%=cp%>/main/ok">Home</a></li>
											<li class="active"><a href="<%=cp%>/main/hostCheckList">Hosting Check</a></li>
											<li>Hosting Check Info</li>
										</ul>
									</div>
								</div>							
							</div>
						</div>
					</div>
				</div>
			</div>
		 
<!--  대쉬보드  -->
		
			<div class="dash-content" id="bodyContents">
				<div class="container-fluid">
					<div class="row">
					
			<!--  1번째 테이블  -->
						<div class="col-md-12">
							<div class="db-add-list-wrap">
							
						<!--  건물 정보입력 -->
								<div class="act-title">
									<h5><i class="ion-ios-information"></i> House Information :</h5>
								</div>
								
								<div class="db-add-listing">
									<div class="row">
										<div class="col-md-6">	
							<!--  건물 이름 입력 -->
							
											<div class="form-group">
												<label>House Title</label>
												<input type="text" name="houseTilte" id="houseTitle" class="form-control filter-input" placeholder="House Title" value="${dto.m_name }" readonly="readonly">
											</div>
										</div>
										
							<!--  건물 주소 입력 -->
										<div class="col-md-6">
											<div class="form-group">
												<label>Address</label>
												<input type="text" name="address" class="form-control filter-input" placeholder="Address of your House" value="${dto.m_addr }" readonly="readonly">
											</div>
										</div>
										
							<!--  호스트 연락처 , 유저테이블의 tel을 가져와서 기본값, 변경가능-->
										<div class="col-md-6">
											<div class="form-group">
												<label>Tel.</label>
												<input type="text" name="tel" class="form-control filter-input" placeholder="Reachable tel"  value="${dto.m_tel }" readonly="readonly">
											</div>
										</div>
										
							<!-- 건물 형태 -->
										<div class="col-md-6">
											<div class="form-group">
												<label>Category</label>
												<input type="text" name="tel" class="form-control filter-input" placeholder="Reachable tel"  value="${cate_name }" readonly="readonly">	
											</div>
										</div>	
									</div>
								</div>
							</div>
							
				<!--  방 정보 -->	
							<div class="db-add-list-wrap">
						<!--  방 정보 및 가격  -->
								<div class="act-title">
									<h5><i class="ion-ios-location"></i> Rooms/Pricing :</h5>
								</div>
								<div class="db-add-listing">
									<div class="row">
										<div class="col-md-6">
							<!--  방 이름 -->
											<div class="form-group">
												<label>Room Title</label>
												<input type="text" name="roomName" class="form-control filter-input" placeholder="Standard family Room" value="${dto.r_name }" readonly="readonly">
											</div>
										</div>
										
							<!--  방 가격 -->
										<div class="col-md-6">
											<div class="form-group">
												<label>Price</label>
												<input type="text" name="price" class="form-control filter-input" placeholder="30000(￦)" value="${dto.r_price }" readonly="readonly">
											</div>
										</div>
										
							<!--  기준 인원 -->
										<div class="col-md-6">
											<div class="form-group">
												<label>Personnel</label>
												<input type="text" name="people" class="form-control filter-input" placeholder="2 persons" value="${dto.r_inwon }" readonly="readonly">
											</div>
										</div>
										
							<!-- 추가인원당 비용 -->
										<div class="col-md-6">
											<div class="form-group">
												<label>add cost of one person</label>
												<input type="text" name="addPeople" class="form-control filter-input" placeholder="10000(￦)"  value="10000" readonly="readonly">
											</div>
										</div>
										
							<!--  화장실 수, 침대 갯수, 침실 수 -->
										<div class="col-md-4">
											<div class="form-group">
												<label>Bath Number</label>
												<input type="text" class="form-control filter-input" name="bathCount" placeholder="Bath Number" value="${dto.r_bath }" readonly="readonly">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>Bed Number</label>
												<input type="text" class="form-control filter-input" name="bedCount" placeholder="Bed Number" value="${dto.r_bed }" readonly="readonly">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>BedRoom Number</label>
												<input type="text" class="form-control filter-input" name="bedRoomCount" placeholder="BedRoom Number" value="${dto.r_bedroom }" readonly="readonly">
											</div>
										</div>
										<div class="col-md-12">

												<div class="form-group">
													<label for="list_info">Description</label>
													<textarea class="form-control" id="list_info" rows="4" name="textArea" placeholder="Enter your text here" readonly="readonly">${dto.r_content }</textarea>
												</div>
										</div>	
									
										
							<!--  편의사항 -->
										<div class="col-md-12">
											<div class="form-group">
												<label>Amenities</label>
												<div class="filter-checkbox">
													<input type="hidden" name="checkArray" id="array">
													<input id="check-1" type="checkbox" name="check" value="1" onclick="return false;">
														<label for="check-1">필수품목(수건,침대 시트,비누,화장지, 베개)</label>
													<input id="check-2" type="checkbox" name="check" value="2" onclick="return false;">
														<label for="check-2">Wifi</label>
													<input id="check-3" type="checkbox" name="check" value="3" onclick="return false;">
														<label for="check-3">Tv</label>
													<input id="check-4" type="checkbox" name="check" value="4" onclick="return false;">
														<label for="check-4">에어컨</label>
													<input id="check-5" type="checkbox" name="check" value="5" onclick="return false;">
														<label for="check-5">샴푸</label>
													<input id="check-6" type="checkbox" name="check" value="6" onclick="return false;">
														<label for="check-6">스파가능</label>
													<input id="check-7" type="checkbox" name="check" value="7" onclick="return false;">
														<label for="check-7">여성전용</label>
													<input id="check-8" type="checkbox" name="check" value="8" onclick="return false;">
														<label for="check-8">PC</label>
													<input id="check-9" type="checkbox" name="check" value="9" onclick="return false;">
														<label for="check-9">짐보관</label>
													<input id="check-10" type="checkbox" name="check" value="10" onclick="return false;">
														<label for="check-10">근처 편의점(50m)</label>
													<input id="check-11" type="checkbox" name="check" value="11" onclick="return false;">
														<label for="check-11">상비약</label>
													<input id="check-12" type="checkbox" name="check" value="12" onclick="return false;">
														<label for="check-12">독채</label>
													<input id="check-13" type="checkbox" name="check" value="13" onclick="return false;">
														<label for="check-13">계곡인접</label>
													<input id="check-14" type="checkbox" name="check" value="14" onclick="return false;">
														<label for="check-14">해수욕장 인근</label>
													<input id="check-15" type="checkbox" name="check" value="15" onclick="return false;">
														<label for="check-15">동물입실가능</label>
													<input id="check-16" type="checkbox" name="check" value="16" onclick="return false;">
														<label for="check-16">조식 운영</label>
													<input id="check-17" type="checkbox" name="check" value="17" onclick="return false;">
														<label for="check-17">복층구조</label>
												</div>
											</div>
							<!--  사용 공간 -->		
											<div class="form-group">
												<label>Use Space</label>
												<div class="filter-checkbox">
													<input type="hidden" name="checkArray2" id="array2">
													<input id="check-space-1" type="checkbox" name="check2" value="1" onclick="return false;">
														<label for="check-space-1">주차장</label>
													<input id="check-space-2" type="checkbox" name="check2" value="2" onclick="return false;">
														<label for="check-space-2">공용 거실</label>
													<input id="check-space-3" type="checkbox" name="check2" value="3" onclick="return false;">
														<label for="check-space-3">공용 주방</label>
													<input id="check-space-4" type="checkbox" name="check2" value="4" onclick="return false;">
														<label for="check-space-4">기본 양념</label>
													<input id="check-space-5" type="checkbox" name="check2" value="5" onclick="return false;">
														<label for="check-space-5">실내 취사</label>
													<input id="check-space-6" type="checkbox" name="check2" value="6" onclick="return false;">
														<label for="check-space-6">금연 객실</label>
													<input id="check-space-7" type="checkbox" name="check2" value="7" onclick="return false;">
														<label for="check-space-7">흡연 객실</label>
													<input id="check-space-8" type="checkbox" name="check2" value="8" onclick="return false;">
														<label for="check-space-8">흡연 구역</label>
													<input id="check-space-9" type="checkbox" name="check2" value="9" onclick="return false;">
														<label for="check-space-9">수영장</label>
													<input id="check-space-10" type="checkbox" name="check2" value="10" onclick="return false;">
														<label for="check-space-10">운동장</label>
												</div>
											</div>											
										</div>
									</div>
								</div>
							</div>
							
							<div class="db-add-list-wrap">
								<div class="act-title">
									<h5><i class="ion-clock"></i> Check In/Check Out Hours :</h5>
								</div>
								<div class="db-add-listing">
									<div class="row mar-bot-30">
										<div class="col-md-2">
											<label class="fix_spacing">CheckIn & CheckOut</label>
										</div>
										
										<div class="col-md-5">

												<input type="text" class="form-control filter-input" name="checkin" value="15.00 pm" readonly="readonly">
					
										</div>
										<div class="col-md-5">
											
												<input type="text" class="form-control filter-input" name="checkout" value="12.00 pm" readonly="readonly">
										
										</div>
									</div>
								</div>
							</div>
							
							
					<!--  동의 버튼 -->
							<div class="col-md-6 text-right sm-left" style="padding: 0px; max-width: 100%; text-align: center!important;">
								
								<a href="/tmi/main/agreeHost?r_num=${dto.r_num }">
								<button type="button" class="btn v8">
									<i class="icofont-check-circled"></i>&nbsp;Agree
								</button>
								</a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="/tmi/main/disAgreeHost?r_num=${dto.r_num }&email=${dto.email}">
								<button type="button" class="btn v8" style="background-color: red;">
									<i class="icofont-close-squared"></i>&nbsp;Disagree
								</button>
								</a>
							</div>
						
					<!--  맨위로 가기 버튼 -->
							<span class="scrolltotop"><i class="ion-arrow-up-c"></i></span>
						</div>	
					</div>
				</div>

</div>

			<!--Dashboard footer starts-->
			<div class="dash-footer">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="copyright">
								<p>© 2020 Listagram . All rights reserved.</p>
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
	<!--google maps-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_8C7p0Ws2gUu7wo0b6pK9Qu7LuzX2iWY&amp;libraries=places&amp;callback=initAutocomplete"></script>
	<!-- Main JS-->
	<script src="/tmi/resources/js/main.js"></script>
	<!-- Dashboard JS-->
	<script src="/tmi/resources/js/dashboard.js"></script>
	<script type="text/javascript">
		window.onload = function() {
			
			check();
		}
	</script>
	
</body>

</html>
