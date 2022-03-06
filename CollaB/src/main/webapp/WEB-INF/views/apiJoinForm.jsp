<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
        integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@800&display=swap" rel="stylesheet">
    <title>회원가입</title>
    <style>
        html,
        body {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #ECE9FE;

        }
        a {
            text-decoration: none;
            color: #F6F6F6;
        }

        ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .body__wrap {
            min-width: 980px;
            display: block;
            position: relative;
        }

        .nav__wrap {
            min-width: 980px;
            height: 60px;
            overflow: hidden;
            display: block;
            position: relative;
            background-color: #ECE9FE;
        }

        .nav__row {
            width: 720px;
            height: 100%;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .nav__row a {
            color: #000000;
            font-weight: bold;
            font-size: 1.1rem;
        }

        .nav__homeLogo {
            float: left;
        }

        .nav__right {
            display: flex;

        }

        .nav__right li:first-child {
            margin-right: 20px;
        }

        .nav__right li i {
            margin-right: 8px;
        }

        .body__container {
            width: 980px;
            margin: 0 auto;
            background-color: #ECE9FE;
        }
        .test{
            width: 720px;
            height: 1230px;
            background-color: #CBC0D3;
            margin: 0 auto;
            padding-top: 30px;
            padding-bottom: 10px; 
            border-radius: 30px;
        }

        .body__row {
            width: 660px;
            height: 1200px;
            margin: 0 auto;
            border-radius: 30px;
        }

        .find__top {
            height: 300px;
            background-color: #9F90D9;
            border-radius: 30px 30px 0 0;
            color: #F6F6F6;
        }

        .find__top a {
            text-align: center;
            display: block;
            padding: 20px 0 60px 0;
            font-size: 25px;
            font-weight: bold;
        }

        .find__body__header__contents1 {
            font-size: 38px;
            font-weight: 600;
            padding-left: 8%;
        }
        .find__body__header__contents2 {
            font-size: 20px;
            font-weight: 600;
            padding-left: 8% ;
            padding-top: 25px;
        }
        .essential{
            color: #6553C1;
        }
        .contents__body {
            background-color: white;
            height: 800px;
            position: relative;
        }
        .body__top {
            padding: 20px 90px 0px 90px;
        }
        .body__top li {
            margin-bottom: 15px;
            font-weight: bold;
            font-size: 18px;
        }
        .underline {
            background-color: #9F90D9;
            height: 2px;
            width: 100%;
            display: inline-block;

        }
        .contents__footer{
            width: 100%;
            height: 100px;
            border-radius: 0 0 20px 20px;
            background-color: white;
        }
        .form__input{
            margin-left: 25%;
        }            
        #joinBtn{
            background-color: #9F90D9;
            border: 1px solid #9F90D9;
            width: 150px;
            height: 50px;
            border-radius: 5px;
            color: #F6F6F6;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
            margin: auto;
            display: block;   
        }
        #joinBtn:hover, #joinBtn:active{
            background-color: white;
            border: 1px solid #9F90D9;
            border-radius: 5px;
            color: #9F90D9;
        }
        input[type=checkbox]{
            float: right;
            zoom: 1.5;
        }
        #idCheck{
            background-color: #9F90D9;
            border: 1px solid #9F90D9;
            color: #F6F6F6;
            border-radius: 5px;
            cursor: pointer;
        }
        .modal{ 
            width: 500px; height: 500px;
            background: white;
            display: none;
            border: 1px solid red;
            margin: 0 auto;
            position: fixed;
            top: 50%; left: 50%;
            transform: translate(-50%, -50%);
        }
        .msgGrp{
            margin-top: 5px;
        }
        input[type=text], input[type=password], input[type=email], input[type=tel]{
            height: 25px;
            width: 65%;
            margin-top: 10px;
        }
        .formBox{
            margin-bottom: 20px;
        }
        .label{
			font-weight: bold;        
        }
    </style>
</head>

<body>
    
    <nav class="nav__wrap">
        <div class="nav__row">
            <div class="nav__homeLogo">
                <a href="index.do" style="font-size: 1.2rem;">CollaB</a>
            </div>
            <ul class="nav__right">
<!--                 <li><a href="#"><i class="fas fa-user"></i>Sign Up</a></li> -->
                <li><a href="login.do"><i class="fas fa-unlock-alt"></i>Login</a></li>
            </ul>
        </div>
    </nav>
    <div class="body__wrap">
        <div class="body__container">
            <div class="test">
               
                <div class="body__row">
                    <div class="find__top">
                        <a href="index.do">CollaB</a>
                        <div class="find__body__header__contents1">
                            환영합니다 👋
                        </div>
                        <div class="find__body__header__contents2">
                            콜라비 회원이 되어서 편하게 협업하세요!
                        </div>
                    </div>
                    
                    <div class="contents__body">
                        
                        <ul class="body__top">
                            <li>
                                <span>개인정보 수집 및 이용 동의</span> <span class="essential">(필수)</span><span><input type="checkbox" id="chk"></span>
                            </li>
                            <li>
                                <span>이용약관 동의 </span> <span class="essential">(필수)</span><span><input type="checkbox" id="chk2"></span>
                            </li>
                            <li>
                                <span class="underline"></span>
                            </li>
                        </ul>
                        
                        <div class="form__input">
                            <form id="joinForm" name="joinForm" method="post" onsubmit="formCheck()" action="userInsert.do"> 
                                    <div class="formBox">
                                        <div>
                                            <span class="label">아이디</span>&nbsp;<span class="msgGrp" id="idMsg" style="font-size: 11px;">이메일 형식으로 입력해주세요. 😀</span>                                  
                                        </div>
                                        <input type="text" name="id" id="id" style="width: 50%;" required="required" >&nbsp;<button id="idCheck">중복확인</button>             
                                    </div>

                                    <div class="formBox">
                                        <div>
                                            <span class="label">비밀번호</span>&nbsp;<span class="msgGrp" id="pwMsg" style="font-size: 11px;">영문 대소문자, 숫자, 특수기호 조합하여 10~20자 🔒</span>                                  
                                        </div>
                                        <input type="password" name="password" id="password" required="required">            
                                    </div>
                           
                                    <div class="formBox">
                                        <div>
                                            <span class="label">비밀번호 확인</span>&nbsp;<span class="msgGrp" id="pwChkMsg" style="font-size: 11px;"></span>
                                        </div>
                                        <input type="password" name="pwCheck" id="pwCheck" required="required">
                                    </div>
                                   
                                    <div class="formBox">
                                        <div><span class="label">이 름</span></div>
                                        <input type="text" name="name" id="name" required="required">
                                    </div>
                                    
                                    <div class="formBox">
                                        <div><span class="label">닉네임</span></div>
                                        <input type="text" name="nickname" id="nickname" required="required">
                                    </div>
                                      
                                    <div class="formBox">
                                        <div><span class="label">회사명</span></div>
                                        <input type="text" name="company" id="company" required="required">
                                    </div>
                                   
                                    <div class="formBox">
                                        <div><span class="label">연락처</span></div>
                                        <input type="tel" name="tel" id="tel" required="required">
                                    </div>
                          
                                    <div class="formBox">
                                        <div><span class="label">이메일</span></div>
                                        <input type="email" name="email" id="email" placeholder="아이디 혹은 비밀번호 찾기에 쓰일 이메일 입력" required="required">
                                    </div>
                                    <br>
						<input type="hidden" id="apiProfile_image" name="prof_pic"  value="${profile_image }">
						<input type="hidden" id="company" name="company"  value="${company }">
                   
                        </div> <!--end of form__input-->
                    </div>
                    <div class="contents__footer">
                        <input type="submit" id="joinBtn" value="가입하기" >
                    </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<div class="modal" id="modal1">
        모달 테스트 <br>
        잘 나오나???
        <button id="closeBtn">닫기</button>
</div>
<div class="modal" id="modal2">
        모달 테스트222 <br>
        잘 나오나???
        <button id="closeBtn2">닫기</button> 
</div>
<div class="hiddenInput">
<input type="hidden" id="apiEmail" data-value="email" value="${email }">
<input type="hidden" id="apiNickname" data-value="nickname" value="${nickname }">
<input type="hidden" id="apiName" data-value="name"  value="${name }">
<input type="hidden" id="apiTel" data-value="tel" value="${tel }">
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	$(function(){
		let hiddenInputs = $('.hiddenInput>input')
		
		for(let hiddenInput of hiddenInputs){
			
			if($(hiddenInput).val() != ''){
				let inputName = $(hiddenInput).attr('data-value');
				let inputVal = $(hiddenInput).val();
				$("#"+inputName).val(inputVal).attr("disabled" , "disabled");
			}
		}

	})


// 체크박스 모달
$(document).ready(function(){
    $("#chk").on('change', function(){ 
        if($(this).prop('checked')){
            $("#modal1").fadeIn();
        }
    })
})
$(document).ready(function(){
    $("#chk2").on('change', function(){ 
        if($(this).prop('checked')){
            $("#modal2").fadeIn();
        }
    })
})

document.getElementById("closeBtn").onclick = function() {
    $("#modal1").fadeOut();
};
document.getElementById("closeBtn2").onclick = function() {
    $("#modal2").fadeOut();
};




/* 유효성 검사 자바스크립트 */
let userid = document.getElementById('id');
let pw = document.getElementById('password');
let pwchk = document.getElementById('pwCheck');
let name = document.getElementById('name');

const emailReg =  /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
const pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{10,20}$/;

// form submit 버튼 달-칵
function formCheck(){
	
	if (!$("input:checked[id='chk']").is(":checked")){ 
		alert("개인정보 수집 및 이용 동의를 확인해주세요.");
		form.chk.focus();
	}
	if (!$("input:checked[id='chk2']").is(":checked")){ 
		alert("이용약관 동의를 확인해주세요."); 
		form.chk2.focus();
	}
    if(userid.value < 1){
        alert('아이디를 입력해주세요.');
        userid.value = '';
        userid.focus();
        return false;
    }   
    if(pw.value < 1){
        alert('비밀번호를 입력해주세요.');
        pw.value = '';
        pw.focus();
        return false;
    }
    if(pwchk.value < 1){
        alert('비밀번호 확인을 입력해주세요.');
        pwchk.value = '';
        pwchk.focus();
        return false;
    }
}

// 아이디(이메일) 정규식 검사
userid.onkeyup = () => {
    if(!emailReg.test(event.target.value)){
        document.getElementById('idMsg').innerText = "이메일 형식이 올바르지 않습니다. 😅";
        document.getElementById('idMsg').style.color = 'red';
        
    }else{
        document.getElementById('idMsg').innerText = "좋아요! 😊";
        document.getElementById('idMsg').style.color = 'blue';
    }
}

// 비밀번호 정규식 검사
pw.onkeyup = () => {
    if(!pwReg.test(event.target.value)){
        document.getElementById('pwMsg').innerText = "영문 대소문자, 숫자, 특수기호 조합하여 10~20자 🔒";
        document.getElementById('pwMsg').style.color = 'red';
    }else{
        document.getElementById('pwMsg').innerText = "완벽해요! 😁";
        document.getElementById('pwMsg').style.color = 'blue'
    }
}

// 비밀번호 일치 확인 검사
pwchk.onkeyup = () =>{
    if(pwchk.value < 1 || pw.value != pwchk.value){
        document.getElementById('pwChkMsg').innerText = "비밀번호가 일치하지 않습니다. 😮";
        document.getElementById('pwChkMsg').style.color = 'red';
    }else{
        document.getElementById('pwChkMsg').innerText = "딩동댕동~ 🤗";
        document.getElementById('pwChkMsg').style.color = 'blue';
    }
}
</script>
</body>
</html>

