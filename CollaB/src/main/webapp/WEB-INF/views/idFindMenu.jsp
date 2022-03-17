<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
        integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
            padding: 70px 50px;
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
        }

        .container__mid__header li:last-child {
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
            padding: 50px;
        }

        .container__mid__body li {
            margin-bottom: 50px;
        }

        .container__mid__body li:last-child{
            margin: 0;
        }
        .container__mid__body input{
            margin-right: 20px;
        }
        .container__mid__body div{
            margin-left: 20px;
            margin-top: 30px;
            height: 70px;
            position: relative;
            display: none;
        }
        .container__mid__body li{
            margin-bottom: 100px;
        }
        .container__mid__body button{
            position: absolute;
            bottom: 0;
            right: 0;
            background-color: #9F90D9;
            border: 1px solid #9F90D9;
            width: 100px;
            height: 30px;
            border-radius: 5px;
            color: #F6F6F6;
            cursor: pointer;
            font-weight: bold;
            
        }
        .container__mid__body button:hover{
            background-color: #826cd8;
        }



        .body__container__bot {
            height: 100px;
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
                    <div class="container__top__2"><i class="far fa-address-card"></i>아이디 찾기 😍</div>
                    <div class="container__top__3">
<!--                         <div><a href="">아이디찾기</a></div> -->
<!--                         <div><a href="">비밀번호찾기</a></div> -->
                    </div>
                </div>
                <div class="body__container__mid">
                    <ul class="container__mid__header">
                        <li>아이디를 모르시나요?</li>
                        <li>아이디 찾기 방법 중 가능한 방법을 선택해 주세요.<span class="underline"></span></li>

                    </ul>
                    <ul class="container__mid__body">
<!--                         <li class="" name="method_1"><span><input type="radio" name="find__radio">내 명의(이름)로 가입된 휴대폰 -->
<!--                                 인증</span> -->
<!--                             <div>내 명의(이름)로 가입한 아이디와, 이름/휴대폰 번호가 일치한 아이디를 찾습니다. -->
<!--                                 <button type="button">다음단계</button> -->
<!--                             </div> -->
<!--                         </li> -->
                        <li class="" name="method_2"><span><input type="radio" name="find__radio">내 정보에 등록된 휴대폰으로
                                찾기</span>
                            <div>가입 시 등록하신 전화번호와 일치한 아이디를 찾습니다.
                                <button type="button" onclick='location.href="idFindTel.do"'>다음단계</button>
                            </div>
                        </li>
                        <li class="" name="method_3"><span><input type="radio" name="find__radio">내 정보에 등록된 이메일로
                                찾기</span>
                            <div>가입 시 등록하신 본인확인 이메일과 일치한 아이디를 찾습니다.
                                <button type="button" onclick="location.href='idFindEmail.do'">다음단계</button>

                            </div>
                        </li>
                    </ul>
                </div>
                <div class="body__container__bot"></div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="resources/js/jay/confirmForm.js"></script>
    <script type="text/javascript">

    $(".container__mid__body").on("click", function (e) {
        // console.log($(e.target).prop('tagName'))
        if ($(e.target).prop('tagName') == 'INPUT') {
            let lis = $(".container__mid__body>li");
            for(let i= 0; i<lis.length; i++ ){
                if(i==$(e.target).parent().parent().index()){
                    continue;
                }
                $(lis[i]).children("div").slideUp(200);
                $(lis[i]).children("span").css("font-weight","normal")
          
            }
            $(e.target).parent().next().slideDown(200);
            $(e.target).parent().css("font-weight","bold")
    

        }
    })
</script>
    
  
</body>
</html>