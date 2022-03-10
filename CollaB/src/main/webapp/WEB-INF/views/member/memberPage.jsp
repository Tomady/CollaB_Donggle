<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<script type="module"
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>


<link rel="stylesheet" href="resources/assets/css/components.css">
<style type="text/css">
.section-header div {
	margin: 0 auto;
	display: flex;
	align-items: center;
}

.section-header div h1 {
	margin: 0;
}

.section-body {
	/* 	margin-top: 50px; */
	
}

.tableTopMenu {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 0;
}

.tableTopMenu__left {
	display: flex;
	width: 300px;
	border: 1px solid #6553C1;
	height: 45px;
	background-color: #FFFFFF;
	border-radius: 5px;
}

.tableTopMenu__left input {
	border: none;
	box-shadow: none;
	outline-style: none;
	width: 100%;
	margin-left: 5px;
	background: none;
	color: black;
	font-size: 14px;
}

.tableTopMenu__left button {
	padding: 0;
	margin: 0;
	width: 100px;
	border: none;
	background-color: #6553C1;
	color: white;
	font-weight: bold;
	font-size: 16px;
}

.tableTopMenu__right {
	
}

.tableTopMenu__right button {
	padding: 0;
	margin: 0;
	height: 50px;
	width: 400px;
	border: 1px solid black;
	border-radius: 5px;
	background-color: black;
	color: #FFFFFF;
	font-weight: bold;
	font-size: 18px;
}

.off-screen {
	display: none;
}

#pagebtn {
	width: 500px;
	text-align: center;
	margin: 0 auto;
	height: 50px;
	line-height: 60px;
}

#pagebtn a {
	all: initial;
	display: inline-block;
	margin-right: 10px;
	border-radius: 3px;
	border: none;
	font-family: Tahoma;
	background: #f9fafe;
	color: #000;
	text-decoration: none;
	height: 40px;
	width: 40px;
	text-align: center;
	line-height: 40px;
	transition: all .5s;
}

#pagebtn a:hover {
	background-color: #6553C1;
}

#pagebtn a.active {
	background: #6553C1;
	color: #fff;
}

/* table css */
.tabletdRow {
	display: flex;
	width: 100%;
	height: 100%;
	justify-content: space-between;
	align-items: center;
	flex-wrap: nowrap;
	overflow: hidden;
}

.tabletdRow:first-child {
	
}

.tdDetails {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-wrap: nowrap;
}

.user__img {
	height: 45px;
	width: 45px;
	border-radius: 100px;
	margin-right: 15px;
	/* text-align: center; */
	overflow: hidden;
}

.user__img img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.user__name {
	font-size: 16px;
}

.tdOptions {
	width: 40%;
	display: flex;
	flex-wrap: nowrap;
	justify-content: flex-end;
}

.tdOptions a {
	display: inline-block;
	width: 100px;
	min-width: 100px;
	height: 35px;
	border: none;
	background-color: #091e420a;
	line-height: 35px;
	margin-right: 20px;
	border-radius: 5px;
	color: #172b4d;
}

.thOptions {
	width: 40%;
	display: flex;
	flex-wrap: nowrap;
	justify-content: flex-end;
}

.thOptions a {
	text-decoration: none;
	display: inline-block;
	width: 100px;
	min-width: 100px;
	height: 35px;
	border: none;
	line-height: 35px;
	margin-right: 20px;
	border-radius: 5px;
	color: black;
	font-size: 16px;
	cursor: default;
}

.tdOptions a:first-child {
	background: none;
}

.tdOptions a:hover {
	background-color: #dee2e7;
}

.modal-wrapper .modalbox {
	opacity: 0;
	transform: scale(0.5);
	min-width: 200px;
	transition: all 0.2s ease-in;
	background: #9F90D9;
	color: #fff;
	height: auto;
	width: 20%;
	padding: 1rem 2rem;
	border: 2px solid #fff;
}

.hs {
	opacity: 0;
	display: none;
}

.modal-wrapper {
	position: fixed;
	display: flex;
	justify-content: center;
	align-items: center;
	opacity: 0;
	transform: scale(0.5);
	transition: all 0.2s ease-in;
	z-index: -10;
	/* z-index: 999; */
	background: rgba(0, 0, 0, .9);
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.modals-content {
	display: flex;
	flex-direction: column;
	align-items: center;
	min-width: 200px;
}

.modals-content-body {
	height: 80px;
	font-size: 18px;
}

.modal-footer .modal-changeBtn {
	display: inline-block;
	width: 60px;
	height: 30px;
	background: #20a88b;
	border: 2px solid #fff;
	margin-right: 15px;
	color: #fff;
	text-align: center;
	line-height: 30px;
	border-radius: 4px;
	cursor: pointer;
}

.modalbox .modal-footer .modal-cancleBtn {
	display: inline-block;
	width: 60px;
	height: 30px;
	background: #fb527a;
	border: 2px solid #fff;
	transition: all 0.5s ease-in;
	line-height: 30px;
	text-align: center;
	border-radius: 4px;
	cursor: pointer;
}

/* 초대 모달 */
.modal-wrapper .modalbox2 {
	opacity: 0;
	transform: scale(0.5);
	transition: all 0.2s ease-in;
	position: relative;
	width: 400px;
	height: auto;
	min-width: 400px;
	max-width: 400px;
	margin: 10vmax auto;
	border-radius: 10px;
	padding: 10px;
	background: rgba(41, 40, 40, 1);
}

.modals2-content {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 100%;
	height: auto;
}

.headerRow {
	width: 100%;
	/* display: flex; */
}

.headerTop {
	/* border: 1px solid white; */
	display: flex;
	height: 60px;
	line-height: 60px;
}

.headerTop-icon {
	margin-right: 15px;
	width: 10%;
	height: 100%;
	color: #fff;
	text-align: center;
	cursor: pointer;
	font-size: 18px;
}

.headerTop-icon i {
	font-size: 18px;
	transition: 0.3s;
}

.headerTop-icon i:hover {
	color: #7c72da;
	transform: scale(1.5);
	transition: 0.3s;
}

.headerTop-input {
	width: 90%;
	height: 100%;
	font-size: 18px;
	font-weight: bold;
	color: #fff;
}

.bodyRow {
	padding: 10px 5px;
	width: 100%;
	background-color: rgba(58, 56, 56, 0.8);
	border-radius: 3px;
}

.bodyRow-search {
	display: flex;
	background-color: rgba(90, 85, 85, 0.8);
	border-radius: 3px;
	height: 40px;
	width: 100%;
	margin: 0 auto;
	line-height: 40px;
	margin-bottom: 25px;
}

.bodyRow-search-icon {
	margin-right: 5px;
	width: 10%;
	height: 100%;
	color: #fff;
	text-align: center;
}

.bodyRow-search-icon i {
	font-size: 16px;
}

.bodyRow-search-input {
	width: 75%;
	height: 100%;
	display: flex;
	flex-direction: column;
	position: relative;
}

.bodyRow-search-input input {
	border: none;
	background: none;
	outline: none;
	color: #fff;
	height: 30px;
	margin-top: 5px;
}

.bodyRow-search-input input:focus ~.underline {
	background: #7c72da;
	height: 3px;
	transition: 0.3s;
}

.underline {
	position: absolute;
	bottom: 7px;
	background-color: #fff;
	display: inline-block;
	height: 1px;
	width: 98%;
}

.bodyRow-search-resultBtn {
	width: 15%;
	height: 100%;
}

.bodyRow-search-resultBtn button {
	width: 100%;
	height: 100%;
	border: none;
	background-color: #7c72da;
	color: #fff;
	font-weight: 600;
	border-radius: 5px;
	transition: 0.3s;
}

.bodyRow-search-resultBtn button:hover {
	transition: 0.3s;
	transform: scale(1.08);
}

.bodyRow-content {
	border: 1px dotted rgba(109, 108, 108, 0.8);
	border-radius: 5px;
	min-height: 100px;
	max-height: 150px;
	overflow-y: scroll;
}

.bodyRow-member {
	display: flex;
	justify-content: space-between;
	margin: 13px 0;
	height: 35px;
	align-items: center;
	padding-left: 5px;
}

.member-img {
	width: 9%;
	border-radius: 200%;
	height: 90%;
	text-align: center;
	overflow: hidden;
}

.member-img img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.member-id {
width: calc(91%-80px);
	margin-right: 100px;
	color: #fff;
}

.member-plusBtn button {
	border: 3px solid yellowgreen;
	background: none;
	border-radius: 5px;
	color: yellowgreen;
	font-size: 13px;
	width: 80px;
	height: 32px;
	font-weight: bold;
	margin: 0;
	padding: 0;
	outline: none;
	transition: 0.3s;
	margin-right: 10px;
}

.member-plusBtn button:hover {
	transition: 0.3s;
	transform: scale(1.08);
}

.footerRow {
	margin-top: 30px;
	border: 1px dotted rgba(109, 108, 108, 0.8);
	border-radius: 5px;
	width: 100%;
}

.footerRow-content {
	min-height: 100px;
	max-height: 150px;
	overflow-y: scroll;
	margin: 0 5px;
}

.footerRow-member {
	display: flex;
	justify-content: space-between;
	margin: 13px 0;
	height: 35px;
	align-items: center;
	padding-left: 5px;
}

.result-member-img {
	width: 8.5%;
	border-radius: 200%;
	height: 85%;
	text-align: center;
	overflow: hidden;
}

.result-member-img img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.result-member-id {
	margin-right: 150px;
	color: #fff;
}

.result-member-minusBtn {
	margin-right: 20px;
}

.result-member-minusBtn i {
	font-size: 20px;
	cursor: pointer;
}

.modal2-resultBtn {
	transition: 0.3s;
	margin-top: 40px;
	width: 100%;
	height: 40px;
	border: none;
	text-align: center;
	line-height: 40px;
	border-radius: 5px;
	background-color: #7c72da;
	color: #fff;
	font-size: 15px;
	font-weight: 600;
	cursor: pointer;
}

.modal2-resultBtn:hover {
	transition: 0.3s;
	font-size: 16px;
	background-color: #6b5fd1;
	transform: scale(1.01);
}

input[id^="modal"]:checked+.modal-wrapper {
	opacity: 1;
	z-index: 999;
	transform: scale(1);
	transition: all 0.2s ease-out;
	height: 100vh;
}

input[id^="modal"]:checked+.modal-wrapper>.modalbox {
	opacity: 1;
	z-index: 999;
	transform: scale(1);
	transition: all 0.3s ease-out 0.2s;
}

input[id^="modal"]:checked+.modal-wrapper>.modalbox2 {
	opacity: 1;
	z-index: 999;
	transform: scale(1);
	transition: all 0.3s ease-out 0.2s;
}

.bodyRow-content::-webkit-scrollbar, .footerRow-content::-webkit-scrollbar
	{
	width: 10px;
}

.bodyRow-content::-webkit-scrollbar-thumb, .footerRow-content::-webkit-scrollbar-thumb
	{
	background: yellowgreen;
	border-radius: 6px;
}

.Workspace__boards {
	width: 350px;
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 0 10px;
	border-radius: 5px;
	background-color: #fff;
	box-shadow: 1px 1px 5px gray;
	max-height: 192px;
	overflow: auto;
	min-height: 192px;
}

.Workspace__boards::-webkit-scrollbar, .footerRow-content::-webkit-scrollbar
	{
	width: 10px;
}

.Workspace__boards::-webkit-scrollbar-thumb, .footerRow-content::-webkit-scrollbar-thumb
	{
	background: #dee2e7;;
	border-radius: 6px;
}

.Workspace__boards__header {
	width: 100%;
	display: flex;
	justify-content: space-between;
	align-items: center;
	height: 40px;
	line-height: 40px;
	border-bottom: 1px dotted gray;
}

.header__hiddenBox {
	visibility: hidden;
}

.Workspace__boards__headerCon {
	font-size: 18px;
}

.Workspace__boards__cancelBtn {
	height: 40px;
	line-height: 45px;
	cursor: pointer;
}

.Workspace__boards__cancelBtn i {
	font-size: 17px;
}

.Workspace__boards__body {
	padding: 10px 0;
	width: 100%;
	height: auto;
}

.Workspace__boards__body__boardsList {
	width: 100%;
}

.Workspace__boards__body__boardsList__row {
	width: 100%;
	display: flex;
	align-items: center;
	padding: 6px 8px;
	border-radius: 5px;
}

.boardsList__row__img {
	width: 38px;
	height: 32px;
	border-radius: 8px;
	margin-right: 10px;
}

.boardsList__row__img img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	overflow: hidden;
}

.boardsList__row__name {
	margin-right: 10px;
}

.boardsList__row__removeBtn {
	display: none;
	margin-left: auto;
	height: 32px;
	width: 80px;
	background-color: #CB4523;
	text-align: center;
	line-height: 32px;
	border-radius: 5px;
	color: #fff;
	cursor: pointer;
}

.Workspace__boards__body__boardsList__row:hover {
	background-color: #dee2e7;
}

.Workspace__boards__body__boardsList__row:hover .boardsList__row__removeBtn
	{
	display: block;
}

.boardsList__row__removeBtn:hover {
	background-color: #ca2e06;
}

.pop_over_boards, .pop_over_author {
	width: 355px;
	position: absolute;
	right: -9999px;
	top: -9999px;
	z-index: 999;
}

.Change__permissions {
	width: 350px;
	height: auto;
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 0 10px;
	border-radius: 5px;
	background-color: #fff;
	box-shadow: 1px 1px 5px gray;
	position: relative;
	/* max-height: 310px; */
	/* overflow: auto; */
}

.Change__permissions__header {
	width: 100%;
	display: flex;
	justify-content: space-between;
	align-items: center;
	height: 40px;
	line-height: 40px;
	border-bottom: 1px dotted gray;
	font-size: 18px;
}

.header__hiddenBox {
	visibility: hidden;
}

.Change__permissions__cancelBtn {
	height: 40px;
	line-height: 45px;
	cursor: pointer;
}

.Change__permissions__cancelBtn i {
	font-size: 17px;
}

.change__permissions__body {
	padding: 5px 0;
}

.change__adminRow {
	margin-bottom: 5px;
}

.change__adminRow, .change__userRow {
	padding: 9px 0 9px 9px;
	height: auto;
	width: auto;
	display: block;
	cursor: pointer;
}

.change__adminRow:hover:not([disabled]), .change__userRow:hover:not([disabled])
	{
	border-radius : 4px;
	background-color: #dee2e7;
}

.change__adminRow[disabled], .change__userRow[disabled] {
border-radius : 4px;
	background-color: #dee2e7;
	cursor: default;
	/* color: #bdc1c7; */
}

.change__adminRow[disabled] .adminchkicon, .change__userRow[disabled] .userchkicon
	{
	display: inline-block;
}

.change__admin, .change__user {
	width: 100%;
	display: flex;
	height: 27px;
}

.change__admin span, .change__user span {
	display: none;
	width: 100%;
	height: 100%;
	padding-top: 3px;
	margin-left: 8px;
	box-sizing: border-box;
}

/* remove버튼 */
.remove__member {
	width: 350px;
	height: 150px;
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 0 10px;
	border-radius: 5px;
	background-color: #fff;
	box-shadow: 1px 1px 5px gray;
	/* max-height: 310px; */
	/* overflow: auto; */
}

.remove__member__header {
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: space-between;
	height: 40px;
	line-height: 40px;
	border-bottom: 1px dotted gray;
	font-size: 18px;
}

.header__hiddenBox {
	visibility: hidden;
}

.remove__member__cancelBtn {
	height: 40px;
	line-height: 45px;
	cursor: pointer;
}

.remove__member__cancelBtn i {
	font-size: 17px;
}

.remove__member__body {
	
	width: 100%;
	height: 100%;
}
.remove__memberRow:hover{
border-radius : 4px;
background-color: #dee2e7;
cursor: pointer;
}
.remove__memberRow {
margin-top : 5px;
padding: 5px 10px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	width: 100%;
	height: auto;
}

.remove__member__con {
	height: 25px;
	width: 100%;

	font-size: 15px;
	line-height: 25px;
	box-sizing: content-box;
	font-weight: 600;
}

.remove__member__Btn {
	display: flex;
	width: 100%;
	height: 100%

}

.yesBtn {
	border: 1px solid #ca2e06;
	background-color: #ca2e06;
	margin-right: 15px;
}

.noBtn {
	border: 1px solid black;
	background-color: black;
}

.yesBtn, .noBtn {
	width: 80px;
	height: 30px;
	text-align: center;
	line-height: 30px;
	color: #fff;
	font-weight: bold;
	border-radius: 3px;
	cursor: pointer;
}

.yesBtn:hover {
	background-color: #af2502;
}

.noBtn:hover {
	background-color: rgb(54, 50, 50);
}

.pop_over_remove {
	width: 355px;
	position: absolute;
	right: -9999px;
	top: -9999px;
	z-index: 999;
}

.theadTh {
	width: 131px;
	text-align: center;
	font-size: 16px;
	color: black;
	font-weight: normal;
}

.wkimg-body {
	width: 60px;
	height: 60px;
	border-radius: 5px;
	border: 3px solid rgb(228, 227, 227);
}

.displaynone {
	display: none;
}

.permissionChange__toolTip {
	visibility: hidden;
	/* width: 120px; */
	background-color: #dee2e7;
	text-align: center;
	border-radius: 6px;
	padding: 7px 10px;
	position: absolute;
	z-index: 1000;
	top: -50px;
	left: 50%;
	transform: translate(-50%, -50%);
	color: #6c757d;
	left: 50%;
}

.permissionChange__toolTip::after {
	content: "";
	position: absolute;
	top: 100%;
	left: 50%;
	margin-left: -5px;
	border-width: 5px;
	border-style: solid;
	border-color: #dee2e7;
}

.permissionChange__toolTip__title {
	margin-bottom: 5px;
}

.permissionChange__Btns button {
	border: none;
	padding: 0;
	width: 35px;
	height: 20px;
	border-radius: 3px;
	cursor: pointer;
}

.permissionChange__Btns__yes {
	background-color: #6777ef;
	color: #ffffff;
	margin-right: 5px;
}

.permissionChange__Btns__No {
	background-color: darkorange;
	color: #ffffff;
}

.swal-modal {
	border-radius: 10px;
}

.swal-title {
	font-size: 20px;
}

.swal-text {
	
}
</style>
</head>

<body style="background-color: rgb(204, 195, 226); overflow:scroll; overflow-x:hidden;">



	<!-- Main Content -->
	<div class="main-content">
		<section class="section">

			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="section-body">
							<div class="card-header d-flex justify-content-center"
								style="text-align: center;">
								<div id="workspace-body"
									class="card-body col-lg-3 mt-5 mb-5 d-flex justify-content-center">
									<div class="row workspaceNAME">
										<img class="img-fluid mr-2 mt-2 wkimg-body">
										<h3 class="mt-4" id="WsName"
											data-wkid="${workspace.workspace_id}">${workspace.workspace_title}</h3>
									</div>
								</div>
							</div>
							<div class="card-body">
								<div class="tableTopMenu">
									<div class="tableTopMenu__left">
										<input type="text" placeholder="이름 검색">
										<button type="button">검색</button>
									</div>
									<div class="tableTopMenu__right">
										<label for="modal-2" class="modal2_label"><button
												type="button" onclick="labelClick()">Workspace 초대하기</button></label>
									</div>
								</div>

								<div class="clearfix mb-3"></div>

								<div class="table-responsive" style="text-align: center;">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>
													<div class="tabletdRow">
														<div class="tdDetails">
															<div class="theadTh">Name</div>
														</div>
														<div class="thOptions">
															<a href="#" class="">Boards</a> <a href="#" class="">Author</a>
															<a href="#" class="">Remove</a>
														</div>
													</div>
												</th>
											</tr>

										</thead>
										<tbody class="tbodyEl">



										</tbody>
									</table>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="pop_over_boards">
				<div class="Workspace__boards">
					<div class="Workspace__boards__header">
						<span class="header__hiddenBox"></span> <span
							class="Workspace__boards__headerCon">Workspace boards</span> <span
							class="Workspace__boards__cancelBtn cancelB"><i
							class="fas fa-times"></i></span>
					</div>
					<div class="Workspace__boards__body">
						<div class="Workspace__boards__body__boardsList"></div>
					</div>
					<div class="Workspace__boards__footer"></div>
				</div>
			</div>

			<div class="pop_over_author">

				<div class="Change__permissions">
					<div class="permissionChange__toolTip">
						<div class="permissionChange__toolTip__title">Change ?</div>
						<div class="permissionChange__Btns">
							<button class="permissionChange__Btns__yes">Yes</button>
							<button class="permissionChange__Btns__No">No</button>

						</div>
					</div>
					<div class="Change__permissions__header">
						<span class="header__hiddenBox"></span> <span
							class="Change__permissions__headerCon">Change permissions</span>
						<span class="Change__permissions__cancelBtn cancelB"><i
							class="fas fa-times"></i></span>
					</div>
					<div class="change__permissions__body">
						<div class="change__adminRow" disabled='disabled'>

							<div class="change__admin">
								Admin <span class="adminchkicon"> <ion-icon
										name="checkmark-outline"></ion-icon>
								</span>
							</div>
							<div class="adminExplain">Can view, create and edit
								Workspace boards, and change settings for the Workspace. Will
								have admin rights on all boards in this Workspace.</div>
						</div>
						<div class="change__userRow">

							<div class="change__user">
								User <span class="userchkicon"> <ion-icon
										name="checkmark-outline"></ion-icon>
								</span>
							</div>
							<div class="userExplain">Can view, create and edit
								Workspace boards, and change settings for the Workspace. Will
								have admin rights on all boards in this Workspace.</div>
						</div>
					</div>
				</div>
			</div>

			<div class="pop_over_remove">
				<div class="remove__member">
					<div class="remove__member__header">
						<span class="header__hiddenBox"></span> <span
							class="remove__member__headerCon">Remove memeber</span> <span
							class="remove__member__cancelBtn cancelB"><i
							class="fas fa-times"></i></span>
					</div>
					<div class="remove__member__body">
						<div class="remove__memberRow">
							<div class="remove__member__con">Remove from Workspace</div>
							<div class="remove__member__Btn">Remove all access to the
								Workspace. The member will remain on all their boards in this
								Workspace. They will receive a notification.</div>
						</div>
					</div>
				</div>
			</div>



		</section>
	</div>






	<input type="checkbox" id="modal-1" class="hs" />
	<div class="modal-wrapper">
		<div class="modalbox">
			<div class="modals-content">
				<div class="modal-header">
					<h2>권한 변경</h2>
				</div>
				<div class="modal-content-body">
					<p>홍길동님의 권한을 admin으로 변경하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<span class="modal-changeBtn">변경</span> <label for="modal-1"><span
						class="modal-cancleBtn">취소</span></label>
				</div>

			</div>
		</div>
	</div>


	<input type="checkbox" id="modal-2" class="hs" />
	<div class="modal-wrapper">
		<div class="modalbox2">
			<div class="modals2-content">
				<div class="headerRow">
					<div class="headerTop">
						<label for="modal-2">
							<div class="headerTop-icon">
								<i class="fas fa-arrow-left"></i>
							</div>
						</label>
						<div class="headerTop-input">workspace 초대하기</div>
					</div>
				</div>
				<div class="bodyRow">
					<div class="bodyRow-search">
						<div class="bodyRow-search-icon">
							<i class="fas fa-search"></i>
						</div>
						<div class="bodyRow-search-input">
							<input type="text" id="workspaceInviteInputVal" placeholder="검색하기"> <span
								class="underline"></span>
						</div>
						<div class="bodyRow-search-resultBtn">
							<button type="button" id="inviteBtn" onclick="workspaceInviteBtnFn()">검색</button>
						</div>
					</div>
					<div class="bodyRow-content">
						
					</div>
				</div>
				<div class="footerRow">
					<div class="footerRow-content">
						
					</div>
				</div>
				<div class="modal2-resultBtn">초대 보내기</div>
			</div>
		</div>
	</div>

	<div style="display: none;" id="memPlusTemplate">
		<div class="footerRow-member">
			<div class="result-member-img">
				<img src="" alt="">
			</div>
			<div class="result-member-id"></div>
			<div class="result-member-minusBtn">
				<i class="fas fa-minus-square" id="minusBtn"></i>
			</div>
		</div>
	</div>

	<div style="display: none;" id="memMinusTemplate">
		<div class="bodyRow-member">
			<div class="member-img">
				<img src="" alt="">
			</div>
			<div class="member-id"></div>
			<div class="member-plusBtn">
				<button type="button" id="plusBtn">추가하기</button>
			</div>
		</div>
	</div>

	<div style="display: none;" class="userTrTemplate">
		<div class="tabletdRow">
			<div class="tdDetails">
				<div class="user__img">
					<img src="" alt="">
				</div>
				<div class="user__name"></div>
			</div>
			<div class="tdOptions">
				<a href="#" class="boardsNum a_tag">On <span></span> boards
				</a> <a href="#" class="userAuthor a_tag"> &#183;&#183;&#183; </a> <a
					href="#" class="userRemoveBtn a_tag">Remove...</a>
			</div>
		</div>
	</div>
	<div style="display: none;" class="boardsListRowTemplate">
		<div class="Workspace__boards__body__boardsList__row">
			<div class="boardsList__row__img"></div>
			<div class="boardsList__row__name">test1</div>
			<!-- 			<div class="boardsList__row__name__author">(Normal)</div> -->
			<div class="boardsList__row__removeBtn">Remove</div>
		</div>
	</div>
	<input type="hidden" id="hWorkspace_id"
		value="${workspace.workspace_id}">
</body>



<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

const currentWorkspaceId = $('#hWorkspace_id').val();	

const boardBg = {
		red : "rgb(247,123,123)",
		orange : "rgb(247,217,189)",
		yellow : "rgb(248,244,204)",
		green : "rgb(218,247,228)",
		skyblue : "rgb(203, 248, 250)",
		blue : "rgb(209, 231, 241)",
		darkblue : "rgb(192, 193, 250)",
		purple : "rgb(204, 195, 226)",
		pink : "rgb(248,233,247)",
		gray : "rgb(241,241,241)",
		darkgray : "rgb(119,116,116)",
		black : "rgb(12,12,12)",
		base : "#ECE9FE"
}


	$(function() {

		let name = "${workspace.workspace_title}";
		
		changeWKIMG(name);
		
		let workspaceId = $('#hWorkspace_id').val();


		ajaxMemPageUserList(workspaceId)
		
		

	})

	function ajaxMemPageUserList(workspaceId) {
		$.ajax({
			url : 'ajaxMemPageUserList.do',
			type : 'post',
			data : {	
				workspace_id : workspaceId
			},
			success : function(data){
				let userList = data.userList;
				let usersAuthor = data.userAuthor;
				
				
				createTrRow(userList, usersAuthor)
			}
			
		})
	}

	
	
	function createTrRow(userList, usersAuthor){

		let tbodyEl = $('.tbodyEl');
		
		userList
		for(let user of userList){
			let tr = $('<tr>')
			let td = $('<td>')
			tbodyEl.append(tr.append(td.append(trRow(user, usersAuthor).html())))
		}	
	}
	function ajaxSessionId(){
		let currentId;
		
		$.ajax({
			url : 'ajaxSessionId.do',
			dataType : 'text',
			type : 'post',
			async: false,
			success : function(data){
				
				currentId = data;
			}
		})
		return currentId;
	}
	///여기
	function trRow(user, usersAuthor){
		
		let userTrTemplate = $('.userTrTemplate');
		let sessionId = ajaxSessionId();
		let userId = user.id;
		let userRemoveBtnText = "Remove...";
		let boardsNub = ajaxBoardsNub(userId);
		 
		var userAuthorVal;
		for(let userAuthor of usersAuthor){
			
			if(userAuthor['id'] == userId){
				userAuthorVal = userAuthor['permissions']
			}
		}
	
		userTrTemplate.find('.tabletdRow').attr('data', user.id);
		userTrTemplate.find('.user__img>img').attr('src', user.prof_pic);
		userTrTemplate.find('.user__name').text(user.nickname);
		userTrTemplate.find('.userAuthor').text(userAuthorVal)
		userTrTemplate.find('.boardsNum>span').text(boardsNub);
		if(user.id == sessionId){
			userRemoveBtnText = "Leave";
		
		}
		userTrTemplate.find('.userRemoveBtn').text(userRemoveBtnText);
		
		return userTrTemplate;
	}
	
	function ajaxBoardsNub(userId){

		let num;
		$.ajax({
			url : 'ajaxBoardsNub.do',
			type : 'post',
			dataType : 'json',
			async: false,
			data : {
				id : userId,
				workspace_id : currentWorkspaceId
			},
			success : function(data){		
				
					num = data.length;
					
			}
		})
		return num;
	}
	
	
	//워크프페이스 프로필이미지

	function changeWKIMG(newWKname) {
		let name = newWKname.substring(0, 1);
		let img = document.querySelector(".wkimg");
		let img2 = document.querySelector(".wkimg-body");
		if (name == 'a' || name == 'A') {
			img.setAttribute("src", "resources/img/a.jpg");
			img2.setAttribute("src", "resources/img/a.jpg");
		} else if (name == 'b' || name == 'B') {
			img.setAttribute("src", "resources/img/b.jpg");
			img2.setAttribute("src", "resources/img/b.jpg");
		} else if (name == 'c' || name == 'C') {
			img.setAttribute("src", "resources/img/c.jpg");
			img2.setAttribute("src", "resources/img/c.jpg");
		} else if (name == 'd' || name == 'D') {
			img.setAttribute("src", "resources/img/d.jpg");
			img2.setAttribute("src", "resources/img/d.jpg");
		} else if (name == 'e' || name == 'E') {
			img.setAttribute("src", "resources/img/e.jpg");
			img2.setAttribute("src", "resources/img/e.jpg");
		} else if (name == 'f' || name == 'F') {
			img.setAttribute("src", "resources/img/f.jpg");
			img2.setAttribute("src", "resources/img/f.jpg");
		} else if (name == 'g' || name == 'G') {
			img.setAttribute("src", "resources/img/g.jpg");
			img2.setAttribute("src", "resources/img/g.jpg");
		} else if (name == 'h' || name == 'H') {
			img.setAttribute("src", "resources/img/h.jpg");
			img2.setAttribute("src", "resources/img/h.jpg");
		} else if (name == 'i' || name == 'I') {
			img.setAttribute("src", "resources/img/i.jpg");
			img2.setAttribute("src", "resources/img/i.jpg");
		} else if (name == 'j' || name == 'J') {
			img.setAttribute("src", "resources/img/j.jpg");
			img2.setAttribute("src", "resources/img/j.jpg");
		} else if (name == 'k' || name == 'K') {
			img.setAttribute("src", "resources/img/k.jpg");
			img2.setAttribute("src", "resources/img/k.jpg");
		} else if (name == 'l' || name == 'L') {
			img.setAttribute("src", "resources/img/l.jpg");
			img2.setAttribute("src", "resources/img/l.jpg");
		} else if (name == 'm' || name == 'M') {
			img.setAttribute("src", "resources/img/m.jpg");
			img2.setAttribute("src", "resources/img/m.jpg");
		} else if (name == 'n' || name == 'N') {
			img.setAttribute("src", "resources/img/n.jpg");
			img2.setAttribute("src", "resources/img/n.jpg");
		} else if (name == 'o' || name == 'O') {
			img.setAttribute("src", "resources/img/o.jpg");
			img2.setAttribute("src", "resources/img/o.jpg");
		} else if (name == 'p' || name == 'P') {
			img.setAttribute("src", "resources/img/p.jpg");
			img2.setAttribute("src", "resources/img/p.jpg");
		} else if (name == 'q' || name == 'Q') {
			img.setAttribute("src", "resources/img/q.jpg");
			img2.setAttribute("src", "resources/img/q.jpg");
		} else if (name == 'r' || name == 'R') {
			img.setAttribute("src", "resources/img/r.jpg");
			img2.setAttribute("src", "resources/img/r.jpg");
		} else if (name == 's' || name == 'S') {
			img.setAttribute("src", "resources/img/s.jpg");
			img2.setAttribute("src", "resources/img/s.jpg");
		} else if (name == 't' || name == 'T') {
			img.setAttribute("src", "resources/img/t.jpg");
			img2.setAttribute("src", "resources/img/t.jpg");
		} else if (name == 'u' || name == 'U') {
			img.setAttribute("src", "resources/img/u.jpg");
			img2.setAttribute("src", "resources/img/u.jpg");
		} else if (name == 'v' || name == 'V') {
			img.setAttribute("src", "resources/img/v.jpg");
			img2.setAttribute("src", "resources/img/v.jpg");
		} else if (name == 'w' || name == 'W') {
			img.setAttribute("src", "resources/img/w.jpg");
			img2.setAttribute("src", "resources/img/w.jpg");
		} else if (name == 'x' || name == 'X') {
			img.setAttribute("src", "resources/img/x.jpg");
			img2.setAttribute("src", "resources/img/x.jpg");
		} else if (name == 'y' || name == 'Y') {
			img.setAttribute("src", "resources/img/y.jpg");
			img2.setAttribute("src", "resources/img/y.jpg");
		} else if (name == 'z' || name == 'Z') {
			img.setAttribute("src", "resources/img/z.jpg");
			img2.setAttribute("src", "resources/img/z.jpg");
		} else if (name == '0') {
			img.setAttribute("src", "resources/img/0.jpg");
			img2.setAttribute("src", "resources/img/0.jpg");
		} else if (name == '1') {
			img.setAttribute("src", "resources/img/1.jpg");
			img2.setAttribute("src", "resources/img/1.jpg");
		} else if (name == '2') {
			img.setAttribute("src", "resources/img/2.jpg");
			img2.setAttribute("src", "resources/img/2.jpg");
		} else if (name == '3') {
			img.setAttribute("src", "resources/img/3.jpg");
			img2.setAttribute("src", "resources/img/3.jpg");
		} else if (name == '4') {
			img.setAttribute("src", "resources/img/4.jpg");
			img2.setAttribute("src", "resources/img/4.jpg");
		} else if (name == '5') {
			img.setAttribute("src", "resources/img/5.jpg");
			img2.setAttribute("src", "resources/img/5.jpg");
		} else if (name == '6') {
			img.setAttribute("src", "resources/img/6.jpg");
			img2.setAttribute("src", "resources/img/6.jpg");
		} else if (name == '7') {
			img.setAttribute("src", "resources/img/7.jpg");
			img2.setAttribute("src", "resources/img/7.jpg");
		} else if (name == '8') {
			img.setAttribute("src", "resources/img/8.jpg");
			img2.setAttribute("src", "resources/img/8.jpg");
		} else if (name == '9') {
			img.setAttribute("src", "resources/img/9.jpg");
			img2.setAttribute("src", "resources/img/9.jpg");
		} else {
			img.setAttribute("src","resources/img/workspace_default_profile.png");
			img2.setAttribute("src","resources/img/workspace_default_profile.png");
		}
	}

	$(document).on('click', '.a_tag', a_tageventFn)
	$(document).on('click', '.cancelB', a_tagcancelFn)
	var boardsNum = $('.boardsNum');
	var userAuthor = $('.userAuthor');
	var userRemoveBtn = $('.userRemoveBtn');

	function a_tagcancelFn() {
		let tagName;
		let target = $('.target')

		let className = $('.target').attr('class');

		if (className.includes('boardsNum')) {
			tagName = $('.pop_over_boards');

		} else if (className.includes('userAuthor')) {
			tagName = $('.pop_over_author')

		} else if (className.includes('userRemoveBtn')) {
			tagName = $('.pop_over_remove')
		} else {

		}
		tagName.css({
			top : -9999,
			left : -9999
		})
		target.removeClass('target')

	}

	function a_tageventFn(e) {
		if ($('.target').length) {
			a_tagcancelFn()
		}
		$(e.target).addClass('target');
		let target = $('.target')
		return contentShowFn(target)
	}

	
	function MemBoardsListRowCreate(data, tagName){
		
		let Workspace__boards__body__boardsList = tagName.find('.Workspace__boards__body__boardsList')
		let workspaceId = $('#hWorkspace_id').val();
		Workspace__boards__body__boardsList.find('.Workspace__boards__body__boardsList__row').remove();

		for(let board of data){
				console.log(board)
			if(board.workspace_id == workspaceId){
				let boardsListRowTemplate = $('.boardsListRowTemplate')
			
				console.log()
				boardsListRowTemplate.find('.boardsList__row__img').css('background-color', boardBg[board.board_thema])
				boardsListRowTemplate.find('.boardsList__row__name').attr("data", board.board_id).text(board.board_Title)
				Workspace__boards__body__boardsList.append(boardsListRowTemplate.html());	
		
			}
		}
	}
	
	function ajaxMemBoardsListRow(userId){
		let result;
		$.ajax({
			
			url : 'ajaxMemBoardsListRow.do',
			dataType : 'json',
			async: false,
			type :  'post',
			data : {
				id : userId,
				workspace_id : currentWorkspaceId
			},
			success : function(data){
				result = data;
			}
		})
		
		return result;
	}
	
	function contentInputFn(tagName, target){
		let userId = $('.target').closest('.tabletdRow').attr('data')
		
		let data = ajaxMemBoardsListRow(userId);
		
		MemBoardsListRowCreate(data, tagName)
		
	}

	// permissions 클릭시 노출 author 
		function authorChkdFn(author, tagName){
	

		if(author.includes("ADMIN") || author.includes("admin")){
			$('.change__adminRow').attr('disabled', true);
			$('.change__userRow').attr('disabled', false);
		}else if(author.includes("USER") || author.includes("user")){
			$('.change__adminRow').attr('disabled', false);
			$('.change__userRow').attr('disabled', true);
		}
	}
	
		function ajaxMemPermissionsList(userId, hWorkspace_id){
		let result;
		$.ajax({
			url : 'ajaxMemPermissionsList.do',
			type : 'post',
			dataType : 'json',
			async: false,
			data : {
				id : userId,
				workspace_id : hWorkspace_id
			},
			success : function(data){
				
				result = data;
			}
		})
		
		return result;
	}
	
	
	function authorContentInputFn(tagName, target){
		let userId = $('.target').closest('.tabletdRow').attr('data')
		let hWorkspace_id = $('#hWorkspace_id').val()
	
		let data = ajaxMemPermissionsList(userId, hWorkspace_id);

		authorChkdFn(data.permissions, tagName);
	}
	
	function contentShowFn(target) {

		let className = target.attr('class');
		let topminu = 0;
		let leftminu = 0;
		let tagName;
		if (className.includes('boardsNum')) {
			tagName = $('.pop_over_boards');
			let tagHeight = $('.Workspace__boards').css('height').substring(0,
					3)
			topminu = 272
			leftminu = 280
			
			contentInputFn(tagName, target);
		} else if (className.includes('userAuthor')) {
			tagName = $('.pop_over_author')
			topminu = 351
			leftminu = 530
			
			authorContentInputFn(tagName, target);
		} else if (className.includes('userRemoveBtn')) {
			tagName = $('.pop_over_remove')
			topminu = 230
			leftminu = 530
		} else {

		}
		
		let targetTop = target.offset().top;
		let targetLeft = target.offset().left;

		tagName.css({
			"top" : targetTop - topminu,
			"left" : targetLeft - leftminu
		})

	}

	function windowResize() {
		if ($('.target').length) {
			let target = $('.target');

			return contentShowFn(target)
		}

	}
	$(window).resize(function() {
		windowResize()
	});

	$(document).on('click', '.change__adminRow', changeadminFn)
	$(document).on('click', '.change__userRow', changeuserFn)
	
		// permissions ChangeFn end
		
		 function changeuserFn(){
			let targetCurrentPermission = "USER";	
			 if($('.change__userRow').attr('disabled') !='disabled'){
				 swal({
						title: "권한을 "+targetCurrentPermission+"로 변경 하시겠습니까?",
						icon : "warning",
						buttons : ["취소", "확인"]
					})
					.then(function(value) {
						if(value) {
							
							permissionChangFn(targetCurrentPermission)
							
						}
					})
			 }
		
		}
	
	
		 function changeadminFn(){
			 let targetCurrentPermission = "ADMIN";
			 if($('.change__adminRow').attr('disabled') !='disabled'){
				 swal({
						title: "권한을 "+targetCurrentPermission+"로 변경 하시겠습니까?",
						icon : "warning",
						buttons : ["취소", "확인"]
					})
					.then(function(value) {
						if(value) {
							
				permissionChangFn(targetCurrentPermission)
							
						}
					})
			 }					
		}
	
		function permissionChangFn(targetCurrentPermission){

			let currentUserPermissinChk = ajaxCuerrentUserPermissionChk()

				if(currentUserPermissinChk){
					let targetUserId = $('.target').closest('.tabletdRow').attr('data');
					targetUserPermissionChange(targetUserId, targetCurrentPermission)
				}else{
					swal({
		                icon: 'error',
		                title:'권한이 없습니다.',
		                text: '',
		            })
				}
			
		}

	
		function targetUserPermissionChange(targetUserId, targetCurrentPermission){
			let flag = false;
			let currentWorkspacePermissionChk = ajaxCurrentWorkspacePermissionChk()
	
			if(targetCurrentPermission == "USER" && currentWorkspacePermissionChk){
				flag = ajaxTargetUserPermissionChange(targetUserId, currentWorkspaceId, targetCurrentPermission);
			}else if(targetCurrentPermission == "ADMIN"){
				flag = ajaxTargetUserPermissionChange(targetUserId, currentWorkspaceId, targetCurrentPermission);
			}
			
			if(flag){
				$('.target').text(targetCurrentPermission)
				
				if(targetCurrentPermission=="ADMIN"){
				
					$('.change__adminRow').attr('disabled', true);
					$('.change__userRow').attr('disabled', false);
				}else{
			
					$('.change__adminRow').attr('disabled', false);
					$('.change__userRow').attr('disabled', true);
				}
				swal({
	                icon: 'success',
	                title: targetCurrentPermission+'로 권한 변경 완료.',
	                text: '',
	            })
			}else{
				swal({
	                icon: 'error',
	                title:'최소 한명의 ADMIN 권한자가 있어야 합니다.',
	                text: '',
	            })
			}
		}
	
		function ajaxTargetUserPermissionChange(targetUserId, currentWorkspaceId, targetCurrentPermission){
			let flag = false;
			$.ajax({
				url : 'ajaxTargetUserPermissionChange.do',
				type : 'post',
				dataType : 'text',
				async: false,
				data : {
					workspace_id : currentWorkspaceId,
					id : targetUserId,
					permissions : targetCurrentPermission
				},
				success : function(data){
					flag = data;
				}
				
			})
			return flag;
		}
			
		 function ajaxCurrentWorkspacePermissionChk(){
			 let flag = false;
			 
			 $.ajax({
				url : 'ajaxCurrentWorkspacePermissionChk.do',
				type : 'post',
				dataType : 'text',
				async: false,
				data : {
					workspace_id : currentWorkspaceId
				},
				success : function(data){
					flag = (data=="true") ? true : false;
				}
			 })
			 return flag;
			 
		 }
		 function ajaxCuerrentUserPermissionChk(){
			let flag = false;
			
			$.ajax({
				url : 'ajaxCuerrentUserPermissionChk.do',
				type : 'post',
				dataType : 'text',
				async: false,
				data : {
					workspace_id : currentWorkspaceId
				},
				success : function(data){
					
					flag = (data=="true") ? true : false
					
				}
			})
			return flag;
		}

	
	// permissions ChangeFn end

	function labelClick() {
		$('.modal2_label').click();
	}
	// boards remove Btn start
	function ajaxSessionIdChk(targetUserId){
		let flag = false;
		$.ajax({
			url : 'ajaxSessionIdChk.do',
			dataType : 'text',
			async: false,
			type : 'post',
			data : {
				chkId : targetUserId
			},
			success : function(data){
				
				flag = (data == "true") ? true : false;
			}
			
		})
		
		return flag;
	}
	function ajaxMemPageBoardRemove(targetBoardId, currentWorkspaceId){
		let flag = false;
		$.ajax({
			url : "ajaxMemPageBoardRemove.do",
			dataType : 'text',
			type : 'post',
			async: false,
			data : {
				board_id : targetBoardId,
				workspace_id : currentWorkspaceId
			},
			success : function(data){
				flag = (data == "true") ? true : false;
			}
			
		})
		return flag;
	}
	
	function boardRemoveFn(targetBoardId, targetRowEl){
		console.log("oK")
		let removeResult = ajaxMemPageBoardRemove(targetBoardId, currentWorkspaceId)
		if(removeResult){
			targetRowEl.remove();
			swal({
                icon: 'success',
                title:'탈퇴완료',
                text: '',
            })
		}else{
			swal({
                icon: 'error',
                title:'시스템 에러',
                text: '',
            })
		}
	}
	
	function boardsRemoveFn(){
		let targetEl = $(event.target)
		let targetRowEl = targetEl.closest('.Workspace__boards__body__boardsList__row')
		let targetUserId = $('.target').closest('.tabletdRow').attr('data');
		let targetBoardTitle = targetRowEl.find('.boardsList__row__name').text();
		let chkd = ajaxSessionIdChk(targetUserId)
		if(chkd){
			swal({
				title: '',
				text: targetBoardTitle+'를 나가시겠습니까?',
				icon : "info",
				buttons : ["취소", "확인"]
			})
			.then(function(value) {
				if(value) {
					let targetBoardId = targetEl.closest('.Workspace__boards__body__boardsList__row').find('.boardsList__row__name').attr('data');
					boardRemoveFn(targetBoardId , targetRowEl)
				}
			})
		
		
		}else{
			swal({
                icon: 'error',
                title:'권한이 없습니다.',
                text: '',
            })
		}
		
	}
	
	//workspace inviteBtnFn start
	function createInviteUserRow(data){
		let bodyRow = $('.bodyRow-content');
		for(let user of data){
			let workspaceInviteUserTemplate = $('#memMinusTemplate');
			workspaceInviteUserTemplate.find('.member-img>img').attr('src', user.prof_pic)
			workspaceInviteUserTemplate.find('.member-id').text(user.email)
			bodyRow.append(workspaceInviteUserTemplate.html());
		}
		
	}
	
	function ajaxWorkspaceInviteInputValSearch(workspaceInviteInputVal){
		
		$.ajax({
			url : 'ajaxWorkspaceInviteInputValSearch.do',
			type : 'post',
			dataTpye : 'json',
			data : {
				email : workspaceInviteInputVal
			},
			success : function(data){
				createInviteUserRow(data)
			}
		})
	}
	
	function workspaceInviteBtnFn(){
		let workspaceInviteInputVal = $('#workspaceInviteInputVal').val()
		ajaxWorkspaceInviteInputValSearch(workspaceInviteInputVal)
	}
	
	$(document).on('click', '#minusBtn', minusBtnHandle);
	$(document).on('click', '#plusBtn', plusBtnHandle);
	$(document).on('click', '.boardsList__row__removeBtn', boardsRemoveFn);
	$(document).on('click', '.remove__memberRow', workSpaceUserOutFn)
	
	//workSpaceUserOutFn strat
	function ajaxWorkspaceLeave(targetId){
		
		$.ajax({
			url : 'ajaxWorkspaceLeave.do',
			dataType : 'text',
			type : 'post',
			data : {
				id : targetId,
				workspace_id : currentWorkspaceId
			},
			success : function(data){
				if(data == "true"){
					$('.target').closest('.tabletdRow').parent().parent().remove()
					swal({
		                icon: 'success',
		                title:'Workspace가 탈퇴 되었습니다.',
		                text: '',
		            })
		            
		            // return 어디로 시켜야할지 정해야함!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				}else{
					swal({
		                icon: 'error',
		                title:'시스템 에러',
		                text: '',
		            })
				}
			}
		})
	}
	function ajaxWorkspaceTargetUserRemove(targetId, targetNickName){
		console.log(targetId)
		$.ajax({
			url : 'ajaxWorkspaceTargetUserRemove.do',
			dataType : 'text',
			type : 'post',
			data : {
				id : targetId,
				workspace_id : currentWorkspaceId
			},
			success : function(data){
				if(data == "true"){
					$('.target').closest('.tabletdRow').parent().parent().remove()
					swal({
		                icon: 'success',
		                title: targetNickName+'님이 추방되었습니다.',
		                text: '',
		            })
		            
		            // return 어디로 시켜야할지 정해야함!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				}else{
					swal({
		                icon: 'error',
		                title:'시스템 에러',
		                text: '',
		            })
				}
			}
		})
	}
	
	function targetUserWorkspaceRemove(targetId, targetNickName){
		swal({
            icon: 'warning',
            title: targetNickName+'님을 추방하겠습니까?',
            text: '',
        	buttons : ["취소", "확인"]
        })
        .then(function(value) {
			if(value) {
				ajaxWorkspaceTargetUserRemove(targetId, targetNickName)
				
			}
        })
	}
	
	function workSpaceUserOutFn(){
		let targetId = $('.target').closest('.tabletdRow').attr('data');
		let targetNickName = $('.target').closest('.tabletdRow').find('.user__name').text();
		let currentId = ajaxSessionId();
		if(targetId==currentId){
			swal({
                icon: 'warning',
                title:'현재 WorkSpace를 나가시겠습니까?',
                text: '',
            	buttons : ["취소", "확인"]
            })
            .then(function(value) {
			if(value) {
				ajaxWorkspaceLeave(targetId)
				
			}
		})
		
		return;
		}
		let currentUserPermission = ajaxCuerrentUserPermissionChk();
		if(currentUserPermission){
			
			targetUserWorkspaceRemove(targetId, targetNickName)
			
		}else{
			swal({
                icon: 'error',
                title:'권한이 없습니다.',
                text: ''
            })
		}
		
		
		let targetEl = $(event.target);
		console.log(targetEl)
	}
	//workSpaceUserOutFn end
	
	function plusBtnHandle() {
		console.log(this)
		let memberimg = $(this).parent().prev().prev().find('img').attr('src')
		let memberid = $(this).parent().prev().text();

		let thismember = $(this).closest('.bodyRow-member');
		let memTemplate = $('#memPlusTemplate');
		let members = $('.footerRow-content');
		memTemplate.find('.result-member-img').find('img').attr('src',
				memberimg)
	
		memTemplate.find('.result-member-id').text(memberid)
		members.append(memTemplate.html())
		thismember.remove();
	}

	function minusBtnHandle() {
		console.log()
		let memberimg = $(event.target).parent().prev().prev().find('img').attr('src')
		console.log($(event.target).parent().prev().prev().find('img').attr('src'))
		let memberid = $(this).parent().prev().text()
		let thismember = $(this).closest('.footerRow-member')

		let memTemplate = $('#memMinusTemplate')
		let members = $('.bodyRow-content')
		memTemplate.find('.member-img').attr('src', memberimg)
		memTemplate.find('.member-id').text(memberid)
		members.append(memTemplate.html())
		thismember.remove();
	}

	var pagenumber = 10
	var pageCount = 3
	var currentPage = 1;

	var tableEl = $('.table-responsive');
	var tr = tableEl.find('tbody tr');
	var trtotal = tr.length;

	function page(pagenumber, pageCount, currentPage) {

		if (trtotal == 0)
			return;
		var pagetotal = Math.ceil(trtotal / pagenumber);
		var pageGroup = Math.ceil(currentPage / pageCount);
		var last = pageGroup * pageCount;
		if (last > pagetotal) {
			last = pagetotal;
		}
		var first;
		if (last % pageCount == 0) {
			first = last - (pageCount - 1);
		} else {
			first = last + 1 - last % pageCount
		}
		var next = last + 1;
		var prev = first - 1;
		$('#pagebtn').remove();
		tableEl.after('<div id="pagebtn">');
		if (prev > 0) {
			$('<a href="#"></a>').attr('data', 'prev').html("<").appendTo(
					'#pagebtn');
		}

		for (let i = first; i <= last; i++) {
			$('<a href="#"></a>').attr('data', i).html(i).appendTo('#pagebtn');
		}
		if (last < pagetotal) {
			$('<a href="#"></a>').attr('data', 'next').html(">").appendTo(
					'#pagebtn');
		}
		var paginglink = $('#pagebtn a');
		paginglink.removeClass('active');
		$("[data=" + currentPage + "]").addClass("active")
		var startval = (currentPage - 1) * pagenumber;
		var endval = startval + pagenumber;

		tr.css('opacity', '0.0').addClass('off-screen').slice(startval, endval)
				.removeClass('off-screen').animate({
					opacity : 1
				}, 500);

		paginglink.on('click', function(e) {
			e.preventDefault();
			var thisval = $(this);
			var data = thisval.attr("data");
			var selectedPage = thisval.text();
			if (data == "next")
				selectedPage = next;
			if (data == "prev")
				selectedPage = prev;

			page(pagenumber, pageCount, selectedPage);

		});
	}
	page(pagenumber, pageCount, currentPage);

	const label = $('.label');
	const options = $('.optionItem');

	label.on('click', function(e) {

		$(e.target).parent().toggleClass('active');
	})

	$.each(options, function(index, option) {
		$(option).on('click', function(e) {
			$(e.target).parent().prev().text($(option).text())
			$(e.target).parent().parent().removeClass('active');
		})
	})
</script>
<script src="resources/js/jay/confirmForm.js"></script>
</html>