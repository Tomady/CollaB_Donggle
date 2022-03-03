<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@800&display=swap"
	rel="stylesheet">
<style type="text/css">
html, body {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, Helvetica, sans-serif;
	background-color: #ECE9FE;
}

ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
	color: black;
}

.nav {
	width: 100%;
}

.navbar {
	width: 720px;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
	align-items: center;
	height: 60px;
}

.navbar__Left a {
	font-size: 1.2rem;
	font-weight: bold;
}

.navbar__right {
	display: flex;
}

.navbar__right li:first-child {
	margin-right: 20px;
}

.navbar__right li a {
	font-size: 1.1rem;
	font-weight: bold;
}

.navbar__right li i {
	margin-right: 8px;
}

.wrap {
	width: 100%;
	height: 100%;
}

.wrap__body {
	width: 720px;
	height: auto;
	background-color: #CBC0D3;
	margin: 0 auto;
	border-radius: 30px;
	padding: 30px 0;
}

.wrap__body__container {
	width: 660px;
	height: auto;
	border-radius: 30px;
	background-color: #9F90D9;
	margin: auto;
	display: flex;
	flex-direction: column;
	/* align-items: center; */
}

.body__container__top {
	height: 300px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: space-between;
	padding-top: 20px;
}

.container__top__1 a {
	font-size: 25px;
	color: #F6F6F6;
	font-weight: bold;
}

.container__top__2 {
	font-size: 38px;
	font-weight: bold;
	color: #F6F6F6;
}

.container__top__2 i {
	margin-right: 10px;
}

.container__top__3 {
	display: flex;
	align-self: flex-start;
}

.container__top__3 div {
	margin-right: 10px;
}

.container__top__3 a {
	color: #F6F6F6;
}

.body__container__mid {
	background-color: #F6F6F6;
	height: auto;
	padding: 70px 50px 50px 50px;
}

.container__mid__header {
	
}

.container__mid__header li {
	margin-bottom: 10px;
	font-size: 18px;
	position: relative;
}

.container__mid__header li:first-child {
	font-size: 20px;
	font-weight: bold;
	display: flex;
}

.underline {
	background-color: #9F90D9;
	height: 2px;
	width: 100%;
	display: inline-block;
	position: absolute;
	bottom: -10px;
}

.container__mid__body {
	padding: 50px 50px 0 50px;
}

.body__content {
	list-style: disc;
}

.body__content li {
	margin-bottom: 15px;
}

.body__input {
	margin-top: 80px;
	font-size: 15px;
	font-weight: bold;
}

.body__input li {
	display: flex;
	width: 100%;
	height: 35px;
	margin-bottom: 35px;
	align-items: center;
}

.body__input li div:first-child {
	/* border: 1px solid black; */
	width: 80px;
	height: 100%;
	line-height: 35px;
	text-align: center;
}

.body__inputbox {
	margin-left: 18px;
	width: 250px;
	border: 2px solid #9F90D9;
	border-radius: 5px;
	height: 35px;
	line-height: 35px;
}

.countdown {
	color: red;
}

.body__inputbox input {
	border: none;
	background: none;
	outline: none;
	margin-left: 10px;
	width: 76%;
}

.body__inputBtn {
	width: 80px;
	height: 35px;
	background-color: #9F90D9;
	border-radius: 5px;
	color: #F6F6F6;
	font-weight: bold;
	font-size: 14px;
	margin-left: 20px;
	text-align: center;
	line-height: 35px;
	cursor: pointer;
	padding: 0;
	box-sizing: inherit;
	outline: none;
	border: 1px solid #9F90D9;
}

.body__input li:last-child {
	margin-top: 60px;
}

.body__container__bot {
	height: 100px;
}

.submitBtn {
	margin-left: 18px;
	width: 250px;
	background-color: #9F90D9;
	border: 2px solid #9F90D9;
	border-radius: 5px;
	height: 35px;
	line-height: 35px;
	text-align: center;
	line-height: 35px;
	font-size: 15px;
	font-weight: bold;
	color: #F6F6F6;
	cursor: pointer;
	padding: 0;
	box-sizing: inherit;
}

/* 아이디 찾기 모달 */
.idFindModal {
	justify-content: center;
	align-items: center;
	top: 0;
	left: 0;
	position: fixed;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.8);
	transition: .5s;
}

.idFindModal.show {
	display: flex;
}

.idFindModal_body {
	width: 450px;
	height: 300px;
	border: none;
	text-align: center;
	background-color: #9F90D9;
	border-radius: 20px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	display: flex;
	flex-direction: column;
}

@
keyframes bounceIn { 0%, 20%, 40%, 60%, 80%, to {
	-webkit-animation-timing-function:cubic-bezier(.215, .61, .355, 1);
	animation-timing-function: cubic-bezier(.215, .61, .355, 1)
}

0
%
{
opacity
:
0;
transform
:
scale3d(
.3
,
.3
,
.3
)
}
20
%
{
transform
:
scale3d(
1.1
,
1.1
,
1.1
)
}
40
%
{
transform
:
scale3d(
.9
,
.9
,
.9
)
}
60
%
{
opacity
:
1;
transform
:
scale3d(
1.03
,
1.03
,
1.03
)
}
80
%
{
transform
:
scale3d(
.97
,
.97
,
.97
)
}
to {
	opacity: 1;
	transform: scaleX(1)
}

}
.bounceIn {
	animation-name: bounceIn;
	animation-duration: 1s;
	animation-fill-mode: none;
}

.bounceOut {
	animation-name: bounceOut;
	animation-duration: .7s;
	animation-fill-mode: none;
}

@
keyframes bounceOut { 20% {
	-webkit-transform: scale3d(.9, .9, .9);
	transform: scale3d(.9, .9, .9)
}

50
%
,
55
%
{
opacity
:
1;
-webkit-transform
:
scale3d(
1.1
,
1.1
,
1.1
);
transform
:
scale3d(
1.1
,
1.1
,
1.1
)
}
to {
	opacity: 0;
	-webkit-transform: scale3d(.3, .3, .3);
	transform: scale3d(.3, .3, .3)
}

}
.modal__header {
	width: 100%;
	height: 30%;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 24px;
	font-weight: bold;
	color: #F6F6F6;
}

.modal__header i {
	margin-right: 5px;
}

.modal__body {
	background-color: #F6F6F6;
	width: 100%;
	height: 50%;
	display: flex;
	flex-direction: column;
	box-sizing: border-box;
	justify-content: center;
	padding-top: 40px;
}

.modal__body__explain {
	width: 80%;
	position: relative;
	margin: 0 auto;
	font-size: 17px;
	font-weight: bold;
}

.modal__underline {
	display: inline-block;
	width: 100%;
	/* height: 2px; */
	background-color: #9F90D9;
	position: absolute;
	top: 30px;
	left: 0;
}

.modal__body__content {
	margin: 20px auto;
	display: flex;
	width: 80%;
	height: 60px;
	line-height: 60px;
	justify-content: center;
}

.content__idInput {
	margin-right: 10px;
}

.modal__body__content span {
	font-size: 16px;
	font-weight: bold;
}

.modal__footer {
	width: 100%;
	height: 20%;
	display: flex;
	justify-content: space-around;
}

.modal__footer div {
	width: 50%;
	color: #F6F6F6;
	font-weight: bold;
	font-size: 18px;
	cursor: pointer;
	height: 100%;
	line-height: 60px;
	transition: .2s;
}

.footer__passwordFind {
	border-radius: 0 0 0 20px;
}

.modal__footer__cancelBtn {
	border-radius: 0 0 20px 0;
}

.modal__footer div:hover {
	background-color: #9584d6;
	/* transform: scale(0.97); */
	font-size: 20px;
	transition: .4s;
}

.Vertical__line {
	display: inline-block;
	width: 2px;
	height: 100%;
	background-color: #F6F6F6;
	border: none;
}

.swal-modal {
	border-radius: 10px;
}

.swal-title {
	
}

.swal-text {
	text-align: center;
}

.swal-button {
	background-color: #9F90D9;
}

.disabled {
	cursor: default;
}
</style>
</head>
<body>
	<nav class="nav">
		<div class="navbar">
			<div class="navbar__Left">
				<a href="">CollaB
			</div>
			</a>
			<ul class="navbar__right">
				<li><a href=""><i class="fas fa-user"></i>Sign Up</a></li>
				<li><a href=""><i class="fas fa-unlock-alt"></i>Login</a></li>
			</ul>
		</div>
	</nav>
	<div class="wrap">
		<div class="wrap__body">
			<div class="wrap__body__container">
				<div class="body__container__top">
					<div class="container__top__1">
						<a href="">CollaB</a>
					</div>
					<div class="container__top__2">
						<i class="far fa-address-card"></i>아이디 찾기 😍
					</div>
					<div class="container__top__3">
						<!--                         <div><a href="">아이디찾기</a></div> -->
						<!--                         <div><a href="">비밀번호찾기</a></div> -->
					</div>
				</div>
				<div class="body__container__mid">
					<ul class="container__mid__header">
						<li>이메일로 찾기<span class="underline"></span></li>
					</ul>
					<div class="container__mid__body">
						<ul class="body__content">
							<li>가입 시 등록하신 이름과 이메일을 정확하게 입력해 주세요.</li>
							<li>인증요청 버튼을 누르시면 인증번호가 발송 됩니다.</li>
							<li>3분 이내에 인증 번호를 정확하게 입력해 주세요.</li>
						</ul>
						<ul class="body__input">
							<li>
								<div>이름</div>
								<div class="body__inputbox">
									<input id="name" type="text">
								</div>
							</li>
							<li>
								<div>이메일</div>
								<div class="body__inputbox">
									<input id="email" type="text">
								</div>
								<button type="button" class="body__inputBtn" id="confirmRequestBtn"
									onclick="nameEmailChk()">인증요청</button>
							</li>
							<li>
								<div>인증번호</div>
								<div class="body__inputbox cnt disabled">
									<input id="inputNumb" type="text" disabled="disabled"><span
										class="countdown">03:00</span>
								</div>
								<button type="button" class="body__inputBtn disabled"
									id="confirmBtn" disabled="disabled" onclick="numConfirmFn()">인증확인</button>
							</li>
							<li>
								<div></div>
								<button type="button" class="submitBtn btn-open-popup disabled"
									id="idFindBtn" disabled="disabled" onclick="idFind()">아이디 찾기</button>
								<div></div>
							</li>

						</ul>

					</div>
				</div>
				<div class="body__container__bot"></div>
			</div>
		</div>
	</div>


	<!-- 아이디 찾기 모달 -->
	<div class="idFindModal">
		<div class="idFindModal_body">
			<div class="modal__header">
				<i class="far fa-address-card"></i>아이디 찾기 😍
			</div>
			<div class="modal__body">
				<div class="modal__body__explain">
					고객님의 정보와 일치하는 아이디 입니다. <span class="modal__underline"></span>
				</div>
				<div class="modal__body__content">
					<div class="content__idInput">
						<span> 아이디 : </span> ha3310@naver.com
					</div>
					<div class="content__date">
<!-- 						<span>가입 : </span> 2006,05,10 -->
					</div>
				</div>
			</div>
			<div class="modal__footer">
				<div class="footer__passwordFind">비밀번호 찾기</div>
				<span class="Vertical__line"></span>
				<div class="modal__footer__cancelBtn">창 닫기</div>
			</div>
		</div>

	</div>
	<input type="hidden" id="confirmNumber" value="">
	<!--     <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
	<script src="resources/js/jay/confirmForm.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
	function idFind(){
		
	}
    
    function numConfirmFn(){
    	let confirmInput = $('#inputNumb').val();
    	let confirmNumber = $('#confirmNumber').val();
    	if(confirmInput == ''){
    		swal({
                icon: 'warning',
                title: '인증번호를 입력해 주세요.',
                text: '',
            })
           
            
    	}
    	if(confirmInput == confirmNumber){
    		let idFindBtn = $('#idFindBtn');
    		let confirmRequestBtn = $('#confirmRequestBtn')
    		
    		swal({
                icon: 'success',
                title: '인증완료\n\n아이디 찾기 버튼을 클릭해 주세요.',
                text: '',
            })
            
            noneFn()
            confirmRequestBtn.attr('disabled', true);
    		confirmRequestBtn.toggleClass('disabled')
            idFindBtn.toggleClass('disabled')
          	idFindBtn.attr('disabled', false);
    	}else{
    		swal({
                icon: 'error',
                title: '인증번호가 불일치 합니다.',
                text: '',
            })
    	}
    	
    }
    
    function nameEmailChk(){
    	let name = $('#name').val()
    	let email = $('#email').val()
    	if(name == ''){
    		swal({
                icon: 'warning',
                title: '이름을 입력해 주세요.',
                text: '',
            })
           return;
    	}else if(email == ''){
    		swal({
                icon: 'warning',
                title: '이메일을 입력해 주세요.',
                text: '',
            })
            return;
    	}
    	
    	ajaxNameEmailChk(name, email);
    	
    }
    
    
    function ajaxNameEmailChk(name, email){
    	console.log(name)
    	console.log(email)
    	
    	$.ajax({
    		url : 'ajaxNameEmailChk.do',
    		type : 'post',
    		dataType: 'text',
    		data : {
    			name : name,
    			email : email
    		},
    		success : function(data){
    			if(data=='Yes'){
    				ajaxEmailConfirm(name, email)
    				swal({
    	                icon: 'warning',
    	                title: '',
    	                text: '3분 이내로 인증번호(6자리)를 입력해 주세요.',
    	            })
    			}else{
    				swal({
    	                icon: 'error',
    	                title: '',
    	                text: '이름 또는 이메일을 확인해 주세요.\n일치하는 정보가 없습니다.',
    	            })
    			}
    			
    		},
    		error : function(){
    			
    		}
    	})
    	
    }
    
    function ajaxEmailConfirm(name, email){
    
    	let randomnum = Math.floor(Math.random() * 1000000);
    	
    	$.ajax({
    		url : 'ajaxEmailConfirm.do',
    		type : 'post',
    		data : {
    			randomnum : randomnum,
    			name : name,
    			email : email
    		},
    		success : function(data){
    			if(data=='Yes'){
    				$('#confirmNumber').val(randomnum);
    				blockFn();
    		    	inputcountdownval();	
    			}
    			
    		},
    		error : function(){
    			console.log("error")
    		}
    	})
    	
    	
    
    }
    
    
    function blockFn(){
    	let inputBox = $('.cnt');
    	let input = $('#inputNumb');
    	let confirmBtn = $('#confirmBtn');
    	input.attr('disabled', false)
    	confirmBtn.attr('disabled', false)
    	confirmBtn.removeClass('disabled')
    	inputBox.removeClass('disabled')
    
    }
    function noneFn(){
     	let inputBox = $('.cnt');
    	let input = $('#inputNumb');
    	let confirmBtn = $('#confirmBtn');
    	input.attr('disabled', true)
    	confirmBtn.attr('disabled', true)
    	confirmBtn.addClass('disabled')
    	inputBox.addClass('disabled')
    }
    


 
    // 아이디 찾기 모달 scr
    const body = document.querySelector('body');
    const modal = document.querySelector('.idFindModal');
    const idFindModal_body = document.querySelector('.idFindModal_body');
    const cancelBtn = document.querySelector('.modal__footer__cancelBtn');
    const btnOpenPopup = document.querySelector('.btn-open-popup');

    btnOpenPopup.addEventListener('click', () => {

        modal.classList.toggle('show');
        idFindModal_body.classList.add('bounceIn');
      
    });

    cancelBtn.addEventListener('click', (event) => {
      
            idFindModal_body.classList.remove('bounceIn')
            idFindModal_body.classList.add('bounceOut');
            setTimeout(function () {
                idFindModal_body.classList.remove('bounceOut')
                modal.classList.toggle('show');
            }, 600)


   
    });

    // 카운트 다운 src

    function timeformat(num) {
        return num < 10 ? "0" + num : num;
    }

    function inputcountdownval() {
        let inputminval = 0;
        let inputsecval = 30;
        let duration = inputminval * 60 + inputsecval;

        countdownEl = document.querySelector('.countdown');
        countdownEl.textContent = timeformat(inputminval) + ':' + timeformat(inputsecval);

        startcountdown(--duration, countdownEl);
    }

    function startcountdown(duration, element) {

        let secremaining = duration;
        let min = 0;
        let sec = 0;

        let countinterval = setInterval(function () {
            min = parseInt(secremaining / 60);
            sec = parseInt(secremaining % 60);


            countdownEl.textContent = timeformat(min) + ':' + timeformat(sec);

            secremaining = secremaining - 1;

            if (secremaining < 0) {
            	if($('#idFindBtn').attr('disabled') == 'disabled'){
            		 swal({
      	                icon: 'error',
      	                title: '',
      	                text: '입력시간이 초과 되었습니다.\n다시 요청 바랍니다.',
      	            })

            	}
            	$('#confirmNumber').val('');
           		noneFn();
            	clearInterval(countinterval);
                
               
            }
        }, 1000);
    }


</script>
</body>
</html>