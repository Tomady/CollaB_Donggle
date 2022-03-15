<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CollaB</title>


<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
<style type="text/css">
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
}

a {
	text-decoration: none;
	color: black;
}

ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.nav_Bg a, .nav_Bg i {
	font-weight: bold;
	color: #ECE9FE;
}

.nav_t {
	margin: 0 auto;
	width: 1130px;
	min-width: 1130px;
	/* width: 930px;
            min-width: 930px; */
	transition: .4s;
}

.nav_t ul {
	display: flex;
	justify-content: flex-end;
	padding: 10px 0;
}

.nav_t ul li:first-child {
	margin-right: 15px;
}

.nav_t ul li i {
	margin-right: 8px;
}

.nav_Bg {
	width: 100%;
	position: fixed;
	background-color: #9F90D9;
	z-index: 999;
	color: #ECE9FE;
	transition: .4s;
}

.nav_Bgafter {
	background-color: #ECE9FE;
	margin-top: -41px;
	color: black;
	transition: .4s;
}

.nav_b ul li{
transition-duration: 0.2s;
}

.nav_Bgafter .nav_b ul li:first-child {
	border: 2px solid #6553C1;
	background-color: #6553C1;
	transition: .4s;
}

.nav_Bgafter .nav_b ul li:last-child {
	border: 2px solid black;
	background-color: black;
	transition: .4s;
}

.nav_b ul li:first-child:hover,
.nav_b ul li:last-child:hover{
	box-shadow: 0 20px 38px rgba(0, 0, 0, 0.10);
    transform: translateY(-3px);
    transition-duration: 0.2s;
}

.nav_b {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: 0 auto;
	/* width: 930px; */
	width: 1130px;
	padding: 5px 0;
}

.nav_b div {
	font-size: 42px;
	font-weight: bold;
}

.nav_b ul {
	display: flex;
}

.nav_b ul li:first-child {
	margin-right: 15px;
}

.nav_b ul li {
	width: 90px;
	height: 40px;
	border: 2px solid #ECE9FE;
	border-radius: 20px;
	text-align: center;
	line-height: 40px;
}

.container-scroller {
	background-color: #ECE9FE;
	background-attachment: fixed;
	display: flex;
	flex-direction: column;
	justify-content: flex-end;
	align-items: center;
	overflow: hidden;
	height: 850px;
	transition: 0.5s;
	width: 100%;
	min-width: 1130px;
}

.container-scroller .container_content {
	text-align: center;
	width: 1130px;
	font-size: 20px;
	padding: 20px 0;
}

.container-scroller .container_content button {
	width: 400px;
	height: 50px;
	border-radius: 20px;
	background-color: #6553C1;
	border: none;
	color: #ECE9FE;
	font-size: 20px;
	box-shadow: 1px 1px 5px #6553C1;
	cursor: pointer;
}

.options {
	margin-bottom: 20px;
}

.body {
	padding: 20px 0;
	display: flex;
	width: 1130px;
	margin: 0px auto;
}

.body .img {
	width: 100%;
}

.body .body_content {
	width: 50%;
	/* background-color: blueviolet; */
}

.footer {
	min-width: 1130px;
	height: 70px;
	background-color: #9F90D9;
}

body .options {
	display: flex;
	flex-direction: row;
	align-items: stretch;
	overflow: hidden;
	min-width: 600px;
	max-width: 900px;
	width: calc(100% - 100px);
	height: 400px;
}

@media screen and (max-width: 718px) {
	body .options {
		min-width: 520px;
	}
	body .options .option:nth-child(5) {
		display: none;
	}
}

@media screen and (max-width: 638px) {
	body .options {
		min-width: 440px;
	}
	body .options .option:nth-child(4) {
		display: none;
	}
}

@media screen and (max-width: 558px) {
	body .options {
		min-width: 360px;
	}
	body .options .option:nth-child(3) {
		display: none;
	}
}

@media screen and (max-width: 478px) {
	body .options {
		min-width: 280px;
	}
	body .options .option:nth-child(2) {
		display: none;
	}
}

body .options .option {
	position: relative;
	overflow: hidden;
	min-width: 60px;
	margin: 10px;
	background-size: auto 120%;
	background-position: center;
	cursor: pointer;
	transition: 0.5s cubic-bezier(0.05, 0.61, 0.41, 0.95);
}

.options .option:nth-child(1) .label .icon {
	color: #ed5565;
}

.options .option:nth-child(2) .label .icon {
	color: #fc6e51;
}

.options .option:nth-child(3) .label .icon {
	color: #ffce54;
}

.options .option:nth-child(4) .label .icon {
	color: #2ecc71;
}

.options .option:nth-child(5) .label .icon {
	color: #5d9cec;
}

.options .option:nth-child(6) .label .icon {
	color: #ac92ec;
}

.options .option.active {
	flex-grow: 10000;
	transform: scale(1);
	max-width: 600px;
	margin: 0px;
	border-radius: 40px;
	background-size: auto 100%;
	/*&:active {
     transform:scale(0.9);
  }*/
}

body .options .option.active .shadow {
	box-shadow: inset 0 -120px 120px -120px black, inset 0 -120px 120px
		-100px black;
}

body .options .option.active .label {
	bottom: 20px;
	left: 20px;
}

body .options .option.active .label .info>div {
	left: 0px;
	opacity: 1;
}

body .options .option:not(.active) {
	flex-grow: 1;
	border-radius: 30px;
}

body .options .option:not(.active) .shadow {
	bottom: -40px;
	box-shadow: inset 0 -120px 0px -120px black, inset 0 -120px 0px -100px
		black;
}

body .options .option:not(.active) .label {
	bottom: 10px;
	left: 10px;
}

body .options .option:not(.active) .label .info>div {
	left: 20px;
	opacity: 0;
}

body .options .option .shadow {
	position: absolute;
	bottom: 0px;
	left: 0px;
	right: 0px;
	height: 120px;
	transition: 0.5s cubic-bezier(0.05, 0.61, 0.41, 0.95);
}

body .options .option .label {
	display: flex;
	position: absolute;
	right: 0px;
	height: 40px;
	transition: 0.5s cubic-bezier(0.05, 0.61, 0.41, 0.95);
}

body .options .option .label .icon {
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	min-width: 40px;
	max-width: 40px;
	height: 40px;
	border-radius: 100%;
	background-color: white;
	color: #e6e9ed;
}

body .options .option .label .info {
	display: flex;
	flex-direction: column;
	justify-content: center;
	margin-left: 10px;
	color: white;
	white-space: pre;
}

body .options .option .label .info>div {
	position: relative;
	transition: 0.5s cubic-bezier(0.05, 0.61, 0.41, 0.95), opacity 0.5s
		ease-out;
}

body .options .option .label .info .main {
	font-weight: bold;
	font-size: 1.2rem;
}

body .options .option .label .info .sub {
	transition-delay: 0.1s;
}
      .swal-modal {
            border-radius: 10px;

        }

        .swal-title {
           
        }

        .swal-text {
          
        }
        
        .swal-button{
	
}
.swal-button--confirm{
	background-color : #9F90D9;
}

</style>
	<script src="resources/js/jay/confirmForm.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<nav class="nav_Bg">
		<div class="nav_t">
			<ul>
				<li>
					<i class="fas fa-phone-alt"></i>
					<a href="">010-8258-9612</a>
				</li>
				<li>
					<i class="fas fa-envelope"></i>
					<a href="">ha3310@naver.com</a>
				</li>
			</ul>
		</div>

		<div class="nav_b">
			<div class="logo"><img src="resources/img/logo3334.png" width="200px;"></div>
			<ul>
				<c:if test="${empty id }">
					<li><a href="login.do">로그인</a></li>
				</c:if>
				<c:if test="${empty id }">
					<li><a href="joinForm.do">회원가입</a></li>
				</c:if>
				<c:if test="${not empty id}">
					<li><a href="javascript:logout()">로그아웃</a></li>
				</c:if>
				<c:if test="${not empty id}">
					<li><a href="#">ㅇㅇ?</a></li>
				</c:if>
			</ul>
		</div>
	</nav>
	
	<div class="container-scroller">
		<div class="container_content ">
			<h1>초연결 업무 플랫폼 CollaB</h1>
			<h5>업무를 위한 모든 서비스를 한 공간에서 이용해보세요</h5>
			<button type="button" onclick="location.href='WorkspaceList'">CollaB 시작하기</button>
		</div>
		
		<!-- 슬라이드 -->
		<div class="options">
			<div class="option active" style="background-image: url(https://66.media.tumblr.com/6fb397d822f4f9f4596dff2085b18f2e/tumblr_nzsvb4p6xS1qho82wo1_1280.jpg);">
				<div class="shadow"></div>
				<div class="label">
					<div class="icon">
						<i class="fas fa-walking"></i>
					</div>
					<div class="info">
						<div class="main">Blonkisoaz</div>
						<div class="sub">Omuke trughte a otufta</div>
					</div>
				</div>
			</div>
			
			<div class="option"
				style="background-image: url(https://66.media.tumblr.com/8b69cdde47aa952e4176b4200052abf4/tumblr_o51p7mFFF21qho82wo1_1280.jpg);">
				<div class="shadow"></div>
				<div class="label">
					<div class="icon">
						<i class="fas fa-snowflake"></i>
					</div>
					<div class="info">
						<div class="main">Oretemauw</div>
						<div class="sub">Omuke trughte a otufta</div>
					</div>
				</div>
			</div>
			
			<div class="option"
				style="background-image: url(https://66.media.tumblr.com/5af3f8303456e376ceda1517553ba786/tumblr_o4986gakjh1qho82wo1_1280.jpg);">
				<div class="shadow"></div>
				<div class="label">
					<div class="icon">
						<i class="fas fa-tree"></i>
					</div>
					<div class="info">
						<div class="main">Iteresuselle</div>
						<div class="sub">Omuke trughte a otufta</div>
					</div>
				</div>
			</div>
			
			<div class="option"
				style="background-image: url(https://66.media.tumblr.com/5516a22e0cdacaa85311ec3f8fd1e9ef/tumblr_o45jwvdsL11qho82wo1_1280.jpg);">
				<div class="shadow"></div>
				<div class="label">
					<div class="icon">
						<i class="fas fa-tint"></i>
					</div>
					<div class="info">
						<div class="main">Idiefe</div>
						<div class="sub">Omuke trughte a otufta</div>
					</div>
				</div>
			</div>
			
			<div class="option"
				style="background-image: url(https://66.media.tumblr.com/f19901f50b79604839ca761cd6d74748/tumblr_o65rohhkQL1qho82wo1_1280.jpg);">
				<div class="shadow"></div>
				<div class="label">
					<div class="icon">
						<i class="fas fa-sun"></i>
					</div>
					<div class="info">
						<div class="main">Inatethi</div>
						<div class="sub">Omuke trughte a otufta</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="body">
		<div class="body_content">body content</div>
		<div class="img">
			<img src="resources/img/index__body.svg" alt="">
		</div>
	</div>
	<div class="footer"></div>
</body>

<script type="text/javascript">

	// 로그아웃
	function logout(){
		swal({
			title: "정말 로그아웃을 하시겠습니까?",
			icon : "warning",
			buttons : ["취소", "확인"]
		})
		.then(function(value) {
			if(value) {
				console.log("value : " + value);
				ajaxCompanyChk();
			}
		})
	}

	// 로그아웃 AJAX
	function ajaxCompanyChk() {
		$.ajax({
			url : 'ajaxTokenChk.do',
			dataType : 'text',
			success : function(data) {
				if(data == "No") {
					location.href="logout.do";
				} else {
					logoutSwitchFn(data);
				}
			}
		})
	}
	
	function logoutSwitchFn(data){
		switch(data) {
			case "카카오": 
			
				location.href="kakaoLogout.do";
				break;
				
			case "네이버":
				
				naverLogoutFn();
				break;
				
			case "구글": 
			
				googleLogoutFn();
				break;
				
			case "페이스북":
			
				location.href="facebookLogout.do";
				break;
		}
	}
	
	function googleLogoutFn(){
		$.ajax({
			url : 'googleLogout.do',
			type : 'post',
			dataType : 'text',
			success : function(data){
				popupFn(data);
			}
		})
	}
	
	function naverLogoutFn(){
		
		$.ajax({
			url : 'naverLogout.do',
			type : 'post',
			dataType : 'text',
			success : function(data){
				
				popupFn(data);
			}
		})
	}
	
	function popupFn(url){
		var popupWidth = 1000;
		var popupHeight = 700;
		
		var popupX = (window.screen.width / 2) - (popupWidth /2);
		var popupY = (window.screen.height / 2) - (popupHeight /2);
		
		window.open(url, 'popup', 'z-lock=yes, width='+popupWidth+', height='+popupHeight+', top='+popupY+', left='+popupX);
		location.href='login.do'
	}
	
	$(".option").click(function() {
		$(".option").removeClass("active");
		$(this).addClass("active");
	});

	var nav_Bg = $(".nav_Bg");
	// var nav_tBg = $(".nav_tBg");
	$(window).on("scroll", function() {
		let scrollTop = $(window).scrollTop();
		
		if (scrollTop == 0) {
			nav_Bg.removeClass("nav_Bgafter");
		} else {
			nav_Bg.addClass("nav_Bgafter");
		}
	})
</script>

</html>