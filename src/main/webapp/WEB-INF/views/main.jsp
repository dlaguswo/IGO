<%@page import="com.exe.tmi.guest.dto.GuestDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	
  	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  	
<style type="text/css">

body{
	font-family: 'Noto Sans KR', sans-serif;
}

.suggest{
	width: 350px;
	display: none;
	position: absolute;
	left: 11px;
	top: 60px;
	background: #ffffff;
	text-align: left;
	padding-left: 30px;
	z-index: 10;
}

#ami:hover{color:#6ae;}

input[type=checkbox] { display:none; }

input[type=checkbox] + label{ 
	
	cursor: pointer;
	margin-bottom: 0;
	border-radius: 4px;
	
}

input[type=checkbox]:checked + label { 
	background-image: url('/tmi/resources/images/on.jpg'); 
}
	
.padding-zero { padding: 0; }
	
.select-icon{color:#fff !important;}

</style>
	
	<!-- Document Title -->	
	<title>여행을 만드는 생각 - TMI</title>
		
</head>

<body>	

<!-- 로딩 -->
	<div class="preloader js-preloader">
		<img src="/tmi/resources/images/preloader.gif">
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
                                		 	 	<a class="btn v3" href="<%=cp%>/main/admin">
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
		
<!--  메인  -->
		<div class="hero v1 section-padding bg-zoom" style="background-image: url('/tmi/resources/images/alfs.jpg');">
			<div class="overlay op-3"></div>
			<div class="container">
				<div class="row">
			<!--  메인 이미지 글자 전환  -->
					<div class="col-md-12 text-center">
						<h1 class="hero__title places-tab">
							When's Your Travel Plan ?
						</h1>
						<h1 class="hero__title events-tab">
							Choose The Setting You Want.
						</h1>
		
						<p class="hero__description">
							All the top locations – from Hotel and Motel, Hosting Rooms and more...
						</p>
					</div>
					
			<!-- 검색창 -->
					<div class="col-md-12 text-center mar-top-20">
					
					<!--  검색 주제 -->
						<ul class="hero__list">
							<li class="hero__list-item">
								<a class="place active-list" style="cursor:pointer;">Places Search<i class="icofont-google-map" aria-hidden="true"></i></a>
							</li>
							<li class="hero__list-item">
								<a class="events"  style="cursor:pointer;">Detailed Search<i class="icofont-list"></i></a>
							</li>
						</ul>
						
					
						<form class="hero__form v1 bg-white" method="post" name="myForm" action="<%=cp%>/mansion/list">
							<div class="row">
					<!--  장소 -->
								<div class="col-lg-4 col-md-12">
									<input class="hero__form-input custom-select" type="text" name="userKeyword" id="project" placeholder="What are you looking for?" style="margin-top: 15px;"/>
									
									<div id="suggestDiv" class="suggest">
										<div id="suggestListDiv"></div>
									</div>
									
								</div>
								
					<!--  select문  -->
								<div class="col-lg-4 col-md-12">
									<input class="hero__form-input custom-select" type="text" name="datefilter" placeholder="Check IN 	Check Out" style="margin-top: 15px;"/>
								</div>
					<!--  select 문 -->
								 <div class="col-md-2" style="padding-top: 10px; padding-right: 0px;">
                                        <div class="book-amount">
                                            <div class="input-group">
                                            	<div style="padding-left: 10px;">
                                            		&nbsp;
                                            	</div>
                                                <span class="input-group-btn">
                                                    <button type="button" class="quantity-left-minus btn">
                                                        <span class="ion-minus"></span>
                                                    </button>
                                                </span>
                                                <input type="text" class="form-control input-number" name="inwon" value="2">
                                                <span class="input-group-btn">
                                                    <button type="button" class="quantity-right-plus btn">
                                                        <span class="ion-plus"></span>
                                                    </button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
					<!--  검색버튼 -->
								<div class="col-lg-2 col-md-12" style="padding-top: 15px; padding-right: 25px; padding-left: 0px;">
									<div class="submit_btn text-right md-left">
										<button class="btn v3 text-right" type="button" onclick="goDetail();"><i class="ion-search" aria-hidden="true"></i> Search</button>
									</div>
								</div>
							</div>
							
							<br/>
							
					<!--  이벤트 탭 -->
							<div class="events-tab" style="display: none;">
								<div class="col-md-12">
									<div class="hero-catagory-wrapper v1">
										
										<input type="hidden"  id="check" name="check">
										<a class="hero-category-content v1 padding-zero" style="cursor: pointer;">
										<input type="checkbox" id="check-1" value="1" name="check">
											<label class="padding-zero" for="check-1" style="padding: 30px;">
												<i class="icofont-hotel" id="icon-1"></i>
												<p class="name" id="ifont-1">필수품목</p>
												<p class="d-name">필수품목</p>					
											</label>
										</a>
										
										<a class="hero-category-content v1 padding-zero" style="cursor: pointer;">
										<input type="checkbox" id="check-2" value="2" name="check">
											<label class="padding-zero" for="check-2" style="padding: 30px;">
												<i class="icofont-wifi" id="icon-2"></i>
												<p class="name" id="ifont-2">Wifi</p>
												<p class="d-name">Wifi</p>					
											</label>
										</a>
								
										<a class="hero-category-content v1" style="cursor:pointer;">
											<input type="checkbox" id="check-4" value="4" name="check">
											<label class="padding-zero" for="check-4" style="padding: 30px;">
													<i class="icofont-wind" id="icon-4"></i>
													<p class="name" id="ifont-4">에어컨</p>		
													<p class="d-name">에어컨</p>						
											</label>
										</a>
								
										<a class="hero-category-content v1" style="cursor:pointer;">
											<input type="checkbox" id="check-6" value="7" name="check">
											<label class="padding-zero" for="check-6" style="padding: 30px;">
													<i class="icofont-bathtub" id="icon-6"></i>
													<p class="name" id="ifont-6">스파가능</p>								
													<p class="d-name">스파가능</p>
											</label>
										</a>
										
										<a class="hero-category-content v1" style="cursor:pointer;">
											<input type="checkbox" id="check-7" value="6" name="check">
											<label class="padding-zero" for="check-7" style="padding: 30px;">
													<i class="icofont-female" id="icon-7"></i>
													<p class="name" id="ifont-7">여성전용</p>		
													<p class="d-name">여성전용</p>							
											</label>
										</a>
										
										<a class="hero-category-content v1" style="cursor:pointer;">
											<input type="checkbox" id="check-8" value="8" name="check">
											<label class="padding-zero" for="check-8" style="padding: 30px;">
													<i class="icofont-computer" id="icon-8"></i>
													<p class="name" id="ifont-8">PC</p>
													<p class="d-name">PC</p>										
											</label>
										</a>
									</div>			
									<br/>
									<div class="hero-catagory-wrapper v1">
							
										<a class="hero-category-content v1" style="cursor:pointer;">
											<input type="checkbox" id="check-9" value="9" name="check">
											<label class="padding-zero" for="check-9" style="padding: 30px;">
													<i class="icofont-bag-alt" id="icon-9"></i>
													<p class="name" id="ifont-9">짐 보관</p>
													<p class="d-name">짐 보관</p>										
											</label>
										</a>

										<a class="hero-category-content v1" style="cursor:pointer;">
											<input type="checkbox" id="check-12" value="12" name="check">
											<label class="padding-zero" for="check-12" style="padding: 30px;">
													<i class="icofont-building-alt" id="icon-12"></i>
													<p class="name" id="ifont-12">독채</p>
													<p class="d-name">독채</p>						
											</label>
										</a>
										
										<a class="hero-category-content v1" style="cursor:pointer;">
											<input type="checkbox" id="check-16" value="16" name="check">
											<label class="padding-zero" for="check-16" style="padding: 30px;">
													<i class="icofont-fork-and-knife" id="icon-16"></i>
													<p class="name" id="ifont-16">조식운영</p>
													<p class="d-name">조식운영</p>										
											</label>
										</a>
										
										<input type="hidden"  id="check2" name="check2">
										
										<a class="hero-category-content v1" style="cursor:pointer;">
											<input type="checkbox" id="check-space-1" value="1" name="check2">
											<label class="padding-zero" for="check-space-1" style="padding: 30px;">
													<i class="icofont-car-alt-1" id="icon-space-1"></i>
													<p class="name" id="ifont-space-1">주차장</p>	
													<p class="d-name">주차장</p>				
											</label>
										</a>
										
										<a class="hero-category-content v1" style="cursor:pointer;">
											<input type="checkbox" id="check-space-5" value="5" name="check2">
											<label class="padding-zero" for="check-space-5" style="padding: 30px;">
													<i class="icofont-dining-table" id="icon-space-5"></i>
													<p class="name" id="ifont-space-5">실내취사</p>
													<p class="d-name">실내취사</p>										
											</label>
										</a>		
										
										<a class="hero-category-content v1" style="cursor:pointer;">
											<input type="checkbox" id="check-space-9" value="9" name="check2">
											<label class="padding-zero" for="check-space-9" style="padding: 30px;">
													<i class="icofont-swimmer" id="icon-space-9"></i>
													<p class="name" id="ifont-space-9">수영장</p>
													<p class="d-name">수영장</p>							
											</label>
										</a>
										
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			
			</div>
		</div>

<!--  이미지 출력 -->
		<div class="popular-catagory pad-bot-50 section-padding">
			<div class="container">
				<div class="row">
					<div class="col-md-8 offset-md-2 text-center">
						<h2 class="section-title v1">Explore Where To do</h2>
					</div>
					<div class="col-md-4">
						<div class="popular-catagory-content">
							<div class="popular-catagory-img">
								<img src="/tmi/resources/images/main/seoul.jpg" alt="hotel" class="img_fluid" >
							</div>
							<div class="cat-content">
								<h4 class="title">서울</h4>
								<input type="hidden" value="서울특별시" id="imageValue1"/>
								<span><a href="#" id="clickImage1" style="color: white;">Click to enter</a></span>
							</div>
						</div>
					</div>
					<div class="col-md-8">
						
						<div class="popular-catagory-content">
							<div class="popular-catagory-img">
								<img src="/tmi/resources/images/main/busan.jpg" alt="hotel" class="img_fluid" style="width:730px; height: 350px;">
							</div>
							<div class="cat-content">
								<h4 class="title">부산</h4>
								<input type="hidden" value="부산광역시" id="imageValue2"/>
								<span><a href="#" id="clickImage2" style="color: white;">Click to enter</a></span>
							</div>
						</div>
					</div>
					<div class="col-md-8">	
						<div class="popular-catagory-content">
							<div class="popular-catagory-img">
								<img src="/tmi/resources/images/main/gap.jpg" alt="restaurent" class="img_fluid" style="width:730px; height: 350px;">
							</div>
							<div class="cat-content">
								<h4 class="title">가평</h4>
								<input type="hidden" value="경기도 가평군" id="imageValue3"/>
								<span><a href="#" id="clickImage3" style="color: white;">Click to enter</a></span>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="popular-catagory-content">
							<div class="popular-catagory-img">
								<img src="/tmi/resources/images/main/gang.jpg" alt="hotel" class="img_fluid" >
							</div>
							<div class="cat-content">
								<h4 class="title">강릉</h4>
								<input type="hidden" value="강원도 강릉시" id="imageValue4"/>
								<span><a href="#" id="clickImage4" style="color: white;">Click to enter</a></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
<!--  인기 숙소 -->
		<div class="blog-posts v2 mar-bot-40 pad-top-60 section-padding">
			<div class="container">
				<div class="row">
					<div class="col-md-8 offset-md-2 text-center">
						<h2 class="section-title v1">Popular Posts</h2>
					</div>
				</div>
				<div class="row">
					
					<div class="col-lg-5 col-md-12" style="padding: 0px;">
					<c:forEach begin="0" end="0" var="dto" items="${lists }">
						<div class="single-blog-item v2">
							<img src="/tmi/resources/tmi/room/${dto.r_mainimage }" style="width: 475px; height: 310px;">
							<a href="#" class="blog-cat btn v6 red">${dto.cate_name }</a>
							<div class="blog-hover-content">
								<h3 class="blog-title"><a href="#" style="font-size: 21px;" id="search1">${dto.m_addr }</a></h3>
								<input type="hidden" value="${dto.m_addr }" id="searchValue1"/>
								<a href="/tmi/room/roomInfo?r_num=${dto.r_num }&inwon=2" class="btn v6">Go to search</a>
							</div>
						</div>
					</c:forEach>
					<c:forEach begin="1" end="1" var="dto" items="${lists }">

						<div class="single-blog-item v2">
							<img src="/tmi/resources/tmi/room/${dto.r_mainimage }" style="width: 475px; height: 310px;">
							<a href="#" class="blog-cat btn v6 red">${dto.cate_name }</a>
							<div class="blog-hover-content">
								<h3 class="blog-title"><a href="#" style="font-size: 21px;" id="search2">${dto.m_addr }</a></h3>
								<input type="hidden" value="${dto.m_addr }" id="searchValue2"/>
								<a href="/tmi/room/roomInfo?r_num=${dto.r_num }&inwon=2" class="btn v6">Go to search</a>
							</div>
						</div>
					</c:forEach>
					</div>
					
					
					
					
					<div class="col-lg-7 col-md-12">
						<div class="row">
						<c:forEach begin="2" end="2" var="dto" items="${lists }">
							<div class="col-lg-12 col-md-11">
								<div class="single-blog-item v2">
									<img src="/tmi/resources/tmi/room/${dto.r_mainimage }" style="width: 635px; height: 360px;">
									<a href="#" class="blog-cat btn v6 red">${dto.cate_name }</a>
									<div class="blog-hover-content">
										<h3 class="blog-title"><a href="#" style="font-size: 21px;" id="search3">${dto.m_addr }</a></h3>
										<input type="hidden" value="${dto.m_addr }" id="searchValue3"/>
										<a href="/tmi/room/roomInfo?r_num=${dto.r_num }&inwon=2" class="btn v6">Go to search</a>
									</div>
								</div>
							</div>
							</c:forEach>
							<c:forEach begin="3" end="3" var="dto" items="${lists }">
							<div class="col-md-6">
								<div class="single-blog-item v2">
									<img src="/tmi/resources/tmi/room/${dto.r_mainimage }" style="width: 300px; height: 258px;">
									<a href="#" class="blog-cat btn v6 red">${dto.cate_name }</a>
									<div class="blog-hover-content">
										<h3 class="blog-title"><a href="#" style="font-size: 15px;" id="search4">${dto.m_addr }</a></h3>
										<input type="hidden" value="${dto.m_addr }" id="searchValue4"/>
										<a href="/tmi/room/roomInfo?r_num=${dto.r_num }&inwon=2" class="btn v6">Go to search</a>
									</div>
								</div>
							</div>
							</c:forEach>
							<c:forEach begin="4" end="4" var="dto" items="${lists }">
							<div class="col-md-6">
								<div class="single-blog-item v2">
									<img alt="..." src="/tmi/resources/tmi/room/${dto.r_mainimage }" style="width: 300px; height: 258px;">
									<a href="#" class="blog-cat btn v6 red">${dto.cate_name }</a>
									<div class="blog-hover-content">
										<h3 class="blog-title"><a href="#" style="font-size: 15px;" id="search5">${dto.m_addr }</a></h3>
										<input type="hidden" value="${dto.m_addr }" id="searchValue5"/>
										<a href="/tmi/room/roomInfo?r_num=${dto.r_num }&inwon=2" class="btn v6">Go to search</a>
									</div>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
<!--  맨위로 가기 -->
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
								<li><a href="https://open.kakao.com/o/gwqk9rnc">문의 및 상담 &nbsp;<i class="icofont-kakaotalk"></i> </a></li>
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
	<!--Scripts ends-->	
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resources/js/httpRequest.js"></script>
<script src="/tmi/resources/js/maincheck.js"></script>

<!-- <input type="text" name="datefilter" value="" />
 -->
<script type="text/javascript">
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


$("#project").keyup(function(){
	
	var _userKeyword = $("#project").val();
	//alert(_userKeyword);
	$.ajax({
		url : "/tmi/main/err",
		type : "POST",
		dataType : "text",
		data : {userKeyword : _userKeyword},
		success : function(data){
				
			
			if(data!=""){
				var dataCount = data.split(",").length;
				//alert(dataCount);
				var list = [];
			
				for(var i=0;i<dataCount-1;i++){
				
					list = data.split(",");
				//alert(list[i]);
				}
				list.pop();
			
			//alert(list.length);
			var html="<br/>";
			
			for(var i=0;i<list.length;i++){
				
				html += "<a href=\"javascript:select('" + list[i] + "');\" id='ami'><b>" + list[i] + "</b></a><br/><br/>";
				//<a href="javascript:select('수지');">수지</a><br/>
			
			}
			
			html+="<br/>";
			
			var suggestListDiv = document.getElementById("suggestListDiv");
			
			suggestListDiv.innerHTML = html;
			
			show();
			//alert(data);
			//select(data);
			//$("#displayResult1").val(data);
				
		}else if(data==""){
			
			hide();
		}
		},
			error : function(request,status,error){
			alert("(code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error+")");
		}
	});
});

function select(selectKeyword){
	document.myForm.userKeyword.value = selectKeyword;
	hide();
}

function show(){
	
	var suggestDiv = document.getElementById("suggestDiv");
	suggestDiv.style.display ="block";
}


function hide(){
	
	var suggestDiv = document.getElementById("suggestDiv");
	suggestDiv.style.display ="none";
}

function goDetail(){
	
	var userKeyword = document.myForm.userKeyword.value;
	var datefilter = document.myForm.datefilter.value;
	var inwon = document.myForm.inwon.value;
	
	if(!userKeyword){
		alert("지역을 선택해 주세요!!");
		document.myForm.userKeyword.focus();
		return;
	}
	
	if(!datefilter){
		alert("날짜를 선택해 주세요!!");
		document.myForm.datefilter.focus();
		return;
	}
	
	if(!inwon){
		alert("지역을 선택해 주세요!!");
		document.myForm.inwon.focus();
		return;
	}
	
	if(check){
		
		// ajax option    
        var checkboxValues = [];
        $("input[name='check']:checked").each(function(){
        	checkboxValues.push($(this).val());
        });
        
        var checkboxValues2 = [];
        $("input[name='check2']:checked").each(function(){
        	checkboxValues2.push($(this).val());
        });
        
        $("#check").val(checkboxValues);
        $("#check2").val(checkboxValues2);
        
        
	}
	
	document.myForm.action = "<%=cp%>/mansion/list";
	document.myForm.submit();
	
}
// 이미지 셀렉트
$("#clickImage1").click(function(){
	var imageValue1 = $("#imageValue1").val();
	$("#project").val(imageValue1);
});
$("#clickImage2").click(function(){
	var imageValue2 = $("#imageValue2").val();
	$("#project").val(imageValue2);
});
$("#clickImage3").click(function(){
	var imageValue3 = $("#imageValue3").val();
	$("#project").val(imageValue3);
});
$("#clickImage4").click(function(){
	var imageValue4 = $("#imageValue4").val();
	$("#project").val(imageValue4);
});

$("#search1").click(function(){
	var searchValue = $("#searchValue1").val();
	$("#project").val(searchValue);
});

$("#search2").click(function(){
	var searchValue2 = $("#searchValue2").val();
	$("#project").val(searchValue2);
});

$("#search3").click(function(){
	var searchValue3 = $("#searchValue3").val();
	$("#project").val(searchValue3);
});

$("#search4").click(function(){
	var searchValue4 = $("#searchValue4").val();
	$("#project").val(searchValue4);
});

$("#search5").click(function(){
	var searchValue5 = $("#searchValue5").val();
	$("#project").val(searchValue5);
});

window.onload = function(){
	hide();
}

</script> 	
</body>
</html>
