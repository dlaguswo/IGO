<%@ page import="com.exe.tmi.guest.dto.GuestDTO" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String id = "";
	if(session.getAttribute("guestInfo") != null){
		GuestDTO guestDTO = (GuestDTO)session.getAttribute("guestInfo");
		id = guestDTO.getEmail();	
	}
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
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- Document Title -->
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
    <script src="http://code.jquery.com/jquery.js"></script>
    <style type="text/css">
	.roomimg{
	height: 400px;
	}
	</style>
	<title>여행을 만드는 생각 - TMI</title>	
</head>
									
<script type="text/javascript">
	 function fn_deleteReply(p_num) {		 
		var email = "<%=id%>";
		$.ajax({
			type : "post",
			async : false,
			url : "${contextPath}/post/commentDelete.action",
			dataType : "text",
			data : {
				p_num : p_num,
				email : email
			},			
			success : function(data) {
				if(data == 'true'){
					showReplyList();	
				} else {
					alert("리뷰 작성자가 아닙니다");
				}
			}
		});
	}
	
	 $(document).ready(function(){		 
		 showReplyList();
		 	
	}); 
	 
	function showReplyList() {		
		
		if("<%=id%>" == ("")){			
			$.ajax({
				 type: "GET",
				 dataType : "json",
				 contentType: "application/json",
				 url: "${contextPath}/post/commentList.action?r_num=${r_num}", // r_num 입력받는 값으로 수정 요망
				 success:function(result){		
					 var output = "";
					 $(result).each(function(){							
						 output += "<li>";
						 output += "<div class= \"reviewer-img\">";
						 if(this.profileimage != null){
							 output += "<img src= \"/tmi/resources/tmi/profile/"+ this.profileimage  + "\" class=\"img-fluid\">" 
						 } if(this.profileimage == null){
							 output += "<img src= \"/tmi/resources/images/profile.png\" class=\"img-fluid\">" 
						 }
						 output += "<p>" + this.name + "</p>";
						 output += "</div>";
						 output += "<div class=\"customer-content-wrap\">";
						 output += "<div class=\"customer-content\">";
						 output += "<div class=\"customer-review\">";
						 output += "<p>" + this.p_created + "</p>";
						 output += "</div>";			
						 output += "<div class=\"customer-rating\" style=\"background-color:white;\">";
						 for(var i = 0; i<this.p_grade; i++){
							 output += "<p><i class=\"ion-ios-star\" style = \"color:#FFCD12;\" ></i></p>";
							 output += "&nbsp";
						 }					 
						 output += "</div>";
						 output += "</div>";
						 output += "<p class=\"customer-text\">" + this.p_content + "</p>";
						 output += "<div class=\"review-img\">";					
						 if(this.p_imagename!=null){
							 output += "<img src=\"/tmi/resources/tmi/review/" + this.p_imagename + "\">"
						 }
						 else if(this.p_imagename==null){
							 output += "<br/><br/>";
						 }
						 output += "</div><br/>";
						 output += "</div>"; 
						 output += "</li>";
						 output += "<br><hr>";					
					 });	
					 $("#customer-review-json").html(output);
				 },
					error : function(result) {
						alert(result);				
				}
			 });
		}
		
		else{
			$.ajax({
				 type: "GET",
				 dataType : "json",
				 contentType: "application/json",
				 url: "${contextPath}/post/commentList.action?r_num=${r_num}", // r_num 입력받는 값으로 수정 요망
				 success:function(result){		
					 var output = "";
					 $(result).each(function(){							
						 output += "<li>";
						 output += "<div class= \"reviewer-img\">";
						 if(this.profileimage != null){
							 output += "<img src= \"/tmi/resources/tmi/profile/"+ this.profileimage  + "\" class=\"img-fluid\">" 
						 } if(this.profileimage == null){
							 output += "<img src= \"/tmi/resources/images/profile.png\" class=\"img-fluid\">" 
						 }
						 output += "<p>" + this.name + "</p>";
						 output += "</div>";
						 output += "<div class=\"customer-content-wrap\">";
						 output += "<div class=\"customer-content\">";
						 output += "<div class=\"customer-review\">";
						 output += "<p>" + this.p_created + "</p>";
						 output += "</div>";				
						 output += "<div class=\"customer-rating\" style=\"background-color:white;\">";
						 for(var i = 0; i<this.p_grade; i++){
							 output += "<p><i class=\"ion-ios-star\" style = \"color:#FFCD12;\" ></i></p>";
							 output += "&nbsp";
						 }					 
						 output += "</div>";
						 output += "</div>";
						 output += "<p class=\"customer-text\">" + this.p_content + "</p>";
						 output += "<div class=\"review-img\">";
						 if(this.p_imagename!=null){
						 	output += "<img src=\"/tmi/resources/tmi/review/" + this.p_imagename + "\">"
						 }
						 else if(this.p_imagename==null){
							 output += "<br/><br/>";
						 }
						 if(this.email == "<%= id %>"){
							output += '<a href=\"javascript:void(0)\" style=\"margin-left: 490px;\" onclick=\"fn_deleteReply(' + this.p_num + ')\" >삭제</a>';	  
						 } 	 
						 output += "</div>"; 
						 output += "</li>";
						 output += "<br><hr>";					
					 });	
					 $("#customer-review-json").html(output);
				 },
					error : function(result) {
						alert(result);				
				}
			 });	
		}
	}
	
	function fn_review_add() {		
		
		var email = "<%=id%>";
		var p_content = $("#p_content").val();
		var p_grade = $("#p_grade").text();
		
		$("#p_grade2").val(p_grade);
		
		if(email == ""){
			location.href = "<%=cp%>/guest/commandCheck?r_num=${r_num}&inwon=${inwon}&startDate=${startDate}&endDate=${endDate}";
			return;
		}
		
		if(p_content == ""){
			alert("리뷰를 작성해주세요");
			$("#p_content").focus();
			return;
		}
		
		if(p_grade == 0){
			alert("평점을 매겨주세요");
			$("#p_grade").focus();
			return;
		}
		
		/* var paramData = JSON.stringify({
			"p_content": p_content, 
			"email": email, 
			"r_num" : ${r_num}, // 입력 받는 값으로 수정 요망
			"p_grade" : p_grade
		}); */
		
		var form = new FormData(document.getElementById("fool"));

		$.ajax({
			
			url : "/tmi/post/commentInsert.action", 
			data : form, 
            enctype : "multipart/form-data",
            type : "post",
            dataType : "text",
            processData: false, 
            contentType: false,                
            cache : false,
			success: function(result){
				showReplyList();
				$('#p_content').val('');
			}
			, error: function(error){
				alert("error:"+error);
			}
			
		});
		
	}
</script>
<body>
<!--  로딩창  -->
	<div class="preloader js-preloader">
		<img src="/tmi/resources/images/preloader.gif" alt="...">
	</div>

	<div class="page-wrapper fixed-footer" style="margin-bottom: 0px;">
		<!--header starts-->
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
									<a class="mobile-bar js-menu-toggle">
										<span class="ion-android-menu"></span>
									</a>
								</div>
								
					<!--  모바일 로그인  -->
								<div class="add-list float-right">
									<nav class="site-navigation float-left">
									<div class="container">
										<ul class="site-menu js-clone-nav d-none d-lg-block">
									<!--  로그인 아이콘 -->

										<c:if test="${empty sessionScope.guestInfo}">	
											<li class="has-children" style="padding: 0px; padding-top: 10px; padding-bottom: 10px;"><a class="btn v3" href="<%=cp%>/guest/loginForm" style="border-radius: 4px;">Login </a></li>
											<li class="has-children" style="padding: 0px; padding-top: 10px; padding-bottom: 10px;"><a class="btn v3" href="<%=cp%>/guest/register" style="border-radius: 4px;">Register </a></li>

										</c:if>
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
										<c:if test="${sessionScope.guestInfo.hostcheck eq 2}">	
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
                                    				<li><a href="<%=cp%>/main/admin">Admin&nbsp;&nbsp;&nbsp;&nbsp;<i class="ion-ios-person-outline"></i></a></li>
                                    				<li><a href="<%=cp%>/guest/logout">Logout&nbsp;&nbsp;&nbsp;&nbsp;<i class="ion-ios-upload-outline"></i></a></li>
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
		

	<!--  배경 이미지 -->
		<div class="listing-details-wrapper bg-h" style="background-image: url(/tmi/resources/tmi/room/${dtoR.r_mainimage })">
		
			<div class="overlay op-3"></div>
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="list-details-title v1">
							<div class="row">
				<!--  이미지 글 -->
								<div class="col-lg-6 col-md-7 col-sm-12">
									<div class="single-listing-title float-left">
										<p><a href="#" class="btn v6">${dtoM.cate_name }</a></p>
										<h2>${dtoR.r_name } <i class="icofont-tick-boxed"></i></h2>
										<p><i class="ion-ios-location"></i>${dtoM.m_addr }</p>
										<div class="list-ratings">
											<!-- 정수부분개수만큼 표시 -->
											<fmt:parseNumber var="i" value="${dtoR.r_grade }" integerOnly="true"/>
											<c:forEach begin="1" end="${i }">
												<span class="ion-android-star"></span>
											</c:forEach>
											<!-- 소수값이면 -->																							
											<c:if test="${(dtoR.r_grade mod 1) ne 0}">
												<span class="ion-android-star-half"></span>
											</c:if>										
											<a href="#">(${dtoR.reviewcount } Reviews)</a>
										</div>
									</div>
								</div>
					<!--  배경 버튼 -->
								<div class="col-lg-6 col-md-5 col-sm-12">
									<div class="list-details-btn text-right sm-left">
								<!--  save -->
										<div class="save-btn">
										<a onclick="addWishList(${dtoR.r_num});" class="btn v3 white"><i class="ion-heart"></i> WishList</a>
											<input type="hidden" id="email" value="${guestInfo.email }"/>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
<!--  메뉴  -->
		<div class="list-details-section section-padding">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-md-12">
					
				<!--  메뉴 카테고리(선택시 선택 화면 이동 -->
						<div id="list-menu" class="list_menu">
							<ul class="list-details-tab fixed_nav">
								<li class="nav-item active"><a href="#overview" class="active">Overview</a></li>
								<li class="nav-item"><a href="#gallery">Gallery</a></li>
								<c:if test="${!empty listOR }">
									<li class="nav-item"><a href="#rooms">Rooms</a></li>
								</c:if>
								<li class="nav-item"><a href="#reviews">Reviews</a></li>
								<li class="nav-item"><a href="#add_review">Add Review</a></li>
							</ul>
						</div>
						
				<!--  숙소 설명 -->
						<div class="list-details-wrap">
							<div id="overview" class="list-details-section">
								<h4>Overview</h4>
								<div class="overview-content">
									<p class="mar-bot-10">${dtoR.r_content }</p>									
								</div>
				<!--  편의사항, 사용공간 -->
								<div class="mar-top-20">
									<h6>Facility</h6>
									<ul class="listing-features">
										<li id="numf-1" value="1" style="display: none;"><i class="icofont-hotel"></i> 필수품목(수건,침대시트 등)</li>
										<li id="numf-2" value="2" style="display: none;"><i class="icofont-wifi"></i> Wi Fi</li>
										<li id="numf-3" value="3" style="display: none;"><i class="icofont-monitor"></i> TV</li>
										<li id="numf-4" value="4" style="display: none;"><i class="icofont-wind"></i> 에어컨</li>
										<li id="numf-5" value="5" style="display: none;"><i class="icofont-graffiti"></i> 샴푸</li>
										<li id="numf-6" value="6" style="display: none;"><i class="icofont-bathtub"></i> 스파가능</li>
										<li id="numf-7" value="7" style="display: none;"><i class="icofont-female"></i> 여성전용</li>
										<li id="numf-8" value="8" style="display: none;"><i class="icofont-keyboard-alt"></i> PC</li>
										<li id="numf-9" value="9" style="display: none;"><i class=icofont-bag-alt></i> 짐 보관</li>
										<li id="numf-10" value="10" style="display: none;"><i class="icofont-ui-cart"></i> 근처 편의점(50m)</li>
										<li id="numf-11" value="11" style="display: none;"><i class="icofont-capsule"></i> 상비약</li>
										<li id="numf-12" value="12" style="display: none;"><i class="icofont-building-alt"></i> 독채</li>
										<li id="numf-13" value="13" style="display: none;"><i class="icofont-hill-side"></i> 계곡인접</li>
										<li id="numf-14" value="14" style="display: none;"><i class="icofont-beach"></i> 해수욕장 인근</li>
										<li id="numf-15" value="15" style="display: none;"><i class="icofont-paw"></i> 동물 입실가능</li>
										<li id="numf-16" value="16" style="display: none;"><i class="icofont-fork-and-knife"></i> 조식 운영</li>
										<li id="numf-17" value="17" style="display: none;"><i class="icofont-sort"></i> 복층 구조</li>
									</ul>
								</div>
								
								<div class="mar-top-20">
									<h6>Available Space</h6>
									<ul class="listing-features">
										<li id="nums-1" value="1" style="display: none;"><i class="icofont-car-alt-1"></i> 주차장</li>
										<li id="nums-2" value="2" style="display: none;"><i class="icofont-ui-user-group"></i> 공용 거실</li>
										<li id="nums-3" value="3" style="display: none;"><i class="icofont-herbal"></i> 공용 주방</li>
										<li id="nums-4" value="4" style="display: none;"><i class="icofont-salt-and-pepper"></i> 기본 양념</li>
										<li id="nums-5" value="5" style="display: none;"><i class="icofont-dining-table"></i> 실내 취사</li>
										<li id="nums-6" value="6" style="display: none;"><i class="icofont-no-smoking"></i> 금연 객실</li>
										<li id="nums-7" value="7" style="display: none;"><i class="icofont-lighter"></i> 흡연 객실</li>
										<li id="nums-8" value="8" style="display: none;"><i class="icofont-not-allowed"></i> 흡연 구역 지정</li>
										<li id="nums-9" value="9" style="display: none;"><i class="icofont-swimmer"></i> 수영장 </li>
										<li id="nums-10" value="10" style="display: none;"><i class="icofont-field-alt"></i> 운동장 </li>
									
									</ul>
								</div>
							</div>
				<!--  숙소 이미지 -->
				<!-- 메인 이미지 및에 서브 이미지 링크 제거 -->
							<div id="gallery" class="list-details-section">
								<h4>Gallery</h4>
								<!--Carousel Wrapper-->
								<div id="carousel-thumb" class="carousel slide carousel-fade carousel-thumbnails list-gallery" data-ride="carousel">
									<!--Slides-->
									<div class="carousel-inner" role="listbox">
										<div class="carousel-item active">
											<img class="d-block w-100" src="/tmi/resources/tmi/room/${dtoR.r_mainimage }" alt="slide">
										</div>
										<c:forEach var="vo" items="${r_subimage }">
										<div class="carousel-item">
											<img class="d-block w-100" src="/tmi/resources/tmi/room/${vo }" alt="slide">
										</div>
										</c:forEach>
									</div>
									<!--Controls starts-->
									<a class="carousel-control-prev" href="#carousel-thumb" role="button" data-slide="prev">
										<span class="ion-arrow-left-c" aria-hidden="true"></span>
										<span class="sr-only">Previous</span>
									</a>
									<a class="carousel-control-next" href="#carousel-thumb" role="button" data-slide="next">
										<span class="ion-arrow-right-c" aria-hidden="true"></span>
										<span class="sr-only">Next</span>
									</a>
									<!--Controls ends-->
									<ol class="carousel-indicators  list-gallery-thumb">
										<li><img class="img-fluid d-block w-100" src="/tmi/resources/tmi/room/${dtoR.r_mainimage }"></li>
										<c:forEach var="i" begin="0" end="${fn:length(r_subimage)-1}">
										<li><img class="img-fluid d-block w-100" src="/tmi/resources/tmi/room/${r_subimage[i] }"></li>
										</c:forEach>
										<!-- 										
										<li data-target="#carousel-thumb" data-slide-to="2"><img class="img-fluid d-block w-100" src="/tmi/resources/images//single-listing/gallery-3.jpg" alt="..."></li>
										<li data-target="#carousel-thumb" data-slide-to="3"><img class="img-fluid d-block w-100" src="/tmi/resources/images//single-listing/gallery-4.jpg" alt="..."></li>
										<li data-target="#carousel-thumb" data-slide-to="7"><img class="img-fluid d-block w-100" src="/tmi/resources/images//single-listing/gallery-8.jpg" alt="..."></li>
										<li data-target="#carousel-thumb" data-slide-to="4"><img class="img-fluid d-block w-100" src="/tmi/resources/images//single-listing/gallery-5.jpg" alt="..."></li>
										<li data-target="#carousel-thumb" data-slide-to="5"><img class="img-fluid d-block w-100" src="/tmi/resources/images//single-listing/gallery-6.jpg" alt="..."></li>
										<li data-target="#carousel-thumb" data-slide-to="6"><img class="img-fluid d-block w-100" src="/tmi/resources/images//single-listing/gallery-7.jpg" alt="..."></li>
										 -->
									</ol>
								</div>
								<!--/.Carousel Wrapper-->
							</div>
							
			<!--  같은 건물 다른 숙소 -->						
							<div id="rooms" class="list-details-section mar-top-75">
							
							<c:if test="${!empty listOR }">
								<h4>Rooms</h4>
								<div class="room-type-wrapper">
								
								<c:forEach var="dto" items="${listOR }">
									<div class="room-type-item">
										<div class="row">
											<div class="col-md-4">
												<a href="images/category/hotel/single-room-1.jpg" data-lightbox="single-1">
													<img src="/tmi/resources/tmi/room/${dto.r_mainimage }">
												</a>
											</div>
											<div class="col-md-8">
												<div class="row">
													<div class="col-md-6">
														<div class="feature-left float-left">
															<a href="<%=cp%>/room/roomInfo?r_num=${dto.r_num}&inwon=${inwon}&startDate=${startDate}&endDate=${endDate}"><h3>${dto.r_name }</h3></a>
															<p>Max : <span> ${dto.r_inwon } Persons</span>
															</p>
															<div class="facilities-list">
																<ul>
																	<!-- <li><i class="icofont-wifi"></i><span>Free WiFi</span></li> -->
																	<li><i class="icofont-bathtub"></i><span>${dto.r_bath } Bathroom</span></li>
																	<li><i class="icofont-energy-air"></i><span>${dto.r_bed } Bed</span></li>
																	<li><i class="icofont-energy-air"></i><span>${dto.r_bedroom } Bedroom</span></li>
																</ul>
															</div>
														</div>
													</div>
													<div class="col-md-6">
														<div class="feature-right float-right">
															<span class="price-amt">${dto.r_price }￦</span>
															Total for 1 Night 2 Days
															<div class="clear"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>	

								</div>
							</c:if>
							
							</div>
																				
			<!--  리뷰 추가, 리뷰 입력 -->
			<form method="post" id="fool" class="contact-form" enctype="multipart/form-data">
				<input type="hidden" name="r_num" value="${r_num}">
					<div id="add_review" class="list-details-section" style="padding-top: 0;">
								<h4>Add Review</h4>	
									<h4 class="contact-form__title">
										Rate us and Write a Review
									</h4>
									<div class="row">
										<div class="col-md-6 col-sm-7 col-12">
											<p class="contact-form__rate">
												Your rating for this listing:
											</p>
											<p class="contact-form__rate-bx">
												<i class="ion-ios-star"></i>
												<i class="ion-ios-star"></i>
												<i class="ion-ios-star"></i>
												<i class="ion-ios-star"></i>
												<i class="ion-ios-star"></i>
											</p>
											<p class="contact-form__rate-bx-show">
												<input type="hidden" name="p_grade" id="p_grade2"/>
												<span class="rate-actual" id = "p_grade">0</span> / 5
											</p>
										</div>
										<div class="col-md-6 col-sm-5 col-12">
											<div class="contact-form__upload-btn xs-left">
												<input class="contact-form__input-file" type="file" name="photo-upload" id="photo-upload">
												<span>
													<i class="icofont-upload-alt"></i>
													Upload Photos
												</span>
											</div>
										</div>
									</div>
									<c:choose>
										<c:when test="${empty sessionScope.guestInfo }">
											<textarea class="contact-form__textarea" name="p_content" id="p_content" placeholder="로그인 후 이용하실 수 있습니다"></textarea>
										</c:when>
										<c:otherwise>
											<textarea class="contact-form__textarea" name="p_content" id="p_content" placeholder="Comment"></textarea>
										</c:otherwise>
									</c:choose>									
									<input class="btn v1" type="button" name="submit-contact" id="submit_contact" value="Submit" onclick="fn_review_add();">
								
								</div>
							</form>
						</div>
							
			<!--  리뷰  -->				
							<div id="reviews" class="list-details-section mar-top-10" style="padding-top: 30px;">
								<h4>Reviews</h4>
								<div class="review-box">
									<ul class="review_wrap">	
										<div class="customer-review_wrap" id = "customer-review-json">										
										</div>																																	
									</ul>
								</div>								
							</div>		
			<!--  리뷰 끝 -->
			
			<!-- 지도 출력 -->
			<br/><br/>
						<div id="map" class="sidebar-widget" style="width: 100%; height: 400px;"></div>
                        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d22647d29db96c2052b1b943e018aea5&libraries=services"></script>
                        <script>
                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                           mapOption = {
                           center : new kakao.maps.LatLng(37.5990998, 126.9861493), // 지도의 중심좌표
                           level : 6   // 지도의 확대 레벨
                           };
                                                               
                           // 지도를 생성합니다    
                           var map = new kakao.maps.Map(mapContainer, mapOption);
                                       
                           //------마커의 이미지 생성
                           var imageSrc = '/tmi/resources/images/others/Marker.png', // 마커이미지의 주소입니다    
                           imageSize = new kakao.maps.Size(20, 30), // 마커이미지의 크기입니다
                           imageOption = {offset: new kakao.maps.Point(20, 40)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
                                          
                           // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
                           var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
                                        
                           // 주소-좌표 변환 객체를 생성합니다
                           var geocoder = new kakao.maps.services.Geocoder();   
                           
                           //DB에서 가져온 주소를 배열로 만들기
                        
                              geocoder.addressSearch("${m_addr }", function(result, status) {
                                 
                              // 정상적으로 검색이 완료됐으면 
                              if (status === kakao.maps.services.Status.OK) {
                                 
                                 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                                 
                                 //마커 찍기
                                 var marker = new kakao.maps.Marker({
                                    map : map,
                                    position : coords,
                                    image: markerImage
                                 });
                              
                                 var activeId = null;
                                 var timeoutId = null;
                                 
                                 var content = document.createElement('div');
                                                              
                                 var overlay = new kakao.maps.CustomOverlay({
                                     content: content,
                                     map: map,
                                     position: marker.getPosition(),
                                     xAnchor: 0.6,   //좌우
                                     yAnchor: 0.00   //위아래
                                 });
                                 
                                 //overlay.setContent('<div style="background: #FFFFFF">'+"${m_name }"+'</div>');
                                 overlay.setContent('<div style="position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;">'
                                          +'<a style="display:block;text-decoration:none;color:#FFFFFF;text-align:center;border-radius:6px;font-size:20px;font-weight:bold;overflow:hidden;background: #6ae;background: #6ae no-repeat right 14px center;"'
                                          +'<span style="display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;">'
                                          +"${m_name }"+'</span>'+'</div>');
                                  overlay.setMap(map);
                                             
                                 }//if 끝
                  
                                 // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                 map.setCenter(coords);
                              
                              });
                                                 
                           </script>			
			<!--  근처 건물의 숙소 -->
                              
                  <div class="similar-listing">
                  <c:if test="${!empty listNR }">
                  
                     <div class="similar-listing-title">
                        <h3>Similar Listings</h3>
                     </div>
                     <div class="swiper-container similar-list-wrap">
                        <div class="swiper-wrapper">
                        
                           <c:forEach var="dto" items="${listNR }">
                              <div class="swiper-slide similar-item">
                                 <img src="/tmi/resources/tmi/room/main_image/${dto.r_mainimage }">
                                 <div class="similar-title-box">
                                    <h5><a href="<%=cp%>/room/roomInfo?r_num=${dto.r_num}&inwon=${inwon}&startDate=${startDate}&endDate=${endDate}">${dto.r_name }</a></h5>
                                    <p><span class="price-amt">${dto.r_price }￦</span></p>
                                 </div>
                                 <div class="customer-review">
                                    <div class="rating-summary">
                                       <div class="rating-result" title="60%">
                                          <ul class="product-rating">                                          
                                             <!-- 정수부분개수만큼 표시 -->
                                             <fmt:parseNumber var="i" value="${dto.r_grade }" integerOnly="true"/>
                                             <c:forEach begin="1" end="${i }">
                                                <li><i class="ion-android-star"></i></li>
                                             </c:forEach>
                                             <!-- 소수값이면 -->                                                                     
                                             <c:if test="${(dto.r_grade mod 1) ne 0}">
                                                <li><i class="ion-android-star-half"></i></li>
                                             </c:if>                                                                                    
                                          </ul>
                                       </div>
                                    </div>
                                    <p><i class="ion-ios-location"></i> ${dto.m_addr }</p>
                                 </div>
                              </div>
                           </c:forEach>
   
                        </div>
                     </div>
                     <div class="slider-btn v3 similar-next"><i class="ion-arrow-right-c"></i></div>
                     <div class="slider-btn v3 similar-prev"><i class="ion-arrow-left-c"></i></div>
                     
                  </c:if>   
                  </div>
                  
         <!--Similar Listing ends-->
					</div>
					
		<!--  오른쪽 예약창 -->
					<div class="col-lg-4 col-md-12">
						<div class="listing-sidebar">
						
					<!--  첫번째 박스, 방,체크인,체크아웃,인원 -->
					<form name="myForm" method="post">
							<div class="sidebar-widget info">
								<h3><i class="ion-android-calendar"></i>Booking</h3>
								<div class="row">									
							<!--  체크인, 체크아웃 -->
							<!-- DateFilter로 변경 -->
										<label>&nbsp;&nbsp;&nbsp;&nbsp;Date</label>
										<div class="col-lg-12 col-md-12">
											<input class="hero__form-input custom-select" style="align-content: center;" type="text" name="datefilter" 
											placeholder="BEGIN: ${startDate } - END: ${endDate }" value="BEGIN: ${startDate } - END: ${endDate }"/>
										</div>
										<br/><br/><br/>

						<!--  인원 -->
									<div class="col-md-6 mar-bot-15">
										<div class="book-amount">
											<label>People</label>
											<div class="input-group">
												<span class="input-group-btn">
													<button type="button" class="quantity-left-minus btn">
														<span class="ion-minus"></span>
													</button>
												</span>
												<input type="text" class="form-control input-number" name="inwon" value="${inwon }">
												<span class="input-group-btn">
													<button type="button" class="quantity-right-plus btn">
														<span class="ion-plus"></span>
													</button>
												</span>
											</div>
										</div>
									</div>
								</div>
								
								<input type="hidden" name="r_num" value="${r_num}">
								
						<!--  예약 버튼 -->
								<div class="book-btn text-center">
									<c:if test="${not empty sessionScope.guestInfo }">
										<a href="javascript:selectRoom()"> Request To Book</a>
									</c:if>
									<!-- 로그인 안될 시 로그인 페이지로 이동 -->
									<c:if test="${empty sessionScope.guestInfo }">
										<a href="javascript:seletRoomCheck(${r_num})"> Request To Book</a>
									</c:if>
								</div>
							</div>
				</form>			
				<!-- 호텔 정보, 건물주소, 호스트 전화, 호스트 이메일, 룸 인원, 룸 가격 -->
							<div class="sidebar-widget">
									<div class="business-title">
										<h6><i class="ion-android-globe"></i> Information</h6>
									</div>
								<div id="map"></div>
								<div class="address">
									<span class="ion-ios-location"></span>
									<p>Addr : &nbsp;${dtoM.m_addr }</p>
								</div>
								<div class="address">
									<span class="ion-ios-telephone"></span>
									<p>Tel : &nbsp;${dtoM.m_tel }</p>
								</div>
								<div class="address">
									<span class="ion-android-mail"></span>
									<p>E-mail : &nbsp;${dtoM.email }</p>
								</div>
								<div class="address">
									<span class="icofont-won"></span>
									<p>Price : &nbsp;${dtoR.r_price }&nbsp;&nbsp; (￦)</p>
								</div>
								<div class="address">
									<span class="ion-android-person"></span>
									<p>Adults : &nbsp;${dtoR.r_inwon }&nbsp;&nbsp; people</p>
								</div>
							</div>
							
					<!--  체크인 체크아웃 시간 -->
							<div class="sidebar-widget">
								<div class="business-time">
									<div class="business-title">
										<h6><i class="ion-android-alarm-clock"></i> Check Time</h6>
									</div>
									<ul class="business-hours">
										<li class="business-open">
											<span class="day">Check in</span>
											<div class="atbd_open_close_time">
												<span class="time">15:00 pm</span>
											</div>
										</li>
										<li class="business-open">
											<span class="day">Check Out</span>
											<div class="atbd_open_close_time">
												<span class="time">12:00 pm</span>
											</div>
										</li>

									</ul>
								</div>
							</div>
							
							<!-- Host 정보 -->
							<div class="sidebar-widget follow">
								<div class="business-title">
									<h6><i class="ion-android-globe"></i> Host</h6>
								</div>
								<div class="follow-img">
									<c:if test="${not empty dtoH.profileimage }">
										<img src="/tmi/resources/tmi/profile/${dtoH.profileimage }" class="img-fluid">
									</c:if>
									<c:if test="${empty dtoH.profileimage }">									
										<img src="/tmi/resources/images/profile.png" class="img-fluid">
									</c:if>
									<h6>${dtoH.name }</h6>									
								</div>
								<ul class="social-counts">
									<li>
										<h6>${postCount }</h6>
										<span>Reply</span>
									</li>
									<li>
										<h6>${roomCount }</h6>
										<span>RoomCount</span>
									</li>
								</ul>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		
<!--  맨 위로가기 버튼  -->
		<span class="scrolltotop"><i class="ion-arrow-up-c"></i></span>
	</div>
	
<!--  하단 메뉴 -->
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
							<c:if test="${empty sessionScope.guestInfo}">	
								<li><a class="link-hov style1" href="<%=cp%>/guest/loginForm" style="border-radius: 4px;">Login </a></li>
								<li><a class="link-hov style1" href="<%=cp%>/guest/register" style="border-radius: 4px;">Register </a></li>
							</c:if>
							<c:if test="${not empty sessionScope.guestInfo}">
							<c:if test="${sessionScope.guestInfo.hostcheck eq 0 || sessionScope.guestInfo.hostcheck eq 1}">
								<li ><a class="link-hov style1" href="<%=cp%>/guest/dashboard">My Page</a></li>	
                   				<li><a class="link-hov style1" href="<%=cp%>/guest/myProfile">My Profile&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                   				<li><a class="link-hov style1" href="<%=cp%>/guest/wishListForm">Wish List&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                   				<li><a class="link-hov style1" href="<%=cp%>/guest/addHost">Add Hosting&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                           	</c:if>
							<c:if test="${sessionScope.guestInfo.hostcheck eq 2}">	>
                     		 	 <li><a class="btn v3" href="<%=cp%>/main/admin">Admin</a></li>
							</c:if>
							</c:if>
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
	<!--Scripts starts-->
	<!--plugin js-->
	<script src="/tmi/resources/js/plugin.js"></script>
	<!--google maps-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_8C7p0Ws2gUu7wo0b6pK9Qu7LuzX2iWY&amp;libraries=places&amp;callback=initAutocomplete"></script>
	<!--Main js-->
	<script src="/tmi/resources/js/main.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<script type="text/javascript" src="<%=cp%>/resources/js/httpRequest.js"></script>
	<!-- 위시리스트 추가 -->
   <script type="text/javascript">
   function addWishList(r_num){

      var email = $("#email").val();   

      $.ajax({
         
         url: "http://183.99.243.229/tmi/mansion/addWishList",
         type: "POST",
         dataType: "text",
         data: {r_num : r_num,email : email},
         success: function(data){            
            if(data!=""){
               alert(data);
               if(data=="로그인을 해주세요"){                          
                  location.href = "<%=cp %>/guest/commandCheck?r_num=${r_num}&=${inwon}&startDate=${startDate}&endDate=${endDate}";                                                         
               }               
            }            
         }
         
      });
      
   }   
   </script>
   
   <!-- 예약버튼 누를 때 로그인 안되 있으면 블락 -->
   <script type="text/javascript">
   function seletRoomCheck(r_num){   
	  var email = $("#email").val();
	  
      $.ajax({
          url: "http://183.99.243.229/tmi/room/selectRoomCheck",
         type: "POST",
         dataType: "text",
         data: {r_num:r_num,email : email},
         success: function(data){            
            if(data!=""){
            	alert(data);
               if(data=="로그인을 해주세요"){                 	   
                  location.href = "<%=cp %>/guest/seletRoomCheck?r_num="+ r_num +"&inwon=${inwon}&startDate=${startDate}&endDate=${endDate}";                                                         
               }               
            }            
         }
         
      });
      
   }
 
   <!-- 예약 페이지 이동 -->
   function selectRoom (){
	      document.myForm.action = "<%=cp%>/book/bookCheck";
	      document.myForm.submit();
	   }
   
   <!-- Booking - date -datefilter 날짜달력  -->
   $(function() {
		
		var thisDate = new Date();
		var thisYear = thisDate.getFullYear();        //해당 연
	    var thisMonth = thisDate.getMonth() + 1;    //해당 월

	  $('input[name="datefilter"]').daterangepicker({
		  minDate: thisDate,
		  startDate: thisDate,
	      autoUpdateInput: false,
	      locale: {
	          cancelLabel: 'Clear'
	      }
	  });

	  $('input[name="datefilter"]').on('apply.daterangepicker', function(ev, picker) {
	      $(this).val('BEGIN: ' +picker.startDate.format('YYYY-MM-DD') + ' -  END: ' + picker.endDate.format('YYYY-MM-DD'));
	  });

	  $('input[name="datefilter"]').on('cancel.daterangepicker', function(ev, picker) {
	      $(this).val('');
	  });

	});
   
   
   <!-- 해당 룸의 roomsub, space 아이콘 띄움  -->
   function selectIcon() {
	   
	   var f_iconValues = [${facility}];
	   var s_iconValues = [${roomsub}];
	   
	   for(var j=0;j<17;j++){
	   
	   	for(var i=0;i<f_iconValues.length;i++){
		   	/* alert(f_iconValues[i]); */
		   	if(f_iconValues[i]==$("#numf-" + [j]).val()){
			   	$("#numf-" + [j]).attr('style',"display:block");
		   	}
	   	}
	   	
	   }
	   
	   for(var k=0;k<10;k++){
		   
		   	for(var l=0;l<s_iconValues.length;l++){
			   	/* alert(s_iconValues[l]); */
			   	if(s_iconValues[l]==$("#nums-" + [k]).val()){
				   	$("#nums-" + [k]).attr('style',"display:block");
			   	}
		   	}
		   	
		   }
	   
   }
   
   window.onload(selectIcon())

   </script>
	<!--Scripts ends-->
</body>

</html>
