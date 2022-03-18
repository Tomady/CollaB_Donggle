<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
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
            height: 200px;
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

        .container__mid__body li:first-child {
            margin-bottom: 70px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .container__mid__body li:last-child {
            list-style: initial;
            margin-left: 16px;
        }

        .container__mid__body li:last-child a {
            text-decoration: underline;
            color: blue;
            margin-left: 15px;
        }

        .mid__body__inputBox {
            width: 300px;
            height: 35px;
            border: 2px solid #9F90D9;
            border-radius: 10px;
            line-height: 35px;
        }

        .mid__body__inputBox input {
            border: none;
            background: none;
            outline: none;
            margin-left: 10px;
            width: 90%;
            
        }

        .mid__body__inputBtn{
            width: 110px;
            height: 39px;
            border-radius: 10px;
            cursor: pointer;
            background-color: #9F90D9;
            text-align: center;
            line-height: 39px;
            color: #F6F6F6;
            font-weight: bold;
            margin-right: 30px;
            transition: .2s;
        }
        .mid__body__inputBtn:hover{
            font-size: 17px;
            background-color: #9482db;
            transition: .4s;
        }
        .body__container__bot {
            height: 100px;
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
                        <li>비밀번호를 모르시나요?</li>
                        <li>아이디를 입력하시면, 찾을 수 있는 방법을 알려드려요.<span class="underline"></span></li>

                    </ul>
                    <ul class="container__mid__body">
                        <li>
                            <div class="mid__body__inputBox"><input type="text" id="inputId" placeholder="아이디를 입력해 주세요."></div>
                            <div class="mid__body__inputBtn" onclick="nextFn()">다음단계</div>
                        </li>
                        <li>아이디를 모르시나요?<a href="idFindMenu.do">아이디 찾기 바로가기</a></li>
                    </ul>
                </div>
                <div class="body__container__bot"></div>
            </div>
        </div>
    </div>
</body>
	<script src="resources/js/jay/confirmForm.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	function nextFn(){
		let id = $('#inputId').val();
		if(id == ''){
			swal({
                icon: 'warning',
                title: '아이디를 입력해 주세요.',
                text: '',
            })
            return;
		}
		
		$.ajax({
			url : 'ajaxPasswordFindIdChk.do',
			type : 'post',
			dataType : 'text',
			data : {
				id : id
			},
			success : function(data){
				if(data == "No"){
					swal({
		                icon: 'warning',
		                title: '입력하신 아이디와 일치하는 정보가 없습니다.',
		                text: '',
		            })
		            return;
				}
				console.log(data)
				nextView(data);
			},
			error : function(){
				console.log("error");
			}
		})
	}
	
	function nextView(data){
		let f = $('<form>');
		let userInfo = $('<input>')
		
		userInfo.attr({
			type : "hidden",
			name : "id",
			value : data
		});
		f.append(userInfo);
		f.attr({
			action : "passwordFindMenuNext.do",
			method : "post"
		})
		f.appendTo(document.body);
		f.submit();
	}
	
	
	
</script>
</html>