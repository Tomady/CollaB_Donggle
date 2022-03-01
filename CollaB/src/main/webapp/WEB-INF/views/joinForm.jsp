<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            padding: 50px 50px 0px 50px;
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
            padding-left: 50px;
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
            
    </style>
</head>

<body>
    
    <nav class="nav__wrap">
        <div class="nav__row">
            <div class="nav__homeLogo">
                <a href="" style="font-size: 1.2rem;">CollabB</a>
            </div>
            <ul class="nav__right">
                <li><a href="#"><i class="fas fa-user"></i>Sign Up</a></li>
                <li><a href="#"><i class="fas fa-unlock-alt"></i>Login</a></li>
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
                            <form action="" method="post" name="joinForm"> 
                                <table width="500" height="600" cellpadding="0" style="border-collapse:collapse; font-size:9pt;">
                                    <tr class="register" height="30">
                                        <td width="5%" align="center">*</td>
                                        <td width="17%">아이디</td>
                                        <td><input type="text" name="userId" />&nbsp;<button id="idCheck">ID 중복 체크</button></td>
                                    </tr>
                                    <tr height="7">
                                        <td colspan="3"><hr /></td>
                                    </tr>
                                    <tr class="register" height="30">
                                        <td width="5%" align="center">*</td>
                                        <td width="17%">비밀번호</td>
                                        <td><input type="password" name="pw" id="pw" onchange="isSame()" /></td>
                                    </tr>
                                    <tr height="7">
                                        <td colspan="3"><hr /></td>
                                    </tr>
                                    <tr class="register" height="30">
                                        <td width="5%" align="center">*</td>
                                        <td width="17%">비밀번호 확인</td>
                                        <td><input type="password" name="pwCheck" id="pwCheck" onchange="isSame()" />&nbsp;&nbsp;<span id="same"></span></td>
                                    </tr>
                                    <tr height="7">
                                        <td colspan="3"><hr /></td>
                                    </tr>
                                    <tr class="register" height="30">
                                        <td width="5%" align="center">*</td>
                                        <td width="17%">이 름</td>
                                        <td><input type="text" name="userName" /></td>
                                    </tr>
                                    <tr height="7">
                                        <td colspan="3"><hr /></td>
                                    </tr>
                                    <tr class="register" height="30">
                                        <td width="5%" align="center">*</td>
                                        <td width="17%">닉네임</td>
                                        <td><input type="text" name="nickname" /></td>
                                    </tr>
                                    <tr height="7">
                                        <td colspan="3"><hr /></td>
                                    </tr>
                                    <tr class="register" height="30">
                                        <td width="5%" align="center">*</td>
                                        <td width="17%">회사명</td>
                                        <td><input type="text" name="company" /></td>
                                    </tr>
                                    <tr height="7">
                                        <td colspan="3"><hr /></td>
                                    </tr>
                                    <tr class="register" height="30">
                                        <td width="5%" align="center">*</td>
                                        <td width="17%">연락처</td>
                                        <td><input type="tel" name="phone" /></td>
                                    </tr>
                                    <tr height="7">
                                        <td colspan="3"><hr /></td>
                                    </tr>
                                    <tr class="register" height="30">
                                        <td width="5%" align="center">*</td>
                                        <td width="17%">이메일</td>
                                        <td><input type="email" name="email" /></td>
                                    </tr>
                                    <tr height="7">
                                        <td colspan="3"><hr /></td>
                                    </tr>
                                </table>

                            </form>
                        </div> <!--end of form__input-->
                    </div>
                    <div class="contents__footer"><button type="button" id="joinBtn">가입하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 모달창 -->
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
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script>
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


   </script>
</body>

</html>

