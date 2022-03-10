<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no"
	name="viewport">
<title>Bootstrap Components &rsaquo; Card &mdash; Stisla</title>

<!-- General CSS Files -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
<!-- Template CSS -->
<link rel="stylesheet"
	href='<c:url value="/resources/assets/css/style.css"></c:url>'>
<link rel="stylesheet"
	href='<c:url value="/resources/assets/css/components.css"></c:url>'>


<!-- CSS Libraries -->


<!-- Template CSS -->
<!-- <link rel="stylesheet" href="resources/assets/css/style.css"> -->
<!-- <link rel="stylesheet" href="resources/assets/css/components.css"> -->

<style>
/*1.보드헤더버튼색*/
.boardheaderbtn {
	background-color: rgb(171, 127, 252);
	border: solid 1px rgb(171, 127, 252);
}

.boardheaderFilter {
	border: solid 1px rgb(171, 127, 252);
	color: rgb(171, 127, 252);
}

/*2.메인헤더배경색*/
.mainheaderBackground {
	background-color: rgb(199, 174, 247);
}

/*3.페이지바디배경색*/
.pagebodybackground {
	background-color: rgb(204, 195, 226);
}

.cardDetail {
	width: 100%;
	height: 850px;
	overflow: scroll;
	overflow-x: hidden;
	border-radius: 2px;
}

.label {
	width: 25px;
	height: 25px;
	border: rgb(240, 240, 240) 1px solid;
	text-align: center;
	line-height: 2;
}

.fa-check {
	color: black;
}

.cardmenu {
	background-color: whitesmoke;
	border-radius: 10px;
}

.menu {
	font-size: medium;
	color: gray;
}
</style>


</head>

<body class="pagebodybackground">
	<div id="app">
		<div class="main-wrapper">
			<div class="navbar-bg mainheaderBackground"></div>
			<!-- Main Header -->
			<nav
				class="navbar navbar-expand-lg main-navbar d-flex justify-content-between">
				<form class="form-inline mr-auto">
					<ul class="navbar-nav mr-3">
						<li><a href="#" data-toggle="sidebar"
							class="nav-link nav-link-lg"><i class="fas fa-bars"></i></a></li>
						<li><a href="#" data-toggle="search"
							class="nav-link nav-link-lg d-sm-none"><i
								class="fas fa-search"></i></a></li>
					</ul>
				</form>
				<div class="col-lg d-flex justify-content">
					<div onclick="location.href=''"
						style="color: white; font-weight: bold;"
						class="mainheadermenu mr-4">Workspace</div>
					<div onclick="location.href=''"
						style="color: white; font-weight: bold;"
						class="mainheadermenu mr-4">Recent</div>
					<div onclick="location.href=''"
						style="color: white; font-weight: bold;"
						class="mainheadermenu mr-4">Create</div>
				</div>
				<ul class="navbar-nav navbar-right">
					<li class="dropdown"><a href="#" data-toggle="dropdown"
						class="nav-link dropdown-toggle nav-link-lg nav-link-user"> <img
							alt="image" src="resources/assets/img/avatar/avatar-1.png"
							class="rounded-circle mr-1">
							<div class="d-sm-none d-lg-inline-block">Hi, Circle</div>
					</a>
						<div class="dropdown-menu dropdown-menu-right">
							<a href="#" class="dropdown-item has-icon"> <i
								class="far fa-user"></i> Mypage
							</a>
							<div class="dropdown-divider"></div>
							<a href="#" class="dropdown-item has-icon text-danger"> <i
								class="fas fa-sign-out-alt"></i> Logout
							</a>
						</div></li>
				</ul>

			</nav>
			<!-- Main Sidebar -->
			<div class="main-sidebar">
				<aside id="sidebar-wrapper">
					<div class="sidebar-brand">
						<a href="#">Colla B</a>
					</div>
					<ul class="sidebar-menu">
						<li><a class="nav-link" href="#"> <span>[current
									workspace name]</span>
						</a></li>
						<li class="menu-header">MENU</li>
						<li><a class="nav-link" href="#"> <i
								class="fas fa-columns"></i> <span>Boards</span>
						</a></li>
						<li><a class="nav-link" href="#"> <i class="far fa-user"></i>
								<span>Members</span>
						</a></li>
						<li><a class="nav-link" href="#"> <i class="fas fa-fire"></i>
								<span>Issues</span>
						</a></li>
						<li><a class="nav-link" href="#"> <i class="fas fa-th"></i>
								<span>Files</span>
						</a></li>
						<li class="menu-header">Your Boards</li>
						<li><a class="nav-link" href="#"> <span> [board 1]</span>
						</a></li>
						<li><a class="nav-link" href="#"> <span> [board 2]</span>
						</a></li>
						<li class="menu-header">Your Workspace</li>
						<li><a class="nav-link" href="#"> <span>
									[Workspace 1]</span>
						</a></li>
						<li><a class="nav-link" href="#"> <span>
									[Workspace 2]</span>
						</a></li>
					</ul>
				</aside>
			</div>
			<!-- Main Content -->
			<div class="main-content" style="min-height: 829px;">
				<section class="section">
					<div class="row">
						<!--사용자가 선택한 리스트-->
						<div class="col-lg-2 cardDetail"
							style="background-color: rgb(252, 250, 250);">
							<div class="card.h-100">
								<h4 class="listName mt-5 mb-4 ml-4">LIST NAME</h4>
								<div class="cardArea">
									<div class="card card-light ml-2 mr-2">
										<!--라벨표시-->
										<div class="card-header d-flex justify-content-between">
											<span class="cardName ml-0">CARD NAME</span>
											<!--카드이름-->
											<i class="fa fa-times col-rg" aria-hidden="true"></i>
										</div>
										<div class="ml-3">
											<!--옵션표시(file,checklist,dates)-->
											<i class="fa fa-check-square check"
												style="color: rgb(59, 59, 59);"></i> <i
												class="fa fa-calendar ml-1 dates"
												style="color: rgb(59, 59, 59);"></i> <i
												class="fa fa-paperclip ml-1 files"
												style="color: rgb(59, 59, 59);"></i>
										</div>
									</div>
									<!--===============여기서부터===============-->
									<div class="card card-primary ml-2 mr-2">
										<!--라벨표시-->
										<div class="card-header d-flex justify-content-between">
											<span class="cardName ml-0">CARD NAME</span>
											<!--카드이름-->
											<i class="fa fa-times col-rg" aria-hidden="true"></i>
										</div>
										<div class="ml-3">
											<!--옵션표시(file,checklist,dates)-->
											<i class="fa fa-check-square check"
												style="color: rgb(59, 59, 59);"></i> <i
												class="fa fa-calendar ml-1 dates"
												style="color: rgb(59, 59, 59);"></i> <i
												class="fa fa-paperclip ml-1 files"
												style="color: rgb(59, 59, 59);"></i>
										</div>
									</div>
									<!--===============여기까지가 하나의 카드!===============-->
									<div class="card card-secondary ml-2 mr-2">
										<!--라벨표시-->
										<div class="card-header d-flex justify-content-between">
											<span class="cardName ml-0">CARD NAME</span>
											<!--카드이름-->
											<i class="fa fa-times col-rg" aria-hidden="true"></i>
										</div>
										<div class="ml-3">
											<!--옵션표시(file,checklist,dates)-->
											<i class="fa fa-check-square check"
												style="color: rgb(59, 59, 59);"></i> <i
												class="fa fa-calendar ml-1 dates"
												style="color: rgb(59, 59, 59);"></i> <i
												class="fa fa-paperclip ml-1 files"
												style="color: rgb(59, 59, 59);"></i>
										</div>
									</div>
									<div class="card card-danger ml-2 mr-2">
										<!--라벨표시-->
										<div class="card-header d-flex justify-content-between">
											<span class="cardName ml-0">CARD NAME</span>
											<!--카드이름-->
											<i class="fa fa-times col-rg" aria-hidden="true"></i>
										</div>
										<div class="ml-3">
											<!--옵션표시(file,checklist,dates)-->
											<i class="fa fa-check-square check"
												style="color: rgb(59, 59, 59);"></i> <i
												class="fa fa-calendar ml-1 dates"
												style="color: rgb(59, 59, 59);"></i> <i
												class="fa fa-paperclip ml-1 files"
												style="color: rgb(59, 59, 59);"></i>
										</div>
									</div>
									<div class="card card-warning ml-2 mr-2">
										<!--라벨표시-->
										<div class="card-header d-flex justify-content-between">
											<span class="cardName ml-0">CARD NAME</span>
											<!--카드이름-->
											<i class="fa fa-times col-rg" aria-hidden="true"></i>
										</div>
										<div class="ml-3">
											<!--옵션표시(file,checklist,dates)-->
											<i class="fa fa-check-square check"
												style="color: rgb(59, 59, 59);"></i> <i
												class="fa fa-calendar ml-1 dates"
												style="color: rgb(59, 59, 59);"></i> <i
												class="fa fa-paperclip ml-1 files"
												style="color: rgb(59, 59, 59);"></i>
										</div>
									</div>
									<div class="card card-info ml-2 mr-2">
										<!--라벨표시-->
										<div class="card-header d-flex justify-content-between">
											<span class="cardName ml-0">CARD NAME</span>
											<!--카드이름-->
											<i class="fa fa-times col-rg" aria-hidden="true"></i>
										</div>
										<div class="ml-3">
											<!--옵션표시(file,checklist,dates)-->
											<i class="fa fa-check-square check"
												style="color: rgb(59, 59, 59);"></i> <i
												class="fa fa-calendar ml-1 dates"
												style="color: rgb(59, 59, 59);"></i> <i
												class="fa fa-paperclip ml-1 files"
												style="color: rgb(59, 59, 59);"></i>
										</div>
									</div>
									<div class="card card-success ml-2 mr-2">
										<!--라벨표시-->
										<div class="card-header d-flex justify-content-between">
											<span class="cardName ml-0">CARD NAME</span>
											<!--카드이름-->
											<i class="fa fa-times col-rg" aria-hidden="true"></i>
										</div>
										<div class="ml-3">
											<!--옵션표시(file,checklist,dates)-->
											<i class="fa fa-check-square check"
												style="color: rgb(59, 59, 59);"></i> <i
												class="fa fa-calendar ml-1 dates"
												style="color: rgb(59, 59, 59);"></i> <i
												class="fa fa-paperclip ml-1 files"
												style="color: rgb(59, 59, 59);"></i>
										</div>
									</div>
									<div class="card card-dark ml-2 mr-2">
										<!--라벨표시-->
										<div class="card-header d-flex justify-content-between">
											<span class="cardName ml-0">CARD NAME</span>
											<!--카드이름-->
											<i class="fa fa-times col-rg" aria-hidden="true"></i>
										</div>
										<div class="ml-3">
											<!--옵션표시(file,checklist,dates)-->
											<i class="fa fa-check-square check"
												style="color: rgb(59, 59, 59);"></i> <i
												class="fa fa-calendar ml-1 dates"
												style="color: rgb(59, 59, 59);"></i> <i
												class="fa fa-paperclip ml-1 files"
												style="color: rgb(59, 59, 59);"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--사용자가 선택한 카드 상세-->
						<div class="col-lg-10 cardDetail" style="background-color: white;">
							<div class="row" style="float: right;">
								<!--카드상세조회 닫기버튼-->
								<h4 class="closeCardDetail mr-3 mt-3" st>
									<i class="fa fa-window-close" title="close_card"
										aria-hidden="true"></i>
								</h4>
							</div>
							<div class="row">
								<!--카드상세내용-->
								<div class="col-lg-7 ml-3"
									style="border-right: whitesmoke 1px solid;">
									<!--카드이름-->
									<h4 class="cardName mt-5 mb-4">CARD NAME</h4>
									<!--카드메뉴-->
									<div class="row d-flex justify-content-center mr-2 cardmenu">
										<button class="btn menu">Dates</button>
										<button class="btn menu">CheckList</button>
										<button class="btn menu">Attachments</button>
									</div>
									<!--카드아이템 : 라벨, 일정-->
									<style>
#testbtn {
	position: relative;
}

.test123 {
	width: 50px;
	height: 50px;
	background-color: blueviolet;
	color: red;
	opacity: 0;
	transition: all 0.5s;
	position: absolute;
	top: -60px;
	left: -10px;
}
/* 임의 스타일 */
.test1234 {
	transition: all 0.5s;
	opacity: 1;
}
</style>
									<div class="row mt-4">
										<div class="card">
											<div style="width: 370px;"></div>
											<div class="card-header">
												<div class="row">
													<h4>Label</h4>
													<div class="label light" style="background-color: white;">
													</div>
													<div class="label danger"
														style="background-color: rgb(253, 38, 38);"></div>
													<div class="label warning"
														style="background-color: rgb(255, 184, 52);"></div>
													<div class="label success"
														style="background-color: rgb(58, 231, 95);"></div>
													<div class="label info"
														style="background-color: rgb(0, 217, 255);"></div>
													<div class="label primary"
														style="background-color: rgb(85, 73, 248);"></div>
													<div class="label secondary"
														style="background-color: rgb(165, 165, 165);"></div>
													<div class="label dark"
														style="background-color: rgb(7, 7, 7);"></div>
													<input class="form-control ml-1 mr-1" type="text"
														style="width: 80px; height: 25px;">
													<button class="fa fa-check" id="testbtn"
														onclick="testtest()"
														style="border: solid 1px rgb(240, 238, 238); background-color: white;">
														<div class="test123">ㅇㅇㅇ</div>
													</button>
												</div>
											</div>
										</div>
										<div class="card">
											<div style="width: 350px;"></div>
											<div class="card-header">
												<h4>Dates</h4>
												<div>
													<input type="checkbox"> <span
														style="background-color: rgb(235, 251, 252); border-radius: 3px; font-size: 15px;">
														Feb 22 - Mar 4 at 3:12 PM </span>
												</div>
											</div>
										</div>
									</div>
									<!--카드아이템 : 카드내용-->
									<div class="row">
										<div class="card">
											<div style="width: 740px;"></div>
											<div class="card-header" style="font-size: large;">
												<i class="fa fa-align-left" aria-hidden="true">&nbsp;&nbsp;Description</i>
												<button class="btn btn-light ml-2">Edit</button>
											</div>
											<div class="card-body">
												<textarea rows="4" style="width: 100%;"></textarea>
												<button class="btn btn-secondary mt-1">SAVE</button>
											</div>
										</div>
									</div>
									<!--카드아이템 : 체크리스트-->
									<div class="row">
										<div class="card">
											<div style="width: 740px;"></div>
											<div class="card-header" style="font-size: large;">
												<i class="fa fa-check-square" aria-hidden="true">&nbsp;&nbsp;CheckList</i>
											</div>
											<div class="card-body">
												<!--여기서부터-->
												<div class="card">
													<div class="card-body">
														<div>
															체크리스트 제목
															<button class="btn ml-2 fa fa-times"></button>
														</div>
														<div class="progress mb-2"></div>
														<input type="checkbox"> 할일<br> <input
															type="checkbox"> 할일<br> <input
															type="checkbox"> 할일<br>
													</div>
												</div>
												<!--여기까지가 하나의 체크리스트-->
												<div class="card">
													<div class="card-body">
														<div>
															체크리스트 제목
															<button class="btn ml-2 fa fa-times"></button>
														</div>
														<div class="progress mb-2"></div>
														<input type="checkbox"> 할일<br> <input
															type="checkbox"> 할일<br> <input
															type="checkbox"> 할일<br>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!--카드아이템 : 파일첨부-->
									<div class="row">
										<div class="card">
											<div style="width: 740px;"></div>
											<div class="card-header" style="font-size: large;">
												<i class="fa fa-paperclip ml-1 files">&nbsp;&nbsp;Attachments</i>
											</div>
											<div class="card-body">
												<!--여기서부터-->
												<div class="card">
													<div class="card-body">
														<div>
															파일이름
															<button class="btn ml-2 fa fa-times"></button>
														</div>
													</div>
												</div>
												<!--여기까지가 하나의 첨부파일-->
											</div>
										</div>
									</div>
								</div>

								<!--   <i class="fa fa-check-square check" style="color:rgb(59, 59, 59);"></i>
                      <i class="fa fa-calendar ml-1 dates" style="color: rgb(59, 59, 59);;"></i>
                      <i class="fa fa-paperclip ml-1 files" style="color: rgb(59, 59, 59);;"></i> -->
								<style>
.fas.fa-bars {
	cursor: pointer;
	position: relative;
}

.fas__menu {
	display: none;
	position: absolute;
	left: -46px;
	top: 0px;
	width: 45px;
	height: 50px;
	border-radius: 1px;
}

.fas__menu__btnC, .fas__menu__btnD {
	width: 100%;
	height: 50%;
	text-align: center;
	line-height: 25px;
	/* background-color: #e3eaef; */
	background-color: #fff;
	border: 1px solid #b1b6b9;
}

.fas__menu__btn:first-child {
	border-bottom: 1px solid #b1b6b9;
}

.goodBtnRow {
	cursor: pointer;
	margin-right: 5px;
	width: 15px;
	height: 100%;
}

.badBtnRow {
	cursor: pointer;
	width: 15px;
	height: 100%;
}

.comment__input__row {
	display: flex;
}

.comment__input__Box {
	border: 1px solid rgb(202, 202, 202);
	border-radius: 5px;
	width: 100%;
	box-shadow: 0 2px 4px -1px rgb(9 30 66/ 20%), 0 0 0 1px rgb(9 30 66/ 8%);
}

.textarea__Box {
	padding: 9px 12px 0 12px;
	height: auto;
}

.textarea__Box textarea {
	width: 100%;
	overflow: hidden;
	overflow-wrap: break-word;
	outline: none;
	border: none;
	resize: none;
}

.textareaEl {
	height: 20px;
	min-height: 20px;
	padding: 0;
}

.input__Box__Btns__none {
	display: none;
}

.input__Box__Btns {
	display: flex;
	justify-content: space-between;
	height: 50px;
	align-items: center;
	padding: 0 10px;
}

.input__Box__btns__left {
	display: flex;
	align-items: center;
}

.input__Box__btns__left label {
	margin-bottom: 1px;
}

.file__icon {
	cursor: pointer;
	font-size: 18px;
}

#emoji-button {
	position: relative;
	border: none;
	background: none;
	font-size: 18px;
	margin-left: 5px;
}

.emoji-picker {
	z-index: 999;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.emoji-picker__content {
	border-bottom: none;
}

.emoji-picker__preview {
	padding-top: 25px;
	height: 100%;
	border-top: none;
}

.comment__input__filetext {
	cursor: pointer;
	margin-left: 10px;
}

.save_btn {
	border-radius: 5px;
	background-color: #6777ef;
	color: #fff;
	border: none;
	width: 65px;
	height: 32px;
	text-align: center;
	line-height: 32px;
	cursor: pointer;
	font-weight: bold;
}

.img__box__wrap {
	top: 0;
	left: 0;
	position: fixed;
	width: 100%;
	height: 100%;
	display: none;
	z-index: 999;
	background-color: rgba(0, 0, 0, 0.9);
}

.img__box {
	width: auto;
	height: auto;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 999;
	/* display: none; */
}

.img__box img {
	width: auto;
	height: auto;
	object-fit: cover;
}

.comment__row {
	display: flex;
	flex-direction: column;
}

.comment__class__1 {
	display: flex;
}

.comment__row__left {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.recomment__btn {
	border: 1px solid rgb(182, 182, 182);
	text-align: center;
	cursor: pointer;
	width: 45px;
	height: 20px;
	font-size: 14px;
	line-height: 20px;
	border-radius: 1px;
}

.recomment__btn i {
	margin-right: 5px;
	font-size: 15px;
}

.recomment__num {
	display: inline-block;
}

.comment__row__right {
	width: 100%;
	display: flex;
	flex-direction: column;
}

.comment__writer__box {
	margin-bottom: 10px;
	display: flex;
	justify-content: space-between;
}

.recomment__wrap .comment__writer__box {
	
}

.comment__writer {
	font-size: 15px;
	font-weight: 600;
}

.comment__context {
	margin-bottom: 5px;
	font-size: 14px;
	color: #98a6ad;
}

.comment__context__file {
	margin-bottom: 10px;
	font-size: 15px;
}

.comment__context__file a {
	text-decoration: underline;
	font-size: 15px;
	font-weight: 600;
}

.comment__info {
	display: flex;
	justify-content: space-between;
	font-size: 13px;
	font-weight: 500;
}

.comment__class__1__underline {
	width: 100%;
	height: 1px;
	background-color: #e8eaeb;
	margin: 1rem 0;
}

.class2 {
	padding: 0;
}

.class2 li {
	border-bottom: 1px dotted rgb(235, 235, 235);
}

.class2 li:last-child {
	border-bottom: 1px dotted rgb(235, 235, 235);
	margin-bottom: 15px;
}

.recomment__row {
	display: flex;
	width: 100%;
}

.recomment__left {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.imgHd {
	visibility: hidden;
}

.recomment__icon {
	width: 13px;
	height: 13px;
	border-bottom: 1px solid rgb(104, 104, 104);
	border-left: 1px solid rgb(104, 104, 104);
	margin-top: 5px;
}

.recomment__right {
	display: flex;
	width: 100%;
}

.recomment__content {
	width: 100%;
}

.recommentgoodbadBtn {
	
}

.recomment__wrap {
	padding: 0 10px 0 0;
	background-color: rgb(248, 248, 248);
}

.recomment__wrap .comment__input__Box {
	background-color: #fff;
}

.recomment__input__box {
	/* border-top: 1px dotted rgb(216, 216, 216); */
	padding: 20px 0 30px 0;
	display: flex;
	width: 100%;
}

.recomment__input__box .comment__input__row {
	width: 100%;
}
</style>
								<!-- 댓글 end -->
								<!--카드댓글 #394eea -->
								<!--////////////////////////재의님 여기예요~!!!/////////////////////-->
								<!-- <div class="comment__input__top__img"><img id="img_preview" class="img_preview" /></div> -->
								<div class="col-lg-4 mt-5">
									<h4 class="cardName ml-2">
										Activity <i class="fa fa-comment" aria-hidden="true"></i>
									</h4>
									<div class="card-body">
										<div class="comment__input__row">
											<img class="mr-3 rounded-circle" width="40" height="40px"
												src="resources/assets/img/avatar/avatar-1.png" alt="avatar">
											<div class="comment__input__Box">
												<div class="textarea__Box">
													<textarea name="" id=""
														class="textareaEl textareaEl__class1"></textarea>
												</div>
												<div class="input__Box__Btns__none">
													<div class="input__Box__Btns">
														<div class="input__Box__btns__left">
															<label for="input_file"
																class="file__icon fa fa-paperclip ml-1 files"></label> <input
																type="file" id="input_file" class="input_file"
																style="display: none;">
															<button id="emoji-button" class="emoji_button_class1">😀</button>
															<div class="comment__input__filetext filetext__class1"></div>
														</div>
														<div class="input__Box__btns__right">
															<div class="save_btn" onclick="commentCreate()">SAVE</div>

														</div>
													</div>
												</div>
											</div>
										</div>
										<hr>
										<ul class="mt-4 list-unstyled list-unstyled-border">

											<li class="comment__row">
												<div class="comment__class__1">
													<div class="comment__row__left">
														<img class="mr-3 rounded-circle" width="40" height="40px"
															src="resources/assets/img/avatar/avatar-1.png"
															alt="avatar">
														<div class="recomment__btn">
															<i class="fas fa-comment-medical"></i><span
																class="recomment__num">5</span>
														</div>
													</div>
													<div class="comment__row__right">
														<div class="comment__writer__box">
															<div class="comment__writer">김은지</div>
															<div class="fas__fa__menu">
																<div class="fas fa-bars">
																	<div class="fas__menu">
																		<div class="fas__menu__btnC">수정</div>
																		<div class="fas__menu__btnD">삭제</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="comment__context">댓글댓글댓글</div>
														<div class="comment__context__file">
															파일명 : <a href="#">kakao.jsp</a>
														</div>
														<div class="comment__info">
															<span class="comment__date">2022/02/22</span> <span
																class="comment__right"> <span class="goodBtnRow">
																	<span class="goodBtnRow__icon">👍🏻</span> <sapn
																		class="goodBtnRow__num">0</sapn>
															</span> <span class="badBtnRow"> <span
																	class="badBtnRow__icon">👎🏻</span> <span
																	class="badBtnRow__num">0</span>
															</span>
															</span> </span>
														</div>
													</div>
												</div>
												<div class="recomment__wrap">
													<ul class="mt-4 list-unstyled list-unstyled-border class2">
														<li class="recomment__row">
															<div class="recomment__left">
																<div class="recomment__icon"></div>
																<img class="mr-3 rounded-circle imgHd" width="40"
																	height="40px" src="" alt="avatar">
															</div>
															<div class="recomment__right">
																<img class="mr-3 rounded-circle" width="40"
																	height="40px"
																	src="resources/assets/img/avatar/avatar-1.png"
																	alt="avatar">
																<div class="recomment__content">
																	<div class="comment__writer__box">
																		<div class="comment__writer">김은지</div>
																		<div class="fas__fa__menu">
																			<div class="fas fa-bars">
																				<div class="fas__menu">
																					<div class="fas__menu__btnC">수정</div>
																					<div class="fas__menu__btnD">삭제</div>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="comment__context">댓글댓글댓글</div>
																	<div class="comment__context__file">
																		파일명 : <a href="#">kakao.jsp</a>
																	</div>
																	<div class="comment__info">
																		<span class="comment__date">2022/02/22</span> <span
																			class="comment__right recommentgoodbadBtn"> <span
																			class="goodBtnRow"> <span
																				class="goodBtnRow__icon">👍🏻</span> <sapn
																					class="goodBtnRow__num">0</sapn>
																		</span> <span class="badBtnRow"> <span
																				class="badBtnRow__icon">👎🏻</span> <span
																				class="badBtnRow__num">0</span>
																		</span>
																		</span> </span>
																	</div>
																</div>
															</div>
														</li>
													</ul>
													<div class="recomment__input__box">
														<div class="recomment__left">
															<div class="recomment__icon"></div>
															<img class="mr-3 rounded-circle imgHd" width="40"
																height="22px" src="" alt="avatar">
														</div>
														<div class="comment__input__row">
															<img class="mr-3 rounded-circle" width="40" height="40px"
																src="resources/assets/img/avatar/avatar-1.png"
																alt="avatar">
															<div class="comment__input__Box">
																<div class="textarea__Box">
																	<textarea name="" id=""
																		class="textareaEl textareaEl__class2"></textarea>
																</div>
																<div class="input__Box__Btns__none">
																	<div class="input__Box__Btns">
																		<div class="input__Box__btns__left">
																			<label for="input_file__re"
																				class="file__icon fa fa-paperclip ml-1 files"></label>
																			<input type="file" id="input_file__re"
																				class="input_file" style="display: none;">
																			<button id="emoji-button" class="emoji_button_class2">😀</button>
																			<div
																				class="comment__input__filetext filetext__class2"></div>
																		</div>
																		<div class="input__Box__btns__right">
																			<div class="save_btn" onclick="test()">SAVE</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</li>
										</ul>

									</div>
								</div>
								<!-- cardbody end-->
								<!-- 댓글 end -->
							</div>
						</div>
				</section>
			</div>

		</div>
	</div>
	<!--이미지 미리보기-->
	<style>
.imgpreview {
	width: 100px;
	height: 100px;
	border: 1px solid blue;
}
</style>
	<div class="imgpreview"></div>
	<!--이미지 미리보기-->
	<div class="" style="display: none;" id="commentPlusTemplate">
		<li class="media"><img class="mr-3 rounded-circle" width="50"
			src="resources/assets/img/avatar/avatar-2.png" alt="avatar">
			<div class="media-body">
				<div class="fas__fa__menu">
					<div class="float-right fas fa-bars">
						<div class="fas__menu">
							<div class="fas__menu__btnC">수정</div>
							<div class="fas__menu__btnD">삭제</div>
						</div>
					</div>
				</div>
				<div class="media-title"></div>
				<span class="text-small text-muted"></span>
				<div class="mt-2">
					<span class="comment__date"></span> <span class="float-right">
						<span class="goodBtnRow"> <span class="goodBtnRow__icon">👍</span>
							<sapn class="goodBtnRow__num">0</sapn>
					</span> <span class="badBtnRow"> <span class="badBtnRow__icon">👎</span>
							<span class="badBtnRow__num">0</span>
					</span>
					</span>
				</div>
			</div></li>

	</div>
	<!-- 댓글 사진 미리보기 -->
	<div class="img__box__wrap">
		<div class="img__box">
			<img src="" alt="" class="img_preview">
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/emoji-button@0.6.0/dist/index.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
	
	
 
    function commentCreate() {
      let textareaElVal = $(event.target).closest('.comment__input__Box').find('.textareaEl').val()
      textareaElVal = textareaElVal.replace(/(?:\r\n|\r|\n)/g, '<br />');
	
      
    }


    window.addEventListener('DOMContentLoaded', () => {
      EmojiButton(document.querySelector('.emoji_button_class1'), function (emoji) {
        document.querySelector('.textareaEl__class1').value += emoji;
      });

      EmojiButton(document.querySelector('.emoji_button_class2'), function (emoji) {
        document.querySelector('.textareaEl__class2').value += emoji;
      });
    });

  
    function textareaHeight(textEl) {
      var textEle = $(textEl);
      textEle[0].style.height = '20px';
      var textEleHeight = textEle.prop('scrollHeight');
      textEle.css('height', textEleHeight);
    };
    var textEle = $('.textareaEl');
    textEle.on('keydown keyup', function (e) {
      textareaHeight(e.target);
    });

    textEle.on('focus', function (e) {
      console.log($(e.target))
      $(e.target).closest('.comment__input__Box').find('.input__Box__Btns__none').slideDown(200)
 
    })




    $('.input_file').on('change', function (e) {
      readText(e.target)
    })
  

    function readText(input) {
      let tgInput = input;
      if (input.files && input.files[0]) {
        $(tgInput).parent().find('.comment__input__filetext').text("파일명 : " + input.files[0].name)
      }
    }

    $('.comment__input__filetext').on('click', function (e) {

      let input = e.target.parentNode.querySelector('.input_file');

      console.log(input.files[0].type.match(/image\//))
      if (!input.files[0].type.match(/image\//)) {
        return;
      }
      var reader = new FileReader();
      reader.onload = function (e) {
        var image = $('.img_preview');
        image.attr('src', e.target.result)
        $('.img__box__wrap').css('display', 'block')
      }
      reader.readAsDataURL(input.files[0])

    })


    $(document).on('click', '.goodBtnRow', goodBtnRowFn)
    $(document).on('click', '.badBtnRow', badBtnRowFn)

    function goodBtnRowFn(e) {

      let btnParent = $(e.target).parent();
      let goodBtnRow__num = btnParent.find('.goodBtnRow__num');
      let goodBtnRow__numVal = Number(goodBtnRow__num.text())
      goodBtnRow__num.text(goodBtnRow__numVal + 1);
    }

    function badBtnRowFn(e) {
      let btnParent = $(e.target).parent();
      let goodBtnRow__num = btnParent.find('.badBtnRow__num');
      let goodBtnRow__numVal = Number(goodBtnRow__num.text())
      goodBtnRow__num.text(goodBtnRow__numVal + 1);
    }


    let menubtn = $('.fas__fa__menu');

    menubtn.on('click', menuShowFn)


    function menuShowFn(e) {
      $(e.target).find('.fas__menu').show()


    }



    $('body').on('click', function (e) {
      var tgPoint = $(e.target);
      var icon = tgPoint.hasClass('fas fa-bars')
      var btnC = tgPoint.hasClass('fas__menu__btnC')
      var btnD = tgPoint.hasClass('fas__menu__btnD')
      var fas__menu = tgPoint.hasClass('fas__menu')
      var preview = tgPoint.hasClass('img_preview')



      if (!icon && !fas__menu && !btnC && !btnD) {
        $('.fas__menu').hide()
      }
  

    
      if (!tgPoint.closest('.comment__input__Box').length && $('.textareaEl__class1').val() == '' && $(
          '.filetext__class1').text() == '') {
        $('.textareaEl__class1').closest('.comment__input__Box').find('.input__Box__Btns__none').slideUp(200)
      }
      
      if (!tgPoint.closest('.comment__input__Box').length && $('.textareaEl__class2').val() == '' && $(
          '.filetext__class2').text() == '') {
        $('.textareaEl__class2').closest('.comment__input__Box').find('.input__Box__Btns__none').slideUp(200)
      }
   
      
  
      if (preview) {
        $('.img__box__wrap').css('display', 'none')
      }

    })


    $('.fas__menu__btnC').on('click', function () {
      console.log('수정')
    })

    $('.fas__menu__btnD').on('click', function () {
      console.log('삭제')
    })

  </script>
	<!-- General JS Scripts -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	<script src='<c:url value="/resources/assets/js/stisla.js"></c:url>'></script>

	<!-- Template JS File -->
	<script src='<c:url value="/resources/assets/js/scripts.js"></c:url>'></script>
	<script src='<c:url value="/resources/assets/js/custom.js"></c:url>'></script>

	<!--은지코드-->
	<script
		src='<c:url value="/resources/js/board/main_layout.js"></c:url>'></script>

	<!-- 은지 코드 -->
	<script src="resources/js/board-header.js"></script>
	<script src="resources/js/board-detail_body.js"></script>
</body>

</html>
