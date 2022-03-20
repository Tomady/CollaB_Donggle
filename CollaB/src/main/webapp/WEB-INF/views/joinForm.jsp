<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
    <link rel="shortcut icon" href="/favicon2.ico" type="image/x-icon">
    <!-- 웹 타이틀 이미지 -->
	<link rel="shortcut icon" href="/resources/img/web_title.ico">
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
        	display: none;       
            position:relative;
			width:100%;
			height:100%;
			z-index:1;
            
        }
        .contentOfModal{
        	padding: 30px;
        	width: 50%; height: 80%; 
            background: white;
            margin: 0 auto;
            position: fixed;
            top: 50%; left: 50%;
            transform: translate(-50%, -50%);
            overflow: scroll;
        }
        .modalLayer{
        	 position:fixed;
			 top:0;
			 left:0;
			 width:100%;
			 height:100%;
			 background:rgba(0, 0, 0, 0.5);
			 z-index:-1;
        }
        .closing{
        	display: block;
		    margin: auto;
		    margin-top: 20px;
		    border: 1px solid #9F90D9;
		    background-color: #9F90D9;
		    color: white; 
		    cursor: pointer;
		    border-radius: 5px;
		    width: 10%; height: 5%;
        	
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
                <a href="index.do" style="font-size: 1.2rem;"><img src="resources/img/logologo.png" width="120px;"></a>
            </div>
            <ul class="nav__right">
                <li><a href="joinForm.do"><i class="fas fa-user"></i>Sign Up</a></li>
                <li><a href="login.do"><i class="fas fa-unlock-alt"></i>Login</a></li>
            </ul>
        </div>
    </nav>
    <div class="body__wrap">
        <div class="body__container">
            <div class="test">
               
                <div class="body__row">
                    <div class="find__top">
                        <a href="">CollaB</a>
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
                                <span>개인정보 수집 및 이용 동의</span> <span class="essential">(필수)</span><span><input type="checkbox" id="chk" required="required"></span>
                            </li>
                            <li>
                                <span>이용약관 동의 </span> <span class="essential">(필수)</span><span><input type="checkbox" id="chk2" required="required"></span>
                            </li>
                            <li>
                                <span class="underline"></span>
                            </li>
                        </ul>
                        
                        <div class="form__input">
                            <form id="joinForm" name="joinForm" method="post" onsubmit="formCheck()" action="userInsert.do"> 
                                    <div class="formBox">
                                        <div>
                                            <span class="label">*아이디</span>                               
                                        </div>
                                        <input type="text" name="id" id="id" style="width: 50%;" required="required" >&nbsp;
                                        <button type="button" id="idCheck" onclick="fn_idChk()" required="required">중복확인
                                        	<input type="hidden" id="idChkVal" value="">
                                        </button>             
                                    </div>

                                    <div class="formBox">
                                        <div>
                                            <span class="label">*비밀번호</span>&nbsp;<span class="msgGrp" id="pwMsg" style="font-size: 11px;">영문 대소문자, 숫자, 특수기호 조합하여 10~20자 🔒</span>                                  
                                        </div>
                                        <input type="password" name="password" id="password" required="required">            
                                    </div>
                           
                                    <div class="formBox">
                                        <div>
                                            <span class="label">*비밀번호 확인</span>&nbsp;<span class="msgGrp" id="pwChkMsg" style="font-size: 11px;"></span>
                                        </div>
                                        <input type="password" name="pwCheck" id="pwCheck" required="required">
                                    </div>
                                   
                                    <div class="formBox">
                                        <div><span class="label">*이 름</span></div>
                                        <input type="text" name="name" id="name" required="required">
                                    </div>
                                    
                                    <div class="formBox">
                                        <div><span class="label">*이메일</span></div>
                                        <input type="email" name="email" id="email" required="required">
                                    </div>
                                    
                                    <div class="formBox">
                                        <div><span class="label">연락처</span></div>
                                        <input type="tel" name="tel" id="tel">
                                    </div>
                                    
                                    <div class="formBox">
                                        <div><span class="label">닉네임</span></div>
                                        <input type="text" name="nickname" id="nickname">
                                    </div>
                                      
                                    <div class="formBox">
                                        <div><span class="label">회사명</span></div>
                                        <input type="text" name="company" id="company">
                                    </div>                                
                                    <br>                            
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
	<div class="contentOfModal">
		<h3>개인정보 취급방침</h3>
		<h4>[개인정보 수집 및 이용 목적]</h4>
		
		콜라비(CollaB)는 수집한 개인정보를 다음의 목적을 위해 이용합니다.<br>
		     1.서비스 관련 문의 등을 포함한 이용계약 관련 사항의 처리<br>
		     2.서비스품질향상을 위한 통계자료<br>
		     3.기타 개인정보취급방침에 고지된 수탁자에게 서비스 제공 등 계약의 이행에 필요한 업무의 위탁<br>
		<h4>[수집하는 개인정보의 항목]</h4>
		콜라비(CollaB)는 회원가입, 상담, 서비스제공을 위하여 필요한 최소한의 개인정보 만을 수집/이용합니다.<br>
		     1. 이메일주소, 이름, 연락처, 회사명<br>
		     2. 추가로 입력하는 이메일주소<br>
		<h4>[개인정보가 아닌 항목]</h4>
		콜라비(CollaB)의 가입과정에서 입력받지 않는 프로필사진, 부서명, 직급/직책, 주요업무 등은 개인정보에 해당하지 않습니다.<br>
		1. 위 정보들은 서비스 내에서 협업자들을 위한 공공정보로 활용될 수 있습니다.<br>
		2. 휴대폰 번호는 개인정보로서 관리합니다.<br>
		<h4>[개인정보의 보유, 이용기간]</h4>
		콜라비(CollaB)는 고객님의 개인정보를 고객님께 서비스를 제공하는 기간(이용기간) 또는 분쟁처리 기간(보유기간)동안에 한하여 보유하고 이를 활용합니다. 
		다만, 법률에 특별한 규정이 있는 경우에는 관계 법령에 따라 보관됩니다.(이용기간 : 서비스 가입기간(가입일~해지일) 또는 분쟁기간 동안)
		<br>
		※정보통신서비스의 제공을 위한 개인정보의 수집•이용 관련 세부 내역은 ‘개인정보취급방침’에 공개합니다.<br>
	    <button id="closeBtn" class="closing">닫기</button>
	</div>
	<div class="modalLayer"></div>
</div>
<div class="modal" id="modal2">
	<div class="contentOfModal">
		<h3>이용약관</h3>
		<h4>제1장 총칙</h4>
		제1조 목적<br>
		
		이 약관은 콜라비(이하 “회사”)가 운영하는콜라비(동일명, 구분을 위해 이하 “서비스”)에 가입한 회원의 서비스 이용조건 및 절차에 관한 사항과 기타 이용에 필요한 사항을 정함을 목적으로 합니다.<br>
		<br>제2조 약관의 효력및 변경<br>
		①본 약관의 내용은 서비스화면에 게시하거나 기타의 방법으로 회원에게 공시하고, 이에 동의한 회원이 서비스에 가입함으로써 효력이 발생합니다.<br>
		②회사는 약관의 규제에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 관련 법령에 위배되지 않는 범위에서 이 약관을 변경할 수있으며, 약관이 변경된 경우에는 지체 없이 제1항의 방식에 따라개정 약관의 적용일자 7일 전부터 적용일자 전일까지 공지합니다.<br>
		③회사가 전항에 따라 개정약관을 공지 또는 통지하면서 회원에게 적용예정일까지 회사에게 거부의 의사 표시를 하지 않으면 동의 의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지 또는 통지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 아니한 경우 회원이 개정약관에 동의한 것으로 봅니다.<br>
		④회원은 변경된 약관에 동의하지 않으면 서비스 이용을 중단하고 이용계약을 해지할 수 있습니다.<br>
		⑤회사가 약관의 변경 시 본 조에 따른 조치를 하였음에도 불구하고 회원이 변경된 약관을 인지하지 못하여 발생하는 손해에 대해 회사에서는 책임을 지지 않습니다.<br>
		<br>
		제3조 용어의 정의<br>
		본 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
		①‘콜라비(서비스)’라 함은 커뮤니케이션 비용을 효과적으로 줄일 수 있는 협업도구 서비스를 말합니다.<br>
		②‘사이트’라 함은 서비스를 제공하기 위해 회사가 운영하는 웹사이트를 말합니다.<br>
		③‘회원’이라 함은 사이트에서 이용약관에 동의하고, 서비스을 이용하는 고객을 말합니다.<br>
		④‘ID(고유번호)’라 함은 회원식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가 승인하는 이메일 주소입니다.<br>
		⑤‘Password(비밀번호)’라 함은 회원의 비밀보호를 위해 회원 자신이 설정한 문자와 숫자의 조합을 의미합니다.<br>
		<br>
		<h4>제 2 장 손해배상</h4>
		제23조 손해배상손해배상
		①회사의 서비스 제공과 관련하여 회사의 고의 또는 중과실로 인하여 회원이 서비스 이용에 손해를 입은 경우 합당하고 적절한 보상을 받을 수 있습니다.<br> 
		②회사는 회원이 본 서비스와 관련하여 타인의 저작권 등을 침해하더라도 이에 대한 민, 형사상의 책임을 부담하지 않습니다.<br>
		<br>
		제24조 면책조항<br>
		회사는 다음 각 호의 사유로 인하여 발생한 손해에 대해서는 그 책임을 지지 아니합니다.<br>
		①서비스 점검이 불가피하여 사전에 공지한 경우로 회사의 고의, 중과실이 없는 경우<br>
		②국가의 비상사태, 천재지변 또는 이에 준하는 불가항력으로 인해 서비스를 제공할 수 없는 경우<br>
		③회원 또는 제3자의 귀책사유로 인한 데이터 유실 등의 서비스 이용장애 발생시<br>
		④서비스의 관리영역을 벗어난 공중통신선로의 장애로 서비스 이용이 불가능한 경우<br>
		⑤회원의 단말 하드웨어, 운영체계 소프트웨어 사양에 따른 장애의 경우<br>
		⑥회원의 단말의 고장 등의 문제에 따른 장애의 경우<br>
		⑦회원이 다른 회원 등 회사 이외의 제3자가 제공하는 앱이나 프로그램 등으로 인하여 손해를 입은 경우<br>
		<br>
		제25조 약관 외 사항<br>
		①이용자의 개인정보 보호에 관한 사항은 개인정보 취급방침에 따릅니다.<br>
		②기타 회사가 정하는 정책 또는 이용 약관에 명시되지 아니한 사항에 대해서는 전기통신사업법, 정보통신망 이용촉진 등에 관한 법률 및 기타 관련 법령의 규정에 따릅니다.<br>
		<br>
		부 칙
		<br>
		본약관은 2022년 3월 22일부터 적용합니다.
		<br>
        <button id="closeBtn2" class="closing">닫기</button> 
	</div>
        <div class="modalLayer"></div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

var idchkval =  $("#idChkVal");

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

// 아이디 중복 확인
function fn_idChk(){
	idchkval.val('Y');
	
	$.ajax({
		url: "idChk.do",
		type: "post",
		dataType: "json",
		data: {"id" : $("#id").val()},
		success: function(data){
			if(data == 1){
				idchkval.val('No');
				alert("이미 사용 중인 아이디입니다.");
			}else if(data == 0){
				idchkval.val('Ok');
				alert("사용 가능한 아이디입니다.");
				
			}
		}
		
	
	})
}

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
		event.preventDefault();
		alert("개인정보 수집 및 이용 동의를 확인해주세요.");		
	}else if(!$("input:checked[id='chk2']").is(":checked")){
		event.preventDefault();
		alert("이용약관 동의를 확인해주세요."); 
	}else if(!pwReg.test(pw.value)){
		event.preventDefault();
		alert("비밀번호 형식이 올바르지 않습니다.");
	}else if(pwchk.value < 1 || pw.value != pwchk.value){
		event.preventDefault();
		alert("비밀번호가 일치하지 않습니다.");
	}else if(idchkval.val() == ''){
		event.preventDefault();
		alert("아이디 중복확인을 해주세요.");
	}else if(idchkval.val() == 'No'){
		event.preventDefault();
		alert("이미 사용 중인 아이디이거나 중복확인이 필요합니다.");
	}

}
/*
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
*/
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

