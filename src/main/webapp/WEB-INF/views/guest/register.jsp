<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();	
	String all = request.getParameter("all");
	Object userInfo = session.getAttribute("userInfo");
	String msg = "NULL";
	if(request.getAttribute("msg") != null){
		msg = (String)request.getAttribute("msg");
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

	var useridRegex=/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	var userpassRegex= /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	
	var compare_name = false; // 이름 검사
	var compare_email = false; // 이메일 검사
	var compare_pwd = false; // 비밀번호 검사
	var compare_tel = false; // 인증번호 체크 여부
	var compare_number = false; //인증
	

	$(document).ready(function(){
		if("<%=msg %>" != "NULL"){
			alert("\n　　　　　　　　　　TMI회원이 아닙니다\n　　　　　　　　　　회원가입 부탁드립니다");
		}
	});

	function fn_name() {
		var _name = $("#user_name").val();		
		if(_name == ''){
			$('#user_name').css("border-color", '');
			compare_name = false;
		}
		else{
			$('#user_name').css("border-color", '#86E57F');	
			compare_name = true;
		}
	}
	
	function fn_overlapped() {
	
		var _email = $("#email").val();		
		$.ajax({
			type : "post",
			async : false,
			url : "${contextPath}/guest/overlapped",
			dataType : "text",
			data : {
				email : _email
			},
			success : function(data) {
				if (data == 'false') {
					if(useridRegex.test(_email)){
						$('#i_result').text('');				
						$("#email").css("border-color", '#86E57F');
						compare_email = true;
					} else if(_email == ""){						
						$('#i_result').text('아이디를 입력해주세요');
						$("#email").css("border-color", '');
						$('#i_result').css('color', 'red');	
						compare_email = false;
					} else {						
						$("#email").css("border-color", '');
						$('#i_result').text("이메일 양식이 아닙니다.");
						$('#i_result').css('color', 'red');
						compare_email = false;
					}
				} else {
					$("#email").css("border-color", '');
					$('#i_result').text("중복된 ID 입니다");
					$('#i_result').css('color', 'red');
					compare_email = false;
				}
			},
			error : function(data) {
				alert(data);				
			}
		});
	}
	
	
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
			$('#s_result2').text('성공');
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
	
	function sendSms() { 
		$.ajax({ 
			url: "<%=cp%>/guest/sendSms", 
			data: { receiver: $("#tel").val() }, 
			type: "post", 
			success: function(result) { 
				if (result == "true") {
					compare_number = true;
					console.log(result);
					alert("인증번호 전송 성공"); 
				} else {
					compare_number = false;
					alert("인증번호 전송 실패"); 
				} 
			} 
		}); 
	}
		
	function fn_join_member() {
		
		var f = document.myForm;
		var name = f.name.value;
		var email = f.email.value;
		var pwd = f.pwd.value;
		var pwd2 = f.pwd2.value;
		var tel = f.tel.value;
		var telcheck = f.telcheck.value;
		var agreement = f.remember.checked;
		
		if(!name || !email || !pwd || !pwd2 || !tel || !telcheck ){
			alert('입력란을 모두 채워주세요!');			
			return;
		}
		
		if(!compare_name){
			alert("이름을 정확히 입력해주세요");
			f.name.focus();
			return;
		}
		
		if(!compare_email){
			alert("이메일을 정확히 입력해주세요");
			f.email.focus();
			return;
		}
		
		if(!compare_pwd){
			alert("비밀번호를 정확히 입력해주세요");
			f.pwd.focus();
			return;
		}
		
		if(!compare_number){
			alert("인증번호를 받아주세요");
			f.tel.focus();
			return;
		}
		
		if(!agreement){
			alert("약관에 동의해주세요");
			return;
		}
		
		$.ajax({ 
			url: "<%=cp%>/guest/numberCheck", 
			data: { 
				number: $("#telcheck").val() 
			}, 
			type: "post", 
			success: function(result) { 
				if (result == "true") { 	
					f.method = "POST";
					f.action = "${contextPath}/guest/addMember";
					f.submit();
				} else { 
					alert("인증번호가 일치하지 않습니다");
					f.telcheck.focus();
					return;			
				} 
			} 
		});
								
	}

	function openChild()
	{
	    // window.name = "부모창 이름"; 
	    window.name = "parentForm";
	    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	    window.open("check.action","childForm", "width=800, height=800, resizable = no, scrollbars = yes");    
	}

	function checkId(chk){
		
		alert("이용 약관에 동의하셨습니다.");
		$("input:checkbox[id='remember']").removeAttr("disabled");
		$("input:checkbox[id='remember']").prop("checked", true);
		$("#remember").val("on");

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
								<a class="navbar-brand" href="<%=cp%>/main/ok"><img src="/tmi/resources/images/logo-black.png" alt="logo" class="img-fluid"></a>
							</div>
							<div class="col-md-8 col-6">
								<nav class="site-navigation float-left">
									<div class="container">
										<ul class="site-menu js-clone-nav d-none d-lg-block">
											<li class="d-lg-none"><a class="btn v1" href="<%=cp%>/main/ok">Main </a></li>
										</ul>
									</div>
								</nav>
								<div class="d-lg-none sm-right">
									<a href="#" class="mobile-bar js-menu-toggle">
										<span class="ion-android-menu"></span>
									</a>
								</div>
								<div class="add-list float-right">
									<a class="btn v8" href="<%=cp%>/main/ok" style="border-radius: 4px;">Main</a>
									<a class="btn v8" href="<%=cp%>/guest/loginForm" style="border-radius: 4px;">Login </a>
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
									<a class="nav-link" data-toggle="tab" href="#register" role="tab" aria-selected="false">Register</a>
								</li>
							</ul>
							
							<div class="ui-dash tab-content">							
								<div class="tab-pane fade show active" id="register" role="tabpanel">
									<form name="myForm" id="register-form" method="post">
										<div class="form-group">
											<input type="text" name="name" id="user_name" tabindex="1" class="form-control" placeholder="Username" onkeyup="fn_name()" value="${name }">
										</div>
										<div class="form-group">
											<input type="email" name="email" id="email" tabindex="2" class="form-control" placeholder="Email Address"  onkeyup="fn_overlapped()" value="${email }">
											<span id = "i_result" style="font-size: 10px;"></span>
										</div>
										<div class="form-group">
											<input type="password" name="pwd" id="user_password" tabindex="3" class="form-control" placeholder="Password" onkeyup="fn_compared_pwd1()">
											<span id = "s_result1" style="font-size: 10px;"></span>
										</div>
										<div class="form-group">
											<input type="password" name="pwd2" id="confirm-password" tabindex="4" class="form-control" placeholder="Confirm Password" onkeyup="fn_compared_pwd2()">
											<span id = "s_result2" style="font-size: 10px;"></span>
										</div>
										<div class="form-group">
											<div style="display: inline-block;">
											<input type="text" name="tel" id="tel" tabindex="5" class="form-control" placeholder="tel"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>											
											</div>
											<div style="display: inline-block;">
											<input type = "button" onClick="sendSms()" class="btn v3" value="인증번호 받기" style="height: calc(2.25rem + 2px); line-height: 0;">
											<!-- <button type="submit" onClick="sendSms()" class="btn v3"><i class="ion-android-checkmark-circle"></i>인증번호 받기</button> -->
											</div>
										</div>
										<div class="form-group">										
											<input type="text" name="telcheck" id="telcheck" tabindex="6" class="form-control" placeholder="Certification Number"/>
										</div>
										<!--  체크박스  -->				
										<div class="res-box text-left">
											<input type="checkbox" tabindex="7" name="remember" id="remember" disabled="false">
											<label for="remember">
												<a href="" onclick="openChild(); return false;">
											 		I've read and accept terms & conditions 
											 	</a>
											 </label>
										</div>
										<div class="res-box text-center mar-top-30">
											<button type="button" class="btn v3" onclick="fn_join_member()"><i class="ion-android-checkmark-circle"></i>가입하기</button>
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
								<li><a href="https://open.kakao.com/o/gwqk9rnc" style="color: black;">문의 및 상담 &nbsp;<i class="icofont-kakaotalk"></i> </a></li>
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
