<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String r_num = request.getParameter("r_num");
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
		
			/* $("input:checkbox[id='remember']").prop("checked", true); */
				
			$("input:checkbox[id='check-"+ checkboxValues[i] +"']").prop("checked", true);
			
		}
		
		for(var i=0;i<checkboxValues2.length;i++){

			/* $("input:checkbox[id='remember']").prop("checked", true); */
				
			$("input:checkbox[id='check-space-"+ checkboxValues[i] +"']").prop("checked", true);
			
		}
		
	}

     
    
	function acyncMovePage(url){
 		
    	var houseTitle = document.myForm.houseTitle.value;
    	var address = document.myForm.address.value;
    	var tel = document.myForm.tel.value;
    	var cate = document.myForm.cate.value;
    	var roomName = document.myForm.roomName.value;
    	var price = document.myForm.price.value;
    	var people = document.myForm.people.value;
    	var bathCount = document.myForm.bathCount.value;
    	var bedCount = document.myForm.bedCount.value;
    	var bedRoomCount = document.myForm.bedRoomCount.value;
    	var textArea = document.myForm.textArea.value;
    	var file1 = document.myForm.file1.value;
    	var file2 = document.myForm.file2.value;
    	
    	 if(!houseTitle){
    		alert("건물이름을 입력해주세요");
    		document.myForm.houseTitle.focus();
    		return;
    	}
    	
    	if(!address){
    		alert("주소를 입력해주세요");
    		document.myForm.address.focus();
    		return;
    	}
    	
    	if(!tel){
    		alert("전화번호를 입력해주세요");
    		document.myForm.tel.focus();
    		return;
    	}
    	
    	if(!cate){
    		alert("카테고리를 지정해주세요");
    		return;
    	}
    	
    	if(!roomName){
    		alert("방 이름을 지정해주세요");
    		document.myForm.roomName.focus();
    		return;
    	}
    	
    	if(!price){
    		alert("방 가격을 지정해주세요");
    		document.myForm.price.focus();
    		return;
    	}
    	
    	if(!people){
    		alert("인원 수를 지정해주세요");
    		document.myForm.people.focus();
    		return;
    	}
    	
    	if(!bathCount){
    		alert("화장실 갯수를 지정해주세요");
    		document.myForm.bathCount.focus();
    		return;
    	}
    	
    	if(!bedCount){
    		alert("침대 갯수를 지정해주세요");
    		document.myForm.bedCount.focus();
    		return;
    	}
    	
    	if(!bedRoomCount){
    		alert("침실수를 지정해주세요");
    		document.myForm.bedRoomCount.focus();
    		return;
    	}
    	
    	if(!textArea){
    		alert("소개를 지정해주세요");
    		document.myForm.textArea.focus();
    		return;
    	}
    	
    	if(!file1){
    		alert("메인이미지를 지정해주세요");
    		document.myForm.file1.focus();
    		return;
    	}
    	
    	if(!file2){
    		alert("서브이미지를 지정해주세요");
    		document.myForm.file2.focus();
    		return;
    	}

    	
        // ajax option    
        var checkboxValues = [];
        $("input[name='check']:checked").each(function(){
        	checkboxValues.push($(this).val());
        });
        
        var checkboxValues2 = [];
        $("input[name='check2']:checked").each(function(){
        	checkboxValues2.push($(this).val());
        });
        
        
		$("#array").val(checkboxValues);
		$("#array2").val(checkboxValues2);
        
        var form = new FormData(document.getElementById("myForm"));

         var ajaxOption = {
            		 url : url,
                     data: form,
                     async : true,
                     enctype : "multipart/form-data",
                     type : "post",
                     dataType : "text",
                     processData: false, 
                     contentType: false,                
                     cache : false
            };
            $.ajax(ajaxOption).done(function(data){

                // Contents 영역 삭제
                $('#bodyContents').children().remove();
                // Contents 영역 교체
                $('#bodyContents').html('<div class="dash-content bodyContents"><div class="container-fluid"><div class="row"><div class="col-md-12" style="padding-left: 30%;padding-right: 30%;"><div class="db-add-list-wrap"><div class="act-title"><h5><i class="ion-clock"> Update Success</i></h5>' +
                 		'</div><div class="db-add-listing" ><div class="row" style="text-align: center;">' +
                		'<div class="col-md-12" ><div class="form-group"><p style="font-size: 13pt;"><b>수정완료</b></p></div><div><p style="font-size: 12pt;">호스트에 의해 정보가</p><p style="font-size: 12pt;">성공적으로 수정되었습니다.</p>' +
                		'</div></div></div></div><hr><div class="db-add-listing" ><div class="row" style="vertical-align: middle; text-align: center;"><div class="col-md-12" ><div class="form-group">' +
                		'<p style="font-size: 13pt;"><b>Update Completed</b></p></div><div><p style="font-size: 12pt;">Update Complete</p></div>' +
                		'</div></div></div></div><div class="col-md-6 text-right sm-left" style="padding-left:295px;"><input type="button" class="btn v8" onclick="location.href=\'/tmi/guest/dashboard\'" style="font-weight: bold;" value="확인"/></div><span class="scrolltotop"><i class="ion-arrow-up-c"></i></span></div></div></div></div>');
                        });

        }    
</script>

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
					<li>
							<a class="active"  href="<%=cp %>/guest/addHost">
								<i class="ion-ios-plus-outline"></i>Add Hosting</a>
						</li>	
						
						
			<!--  호스트일경우  -->	
			<c:if test="${sessionScope.guestInfo.hostcheck=='1'}">
					<!--  방추가 ( 호스트 ) -->
						
						
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
							<!--  방 추가 -->
											<div class="account-dropdown__item">
												<a href="<%=cp%>/guest/addHost"> 
												<i class="ion-ios-plus-outline"></i>Add Hosting</a>
											</div>			
					<!--  호스트일 경우 -->
										<c:if test="${sessionScope.guestInfohostCheck=='1'}">
											
											
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
											<li class="active"><a href="<%=cp%>/room/roomEdit">Room Edit</a></li>
											<li>Room Profile</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		 
<!--  대쉬보드  -->
	
			<form enctype="multipart/data-form" method="post" name="myForm" id="myForm">	
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
												<input type="text" name="houseTilte" id="houseTitle" class="form-control filter-input" placeholder="House Title" value="${dto.m_name }">
											</div>
										</div>
										
							<!--  건물 주소 입력 -->
										<div class="col-md-6">
											<div class="form-group">
												<label>Address</label>
												<input type="text" name="address" class="form-control filter-input" placeholder="Address of your House" value="${dto.m_addr }">
											</div>
										</div>
										
							<!--  호스트 연락처 , 유저테이블의 tel을 가져와서 기본값, 변경가능-->
										<div class="col-md-6">
											<div class="form-group">
												<label>Tel.</label>
												<input type="text" name="tel" class="form-control filter-input" placeholder="Reachable tel"  value="${dto.m_tel }">
											</div>
										</div>
										
							<!-- 건물 형태 -->
										<div class="col-md-6">
											<div class="form-group">
												<label>Category</label>
													<select class="nice-select filter-input" name="cate">
														<option class="option" value="1">호텔</option>
														<option class="option" value="2">모텔</option>
														<option class="option" value="3">펜션</option>
														<option class="option" value="4">아파트</option>
														<option class="option" value="5">주택</option>
														<option class="option" value="5">게스트하우스</option>
													</select>
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
												<input type="text" name="roomName" class="form-control filter-input" placeholder="Standard family Room" value="${dto.r_name }">
											</div>
										</div>
										
							<!--  방 가격 -->
										<div class="col-md-6">
											<div class="form-group">
												<label>Price</label>
												<input type="text" name="price" class="form-control filter-input" placeholder="30000(￦)" value="${dto.r_price }">
											</div>
										</div>
										
							<!--  기준 인원 -->
										<div class="col-md-6">
											<div class="form-group">
												<label>Personnel</label>
												<input type="text" name="people" class="form-control filter-input" placeholder="2 persons" value="${dto.r_inwon }">
											</div>
										</div>
										
							<!-- 추가인원당 비용 -->
										<div class="col-md-6">
											<div class="form-group">
												<label>add cost of one person</label>
												<input type="text" name="addPeople" class="form-control filter-input" placeholder="10000(￦)" readonly="readonly">
											</div>
										</div>
										
							<!--  화장실 수, 침대 갯수, 침실 수 -->
										<div class="col-md-4">
											<div class="form-group">
												<label>Bath Number</label>
												<input type="text" class="form-control filter-input" name="bathCount" placeholder="Bath Number" value="${dto.r_bath }">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>Bed Number</label>
												<input type="text" class="form-control filter-input" name="bedCount" placeholder="Bed Number" value="${dto.r_bed }">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>BedRoom Number</label>
												<input type="text" class="form-control filter-input" name="bedRoomCount" placeholder="BedRoom Number" value="${dto.r_bedroom }">
											</div>
										</div>
										<div class="col-md-12">

												<div class="form-group">
													<label for="list_info">Description</label>
													<textarea class="form-control" id="list_info" rows="4" name="textArea" placeholder="Enter your text here">${dto.r_content }</textarea>
												</div>
										</div>	
										
							<!--  방 메인 이미지 -->
										
										<div class="col-md-12">
											<div class="form-group">
													<div class="form-group">
													<label>Main Image</label>
														<div class="add-listing__input-file-box">
															<input class="add-listing__input-file" type="file" name="file1" id="file1">
															<div class="add-listing__input-file-wrap">
																<i class="ion-ios-cloud-upload"></i>
																<p style="color: black;">Click here to upload Room Main images</p><br/>
																<p style="color: rgb(255,180,180);"> Serve Images Use the Serve image Menu </p>
															</div>
														</div>
													</div>
											</div>
										</div>
										
							<!--  편의사항 -->
										<div class="col-md-12">
											<div class="form-group">
												<label>Amenities</label>
												<div class="filter-checkbox">
													<input type="hidden" name="checkArray" id="array">
													<input id="check-1" type="checkbox" name="check" value="1">
														<label for="check-1">필수품목(수건,침대 시트,비누,화장지, 베개)</label>
													<input id="check-2" type="checkbox" name="check" value="2">
														<label for="check-2">Wifi</label>
													<input id="check-3" type="checkbox" name="check" value="3">
														<label for="check-3">Tv</label>
													<input id="check-4" type="checkbox" name="check" value="4">
														<label for="check-4">에어컨</label>
													<input id="check-5" type="checkbox" name="check" value="5">
														<label for="check-5">샴푸</label>
													<input id="check-6" type="checkbox" name="check" value="6">
														<label for="check-6">스파가능</label>
													<input id="check-7" type="checkbox" name="check" value="7">
														<label for="check-7">여성전용</label>
													<input id="check-8" type="checkbox" name="check" value="8">
														<label for="check-8">PC</label>
													<input id="check-9" type="checkbox" name="check" value="9">
														<label for="check-9">짐보관</label>
													<input id="check-10" type="checkbox" name="check" value="10">
														<label for="check-10">근처 편의점(50m)</label>
													<input id="check-11" type="checkbox" name="check" value="11">
														<label for="check-11">상비약</label>
													<input id="check-12" type="checkbox" name="check" value="12">
														<label for="check-12">독채</label>
													<input id="check-13" type="checkbox" name="check" value="13">
														<label for="check-13">계곡인접</label>
													<input id="check-14" type="checkbox" name="check" value="14">
														<label for="check-14">해수욕장 인근</label>
													<input id="check-15" type="checkbox" name="check" value="15">
														<label for="check-15">동물입실가능</label>
													<input id="check-16" type="checkbox" name="check" value="16">
														<label for="check-16">조식 운영</label>
													<input id="check-17" type="checkbox" name="check" value="17">
														<label for="check-17">복층구조</label>
												</div>
											</div>
							<!--  사용 공간 -->		
											<div class="form-group">
												<label>Use Space</label>
												<div class="filter-checkbox">
													<input type="hidden" name="checkArray2" id="array2">
													<input id="check-space-1" type="checkbox" name="check2" value="1">
														<label for="check-space-1">주차장</label>
													<input id="check-space-2" type="checkbox" name="check2" value="2">
														<label for="check-space-2">공용 거실</label>
													<input id="check-space-3" type="checkbox" name="check2" value="3">
														<label for="check-space-3">공용 주방</label>
													<input id="check-space-4" type="checkbox" name="check2" value="4">
														<label for="check-space-4">기본 양념</label>
													<input id="check-space-5" type="checkbox" name="check2" value="5">
														<label for="check-space-5">실내 취사</label>
													<input id="check-space-6" type="checkbox" name="check2" value="6">
														<label for="check-space-6">금연 객실</label>
													<input id="check-space-7" type="checkbox" name="check2" value="7">
														<label for="check-space-7">흡연 객실</label>
													<input id="check-space-8" type="checkbox" name="check2" value="8">
														<label for="check-space-8">흡연 구역</label>
													<input id="check-space-9" type="checkbox" name="check2" value="9">
														<label for="check-space-9">수영장</label>
													<input id="check-space-10" type="checkbox" name="check2" value="10">
														<label for="check-space-10">운동장</label>
												</div>
											</div>											
										</div>
									</div>
								</div>
							</div>
							
				<!-- 서브 이미지 추가 -->
							<div class="db-add-list-wrap">
								<div class="act-title">
									<h5><i class="ion-image"></i> Serve Image :</h5>
								</div>
								
								<div class="db-add-listing">
									
										<div class="form-group">
											<div class="form-group">
												<div class="add-listing__input-file-box">
													<input multiple="multiple" class="add-listing__input-file" type="file" name="file2" id="file2">
													<div class="add-listing__input-file-wrap">
														<i class="ion-ios-cloud-upload"></i>
														<p style="color: black;">Click here to upload Room Serve images</p>
													</div>
												</div>
											</div>
										</div>
										

								</div>
							</div>
							

					<!--  동의 버튼 -->
							<div class="col-md-6 text-right sm-left">
								<input type="hidden" name="r_num" value="<%=r_num %>">
								<input type="hidden" name="email" value="${sessionScope.guestInfo.email }">
								<input type="button" value="Update" onclick="acyncMovePage('/tmi/room/updatehostCheck');" class="btn v8">
								
							</div>
					<!--  맨위로 가기 버튼 -->
							<span class="scrolltotop"><i class="ion-arrow-up-c"></i></span>
						</div>
					</div>
				</div>
			</div>
			</form>

			<!--Dashboard footer starts-->
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
	<!--google maps-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_8C7p0Ws2gUu7wo0b6pK9Qu7LuzX2iWY&amp;libraries=places&amp;callback=initAutocomplete"></script>
	<!-- Main JS-->
	<script src="/tmi/resources/js/main.js"></script>
	<!-- Dashboard JS-->
	<script src="/tmi/resources/js/dashboard.js"></script>
	
	<script>
	
	window.onload = function() {
		check();
	}

	</script>
</body>

</html>
