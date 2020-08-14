<%@ page contentType="text/html; charset=UTF-8"%>
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
	
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<style type="text/css">
	body{
	font-family: 'Noto Sans KR', sans-serif;
	}
	</style>
	
	<!-- Document Title -->
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
    <script src="http://code.jquery.com/jquery.js"></script>
	<title>여행을 만드는 생각 - TMI</title>
	
	<style type="text/css">
		.coupon{
			width: 350px;
			display: none;
			position: absolute;
			left: 11px;
			top: 442px;
			background: #ffffff;
			text-align: left;
			padding-left: 30px;
			z-index: 10
		}
	#ami:hover{color:#6ae;}
	</style>
</head>

<script type="text/javascript">

<!-- 쿠폰 마우스 이벤트 올릴 때 -->
function onmouseover_event() {
	var str = "${coupons}";
	var jbSplit = str.split(",");
	var temp = 1;
	var index = 0;
	var html = "<br>";
	var list = ["신규 쿠폰", "생일 쿠폰", "이벤트 쿠폰"];
	for (var i in jbSplit ) { 
        if(jbSplit[i] == temp) {
        	if(temp == 1){         
        		html += "<a href=\"javascript:select('" + list[index] + "');\" id=\'ami\'><b>" + "신규 쿠폰" + "</b></a><br/><br/>"; 			
    			temp = temp + 1;
    			index = index + 1;
        	} else if(temp == 2){
        		html += "<a href=\"javascript:select('" + list[index] + "');\" id='ami'><b>" + "생일 쿠폰" + "</b></a><br/><br/>";    			
    			temp = temp + 1;
    			index = index + 1;
        	} else if(temp == 3){
        		html += "<a href=\"javascript:select('" + list[index] + "');\" id='ami'><b>" + "이벤트 쿠폰" + "</b></a><br/><br/>";
    			temp = temp + 1;
    			index = index + 1;
        	}
        }
    }
	
	html+="<br/>";
	
	var couponListDiv = document.getElementById("couponListDiv");
	couponListDiv.innerHTML = html;
	show();
}

function select(selectKeyword){
	document.myCouponForm.userKeyword.value = selectKeyword;
	hide();
}

function show(){
	var couponDiv = document.getElementById("couponDiv");
	couponDiv.style.display ="block";
}

function hide(){
	var couponDiv = document.getElementById("couponDiv");
	couponDiv.style.display ="none";
}

<!-- 쿠폰 사용 -->
function usecoupon() {
		
	// 포인트를 적용하고 쿠폰을 사용함
	if($("#project").attr("disabled")){
		 if (confirm("할인 수단 변경 시, 이미 적용된 포인트 수단이 초기화됩니다. 할인쿠폰을 적용/변경하시겠습니까?")) {
             // 확인 버튼 클릭 시 동작
             var totalprice = $("#totalprice").text(); 
             $("#project").attr("disabled", false);
             $("#price").text(totalprice);
             $("#point").val('');
         } 
	} else{
		var coupon = $("#project").val(); // 적용할 쿠폰
		var price = $("#price").text().replace("(￦)", ""); // 총 가격
		var totalprice = $("#totalprice").text().replace("(￦)", "");
		$("#point").attr("disabled", true);
		
		if(price != totalprice){
			$.ajax({
				type : "post",
				url : "<%=cp %>/book/coupondiscount",
				dataType : "text",
				data : {
					price : totalprice,
					coupon : coupon
				},
				success : function(data) {
					$("#price").text(data + "(￦)"); // 가격 변동
				}
			});		
		} else {
			$.ajax({
				type : "post",
				url : "<%=cp %>/book/coupondiscount",
				dataType : "text",
				data : {
					price : price,
					coupon : coupon
				},
				success : function(data) {
					$("#price").text(data + "(￦)"); // 가격 변동
				}
			});		
		}
	}
	
}

<!-- 포인트 사용 -->
function usepoint() {
	var totalprice = $("#totalprice").text().replace("(￦)", "");
	var price = $("#price").text().replace("(￦)", ""); // 총 가격
	var point = $("#point").val(); // 포인트
		
	if($("#point").attr("disabled")){
		if (confirm("할인 수단 변경 시, 이미 적용된 쿠폰 수단이 초기화됩니다. 포인트를 적용/변경하시겠습니까?")) {
            // 확인 버튼 클릭 시 동작
            var totalprice = $("#totalprice").text(); 
            $("#point").attr("disabled", false);
            $("#price").text(totalprice);
            $("#project").val('');
        } 
	} else {
		if(point > ${sessionScope.guestInfo.point }){
			alert("해당 포인트만큼 존재하지 않습니다");
			$("#point").focus();
			return;		
		}

		$("#project").attr("disabled", true);
		
		if(price != totalprice){ // 포인트를 한번 사용한 경우
			$.ajax({
				type : "post",
				url : "<%=cp %>/book/pointdiscount",
				dataType : "text",
				data : {
					price : totalprice,
					point : point
				},
				success : function(data) {
					$("#price").text(data + "(￦)"); // 가격 변동
				}
			});
		} 
		else { // 포인트를 처음 사용한 경우
			$.ajax({
				type : "post",
				url : "<%=cp %>/book/pointdiscount",
				dataType : "text",
				data : {
					price : price,
					point : point
				},
				success : function(data) {
					$("#price").text(data + "(￦)"); // 가격 변동
				}
			});	
		}	
	}
	
	
}

</script>
<body>
	
<!--  로딩창 -->
	<div class="preloader js-preloader">
		<img src="/tmi/resources/images/preloader.gif">
	</div>
	
	<div class="page-wrapper fixed-footer" style="margin-bottom: 150px;">
	
<!--헤더 -->
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
									<a href="" class="mobile-bar js-menu-toggle">
										<span class="ion-android-menu"></span>
									</a>
								</div>
								
					<!--  모바일 로그인  -->
								<div class="add-list float-right">
									<nav class="site-navigation float-left">
									<div class="container">
										<ul class="site-menu js-clone-nav d-none d-lg-block">
								<!--  로그인 아이콘 -->
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
		
		
<!--  화면 이미지 -->
		<div class="breadcrumb-section" style="background-color:#6ae">
			<div class="overlay op-5"></div>
			<div class="container">
				<div class="row align-items-center  pad-top-80">
					<div class="col-md-6 col-12">
					
						<div class="breadcrumb-menu">
							<h2 class="page-title">Booking Info</h2>
						</div>
					</div>
					
					<div class="col-md-6 col-12">
						<div class="breadcrumb-menu text-right sm-left">
							<ul>
								<li class="active"><a href="<%=cp%>/tmi/main/ok">Home</a></li>
								<li><a><font color="#ffffff">Booking Info</font></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		
<!--  예약 메인 -->
		<div class="list-details-section section-padding  add_list">
			<div class="container">
				<div class="row">
				
			<!--  왼쪽 화면 -->
					<div class="col-lg-7 col-md-12">
					
			<!--  건물, 방 정보 -->		
						<div class="add_list_content">
							<h4> <i class="ion-ios-information-outline"></i>Room Information :</h4>
							<div class="row">
							
						<!--  건물이름 -->
								<div class="col-md-6">
									<div class="form-group">
										<label for="mname">Building Name</label>
										<input id="mname" type="text" class="form-control filter-input" readonly="readonly" value="${dto.m_name }">
									</div>
								</div>
								
						<!--  건물 주소 -->
								<div class="col-md-6">
									<div class="form-group">
										<label for="addr">Address</label>
										<input id="maddr" type="text" class="form-control filter-input" readonly="readonly" value="${dto.m_addr }">
									</div>
								</div>
								
						<!--  방 이름 -->
								<div class="col-md-6">
									<div class="form-group">
										<label for="rname">Room Name</label>
										<input id="rname" type="text" class="form-control filter-input" readonly="readonly" value="${dto.r_name }">
									</div>
								</div>
								
						<!-- 호스트 연락처 -->
								<div class="col-md-6">
									<div class="form-group">
										<label for="htel">Tel.</label>
										<input id="htel" type="text" class="form-control filter-input" readonly="readonly" value="${dto.m_tel }">
									</div>
								</div>
							</div>
						</div>
						<br/>
						
			<!--  예약자 정보 -->
						<div class="add_list_content mar-top-20">
							<h4> <i class="ion-ios-information-outline"></i> Visitor Information :</h4>
							<div class="row">
							
						<!-- 이메일주소 -->
								<div class="col-md-6">
									<div class="form-group">
										<label for="email">Email</label>
										<input id="email" type="text" class="form-control filter-input" value="${sessionScope.guestInfo.email }">
									</div>
								</div>
						
						<!--  방문자 이름 , 변경가능 -->
								<div class="col-md-6">
									<div class="form-group">
										<label for="name">Visitor Name</label>
										<input id="name" type="text" class="form-control filter-input" value="${sessionScope.guestInfo.name }">
									</div>
								</div>
								
						<!--  방문자 연락처, 변경가능-->
								<div class="col-md-12">
									<div class="form-group">
										<label for="tel">Visitor Tel</label>
										<input id="tel" type="text" class="form-control filter-input" value="${sessionScope.guestInfo.tel }">
									</div>
								</div>	
						
					<!--  결제 -->
								<div class="col-md-12">
									
								</div>
							</div>
							

						</div>
					</div>
					
			<!--  오른쪽 보여줄 화면 -->
					<div class="col-lg-5 col-md-12">
						<div class="boxed-widget summary">
							<h3><i class="icofont-book-alt"></i> Booking Summary</h3>
							
					<!-- 예약정보 -->
							<ul>
								<li>Check In <span>${startDate }</span></li>
								<li>Check Out <span>${endDate }</span></li>
								<li>Guests <span>${inwon } Adults</span></li>
							</ul>
							
					<!--  변경 전 가격 -->
							<div class="total_cost clearfix border-top">
								<div class="float-left">
									<h4>Sub Price</h4>
								</div>
								<div class="float-right"><span id = "totalprice">${price }(￦)</span></div>
							</div>
							
							<div id="room_type">
								잔여 포인트: ${sessionScope.guestInfo.point }원
							</div>
							
							<br>
							<!--  포인트 -->
							<div class="coupon-code-wrap">
								<form action="mypointForm">
									<input type="text" placeholder="Points to use" id = "point">
									<input type="button" class="coupon_code" id = "pointsubmit" value="Apply" onclick="usepoint();">																						
								</form>		
								<br>
							
							<!-- 쿠폰 -->
								<form name = "myCouponForm">
									<div>
										<input type="text" placeholder="Coupons to use" id="project" name = "userKeyword" onclick="onmouseover_event();" />
										<input type="button" class="coupon_code" id = "couponsubmit" value="Apply" onclick="usecoupon();">
										
										<div id = "couponDiv" class = "coupon">
											<div id="couponListDiv"></div>
										</div>																																
									</div>
								</form>	
																
							</div>
																					
							<br/>
							
							<!--  동의하기 체크 -->
							<div class="row mar-top-20">
								<div class="col-sm-8  text-left">
									<div class="res-box mar-top-10">
										<input type="checkbox" name="remember" id="rememberCheck">
										<label for="remember">I'<a href="#">ve read</a> and accept</label>
									</div>
								</div>						
							</div>
							
							<div class="total_cost clearfix mar-top-40 border-top">
								<div class="float-left">
									<h4>Total</h4>
								</div>
								<div class="float-right"><span id = "price">${price }(￦)</span></div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<!--  결제버튼 -->
							<form name="myForm" method="post">
								<div class="col-sm-4  text-right">
									<div class="res-box sm-left">
										<a href="javascript:check()" class="btn v7" type="submit" style="margin-left: 1190px;">Confirm &amp; Pay</a>
									</div>
								</div>
							</form>	
<!--  맨위로  -->
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
							
								<li ><a class="link-hov style1" href="<%=cp%>/guest/dashboard">My Page</a></li>	
                   				<li><a class="link-hov style1" href="<%=cp%>/guest/myProfile">My Profile&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                   				<li><a class="link-hov style1" href="<%=cp%>/guest/wishListForm">Wish List&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                   				<li><a class="link-hov style1" href="<%=cp%>/guest/addHost">Add Hosting&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                           
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
	<!--Scripts ends-->
	<script type="text/javascript">
	function check () {
		var check = $("#rememberCheck").is(":checked");
		var totalprice = $("#price").text().replace("(￦)", "");
		var point = $("#point").val();
		var project = $("#project").val();
		
		if(point == ''){
			point = 0;
		} 
		
		if(project == ''){
			project = 0;
		} else if (project == '신규 쿠폰'){
			project = 1;
		} else if (project == '생일 쿠폰'){
			project = 2;
		}

		if(check==false){	
			alert("확인에 체크해주세요");
			return;
		}
		
		$.ajax({
			type : "post",
			async : false,
			url : "<%=cp%>/book/bookingPayMent",
			dataType : "text",
			data : {
				price : totalprice,
				r_num : ${dto.r_num},
				product : "${dto.r_name }",
				tel : "${dto.m_tel }",
				addr : "${dto.m_addr }",
				startDate : "${startDate}",
				endDate : "${endDate}",
				inwon : "${inwon }",
				usepoint : point,
				cp_num : project 
			},			
			success : function(data) {
				if(data == 'okay'){
					window.location.href = "<%=cp%>/book/bookingPayMentForm?price=" + totalprice + "&r_num=${dto.r_num}&product=${dto.r_name }&tel=${dto.m_tel }&addr=${dto.m_addr }&startDate=${startDate}&endDate=${endDate}&inwon=${inwon }";
				}
			}
		});
					
	<%-- 	document.myForm.action = "<%=cp%>/book/bookingPayMent?price=" + totalprice + "&r_num=${dto.r_num}&product=${dto.r_name }&tel=${dto.m_tel }&addr=${dto.m_addr }&startDate=${startDate}&endDate=${endDate}&inwon=${inwon }";
		document.myForm.submit();		 --%>
	}
	
	</script>
	
</body>

</html>
