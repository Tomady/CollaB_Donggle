<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@800&display=swap" rel="stylesheet">
<style type="text/css">
 html,
        body {
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
            margin-right: 18px;
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

        .container__mid__header {}

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
            font-size: 17px;
            font-weight: bold;
            color: #F6F6F6;
            cursor: pointer;
               padding: 0;
	box-sizing: inherit;
        }


        /* 패스워드 찾기 모달 */
        .passwordFindModal {

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

        .passwordFindModal.show {
            display: flex;

        }

        .passwordFindModal_body {
            width: 450px;
            height: 350px;
            border: none;
            text-align: center;
            background-color: #9F90D9;
            border-radius: 20px;
            box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
            display: flex;
            flex-direction: column;

        }




        @keyframes bounceIn {

            0%,
            20%,
            40%,
            60%,
            80%,
            to {
                -webkit-animation-timing-function: cubic-bezier(.215, .61, .355, 1);
                animation-timing-function: cubic-bezier(.215, .61, .355, 1)
            }

            0% {
                opacity: 0;

                transform: scale3d(.3, .3, .3)
            }

            20% {

                transform: scale3d(1.1, 1.1, 1.1)
            }

            40% {

                transform: scale3d(.9, .9, .9)
            }

            60% {
                opacity: 1;

                transform: scale3d(1.03, 1.03, 1.03)
            }

            80% {

                transform: scale3d(.97, .97, .97)
            }

            to {
                opacity: 1;

                transform: scaleX(1)
            }
        }

        .bounceIn {
            animation-name: bounceIn;
            animation-duration: 1s;
            animation-fill-mode: both
        }

        .bounceOut {
            animation-name: bounceOut;
            animation-duration: .7s;
            animation-fill-mode: both
        }

        @keyframes bounceOut {
            20% {
                -webkit-transform: scale3d(.9, .9, .9);
                transform: scale3d(.9, .9, .9)
            }

            50%,
            55% {
                opacity: 1;
                -webkit-transform: scale3d(1.1, 1.1, 1.1);
                transform: scale3d(1.1, 1.1, 1.1)
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
            height: 60%;
            display: flex;
            flex-direction: column;
            box-sizing: border-box;
            justify-content: center;


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
            padding-top: 20px;


        }

        .password__inputBox {
            display: flex;
            justify-content: center;
            height: 30px;
            align-items: center;
        }

        .password__inputBox:first-child {
            margin-bottom: 15px;
        }

        .inputText {
            margin-right: 10px;
            width: 110px;
            font-size: 14px;
        }

        .password_input{
            height: 30px;
            line-height: 30px;
            border: 2px solid #9F90D9;
            border-radius: 10px;
            width: 210px;
        }
        .password_input input{
            outline: none;
            border: none;
            background: none;
            margin-left: 8px;
            width: 100%;
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

        .footer__passwordChange {
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
            <div class="navbar__Left"><a href="index.do">CollaB</div></a>
            <ul class="navbar__right">
                <li><a href="joinForm.do"><i class="fas fa-user"></i>Sign Up</a></li>
                <li><a href="login.do"><i class="fas fa-unlock-alt"></i>Login</a></li>
            </ul>
        </div>
    </nav>
    <div class="wrap">
        <div class="wrap__body">
            <div class="wrap__body__container">
                <div class="body__container__top">
                    <div class="container__top__1"><a href="index.do">CollaB</a></div>
                    <div class="container__top__2"><i class="fas fa-unlock-alt"></i>비밀번호 찾기 😍</div>
                    <div class="container__top__3">

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
                                <div class="body__inputbox"><input type="text" id="name"></div>
                            </li>
                            <li>
                                <div>이메일</div>
                                <div class="body__inputbox"><input type="text" id="email"></div>
                                <button type="button" class="body__inputBtn" id="confirmRequestBtn" onclick="nameEmailChkFn()">인증요청</button>
                            </li>
                            <li>
                                <div>인증번호</div>
                                <div class="body__inputbox cnt disabled"><input type="text" id="inputNumb" disabled="disabled"><span class="countdown">03:00</span>
                                </div>
                                <button type="button" class="body__inputBtn disabled" id="confirmBtn" disabled="disabled" onclick="numConfirmFn()">인증확인</button>
                            </li>
                            <li>
                                <div></div>
                                <button type="button" class="submitBtn btn-open-popup disabled"
                                id="passwordFindBtn" disabled="disabled" onclick="passwordFind()">바밀번호 찾기</button>
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
    <div class="passwordFindModal">
        <div class="passwordFindModal_body">
            <div class="modal__header"><i class="fas fa-unlock-alt"></i>비밀번호 재설정 😍</div>
            <div class="modal__body">
                <div class="modal__body__explain">
                    하재의님, 새로운 비밀번호로 재설정해 주세요.
                    <span class="modal__underline"></span>
                </div>
                <div class="modal__body__content">
                    <div class="password__inputBox">
                        <div class="inputText">비밀번호</div>
                        <div class="password_input"><input type="text" id="changePassword" placeholder="새 비밀번호를 입력해주세요."></div>
                    </div>
                    <div class="password__inputBox">
                        <div class="inputText">비밀번호 확인</div>
                        <div class="password_input"><input type="text" id="changePasswordChk" placeholder="새 비밀번호를 입력해주세요."></div>
                    </div>
                </div>
            </div>
            <div class="modal__footer">
                <div class="footer__passwordChange">비밀번호 변경</div>
                <span class="Vertical__line"></span>
                <div class="modal__footer__cancelBtn">창 닫기</div>
            </div>
        </div>

    </div>
        <input type="hidden" id="confirmNumber" value="">
    <input type="hidden" id="findResultId" value="">
</body>

<script src="resources/js/jay/confirmForm.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

$('.footer__passwordChange').on('click', function(){
	let changePassword = $('#changePassword').val()
	let changePasswordChk = $('#changePasswordChk').val()
	
	if(changePassword == ''){
		swal({
            icon: 'warning',
            title: '비밀번호를 입력해 주세요.',
            text: '',
        })
        return;
	}else if(changePasswordChk == ''){
		swal({
            icon: 'warning',
            title: '비밀번호 확인을 입력해 주세요.',
            text: '',
        })
        return;
	}
	
	if(changePassword != changePasswordChk){
		swal({
            icon: 'warning',
            title: '비밀번호가 일치하지 않습니다.',
            text: '',
        })
        return;
	}
	
	ajaxPasswordChange(changePassword)

})

function ajaxPasswordChange(password){
	let id = $('#findResultId').val()
	$.ajax({
		url : 'ajaxPasswordChange.do',
		type : 'post',
		dataType : 'text',
		data : {
			id : id,
			password : password
		},
		success : function(data){
			if(data == 'Yes'){
				swal({
		            icon: 'success',
		            title: '비밀번호 변경이 완료됐습니다.',
		            text: '',
		        })
		      	.then(function(value){
		      		if(value){
		      			location.href="login.do"
		      		}
		      	})
			}else{
				swal({
		            icon: 'warning',
		            title: '시스템 오류\n관리자에게 문의해 주세요.',
		            text: '',
		        })
			}
		},
		error : function(){
			swal({
	            icon: 'warning',
	            title: '시스템 오류\n관리자에게 문의해 주세요.',
	            text: '',
	        })
		}
		
	
	})
}

function passwordFind(){
	let name = $('#name').val()
	let email = $('#email').val()
	
	
	$.ajax({
		url : 'ajaxPasswordEmailFind.do',
		type : 'post',
		dataType : 'text',
		data : {
			name : name,
			email : email
		},
		success : function(data){
			if(data == 'No'){
				swal({
		            icon: 'warning',
		            title: '시스템 오류\n관리자에게 문의해 주세요.',
		            text: '',
		        })
		         .then(function(value){
		      		if(value){
		      			return;
		      		}
		      	})
			}
			$('#findResultId').val(data);
			modalPopupFn();
		}
	})
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
       
        return;
	}
	if(confirmInput == confirmNumber){
		let passwordFindBtn = $('#passwordFindBtn');
		let confirmRequestBtn = $('#confirmRequestBtn')
		
		swal({
            icon: 'success',
            title: '인증완료\n\n비밀번호 찾기 버튼을 클릭해 주세요.',
            text: '',
        })
        
        noneFn()
        confirmRequestBtn.attr('disabled', true);
		confirmRequestBtn.toggleClass('disabled')
        passwordFindBtn.toggleClass('disabled')
      	passwordFindBtn.attr('disabled', false);
	}else{
		swal({
            icon: 'error',
            title: '인증번호가 불일치 합니다.',
            text: '',
        })
	}
	
}

function nameEmailChkFn(){
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
				
			}else{
				swal({
	                icon: 'error',
	                title: '',
	                text: '이름 또는 이메일을 확인해 주세요.\n일치하는 정보가 없습니다.',
	            })
			}
			
		},
		error : function(){
			swal({
                icon: 'error',
                title: '',
                text: '시스템 에러\n\n관리자에게 문의해 주세요.',
            })
		}
	})
	
}
// 요기!
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
				swal({
	                icon: 'warning',
	                title: '',
	                text: '3분 이내로 인증번호(6자리)를 입력해 주세요.',
	            })
				blockFn();
		    	inputcountdownval();	
		    	
			}
			
		},
		error : function(){
			swal({
                icon: 'error',
                title: '',
                text: '시스템 에러\n\n관리자에게 문의해 주세요.',
            })
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

const modal = document.querySelector('.passwordFindModal');
const passwordFindModal_body = document.querySelector('.passwordFindModal_body');
const cancelBtn = document.querySelector('.modal__footer__cancelBtn');


function modalPopupFn(){
	passwordFindModal_body.classList.add('bounceIn');
	 modal.classList.toggle('show');
}


cancelBtn.addEventListener('click', (event) => {
  
	passwordFindModal_body.classList.remove('bounceIn')
        passwordFindModal_body.classList.add('bounceOut');
        setTimeout(function () {
        	passwordFindModal_body.classList.remove('bounceOut')
            modal.classList.toggle('show');
        }, 600)



});


// 카운트 다운 src

function timeformat(num) {
    return num < 10 ? "0" + num : num;
}

function inputcountdownval() {
    let inputminval = 3;
    let inputsecval = 00;
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
        	if($('#passwordFindBtn').attr('disabled') == 'disabled'){
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
</html>