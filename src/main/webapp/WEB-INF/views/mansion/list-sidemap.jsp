<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%

	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	Object guestInfo = session.getAttribute("guestInfo");
	
	String startDate = (String)session.getAttribute("startDate");
	String endDate = (String)session.getAttribute("endDate");
	String inwon = (String)session.getAttribute("inwon");
	
	String check1 = request.getParameter("check1");
%>

<!DOCTYPE html>
<html dir="ltr" lang="UTF-8">

<head>
	<!-- Metas -->
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="author" content="LionCoders" />
	<!-- Links -->
	<link rel="icon" type="image/png"/>
	<!-- google fonts-->
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800" rel="stylesheet">
	<!-- Plugins CSS -->
	<link href="/tmi/resources/css/plugin.css" rel="stylesheet" />
	<!-- style CSS -->
	<link href="/tmi/resources/css/style.css" rel="stylesheet" />
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
	
	<style type="text/css">
	.roomimg{
	height: 400px;
	}
	</style>
	
	<script type="text/javascript">
	/* 별점 checkbox 중복체크 안되도록 */
	$(document).ready(function() {
		
	    $('input[type="checkbox"][name="check1"]').click(function(){
	        //클릭 이벤트 발생한 요소가 체크 상태인 경우
	        if ($(this).prop('checked')) {
	            //체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
	            $('input[type="checkbox"][name="check1"]').prop('checked', false);
	            $(this).prop('checked', true);
	        }
	    });
	    
	});
	
	
	<!-- 메인에서 아이콘 상세 검색시 조건에 맞는 체크박스 체크  -->
	function check () {
		<!-- facility -->
		var checkboxValues = [${check}];
		<!-- roomsub -->
		var checkboxValues2 = [${check2}];		
		<!-- facility -->
		for(var i=0;i<checkboxValues.length;i++){		
			$("input:checkbox[id='checkf-"+ checkboxValues[i] +"']").prop("checked", true);
			
		}
		<!-- roomsub -->
		for(var i=0;i<checkboxValues2.length;i++){
			/* $("input:checkbox[id='remember']").prop("checked", true); */
				
			$("input:checkbox[id='checks-"+ checkboxValues2[i] +"']").prop("checked", true);
			
		}
		
		<!-- 별점 -->
		var checkStar = '<%=check1 %>';
		if(checkStar!=""){
			$("input:checkbox[id='check-"+ checkStar +"']").prop("checked", true);
		}
		
	}
	</script>

</head>

<body>
	<!-- 로딩창  -->
	<div class="preloader js-preloader">
		<img src="/tmi/resources/images/preloader.gif">	
	</div>
	
<!-- 배너 DIV -->
	<div class="page-wrapper">
		<!--header starts-->
		<header class="header-fixed">
			<!--Main Menu starts-->
			<div class="site-navbar-wrap v2">
				<div class="container-fluid">
					<div class="site-navbar">
						<div class="row align-items-center">
						
					<!--  로고  -->
							<div class="col-md-4 col-6">
								<a class="navbar-brand" href="<%=cp %>/main/ok"><img src="/tmi/resources/images/logo-black.png" alt="logo" class="img-fluid" style="max-width: 250px"></a>
							</div>
					<!--  배너 -->
							<div class="col-md-8 col-6">
								<nav class="site-navigation float-left">
									<div class="container">
									
									</div>
								</nav>
								<div class="d-lg-none sm-right">
									<a href="#" class="mobile-bar js-menu-toggle">
										<span class="ion-android-menu"></span>
									</a>
								</div>
								
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
						</div>
					</div>
					
					<!-- 모바일로 봤을 경우  -->
					<div class="site-mobile-menu">
						<div class="site-mobile-menu-header">
							<div class="site-mobile-menu-close  js-menu-toggle">
								<span class="ion-ios-close-empty"></span>
							</div>
						</div>
						<div class="site-mobile-menu-body"></div>
					</div>
					<!-- -->
					
				</div>
			</div>
			
		<!-- Main Menu ends-->
		</header>
		<!--Header ends-->
		<!--Listing section starts-->
		<div class="filter-wrapper style1 mar-top-100 half-map">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-7 col-md-12">
					
					<form action="" name="searchForm" method="post">
					
						<div class="form-group filter-group">
				<!--  검색창, looking for~, location, -->
							<div class="row">								
								<div class="col-md-6  col-12">
									<input type="text" class="form-control filter-input" style="margin-top: 0px;" id="searchValue1" name="searchValue1" value="${searchValue1 }" placeholder="${searchValue1 }">
								</div>
				<!--  상세 검색 설정 -->
								<div class="col-md-6  col-12">
									<div class="filter-sub-menu style1">
										<ul>
											<li class="has-sub"><a href="# ">More Filters</a>
												<ul class="explore__form-checkbox-list half-filter">
													<div class="filter-checkbox">
														<p>Sort By Facilities</p>
														<li><input id="checkf-1" type="checkbox" name="check" value="1">
															<label for="checkf-1">필수품목</label></li>
														<li><input id="checkf-2" type="checkbox" name="check" value="2">
															<label for="checkf-2">WIFI</label></li>
														<li> <input id="checkf-3" type="checkbox" name="check" value="3">
															<label for="checkf-3">TV</label></li>
														<li><input id="checkf-4" type="checkbox" name="check" value="4">
															<label for="checkf-4">에어컨</label></li>
														<li><input id="checkf-5" type="checkbox" name="check" value="5">
															<label for="checkf-5">샴푸</label></li>
														<li><input id="checkf-6" type="checkbox" name="check" value="6">
															<label for="checkf-6">여성전용</label></li>
														<li><input id="checkf-7" type="checkbox" name="check" value="7">
															<label for="checkf-7">스파가능</label></li>														
														<li><input id="checkf-8" type="checkbox" name="check" value="8">
															<label for="checkf-8">PC</label></li>
														<li><input id="checkf-9" type="checkbox" name="check" value="9">
															<label for="checkf-9">짐보관</label></li>
														<li><input id="checkf-10" type="checkbox" name="check" value="10">
															<label for="checkf-10">근처 편의점(50M)</label></li>
														<li><input id="checkf-11" type="checkbox" name="check" value="11">
															<label for="checkf-11">상비약</label></li>
														<li><input id="checkf-12" type="checkbox" name="check" value="12">
															<label for="checkf-12">독채</label></li>
														<li><input id="checkf-13" type="checkbox" name="check" value="13">
															<label for="checkf-13">계곡인접</label></li>	
														<li><input id="checkf-14" type="checkbox" name="check" value="14">
															<label for="checkf-14">해수욕장인근</label></li>	
														<li><input id="checkf-15" type="checkbox" name="check" value="15">
															<label for="checkf-15">동물입실가능</label></li>	
														<li><input id="checkf-16" type="checkbox" name="check" value="16">
															<label for="checkf-16">조식운영</label></li>	
														<li><input id="checkf-17" type="checkbox" name="check" value="17">
															<label for="checkf-17">복층구조</label></li>
													</div>
													<div class="filter-checkbox">
															<p>Sort By Ratings</p>
															<div>
																<input id="check-5" type="checkbox" name="check1" value="5" onclick="CheckStar(this)">
																<label for="check-5">
																</label>
																<div class="list-ratings">
																	<span class="ion-android-star"></span>
																	<span class="ion-android-star"></span>
																	<span class="ion-android-star"></span>
																	<span class="ion-android-star"></span>
																	<span class="ion-android-star"></span>
																</div>
															</div>
															<div>
																<input id="check-4" type="checkbox" name="check1" value="4" onclick="CheckStar(this)">
																<label for="check-4">
																</label>
																<div class="list-ratings">
																	<span class="ion-android-star"></span>
																	<span class="ion-android-star"></span>
																	<span class="ion-android-star"></span>
																	<span class="ion-android-star"></span>
																	<span class="ion-android-star-outline"></span>
																</div>
															</div>
															<div>
																<input id="check-3" type="checkbox" name="check1" value="3" onclick="CheckStar(this)">
																<label for="check-3">
																</label>
																<div class="list-ratings">
																	<span class="ion-android-star"></span>
																	<span class="ion-android-star"></span>
																	<span class="ion-android-star"></span>
																	<span class="ion-android-star-outline"></span>
																	<span class="ion-android-star-outline"></span>
																</div>
															</div>
															<div>
																<input id="check-2" type="checkbox" name="check1"  value="2" onclick="CheckStar(this)">
																<label for="check-2">
																</label>
																<div class="list-ratings">
																	<span class="ion-android-star"></span>
																	<span class="ion-android-star"></span>
																	<span class="ion-android-star-outline"></span>
																	<span class="ion-android-star-outline"></span>
																	<span class="ion-android-star-outline"></span>
																</div>
															</div>
															<div>
																<input id="check-1" type="checkbox" name="check1"  value="1" onclick="CheckStar(this)">
																<label for="check-1">
																</label>
																<div class="list-ratings">
																	<span class="ion-android-star"></span>
																	<span class="ion-android-star-outline"></span>
																	<span class="ion-android-star-outline"></span>
																	<span class="ion-android-star-outline"></span>
																	<span class="ion-android-star-outline"></span>
																</div>
															</div>
													</div>
													<div class="filter-checkbox">
														<p>Sort By Space</p>
														<input id="checks-1" type="checkbox" name="check2" value="1">
														<label for="checks-1">주차장</label>
														<input id="checks-2" type="checkbox" name="check2" value="2">
														<label for="checks-2">공용거실</label>
														<input id="checks-3" type="checkbox" name="check2" value="3">
														<label for="checks-3">공용주방</label>
														<input id="checks-4" type="checkbox" name="check2" value="4">
														<label for="checks-4">기본양념</label>
														<input id="checks-5" type="checkbox" name="check2" value="5">
														<label for="checks-5">실내취사</label>
														<input id="checks-6" type="checkbox" name="check2" value="6">
														<label for="checks-6">금연객실</label>
														<input id="checks-7" type="checkbox" name="check2" value="7">
														<label for="checks-7">흡연객실</label>
														<input id="checks-8" type="checkbox" name="check2" value="8">
														<label for="checks-8">흡연구역</label>
														<input id="checks-9" type="checkbox" name="check2" value="9">
														<label for="checks-9">수영장</label>
														<input id="checks-10" type="checkbox" name="check2" value="10">
														<label for="checks-10">운동장</label>
													</div>
												</ul>
											</li>
										</ul>
									</div>
								</div>
								
					<!-- 카테고리 -->
								<div class="col-md-12  col-12">
									<select class="filter-input" name="searchValue2" id="option-select" style="display: none;">
										<option value="0" selected="selected">Category</option>
										<option value="1">호텔</option>
										<option value="2">모텔</option>
										<option value="3">펜션</option>
										<option value="4">아파트</option>
										<option value="5">주택</option>
										<option value="6">게스트하우스</option>
									</select>
								</div>
								
					<!--  검색 범위 조절  -->
								<div class="col-md-12">
									<div class="filter-sub-area style1">
										<div class="filter-title  mar-top-20 mar-bot-15">
											<p>Choose Price : <span><input type="text" id="amount" readonly="readonly" onfocus="this.blur()"></span></p>
											<input type="hidden" id="minPrice" name="minPrice" value="${minPrice }"/>
											<input type="hidden" id="maxPrice" name="maxPrice" value="${maxPrice }"/>
											<%-- <c:if test="${empty maxPrice}">
											<input type="hidden" id="maxPrice" name="maxPrice" value="300000"/>
											</c:if>
											<c:if test="${not empty maxPrice}">
											<input type="hidden" id="maxPrice" name="maxPrice" value=""/>
											</c:if> --%>
										</div>
										<div id="slider-range" class="price-range mar-bot-40"></div>
									</div>
								</div>
			
					<!--  상세검색 적용 다시 검색 -->
								
								<!-- 메인 검색에서 넘어온 값 -->
								<input type="hidden" name="inwon" value="${inwon }"/>
								<input type="hidden" name="startDate" value="${startDate }"/>
								<input type="hidden" name="endDate" value="${endDate }"/>								
								<input type="hidden" id="email" value="${guestInfo.email }"/>
			
								<div class="col-md-6  col-12 text-right sm-left">
									<a onclick="value();" class="btn v1 mar-top-10">Apply</a>							
								</div>
							</div>
						</div>
					
					<script type="text/javascript">
					
					function value() {
						document.searchForm.action = "<%=cp%>/mansion/reList";
						document.searchForm.submit();
					}
					
					function CheckStar(a){
				        var obj = document.getElementsByName("check1");
				        for(var i=0; i<obj.length; i++){
				            if(obj[i]!= a){
				                obj[i].checked = false;
				            }
				        }
				    }
					
					</script>
					
					</form>
					
						
						
			<!--  그리드, 리스트 선택 아이콘 -->					
						<div class="row mar-top-25 pad-bot-30 align-items-center">
							<div class="col-lg-4 col-sm-4 col-12">
								<div class="item-view-mode res-box">
									<!-- item-filter-list start -->
									<ul class="nav item-filter-list" role="tablist">
										<li class="active"><a class="active" data-toggle="tab" href="#grid-view"><i class="ion-grid"></i></a></li>
										<li><a data-toggle="tab" href="#list-view"><i class="ion-ios-list"></i></a></li>
									</ul>
									<!-- item-filter-list end -->
								</div>
							</div>
							
				<!--  현재 리스트페이지, 총 검색 갯수 -->
							<div class="col-lg-8 col-sm-8 col-12">
								<div class="item-element res-box  text-right xs-left">
									<p>Showing <span>${fn:length(roomList)}</span> Rooms</p>
								</div>
							</div>
						</div>
						
						<div class="item-wrapper">
							<div class="tab-content">
							
					<!--  그리드 선택시 나오는 리스트  (왼쪽 아이콘),  6개 씩 출력 -->
								<div id="grid-view" class="tab-pane active  product-grid">
									<div class="row">
									
						<!--  리스트 1 , Hotel-->
						<c:forEach var="dto" items="${roomList}">
										<div class="col-xl-6 col-lg-12">
											<div class="trending-place-item">
												<div class="trending-img">
														<a href="<%=cp%>/room/roomInfo?r_num=${dto.r_num}&inwon=${inwon}&startDate=${startDate}&endDate=${endDate}">
															<img src="/tmi/resources/tmi/room/${dto.r_mainimage }" class="roomimg">
														</a>
													<span class="trending-rating-green">${dto.hitcount }</span>
													
													<c:if test="${empty dto.wishList }">
														<span class="save-btn" onclick="addWishList(${dto.r_num },'${searchValue1}','${searchValue2}');"><i class="icofont-heart"></i></span>
													</c:if>
													
													<c:if test="${not empty dto.wishList }">
														<span class="save-btn" style="background-color: #6ae;" onclick="addWishList(${dto.r_num },'${searchValue1}');"><i class="icofont-heart"></i></span>
													</c:if>
													
																										
												</div>
												<div class="trending-title-box">
													<h4><a href="<%=cp%>/room/roomInfo?r_num=${dto.r_num}&inwon=${inwon}&startDate=${startDate}&endDate=${endDate}">${dto.r_name }</a></h4>
													<div class="customer-review">
														<div class="rating-summary float-left">
															<div class="rating-result" title="60%">
																<!-- 별점 -->
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
														<div class="review-summury float-right">
															<p><a href="#">${dto.p_count } Reviews</a></p>
														</div>
													</div>
													<ul class="trending-address">
														<li><i class="ion-ios-location"></i>
															<p>${dto.m_addr }</p>
														</li>
														<li><i class="ion-ios-telephone"></i>
															<p>${dto.m_tel }</p>
														</li>
														<li><i class="ion-android-globe"></i>
															<p>${dto.email }</p>
														</li>
													</ul>
													<div class="trending-bottom mar-top-15 pad-bot-30">
														<div class="trend-left float-left">
															<span class="round-bg pink"><i class="icofont-hotel"></i></span>
															<p>${dto.cate_name }</p>																														
														</div>
														<div class="trend-right float-right">
															<div class="trend-open"><i class="ion-clock"></i>
																Open <p>till 15:00PM</p>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
					</c:forEach>
					<!-- 리스트 end -->
					
									</div>
								</div>
								
			<!-- 리스트 뷰 (오른쪽 아이콘) , 4개 출력 -->
								<div id="list-view" class="tab-pane product-list">
								
							<!--  리스트 2 -->
							<c:forEach var="dto" items="${roomList }">
									<div class="row trending-place-item">
										<div class="col-md-6 no-pad-lr">
											<div class="trending-img roomimg">
												<img src="/tmi/resources/images/room/${dto.r_mainimage }">
												<span class="trending-rating-green">${dto.hitcount }</span>
												
												<c:if test="${empty dto.wishList }">
														<span class="save-btn" onclick="addWishList(${dto.r_num },'${searchValue1}','${searchValue2}');"><i class="icofont-heart"></i></span>
													</c:if>
													
													<c:if test="${not empty dto.wishList }">
														<span class="save-btn" style="background-color: #6ae;" onclick="addWishList(${dto.r_num },'${searchValue1}','${searchValue2}');"><i class="icofont-heart"></i></span>
													</c:if>
												
											</div>
										</div>
									
										<div class="col-md-6 no-pad-lr">
											<div class="trending-title-box">
												<h4><a href="<%=cp%>/room/roomInfo?r_num=${dto.r_num}&inwon=${inwon}&startDate=${startDate}&endDate=${endDate}">${dto.r_name }</a></h4>
												<div class="customer-review">
													<div class="rating-summary float-left">
														<div class="rating-result" title="60%">
															<!-- 별점 -->
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
													<div class="review-summury float-right">
														<p><a href="#">${dto.p_count } Reviews</a></p>
													</div>
												</div>
												<ul class="trending-address">
													<li><i class="ion-ios-location"></i>
														<p>${dto.m_addr }</p>
													</li>
													<li><i class="ion-ios-telephone"></i>
														<p>${dto.m_tel }</p>
													</li>
													<li><i class="ion-android-globe"></i>
														<p>${dto.email } </p>
													</li>
												</ul>
												<div class="trending-bottom mar-top-15 pad-bot-30">
													<div class="trend-left float-left">														
														<span class="round-bg pink"><i class="icofont-hotel"></i></span>
														<p>${dto.cate_name }</p>
													</div>
													<div class="trend-right float-right">
														<div class="trend-open"><i class="ion-clock"></i>
															Open <p>till 15.00pm</p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							<!--  리스트 1 끗 -->
								</div>
								

							</div>
						</div>
					
					</div>
					
			<!--  맵 오른쪽. -->
					<div class="explore__map-side">
						<div id="map" style="width: 100%; height: 100%;"></div>						
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d22647d29db96c2052b1b943e018aea5&libraries=services"></script>
						<script type="text/javascript">
                                    
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
                        <c:forEach var="dto" items="${roomList}">
                     
                           geocoder.addressSearch("${dto.m_addr}", function(result, status) {
                              
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
                              
                              //마우스 올라왔을때
                              var mouseOverHandler = function() {
                                    if (timeoutId !== null && "${dto.m_addr}" === activeId) {
                                        window.clearTimeout(timeoutId);
                                        timeoutId = null;
                                        return;
                                    }
                                    
                                    overlay.setContent('<div style="position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;">'
                                    +'<a style="display:block;text-decoration:none;color:#FFFFFF;text-align:center;border-radius:6px;font-size:20px;font-weight:bold;overflow:hidden;background: #6ae;background: #6ae no-repeat right 14px center;"'
                                    +'<span style="display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;">'
                                    +"${dto.m_name}"+'</span>'+'</div>');           
                                    
                                    overlay.setMap(map);
                                    activeId = "${dto.m_addr}";
                                };
                                
                                //마우스 올려지지 않았을때
                                var mouseOutHandler = function() {
                                    timeoutId = window.setTimeout(function() {
                                        overlay.setMap(null);
                                        activeId = null;
                                        timeoutId = null;
                                    }, 50);
                                };
                              
                              kakao.maps.event.addListener(marker, 'mouseover', mouseOverHandler);
                              kakao.maps.event.addListener(marker, 'mouseout', mouseOutHandler);
                              kakao.maps.event.addListener(marker, 'click', function(mouseEvent) {
                                 //click하면 그 방의 상세페이지로 이동함
                              location.href = "<%=cp%>/room/roomInfo?r_num=${dto.r_num}&inwon=${inwon}&startDate=${startDate}&endDate=${endDate}";
                           });
                               
                                             
                              }//if 끝
               
                              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                              map.setCenter(coords);
                           
                           });
                                             
                        </c:forEach>
         
                     </script>
					</div>
				</div>
			</div>
		</div>
		<!--Listing section ends-->
		<!-- Scroll to top starts-->
		<span class="scrolltotop"><i class="ion-arrow-up-c"></i></span>
		<!-- Scroll to top ends-->
	</div>
	<!--Page Wrapper ends-->
	<!--Scripts starts-->
	<!--plugin js-->
	<script src="/tmi/resources/js/plugin.js"></script>
	<!--google maps-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_8C7p0Ws2gUu7wo0b6pK9Qu7LuzX2iWY&amp;libraries=places&amp;callback=initAutocomplete"></script>
	<!--Markercluster js-->
	<script src="/tmi/resources/js/markerclusterer.js"></script>
	<!--Maps js-->
	<script src="/tmi/resources/js/maps.js"></script>
	<!--Infobox js-->
	<script src="/tmi/resources/js/infobox.min.js"></script>
	<!--Main js-->
	<script src="/tmi/resources/js/main.js?v=<%=System.currentTimeMillis() %>"></script>
	<!-- 위시리스트 추가 -->
   <script type="text/javascript">
   
   function addWishList(r_num,searchValue1,searchValue2){
      var email = $("#email").val();      
      $.ajax({
         
         url: "http://183.99.243.229/tmi/mansion/addWishList",
         type: "POST",
         dataType: "text",
         data: {r_num:r_num, searchValue1: searchValue1, email : email, searchValue2 : searchValue2},
         success: function(data){            
            if(data!=""){
               alert(data);
               if(data=="로그인을 해주세요"){               
            	   
                  location.href = "<%=cp %>/guest/commandCheck2?r_num="+ r_num +"&inwon=${inwon}&startDate=${startDate}&endDate=${endDate}&searchValue1="+ searchValue1 +"&searchValue2="+ searchValue2 +"&minPrice=${minPrice}&maxPrice=${maxPrice}";                                                         
               }else if(data=="이미 추가된 방입니다!"){
            	   
               }else {
            	   
            	   location.href="<%=cp%>/mansion/reList?inwon=${inwon}&startDate=${startDate}&endDate=${endDate}&searchValue1="+ searchValue1 +"&searchValue2="+ searchValue2 +"&minPrice=${minPrice}&maxPrice=${maxPrice}";
               }               
            }            
         }
         
      });
      
   }
   window.onload = function (){   
	   check();
   }
   </script>
	
	<!--Scripts ends-->
</body>
</html>
