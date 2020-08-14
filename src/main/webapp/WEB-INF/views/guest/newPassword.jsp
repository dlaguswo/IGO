<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();	
	String all = request.getParameter("all");
	Object userInfo = session.getAttribute("userInfo");
			
%>
<!DOCTYPE html>
<html dir="ltr" lang="UTF-8">

<head>
	<!-- Metas -->
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="author" content="LionCoders" />
	<!-- Links -->
	<link rel="icon" type="/tmi/resources/image/png" href="#" />
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
	
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
    <script src="http://code.jquery.com/jquery.js"></script>
	<title>여행을 만드는 생각 - TMI</title>
</head>
<script type="text/javascript">
	
	function sendKakao() {
		
		var f = document.myForm;
		
		f.action="https://kauth.kakao.com/oauth/authorize?client_id=e99d0eec26dd8ff4b5cb9e0cfd2bbbdf&redirect_uri=http://192.168.16.3:8080/tmi/guest/oauth&response_type=code";
		f.submit();
	}
	
	function sendNaver() {
		
		var f = document.myForm;
		
		f.action="${url }";
		f.submit();
	}
		
	var userpassRegex= /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

	var compare_pwd = false; // 비밀번호 검사
					
	function fn_compared_pwd1(){
		var pwd1 = $("#user_password").val();
		var pwd2 = $("#confirm-password").val();
		if(userpassRegex.test(pwd1)){
			$('#s_result1').text('');		
			$("#user_password").css("border-color", '#86E57F');
			compare_pwd = false;
		} else if(pwd1 == ''){
			compare_result = false;
			$("#user_password").css("border-color", '');
			$('#s_result1').text('비밀번호를 입력해주세요');
			$('#s_result1').css('color', 'red');
			compare_pwd = false;
		} else if(!userpassRegex.test(pwd1)) {		
			compare_result = false;
			$("#user_password").css("border-color", '');
			$('#s_result1').text("8~15자리 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
			$('#s_result1').css('color', 'red');
			compare_pwd = false;
		}
		
		if((pwd1 == pwd2) && (userpassRegex.test(pwd1) && userpassRegex.test(pwd2))){
			compare_result = true;			
		}
	}
	
	function fn_compared_pwd2(){
		var pwd1 = $("#user_password").val();
		var pwd2 = $("#confirm-password").val();
		
		if(userpassRegex.test(pwd2)){
			$('#s_result2').text('');		
			compare_pwd = false;
		} else if(pwd2 == ""){			
			$("#confirm-password").css("border-color", '');
			$('#s_result2').text('비밀번호를 입력해주세요');
			$('#s_result2').css('color', 'red');	
			compare_pwd = false;
		} else if(!userpassRegex.test(pwd2)) {			
			$("#confirm-password").css("border-color", '');
			$('#s_result2').text("8~15자리 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
			$('#s_result2').css('color', 'red');
			$("#reg_submit").attr("disabled", true);
			compare_pwd = false;
		}
		
		if((pwd1 == pwd2) && (userpassRegex.test(pwd1) && userpassRegex.test(pwd2))){
			compare_pwd = true;		
			$("#confirm-password").css("border-color", '#86E57F');
		} else if(pwd1 != pwd2){
			compare_pwd = false;
			$("#confirm-password").css("border-color", '');
			$("#s_result2").text('비밀번호가 일치하지 않습니다');
			$('#s_result2').css('color', 'red');
		}
	}
			
	function fn_new_password() {
		
		var f = document.myForm;
		var pwd = f.pwd.value;
		var pwd2 = f.pwd2.value;
				
		if(!pwd || !pwd2){
			alert('입력란을 모두 채워주세요!');			
			return;
		}
						
		if(!compare_pwd){
			alert("비밀번호를 정확히 입력해주세요");
			f.pwd.focus();
			return;
		}
		
		f.method = "POST";
		f.action = "${contextPath}/guest/newPassword.action";
		f.submit();
								
	}
</script>

<body>
	<!--Page Wrapper starts-->
	<div class="page-wrapper">
		<!--header starts-->
		<header class="transparent scroll-hide">
			<!--Main Menu starts-->
			<div class="site-navbar-wrap v2">
				<div class="container">
					<div class="site-navbar">
						<div class="row align-items-center">
							<div class="col-md-4 col-6">
								<a class="navbar-brand" href="<%=cp %>/main/ok"><img src="/tmi/resources/images/logo-black.png" alt="logo" class="img-fluid"></a>
							</div>
							<div class="col-md-8 col-6">
								<nav class="site-navigation float-left">
									<div class="container">
										<ul class="site-menu js-clone-nav d-none d-lg-block">
											<li class="d-lg-none"><a class="btn v1" href="add-listing.html">Main </a></li>
										</ul>
									</div>
								</nav>
								<div class="d-lg-none sm-right">
									<a href="#" class="mobile-bar js-menu-toggle">
										<span class="ion-android-menu"></span>
									</a>
								</div>
							</div>
						</div>
					</div>
					<!--mobile-menu starts -->
					<div class="site-mobile-menu">
						<div class="site-mobile-menu-header">
							<div class="site-mobile-menu-close  js-menu-toggle">
								<span class="ion-ios-close-empty"></span>
							</div>
						</div>
						<div class="site-mobile-menu-body"></div>
					</div>
					<!--mobile-menu ends-->
				</div>
			</div>
			<!--Main Menu ends-->
		</header>
		<!--Header ends-->
		<!--User Login section starts-->
		<div class="user-login-section section-padding bg-fixed" style="background-image: url('/tmi/resources/images/alfs.jpg');" >
			<div class="container">
				<div class="row">
					<div class="col-md-10 offset-md-1  text-center">
						<div class="login-wrapper">
							<ul class="ui-list nav nav-tabs justify-content-center mar-bot-30" role="tablist">
								<li class="nav-item">
									<a class="nav-link" data-toggle="tab" href="#register" role="tab" aria-selected="false">New PassWord</a>
								</li>
							</ul>
							
							<div class="ui-dash tab-content">							
								<div class="tab-pane fade show active" id="register" role="tabpanel">
									<form name="myForm" id="register-form" method="post">
										<div class="form-group">
											<input type="password" name="pwd" id="user_password" tabindex="3" class="form-control" placeholder="new Password" onkeyup="fn_compared_pwd1()">
											<span id = "s_result1" style="font-size: 10px;"></span>
										</div>
										<div class="form-group">
											<input type="password" name="pwd2" id="confirm-password" tabindex="4" class="form-control" placeholder="Confirm Password" onkeyup="fn_compared_pwd2()">
											<span id = "s_result2" style="font-size: 10px;"></span>
										</div>
																														
										<div class="res-box text-center mar-top-30">							
											<input type = "hidden" name = "email" value = ${email } />		
											<button type="button" class="btn v3" onclick="fn_new_password()"><i class="ion-android-checkmark-circle"></i>비밀번호 바꾸기</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--User login section ends-->
		<!--Login section ends-->
		<!-- Scroll to top starts-->
		<span class="scrolltotop"><i class="ion-arrow-up-c"></i></span>
		<!-- Scroll to top ends-->
	</div>
	
<!--  설명 창 -->
	<div class="footer-wrapper no-pad-tb v2">
		<div class="footer-top-area section-padding">
			<div class="container">
				<div class="row nav-folderized">
					<div class="col-lg-3 col-md-12">
						<div class="footer-logo">
							<a href="/tmi/main/ok"> <img src="/tmi/resources/images/logo-black.png" alt="logo"></a>
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
							
								<li><a class="link-hov style1" href="<%=cp%>/guest/loginForm" style="border-radius: 4px; color: black;">Login </a></li>
								<li><a class="link-hov style1" href="<%=cp%>/guest/register" style="border-radius: 4px; color: black;">Register </a></li>
							
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
								<li><a href="https://open.kakao.com/o/gwqk9rnc" style="color: black;">문의 및 상담 &nbsp;<i class="icofont-kakaotalk"></i></a></li>
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
	<script src="/tmi/resources/https://maps.googleapis.com/maps/api/js?key=AIzaSyD_8C7p0Ws2gUu7wo0b6pK9Qu7LuzX2iWY&amp;libraries=places&amp;callback=initAutocomplete"></script>
	<!--Main js-->
	<script src="/tmi/resources/js/main.js"></script>
	<!--Scripts ends-->
</body>

</html>
