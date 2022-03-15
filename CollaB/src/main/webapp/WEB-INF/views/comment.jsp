<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

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

.comment__card__body {
	border: 5px solid rgb(235, 235, 235);
	border-radius: 20px;
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
	left: 18px;
	top: -3px;
	width: 45px;
	height: 50px;
	border-radius: 7px;
	border: 1px solid black;
}

.fas__menu__btnC {
	border-radius: 7px 7px 0 0;
	border-bottom: 1px solid black;
}

.fas__menu__btnD {
	border-radius: 0 0 7px 7px;
}

.fas__menu__btnC, .fas__menu__btnD {
	width: 100%;
	height: 50%;
	text-align: center;
	line-height: 25px;
	/* background-color: #e3eaef; */
	background-color: #fff;
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
	border-bottom: 1px dotted black;
}

.comment__class__1 {
	display: flex;
	/* 	padding-right: 5px; */
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
	display: flex;
	justify-content: center;
	border-radius: 4px;
}

.recomment__btn i {
	display: inline-block;
	margin-top: 1.8px;
	font-size: 15px;
	margin-right: 5px;
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
	min-height: 70px;
}

.comment__context__file__prev {
	display: none;
	align-items: center;
	border: 3px solid rgb(248, 248, 248);
	border-radius: 10px;
	padding: 5px 5px;
}

.context__file__prev__imgBox {
	margin-right: 3px;
	width: 50px;
	height: 50px;
	overflow: hidden;
}

.context__file__prev__imgBox img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.comment__context__file {
	margin-bottom: 10px;
	font-size: 13px;
}

.comment__context__file a {
	text-decoration: underline;
	font-size: 13px;
	font-weight: 600;
}

.comment__info {
	display: flex;
	justify-content: space-between;
	font-size: 13px;
	font-weight: 500;
	margin-top: 15px;
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
	border-bottom: 1px dotted rgb(190, 190, 190);
}

.class2 li:last-child {
	border-bottom: 1px dotted rgb(190, 190, 190);
	padding-bottom: 10px;
	margin-bottom: 10px;
}

.recomment__row {
	margin-bottom: 10px;
	padding-bottom: 10px;
	display: flex;
	width: 100%;
	display: flex
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
	width: 11px;
	height: 11px;
	border-bottom: 2px solid rgb(104, 104, 104);
	border-left: 2px solid rgb(104, 104, 104);
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
	padding: 0 10px 0 10px;
	background-color: rgb(235, 235, 235);
	display: none;
	border-radius: 20px;
	margin-top: 10px;
}

.recomment__wrap .comment__input__Box {
	background-color: #fff;
}

.recomment__input__box {
	/* border-top: 1px dotted rgb(216, 216, 216); */
	padding: 15px 0px 20px 0px;
	display: flex;
	width: 100%;
}

.recomment__input__box .comment__input__row {
	width: 100%;
}

.recomment__box {
	/* 	padding-top: 10px; */
	
}

.commentContainer {
	margin: 0 auto;
}
</style>
								<!-- 댓글 end -->
								<!--카드댓글 #394eea -->
								<!--////////////////////////재의님 여기예요~!!!/////////////////////-->
								<!-- <div class="comment__input__top__img"><img id="img_preview" class="img_preview" /></div> -->
								<div class="col-lg-4 mt-5 commentContainer">
									<h4 class="cardName ml-2">
										Activity <i class="fa fa-comment" aria-hidden="true"></i>
									</h4>
									<div class="card-body comment__card__body">
										<div class="comment__input__row">
											<img class="mr-3 rounded-circle" width="40" height="40px"
												src="${prof_pic}" alt="avatar">
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
																type="file" id="input_file" name="file"
																class="input_file" style="display: none;">
															<button id="emoji-button" data="1"
																class="emoji_button_class1 emojibutEl">😀</button>
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
										<ul
											class="comment__box mt-4 list-unstyled list-unstyled-border">


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


	<!--이미지 미리보기-->
	<div class="class1Temaplate" style="display: none;"
		id="commentPlusTemplate">
		<li class="comment__row classTarget">
			<div class="comment__class__1">
				<div class="comment__row__left">
					<img class="mr-3 rounded-circle" width="30" height="30px"
						src="resources/assets/img/avatar/avatar-1.png" alt="avatar">
					<div class="recomment__btn">
						<i class="fas fa-comment-medical"></i><span class="recomment__num">0</span>
					</div>
				</div>
				<div class="comment__row__right">
					<div class="comment__writer__box">
						<div class="comment__writer"></div>
						<div class="fas__fa__menu">
							<div class="fas fa-bars">
								<div class="fas__menu">
									<div class="fas__menu__btnC">수정</div>
									<div class="fas__menu__btnD">삭제</div>
								</div>
							</div>
						</div>
					</div>

					<div class="comment__context"></div>
					<div class="comment__context__file__prev">
						<div class="context__file__prev__imgBox">
							<img alt="" src="">
						</div>
						<div class="context__file__prev__text">
							파일명 : <a href="#" class="fileContent"></a>
						</div>

					</div>
					<div class="comment__context__file">
						파일명 : <a href="#" class="fileContent"></a>
					</div>
					<div class="comment__info">
						<span class="comment__date"></span> <span class="comment__right">
							<span class="goodBtnRow"> <span class="goodBtnRow__icon">👍🏻</span>
								<span class="goodBtnRow__num">0</span>
						</span> <span class="badBtnRow"> <span class="badBtnRow__icon">👎🏻</span>
								<span class="badBtnRow__num">0</span>
						</span>
						</span>
					</div>
				</div>
			</div>
			<div class="recomment__wrap">
				<ul
					class="recomment__box mt-4 list-unstyled list-unstyled-border class2">
				</ul>
				<div class="recomment__input__box">
					<div class="recomment__left">
						<div class="recomment__icon"></div>
						<img class="mr-3 rounded-circle imgHd" width="20" height="22px"
							src="" alt="avatar">
					</div>
					<div class="comment__input__row">
						<img class="mr-3 rounded-circle" width="40" height="40px"
							src="${prof_pic}" alt="avatar">
						<div class="comment__input__Box">
							<div class="textarea__Box">
								<textarea name="" id="" class="textareaEl textareaEl__class2"></textarea>
							</div>

						</div>
					</div>
				</div>
			</div>
		</li>

	</div>

	<div style="display: none;" id="recommentBtnsTemplate">
		<div class="input__Box__Btns__none">
			<div class="input__Box__Btns">
				<div class="input__Box__btns__left">
					<label for="input_file__re"
						class="file__icon fa fa-paperclip ml-1 files"></label> <input
						type="file" id="input_file__re" class="input_file"
						style="display: none;">
					<button id="emoji-button" class="emoji_button_class2 emojibutEl">😀</button>
					<div class="comment__input__filetext filetext__class2"></div>
				</div>
				<div class="input__Box__btns__right">
					<div class="save_btn" onclick="createRecomment()">SAVE</div>
				</div>
			</div>
		</div>

	</div>

	<div style="display: none;" id="recommentTemplate"
		class="class2Temaplate">
		<li class="recomment__row classTarget">
			<div class="recomment__left">
				<div class="recomment__icon"></div>
				<img class="mr-3 rounded-circle imgHd" width="20" height="40px"
					src="" alt="avatar">
			</div>
			<div class="recomment__right">
				<img class="mr-3 rounded-circle" width="40" height="40px"
					src="resources/assets/img/avatar/avatar-1.png" alt="avatar">
				<div class="recomment__content">
					<div class="comment__writer__box">
						<div class="comment__writer"></div>
						<div class="fas__fa__menu">
							<div class="fas fa-bars">
								<div class="fas__menu">
									<div class="fas__menu__btnC">수정</div>
									<div class="fas__menu__btnD">삭제</div>
								</div>
							</div>
						</div>
					</div>
					<div class="comment__context"></div>
					<div class="comment__context__file__prev" style="border: 3px solid #cbc6c6;">
						<div class="context__file__prev__imgBox">
							<img alt="" src="">
						</div>
						<div class="context__file__prev__text">
							파일명 : <a href="#" class="fileContent"></a>
						</div>

					</div>
					<div class="comment__context__file">
						파일명 : <a href="#" class="fileContent"></a>
					</div>
					<div class="comment__info">
						<span class="comment__date"></span> <span
							class="comment__right recommentgoodbadBtn"> <span
							class="goodBtnRow"> <span class="goodBtnRow__icon">👍🏻</span>
								<span class="goodBtnRow__num">0</span>
						</span> <span class="badBtnRow"> <span class="badBtnRow__icon">👎🏻</span>
								<span class="badBtnRow__num">0</span>
						</span>
						</span>
					</div>
				</div>
			</div>
		</li>

	</div>

	<!-- 댓글 사진 미리보기 -->
	<div class="img__box__wrap">
		<div class="img__box">
			<img src="" alt="" class="img_preview">
		</div>
	</div>
	<input type="hidden" id="currentUserProfPic" value="${prof_pic }">
	<input type="hidden" id="currentCardId" value="${card_id }">
	<script
		src="https://cdn.jsdelivr.net/npm/emoji-button@0.6.0/dist/index.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script id="script">
	
	
	const currentCardId = $('#currentCardId').val();
	const currentUserProfPic = $('#currentUserProfPic').val();
	CommentApp = {
			
			init : async function(){
			
				$.ajax({
					url : 'ajaxCardIdSelect.do',
					type : 'post',
					dataType : 'json',
					data : {
						card_id : currentCardId
					},
					success : function(data){
						console.log(data)
						return CommentApp.createComment(data);	
					}
				})
		},
		
		
		
		createComment : function(data){
			let recommentNum = 0;
			let prevComment_group;
			let commentFiles = CommentApp.ajaxFileSelectList();
			
			for(let comment of data){
			
				let template;
				let src = comment.prof_pic;
				let nickname = comment.nickname;
				let id = comment.id;
				let commentId = comment.comment_id;
				let content = comment.comment_content;
				let sdate = new Date(comment.comment_date);
				let good = comment.comment_good;
				let bad = comment.comment_bad;
				let group = comment.comment_group;
				
				let cdate = getDateStr(sdate)
				let comment_order = comment.comment_order;
				if(prevComment_group == group && comment_order != 0){
					recommentNum++ 
					template = $('#recommentTemplate')
					template.find('.recomment__row').attr('data-id', id)
					template.find('.recomment__row').attr('data-commentId', commentId)
					template.find('.recomment__row').attr('data-group', group)
					template.find('.recomment__row').attr('data-order', comment_order)
					template.find('.recomment__right>img').attr('src', src)
					
				}else{
				
					recommentNum = 0;
					template = $('#commentPlusTemplate');
					template.find('.comment__row').attr('data-id', id)
					template.find('.comment__row').attr('data-commentId', commentId)
					template.find('.comment__row').attr('data-group', group)
					template.find('.comment__row').attr('data-order', comment_order)
					template.find('.comment__row__left>img').attr('src', src)
			
					
				
				}
				template.find('.comment__writer').text(nickname)
				template.find('.comment__context').html(content)
				template.find('.comment__date').text(cdate)
				template.find('.file__icon').attr('for', 'fileInput'+group)
				template.find('.input_file').attr('id', 'fileInput'+group)
				template.find('.comment__info').attr('data-commentId', commentId)
								
				
				prevComment_group = group
				let commnetFileInfo = commentFileChk(commentFiles, commentId)
			
				if(commnetFileInfo){
					let fileId = commnetFileInfo.file_id;
					let filename = commnetFileInfo.file_name;
					let pfile_name = commnetFileInfo.pfile_name;
					
					
					if(checkFile(filename)){
						template.find('.comment__context__file__prev').css("display", "flex");
						template.find('.context__file__prev__imgBox>img').attr("src", "resources/commentFile/"+pfile_name)
						template.find('.context__file__perv__text').attr("data", fileId)
						template.find('.fileContent').text(filename)
						template.find('.fileContent').attr("href", "commentDownload.do?pfile_name="+pfile_name+"&file_name="+filename)
					}else{
						template.find('.comment__context__file').attr('data', fileId).css("display", "block")
						template.find('.comment__context__file>a').text(filename)
						template.find('.comment__context__file>a').attr('href', "commentDownload.do?pfile_name="+pfile_name+"&file_name="+filename)
					}
				
	
				}else{
					template.find('.comment__context__file').css('display', 'none')
				}
				let commentBadSum = CommentApp.ajaxCommentBadSum(commentId) 
				let commentGoodSum = CommentApp.ajaxCommentGoodSum(commentId)
				
				if(commentGoodSum == 0){
					template.find('.goodBtnRow__num').text(0)
				}else{
					template.find('.goodBtnRow__num').text(commentGoodSum)
				}
				
				if(commentBadSum == 0){
					template.find('.badBtnRow__num').text(0)
				}else{
					template.find('.badBtnRow__num').text(commentBadSum)
				}

				
				if(template.attr('class') == 'class1Temaplate'){
				
					$('.comment__box').append(template.html())
				}else{
					
					
					let comment__row = $('.comment__box').find('.comment__row')
					
					for(let commentbox of comment__row){
						
						if($(commentbox).attr('data-group')== group){
							let recommentNumb = Number($(commentbox).find('.recomment__num').text());
							recommentNumb += 1;
							
							$(commentbox).find('.recomment__num').text(recommentNumb);
							$(commentbox).find('.recomment__box').append(template.html())
						}
						
					}
					
				}
				
				CommentApp.templateRemoveFn(template)
				
			}
			CommentApp.bindEvents();
		},
		
		ajaxCommentGoodSum : function(commentId){
			let result;
			$.ajax({
				url : 'ajaxCommentGoodSum.do',
				type : 'post',
				dataType : 'text',
				async : false,
				data : {
					 comment_id : commentId
				},
				success : function(data){
				
					if(data != null){
						result = data;
					}else{
						result = 0;
					}
				}
				
			})
			
			return result;
		},
		
		ajaxCommentBadSum : function(commentId){
			
			let result;
			
			$.ajax({
				url : 'ajaxCommentBadSum.do',
				type : 'post',
				dataType : 'text',
				async : false,
				data : {
					comment_id : commentId
				},
				success : function(data){
					result = data
				}
			})
			
			return result;
		}
		
		,
		
		bindEvents : function(){
			$(document).on('click', '.recomment__btn', CommentApp.recommentEvt)
		},
		
		recommentEvt : function(event){
			$(event.target).closest('.comment__row').find('.recomment__wrap').slideToggle()
		},
		
		ajaxFileSelectList : function(commentId){
			let result;
			$.ajax({
				url : 'ajaxFileSelectList.do',
				type : 'post',
				dataType : 'json',
				async : false,
				data : {
					 comment_id : commentId
				},
				success : function(data){
					if(data == "false"){
						
					}else{
						result = data;
					}
					
				}
			})
			
			return result;
		},
		
		templateRemoveFn : function(template){
			
			if(template.attr("id") == commentPlusTemplate){
				
				template.find('.comment__row').removeAttr('data-id')
				template.find('.comment__row').removeAttr('data-group')
				template.find('.comment__row__left>img').attr('src', '')
			}else{
			
				template.find('.recomment__row').removeAttr('data-id')
				template.find('.recomment__row').removeAttr('data-group')
				template.find('.recomment__right>img').attr('src', '')
			}
		
			template.find('.comment__writer').text('')
			template.find('.comment__context').html('')
			template.find('.comment__date').text('')
			template.find('.file__icon').removeAttr('for')
			template.find('.input_file').removeAttr('id')
			
			
			template.find('.comment__context__file__prev').css("display", "none");
			template.find('.context__file__prev__imgBox>img').removeAttr("src")
			template.find('.context__file__perv__text').removeAttr("data")
			template.find('.fileContent').text('')
			template.find('.fileContent').removeAttr("href")
				
				
				
			template.find('.comment__context__file').removeAttr('data').css("display", "none")
			template.find('.comment__context__file>a').text('')
			template.find('.comment__context__file>a').removeAttr('href')
		
		}
		
		
	}
	
	function checkFile(str){
		 
		 var ext =  str.split('.').pop().toLowerCase();
		 if($.inArray(ext, ['jpg' , 'jpeg', 'gif', 'bmp', 'png', 'tiff', 'svg', 'ico']) == -1) {

		     return null;
		 }

		 return true;

		}
	function commentFileChk(commentFiles, commentId){

		for(let data of commentFiles){
			
			if(data.comment_id === commentId){
				
				return data;
			}
		}
		
		return null;
	}

	 $(function(){
		 CommentApp.init();
	 })
	function ajaxCommentGroup(){
		
		
	}
	
	function getDateStr(date){
	    var sYear = date.getFullYear();
	    var sMonth = date.getMonth() + 1;
	    var sDate = date.getDate();

	    sMonth = sMonth > 9 ? sMonth : "0" + sMonth;
	    sDate  = sDate > 9 ? sDate : "0" + sDate;
	    return sYear +"/"+ sMonth +"/"+ sDate;
	}
	
    function commentCreate() {
      let today = new Date();   
      let textareaElVal = $(event.target).closest('.comment__input__Box').find('.textareaEl').val()
      let file = $('#input_file')
      console.log(file)
      textareaElVal = textareaElVal.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	  let commentMaxGroup = ajaxCommentMaxGroup();
  	  let dateTypedate = today;
	  let comment_date = getDateStr(today)
	  let currentUserNickname = ajaxGetSessionUserNickname();
	  let currentUserId = ajaxGetSessionUserId();
	  
      if(file.val()){
    	  let result = formCommentFileInsert(textareaElVal, commentMaxGroup, currentUserId, dateTypedate, file)
    
    	  if(result){
    		  commentFileCreateRow(textareaElVal, commentMaxGroup, currentUserId, comment_date, file, result)
    		 console.log(result)
    	  }else{
    		  // 실패시 문구
    	  }
    	  
      }else{
    		
    		  let result = ajaxCommentInsert(textareaElVal, commentMaxGroup, currentUserId, dateTypedate)
    	  if(result){
    		 commentCreateRow(textareaElVal, commentMaxGroup, currentUserId, currentUserNickname, comment_date)
    	  }
      }
	  
    }
    
    function createRecomment(evert){
     let today = new Date();  
   	 let target = $(event.target); 
   	 let file = target.closest('.input__Box__Btns').find('.input_file')
   	 let targetGroup = target.closest('.comment__row').attr('data-group')
   	 let textareaElVal = target.closest('.comment__input__Box').find('.textareaEl').val()
   	 textareaElVal = textareaElVal.replace(/(?:\r\n|\r|\n)/g, '<br/>');
   	 let comment_date = getDateStr(today)
   	 let currentUserNickname = ajaxGetSessionUserNickname();
   	 let currentUserId = ajaxGetSessionUserId();
   	 let targetOrder = ajaxRecommentMaxOrder(targetGroup);
   	 let nickname = ajaxGetSessionUserNickname()
   	 
   	 let targetappend = target.closest('.recomment__wrap').find('.recomment__box')
   	 if(file.val()){
   		 let result = formRecommentFileInsert(textareaElVal, targetGroup, currentUserId, today, file, targetOrder)
   		 console.log(result)
   		 if(result){
   			 recommentFileCreateRow(textareaElVal, targetGroup, currentUserId, comment_date, file, result, targetappend, target)
   		 }
   	 }else{
   		let result = ajaxRecommentInsert(textareaElVal, targetGroup, currentUserId, today, targetOrder)
   		console.log(result)
   		recommentCreateRow(result, nickname, textareaElVal, comment_date, targetappend, target)
   	 }
    }
    
    function recommentFileCreateRow(textareaElVal, targetGroup, currentUserId, comment_date, file, result, targetappend, target){
    	
		let template = $('#recommentTemplate');
		
    	let nickname = ajaxGetSessionUserNickname();
    	let fileName = result.file_name;
		
		template.find('.recomment__row').attr('data-id', result.id)
		template.find('.recomment__row').attr('data-group', result.comment_group)
		template.find('.recomment__row').attr('data-order', result.comment_order)
		template.find('.recomment__right>img').attr('src', currentUserProfPic)
    	
    	template.find('.comment__writer').text(nickname)
		template.find('.comment__context').html(textareaElVal)
		template.find('.comment__date').text(comment_date)
		template.find('.file__icon').attr('for', 'fileInput'+result.comment_group)
		template.find('.input_file').attr('id', 'fileInput'+result.comment_group)
		
    	if(checkFile(fileName)){
    	let img = template.find('.context__file__prev__imgBox').find('img')
    	img.attr("class", "imgTarget");
    	file.attr("class", "fileTarget");
    	prevRowFileRead()
    	template.find('.fileContent').text(fileName)
    	template.find('.fileContent').attr("href", "commentDownload.do?pfile_name="+result.pfile_name+"&file_name="+result.file_name)	
    	template.find('.context__file__perv__text').attr("data", result.file_id)
    	template.find('.comment__context__file__prev').css("display", "flex");
		
    	}else{
    		template.find('.comment__context__file').attr('data', result.file_id).css("display", "block")
			template.find('.comment__context__file>a').text(result.file_name)
			template.find('.comment__context__file>a').attr('href', "commentDownload.do?pfile_name="+result.pfile_name+"&file_name="+result.file_name)
    	}
    	
		targetappend.append(template.html())
		
	
		
		let textareaEl = target.closest('.comment__input__Box').find('.textareaEl')
		target.closest('.input__Box__Btns').find('.input_file__re').val('')
		target.closest('.input__Box__Btns').find('.comment__input__filetext').text('')
		textareaEl.val('')
    	textareaEl[0].style.height = '20px';
	
    	CommentApp.templateRemoveFn(template)
    	
    	
    }
    
    function formRecommentFileInsert(textareaElVal, targetGroup, currentUserId, today, file, targetOrder){
    	var form = new FormData()
		let result = null;
    	let commentGroup = $('<input>').val(targetGroup)
    	let commentOrder = $('<input>').val(targetOrder)
    	let commentContent = $('<input>').val(textareaElVal)
    	let userId = $('<input>').val(currentUserId)
    	let date = $('<input>').val(today)
    	let cardId = $('<input>').val(currentCardId)
    	form.append("comment_group",commentGroup.val())
    	
    	form.append("comment_content",commentContent.val())
    	
    	form.append("id", userId.val())
    	
    	form.append("comment_date", date.val())
    	
    	form.append("card_id", cardId.val())
    	
    	form.append("comment_order", commentOrder.val())
    	
    	form.append("file", file[0].files[0]);
 
    	
    	result = ajaxRecommentFileInsert(form)
    	return result;
    }
    
    function ajaxRecommentFileInsert(form){
    	let flag = null;
    	$.ajax({
    		url : 'ajaxReCommentFileInsert.do',
    		type : 'post',
    		dataType : 'json',
    		data : form,
    		contentType :false,
    		processData : false,
    		async : false,
    		success : function(data){
    			flag = (data != null) ? data : null 
    		}
    	})
    	
    	return flag;
    }
    
    function recommentCreateRow(result, nickname, textareaElVal, comment_date, targetappend, target){
    	let template = $('#recommentTemplate')
		template.find('.recomment__row').attr('data-id', result.id)
		template.find('.recomment__row').attr('data-group', result.comment_group)
		template.find('.recomment__row').attr('data-order', result.comment_order)
		template.find('.recomment__right>img').attr('src', currentUserProfPic)
		
		template.find('.comment__writer').text(nickname)
		template.find('.comment__context').html(textareaElVal)
		template.find('.comment__date').text(comment_date)
		template.find('.file__icon').attr('for', 'fileInput'+result.comment_group)
		template.find('.input_file').attr('id', 'fileInput'+result.comment_group)
		
		targetappend.append(template.html())
		
		CommentApp.templateRemoveFn(template)
		
		let textareaEl = target.closest('.comment__input__Box').find('.textareaEl')
		textareaEl.val('')
    	textareaEl[0].style.height = '20px';
    	
		
    }
	
    function ajaxRecommentInsert(textareaElVal, targetGroup, currentUserId, today, targetOrder){
   	 	let result;
    	$.ajax({
    		url : 'ajaxRecommentInsert.do',
    		type : 'post',
    		dataType : 'json',
    		async : false,
    		data : {
    			comment_group : targetGroup,
    			comment_content : textareaElVal,
    			card_id : currentCardId,
    			id : currentUserId,
    			comment_date : today,
    			comment_order : targetOrder		
    		},
    		success : function(data){
    			result = (data != null)? data : null;
    		}
    		
    	})
    	return result;
    }
    
    function ajaxRecommentMaxOrder(targetGroup){
    	
    	let targetOrder;
    	$.ajax({
    		url : 'ajaxRecommentMaxOrder.do',
    		type : 'post',
    		dataType: 'text',
    		async : false,
    		data : {
    			comment_group : targetGroup,
    				card_id : currentCardId
    		},
    		success : function(data){
    			console.log("num : "+ data)
    			targetOrder = data;
    		}
    	})
    	
    	return targetOrder;
    }
    
    function commentFileCreateRow(textareaElVal, commentMaxGroup, currentUserId, comment_date, file, result){
    	let template = $('#commentPlusTemplate');
    	
    	let nickname = ajaxGetSessionUserNickname();
    	let fileName = result.file_name;
    	
    	template.find('.comment__writer').text(nickname)
    	template.find('.comment__context').html(textareaElVal)
    		
    	template.find('.comment__row').attr('data-id', result.id)
		template.find('.comment__row').attr('data-group', result.comment_group)
    	template.find('.comment__row__left>img').attr("src", currentUserProfPic)
					
		template.find('.comment__date').text(comment_date)
		template.find('.file__icon').attr('for', 'fileInput'+result.comment_group)
		template.find('.input_file').attr('id', 'fileInput'+result.comment_group)
    	
    	if(checkFile(fileName)){
    	let img = template.find('.context__file__prev__imgBox').find('img')
    	img.attr("class", "imgTarget");
    	file.attr("class", "fileTarget");
    	prevRowFileRead()
    	template.find('.fileContent').text(fileName)
    	template.find('.fileContent').attr("href", "commentDownload.do?pfile_name="+result.pfile_name+"&file_name="+result.file_name)	
    	template.find('.context__file__perv__text').attr("data", result.file_id)
    	template.find('.comment__context__file__prev').css("display", "flex");
		
    	}else{
    		template.find('.comment__context__file').attr('data', result.file_id).css("display", "block")
			template.find('.comment__context__file>a').text(result.file_name)
			template.find('.comment__context__file>a').attr('href', "commentDownload.do?pfile_name="+result.pfile_name+"&file_name="+result.file_name)
    	}
    	
    	$('.comment__box').append(template.html())
    	
    	CommentApp.templateRemoveFn(template)
    	
    	inputresultRemove()
    }
    
    function inputresultRemove(){
    	let textareaEl = $('.textareaEl').val('');
    	textareaEl[0].style.height = '20px';
    	$('.filetext__class1').text('')
    	$('#input_file').val('')
    	
    }
    
    
	function prevRowFileRead(){
		  var file = document.querySelector('.fileTarget')

	      var reader = new FileReader();
	     
	      reader.onload = function (e) {
	    	  let imgtarget = $('.imgTarget')
	    	  imgtarget.attr('src', e.target.result)
	    	  let filetarget =$('.fileTarget')
	    	  imgtarget.removeClass('imgTarget')
	    	  filetarget.removeClass('fileTarget')
	      }
	      reader.readAsDataURL(file.files[0])
	 }
    
    function formCommentFileInsert(textareaElVal, commentMaxGroup, currentUserId, dateTypedate, file){
    	var form = new FormData()
		let result = null;
    	let commentGroup = $('<input>')
    	let commentContent = $('<input>')
    	let userId = $('<input>')
    	let date = $('<input>')
    	let cardId = $('<input>')
    	form.append("comment_group",commentGroup.attr({
    		type : "hidden",
    		name : "comment_group",
    		value : commentMaxGroup
    	}).val())
    	
    	form.append("comment_content",commentContent.attr({
    		type : "hidden",
    		name : "comment_content",
    		value : textareaElVal
    	}).val())
    	
    	form.append("id", userId.attr({
    		type : "hidden",
    		name : "id",
    		value : currentUserId
    	}).val())
    	
    	form.append("comment_date", date.attr({
    		type : "hidden",
    		name : "comment_date",
    		value : dateTypedate
    	}).val())
    	
    	form.append("card_id", cardId.attr({
    		type : "hidden",
    		name : "card_id",
    		value : currentCardId
    	}).val())
    	
    	form.append("file", $("#input_file")[0].files[0]);
 
    	
    	result = ajaxCommentFileInsert(form)
    	return result;
    }
    
    function ajaxCommentFileInsert(form){
    	let flag = null;
    	$.ajax({
    		url : 'ajaxCommentFileInsert.do',
    		type : 'post',
    		dataType : 'json',
    		data : form,
    		contentType :false,
    		processData : false,
    		async : false,
    		success : function(data){
    			flag = (data != null) ? data : null 
    		}
    	})
    	
    	return flag;
    }
    
    function ajaxGetSessionUserNickname(){
    	let currentUserNickname;
    	
    	$.ajax({
    		url : 'ajaxGetSessionUserNickname.do',
    		type : 'post',
    		dataType : 'text',
    		async : false,
    		success : function(data){
    			currentUserNickname = (data !="false")? data : false;
    		}
    	})
    	return currentUserNickname;
    }
    
    function ajaxGetSessionUserId(){
    	let currentUserId;
    	$.ajax({
    		url : 'ajaxGetSessionUserId.do',
    		type : 'post',
    		dataType : 'text',
    		async : false,
    		success : function(data){
    			currentUserId = (data != "false") ? data : false;
    		}
    	})
    	
    	return currentUserId;
    }
    
    function commentCreateRow(textareaElVal, commentMaxGroup, currentUserId, currentUserNickname, comment_date){
    	
    	let comment__box = $('.comment__box')
    	
    	
    	let template = $('#commentPlusTemplate');
    	template.find('.comment__row').attr("data-id", currentUserId);
    	template.find('.comment__row').attr("data-group", commentMaxGroup);
    	template.find('.comment__row__left>img').attr("src", currentUserProfPic);
    	template.find('.comment__writer').text(currentUserNickname);
    	template.find('.comment__context').text(textareaElVal);
    	template.find('.comment__date').text(comment_date);
    	comment__box.append(template.html());
    }
    
    
    function ajaxCommentMaxGroup(){
    	let commentMaxGroup;
    	
    	$.ajax({
    		url : 'ajaxCommentMaxGroup.do',
    		type : 'post',
    		dataType : 'text',
    		async : false,
    		data : {
    			card_id : currentCardId
    		},
    		success : function(data){
    			console.log("num : "+ data )
    			commentMaxGroup = data;
    		}
    	})
    	
    	return commentMaxGroup;
    }

    function ajaxCommentInsert(textareaElVal, commentMaxGroup, currentUserId, comment_date){
    
    	let flag = false;
    	$.ajax({
    		url : 'ajaxCommentInsert.do',
    		type : 'post',
    		dataType : 'text',
    		async : false,
    		data : {
    			id : currentUserId,
    			card_id : currentCardId,
    			comment_content : textareaElVal,
    			comment_group : commentMaxGroup,
    			comment_date : comment_date
    		},
    		success : function(data){
    			flag = (data == "true") ? true : false;
    		}
    	})
    	
    	return flag;
    }
    
    window.addEventListener('DOMContentLoaded', () => {

      EmojiButton(document.querySelector('.emoji_button_class1'), function (emoji) {
    	
        document.querySelector('.textareaEl__class1').value += emoji;
      });
      
   

    });
    $(document).on('click', '.context__file__prev__imgBox', commentImgprevFn)
 $(document).on('keydown keyup', '.textareaEl', textareaHeightFn)
 $(document).on('focus', '.textareaEl__class1', textareaFocusFn)
 $(document).on('focus', '.textareaEl__class2', textarea2FocusFn)
 $(document).on('change', '.input_file', inputFileFn)
 
 
 
 	//파일 a태그 눌렀을때 이벤 
 	function commentImgprevFn(event){
  
      let src = $(event.target).attr('src');

      var image = $('.img_preview');
      image.attr('src', src)
      
      $('.img__box__wrap').css('display', 'block')
 
 
    }
 
 
 	// 텍스트 크기 이벤
    function textareaHeightFn(event){
    	var textEle = $(event.target);
    	textEle[0].style.height = '20px';
    	var textEleHeight = textEle.prop('scrollHeight');
    	textEle.css('height', textEleHeight)
    }
 // 텍스트 히든 창 노출 이벤
 function textareaFocusFn(event){
    	$(event.target).closest('.comment__input__Box').find('.input__Box__Btns__none').slideDown(200)
    }
 
 function textarea2FocusFn(event){	
	 let parentEl = $(event.target).closest('.comment__input__Box');
		
	 let tgEl = $(event.target)
	 
	 
	 if(parentEl.find('.input__Box__Btns__none').length){
		 console.log("return;")
		 
	 }else{
		 
		 let tgElClass = $('.targetClass')
		 if(tgElClass.length){
			 
			 
			 tgElClass.closest('.comment__input__Box').find('.input__Box__Btns__none').slideUp(200)
		
			 tgElClass.removeClass('targetClass')
			 setTimeout(function() {
				 tgElClass.closest('.comment__input__Box').find('.input__Box__Btns__none').remove();
		    	 }, 200);  	
			 
			 setTimeout(function() {
					let btnsEl = $('#recommentBtnsTemplate');
					tgEl.addClass('targetClass')
				
					 $(event.target).parent().parent().append(btnsEl.html())
					 $(event.target).parent().parent().find('.input__Box__Btns__none').slideDown(200)
					 
					 EmojiButton(document.querySelector('.emoji_button_class2'), function (emoji) {
						   
						 document.querySelector('.targetClass').value += emoji;
				
				 	 });
			 }, 200);  

			 
		 }else{
			let btnsEl = $('#recommentBtnsTemplate');
			tgEl.addClass('targetClass')
			 $(event.target).parent().parent().append(btnsEl.html())
			 $(event.target).parent().parent().find('.input__Box__Btns__none').slideDown(200)
			 
			 EmojiButton(document.querySelector('.emoji_button_class2'), function (emoji) {
				   
				 document.querySelector('.targetClass').value += emoji;
		
		 	 });
			 
		 }
	 }

 }

 function inputFileFn(event){
	 console.log("dkfjdlfkjdkfj")
	 readText(event.target)
 }
 // 파일 

  

    function readText(input) {
	
      let tgInput = input;
      if (input.files && input.files[0]) {
    	  
    	  console.log($(tgInput).closest('.input__Box__Btns'))
        $(tgInput).closest('.input__Box__Btns').find('.comment__input__filetext').text("파일명 : " + input.files[0].name)
      }
    }
 // 파일
 $(document).on('click', '.comment__input__filetext', fileClickFn)
 
 	function fileClickFn(e){
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
 }
   


    $(document).on('click', '.goodBtnRow', goodBtnRowFn)
    $(document).on('click', '.badBtnRow', badBtnRowFn)
	
    function badBtnRowFn(e){
    	
    	  let userId = ajaxGetSessionUserId();
    	  let targetCommentId = $(e.target).closest('.comment__info').attr("data-commentid")
    	  let badBtnRow__num = $(e.target).parent().find('.badBtnRow__num');
    	  let badBtnRow__numVal = Number(badBtnRow__num.text())
    	  let targetChkd = ajaxBadBtnChk(targetCommentId, userId)
    
    	  if(targetChkd == "No"){
    		  badBtnRow__numVal = badBtnRow__numVal +1; 
			  	ajaxBadInsert(targetCommentId, userId)
    	  }else{
    		  badBtnRow__numVal = badBtnRow__numVal -1;
    		  ajaxBadDelect(targetCommentId, userId)
    	  }
    	  badBtnRow__num.text(badBtnRow__numVal)
    }
    
	function ajaxBadDelect(targetCommentId, userId){
		
		$.ajax({
			url : 'ajaxBadDelect.do',
			type : 'post',
			dataType : 'text',
			data : {
				comment_id : targetCommentId,
				id : userId
			},
			success : function(data){
				console.log(data)
			}
		})
		
	}

    
 
    function goodBtnRowFn(e) {
    	  let userId = ajaxGetSessionUserId();
		  let targetCommentId = $(e.target).closest('.comment__info').attr("data-commentid")
		
	  
	      let goodBtnRow__num = $(e.target).parent().find('.goodBtnRow__num');
	   
	     
	      let goodBtnRow__numVal = Number(goodBtnRow__num.text())
	    
	  
		  let targetChkd = ajaxGoodBtnChk(targetCommentId, userId)
		  console.log(targetChkd)
		  if(targetChkd == "No"){
			  
			  	goodBtnRow__numVal = goodBtnRow__numVal+1; 
			  	ajaxGoodInsert(targetCommentId, userId)
		  }else{
			  
			  goodBtnRow__numVal = goodBtnRow__numVal-1;
		 		ajaxGoodDelete(targetCommentId, userId)
	    }
		  goodBtnRow__num.text(goodBtnRow__numVal);
	  }
    
    function ajaxBadBtnChk(targetCommentId, userId){
    		let result;
    	$.ajax({
    		url : 'ajaxBadBtnChk.do',
    		type : 'post',
    		dataType : 'text',
    		async : false,
    		data : {
    			comment_id : targetCommentId,
    			id : userId
    		},
    		success : function(data){
    			result = data;
    		}
    	})
    	return result;
    	
    }
    
  
    function ajaxGoodDelete(targetCommentId, userId){
    	
    	$.ajax({
    		url : 'ajaxGoodDelete.do',
    		type : 'post',
    		dataType : 'text',
    		data : {
    			comment_id : targetCommentId,
    			id : userId
    		},
    		success : function(data){
    			console.log(data)
    		}
    	})
    }
    function ajaxBadInsert(targetCommentId, userId){
    		console.log("?DFDfkdl")
    		$.ajax({
    			url : 'ajaxBadInsert.do',
    			type : 'post',
    			dataType : 'text',
    			data : {
    				comment_id : targetCommentId,
        			id : userId
    			},
    			success : function(data){
    				console.log(data)
    			}
    		})
    	}
    function ajaxGoodInsert(targetCommentId, userId){
    	
    	$.ajax({
    		url : 'ajaxGoodInsert.do',
    		type : 'post',
    		dataType : 'text',
    		data : {
    			comment_id : targetCommentId,
    			id : userId
    		},
    		success : function(data){
    			console.log(data)
    		}
    	})
    }
    
    function ajaxGoodBtnChk(targetCommentId, userId){
    	let result;
    	$.ajax({
    		url : 'ajaxGoodBtnChk.do',
    		type : 'post',
    		dataType: 'text',
    		async : false,
    		data : {
    			comment_id : targetCommentId,
    			id : userId
    		}, 
    		success : function(data){
    			console.log("data : "+ data)
    			result = data;
    		
    		}
    	
    	})
    	return result;
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
      
      console.log(tgPoint.hasClass('comment__input__Box'))
      if (!tgPoint.closest('.comment__input__Box').length && $('.targetClass').val() == '' && $(
          '.filetext__class2').text() == ''&& !tgPoint.hasClass('.emoji-picker')) {
        $('.textareaEl__class2').closest('.comment__input__Box').find('.input__Box__Btns__none').slideUp(200)
     
        setTimeout(function() {
          $('.textareaEl__class2').closest('.comment__input__Box').find('.input__Box__Btns__none').remove();
          let targetClass = $('.targetClass')
          targetClass.removeClass('targetClass')
        	}, 200);
      }
   
      
  
      if (preview) {
        $('.img__box__wrap').css('display', 'none')
      }

    })

    
    


    function menuShowFn(e) {
    	let target = $(event.target).closest('.classTarget').attr("data-id")
    	let userId = ajaxGetSessionUserId();
    
    	if(target == userId){
    		  $(e.target).find('.fas__menu').toggle()
    		
    	}
		
    }

	$(document).on('click', '.fas__fa__menu', menuShowFn)
	$(document).on('click','.fas__menu__btnC', menuUpdateBtnFn)
	$(document).on('click','.fas__menu__btnD', menuDeleteBtnFn)
	
	function menuDeleteBtnFn(event){
		let userId = $(event.target).closest('.classTarget').attr("data-id")
		let group = $(event.target).closest('.classTarget').attr("data-group")
		let order = $(event.target).closest('.classTarget').attr("data-order")
		let commentId = $(event.target).closest('.classTarget').attr("data-commentid")
    	
		if(order == 0){
			let result = ajaxGroupListSelect(group);

			for(let data of result){
				let result = ajaxRemoveComment(data.id, data.comment_id);
			}
			$(event.target).closest('.classTarget').remove();
		}else{
			let result = ajaxRemoveComment(userId, commentId);
			if(result == "Yes"){
				$(event.target).closest('.classTarget').remove();
			}
		}
		
		
    
    }
	
	function ajaxGroupListSelect(group){
		let result;
		$.ajax({
			url : 'ajaxGroupListSelect.do',
			type : 'post',
			dataType : 'json',
			async : false,
			data : {
				comment_group : group
			},
			success : function(data){
				result = data
			}
			
		})
		return result;
	}

    function menuUpdateBtnFn(event){
    	let target = $(event.target).closest('.classTarget').attr("data-id")
    	
    }
    function ajaxRemoveComment(userId, commentId){
    	let result;
    	$.ajax({
    		url : 'ajaxRemoveComment.do',
    		type : 'post',
    		dataType : 'text',
    		async : false,
    		data : {
    			id : userId,
    			comment_id : commentId
    		},
    		success : function(data){
    			console.log(data);
    			result = data;
    		}
    	})
    	
    	return result;
    }


  </script>
	<!-- General JS Scripts -->

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
	<!-- 	<script src="resources/js/board-header.js"></script> -->
	<!-- 	<script src="resources/js/board-detail_body.js"></script> -->
</body>

</html>
