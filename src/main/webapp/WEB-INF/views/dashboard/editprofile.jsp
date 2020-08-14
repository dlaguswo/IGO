<%@page import="com.exe.tmi.guest.dto.GuestDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	GuestDTO dto = (GuestDTO)request.getAttribute("dto");
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

	/////////////////// 프로필 이미지 수정
	 function fileUpload(fis) {
		var str = fis.value;
        $('#span').text(fis.value.substring(str.lastIndexOf("\\")+1));

        // 이미지를 변경한다.

        var reader = new FileReader();

	    reader.onload = function(e){

		$('#loadImg').attr('src',e.target.result);

	   	}

		reader.readAsDataURL(fis.files[0]);

	}
	
	////////////////// 프로필 정보 수정
	
	var userpassRegex= /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	
	var compare_pwd = false; // 비밀번호 검사
					
	function fn_compared_pwd1(){
		var pwd1 = $("#user_password").val();
		var pwd2 = $("#confirm-password").val();
		var oldpwd = $("#old-password").val();
				
		if(userpassRegex.test(pwd1)){
			if(oldpwd == pwd1){
				compare_pwd = false;
				$("#user_password").css("border-color", '');
				$('#s_result1').text("기존에 사용하신 비밀번호와 동일합니다 비밀번호를 변경해주세요.");
				$('#s_result1').css('color', 'red');
			} else {
				$('#s_result1').text('');		
				$("#user_password").css("border-color", '#86E57F');
				compare_pwd = false;		
			}
		} else if(pwd1 == ''){
			$("#user_password").css("border-color", '');
			$('#s_result1').text('비밀번호를 입력해주세요');
			$('#s_result1').css('color', 'red');
			compare_pwd = false;
		} else if(!userpassRegex.test(pwd1)) {		
			$("#user_password").css("border-color", '');
			$('#s_result1').text("8~15자리 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
			$('#s_result1').css('color', 'red');
			compare_pwd = false;
		} 
		
		if((pwd1 == pwd2) && (userpassRegex.test(pwd1) && userpassRegex.test(pwd2))){
			compare_pwd = true;			
		}
	}
	
	function fn_compared_pwd2(){
		var pwd1 = $("#user_password").val();
		var pwd2 = $("#confirm-password").val();
		var oldpwd = $("#old-password").val();
		
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
			if(oldpwd == pwd1){
				compare_pwd = false;
				$("#confirm-password").css("border-color", '');
				$('#s_result2').text("기존에 사용하신 비밀번호와 동일합니다 비밀번호를 변경해주세요.");
			} 
			else{
				compare_pwd = true;		
				$("#confirm-password").css("border-color", '#86E57F');	
			}
		} else if(pwd1 != pwd2){
			compare_pwd = false;
			$("#confirm-password").css("border-color", '');
			$("#s_result2").text('비밀번호가 일치하지 않습니다');
			$('#s_result2').css('color', 'red');
		}
	}
			
	function fn_guest_edit() {		
		
		if(!compare_pwd){
			$("#user_password").focus();
			alert("비밀번호를 정확히 입력해주세요.");
			return;
		}
		
/* 		var pwd = $("#user_password").val();
		var name = $("#firstName").val() + $("#lastName").val();
		var email = $("#email").val();
		var upload = $("#upload").val();
		var paramData = JSON.stringify({
			"email" : email,
			"pwd" : pwd,
			"name" : name,
			"upload" : upload
		});
		
		var headers = {"Content-Type" : "application/json" , "X-HTTP-Method-Override" : "POST"}; */
		
		var form = new FormData(document.getElementById("editForm"));
				
		$.ajax({
			url : "${contextPath}/guest/editProfile",
			data: form,
            async : true,
            enctype : "multipart/form-data",
            type : "POST",
            dataType : "text",
            processData: false, 
            contentType: false,                
            cache : false,
			success: function(result){
				if (result == "true") { 
					alert("정상적으로 회원정보가 수정되었습니다.");
					location.href = '${contextPath}/guest/loginForm.action'; // 경로수정해야함	
				} else {
					alert("회원 정보 수정 실패!");
				}
			}, error: function(error) {
				alert(error);
			}
		})
	} 
	</script>
<body>
	<div class="page-wrapper">
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
						<img src="tmi/resources/tmi/profile/${sessionScope.guestInfo.profileimage}"/>
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
							<a href="<%=cp%>/guest/dashboard">
								<i class="ion-ios-gear-outline"></i>Dashboard
							</a>
						</li>
						
					<!--  유저 정보 수정 -->
						<li>
							<a class="active" href="<%=cp %>/guest/myProfile">
								<i class="ion-ios-person-outline"></i>My profile</a>
						</li>
						
					<!--  찜목록 -->	
						<li>
							<a href="db-favourites.html">
								<i class="ion-ios-heart-outline"></i>Wish List</a>
						</li>
						
					<!--  예약 내역 -->	
						<li>
							<a href="<%=cp%>/book/booking">
								<i class="ion-ios-copy-outline"></i>Bookings</a>
						</li>
						
					<!--  리뷰 확인 -->	
						<li>
							<a href="<%=cp%>/post/reviewPage">
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
							<a class="js-arrow" href="#">
								<i class="ion-social-buffer-outline"></i>Host Manager
							</a>
							<ul class="list-unstyled navbar__sub-list js-sub-list">
							
						<!-- 자신의 방 예약 확인 -->
								<li>
									<a href="db-my-listing.html">Reservation List</a>
								</li>
								
						<!--  방 관리 -->		
								<li>
									<a href="<%=cp%>/room/roomEdit">Room Edit</a>
								</li>
								
						<!--  호스트 리뷰 관리 -->		
								<li>
									<a href="db-my-listing.html">Host Review Page</a>
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

	<!--  헤더 -->
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
									<div class="notifi-dropdown">
									</div>
								</div>
								
						<!--  로그인 시 아이콘 -->
								<div class="header-button-item js-sidebar-btn">
									<c:if test="${!empty sessionScope.guestInfo.profileimage }">
										<img src="/tmi/resources/tmi/profile/${sessionScope.guestInfo.profileimage}" />
									</c:if>
									<c:if test="${empty sessionScope.guestInfo.profileimage }">
										<img src="/tmi/resources/images/profile.png" />
									</c:if>
									<span>${sessionScope.guestInfo.name } <i class="ion-arrow-down-b"></i></span>
								</div>
						<!--  로그인 시 사용 메뉴 -->
								<div class="setting-menu js-right-sidebar d-none d-lg-block">
									<div class="account-dropdown__body">
									<!--  공용 -->
							
								<!--  mypage 메인 -->
										<div class="account-dropdown__item">
											<a href="<%=cp %>/guest/dashboard">
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
										<c:if test="${sessionScope.guestInfo.hostcheck=='1'}">
																						
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

	<!-- 정보 수정 창 -->
			<div class="dash-breadcrumb">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="dash-breadcrumb-content">
								<div class="dash-breadcrumb-left">
								
						<!--  경로 창 -->
									<div class="breadcrumb-menu text-right sm-left">
										<ul>
											<li class="active"><a href="<%=cp%>/main/ok">Home</a></li>
											<li class="active"><a href="#">My profile</a></li>
											<li>Edit Profile</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
	
	<!--  메인 -->
			<div class="dash-content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="db-add-list-wrap">
							
					<!--  정보 상세 설정 -->
								<div class="act-title">
									<h5><i class="ion-person"></i> Profile Details :</h5>
								</div>
								<div class="db-add-listing">
									<div class="row">
										<form id="editForm" name = "editForm" enctype="multipart/form-data">
										<div class="col-md-4 offset-md-4">										
							<!-- 아바타 -->
											<div class="edit-profile-photo" style="text-align: center;">
												<img src="" alt="" id="loadImg" style="width: 200px; height: 200px;">
												<div class="add-listing__input-file-box">
													<input class="add-listing__input-file" type="file" name="upload" id="upload" onchange="fileUpload(this);">
													<div class="add-listing__input-file-wrap">
														<i class="ion-ios-cloud-upload"></i>
														<p style="color: black;">User image</p><br/>
													</div>
												</div>
											</div>
											
										</div>
										
										<div class="col-md-12">
											<div class="row">
											
											
										<!--  이메일 주소 -->
												<div class="col-md-6">
													<div class="form-group">
														<label>Email id</label>
														<input type="text" id = "email" name = "email" class="form-control filter-input" placeholder="${dto.email }" readonly="readonly" value="${dto.email }">
													</div>
												</div>
												
										<!--  연락처 -->
												<div class="col-md-6">
													<div class="form-group">
														<label>Phone</label>
														<input type="text" class="form-control filter-input" value="${dto.tel }" readonly="readonly">
													</div>
												</div>
												
										<!--  비밀번호 , dafault값 주기 ( 테이블 정보 ) -->
												<div class="col-md-6">
													<div class="form-group">
														<label>Password</label>
														<input type="password" id = "old-password" class="form-control filter-input" value="${dto.pwd }" readonly="readonly">
													</div>
												</div>												
												
										<!--  이름 -->
												<div class="col-md-6">
													<div class="form-group">
														<label>이름</label>
														<input type="text" id = "name" name = "name" class="form-control filter-input" value = "<%=firstName %><%=lastName %>">														
													</div>
												</div>
												
<%-- 										<!--  성 -->	
												<div class="col-md-6">
													<div class="form-group">
														<label>Last name(성)</label>
														<input type="text" id = "lastName" class="form-control filter-input" value = "<%=lastName %>">
													</div>
												</div> --%>
												
										<!--  새 비밀번호 -->
												<div class="col-md-6">
													<div class="form-group">
														<label>New Password(새 비밀번호)</label>
														<input type="password" name="pwd" id="user_password" class="form-control filter-input" onkeyup="fn_compared_pwd1();">
														<span id = "s_result1" style="font-size: 10px;"></span>
													</div>
												</div>
												
										<!--  새 비밀번호 확인 -->
												<div class="col-md-6">
													<div class="form-group">
														<label>Confirm new Password(비밀번호 확인)</label>
														<input type="password" name="pwd2" id="confirm-password" class="form-control filter-input" onkeyup="fn_compared_pwd2();">
														<span id = "s_result2" style="font-size: 10px;"></span>
													</div>
												</div>
												
										<!--  확인 버튼 -->
												<div class="col-md-12" style="text-align: center;">													
													<button type="button" class="btn v3" onclick="fn_guest_edit()"><i class="ion-android-checkmark-circle"></i>Save Changes</button>
												</div>	
												</form>											
											</div>											
										</div>
									</div>
								</div>
							</div>
							
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
