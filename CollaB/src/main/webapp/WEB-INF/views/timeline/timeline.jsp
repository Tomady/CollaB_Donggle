<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>타임라인</title>
<!-- fullcalendar -->
<link href='/CollaB/resources/fullcalendar/main.css' rel='stylesheet' />

<script src='/CollaB/resources/fullcalendar/main.js'></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- icon -->
<script type="module"
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

<style>
.boardColor {
	width: 3%;
	height: 50px;
	margin-left: 5%;
}

.default {
	margin-right: 6%;
	height: 50px;
	margin-left: 5%;
}

.boardColor:hover, .default:hover {
	cursor: pointer;
}

body {
	background-color: white !important;
}

#timeline-wrap {
	width: 100%;
	height: auto;
	display: flex;
}

#timeline-list {
	width: 20%;
}

#timeline-list-header {
	padding-top: 16%;
	padding-bottom: 7%;
	text-align: center;
}

#timeline-list-box {
	height: 85%;
}

#timeline-list-body {
	height: 90%;
}

#timeline-list-footer {
	height: 10%;
}

/* calendar */
#calendar {
	width: 80%;
	margin: 40px auto;
}

#calendar button {
	background-color: white;
	color: gray;
}

.fc-button-group {
	margin-left: 5%;
	background-color: white;
	border: none;
	color: #6553C1;
}

.fc-daygrid {
	padding: 5px;
}

/* 왼쪽 div*/
#addBtn {
	background-color: #9F90D9;
	border: none;
	border-radius: 5px;
	color: #F6F6F6;
	font-size: 18px;
	margin: auto;
	display: block;
	width: 30%;
	border: 1px solid #9F90D9;
}

#addBtn:active, #addBtn:hover {
	background-color: white;
	border: 1px solid #9F90D9;
	border-radius: 5px;
	color: #9F90D9;
	outline: 0;
}

button:focus {
	outline: 0;
}

.listOfCard {
	padding: 10%;
	;
}

.listOfCard li {
	border-bottom: 1px solid lightgray;
	list-style-type: none;
	cursor: pointer;
	text-align: center;
	padding: 5px;
}

#modal {
	position: absolute;
	width: 200px;
	height: 90px;
	background: white;
	display: none;
	border: 1px solid lightgray;
	top: 80%;
	left: 7%;
}

#modal li {
	list-style-type: none;
	cursor: pointer;
}

#modal li:hover {
	color: #6553C1;
	font-weight: bold;
}

.icon {
	cursor: pointer;
	float: right;
	margin: 10px;
}

#modalOfCard, #modalOfList {
	width: 500px;
	border: 1px solid lightgray;
	border-radius: 0.25rem;
	display: none;
	transform: translate(-50%, -50%);
	top: 50%;
	left: 60%;
	background-color: white;
	z-index: 1060;
	position: fixed;
}

.alert.alert-primary {
	background-color: #9F90D9;
	color: #F6F6F6;
	font-weight: bold;
	text-align: center;
	font-size: 20px;
}

.form-group {
	width: 70%;
	margin: 10px auto;
}

#dateWrap {
	display: flex;
}

#startDate {
	width: 150px;
	margin-right: 50px;
}

#dueDate {
	width: 150px;
}

.addBtn {
	background-color: #9F90D9;
	border: none;
	border-radius: 5px;
	color: #F6F6F6;
	font-size: 18px;
	margin: auto;
	display: block;
	border: 1px solid #9F90D9;
	width: -webkit-fill-available;
}

.addBtn:active, .addBtn:hover {
	background-color: white;
	border: 1px solid #9F90D9;
	border-radius: 5px;
	color: #9F90D9;
	outline: 0;
}
</style>
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
		let color = "${workspace.board_thema}";
		let name = "${workspace.workspace_title}".substring(0, 1);
		boardColorFnc(color);
		changeWKIMG(name);
	})
</script>
</head>

<body>
	<!-- Main Content -->
	<div class="main-content">
		<section class="section">
			<!-- 보드헤더 -->
			<div class="section-header d-flex justify-content-between">
				<div class="btn-group">
					<button class="btn btn-secondary dropdown-toggle boardheaderbtn"
						type="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Switch View</button>
					<div class="dropdown-menu">
						<!-- 세션에다 닉네임 저장해주세여....부탁드려보자.... -->
						<div class="dropdown-title">
							Hi, ${nickname}! 🤗
							<p>Where are you going ?</p>
						</div>
						<a class="dropdown-item" href="boardDetail?boardID=${boardID}">&nbsp;&nbsp;Board</a>
						<a class="dropdown-item" href="timeline.do?boardID=${boardID}">&nbsp;&nbsp;TimeLine</a>
						<a class="dropdown-item" href="calendar.do?boardID=${boardID}">&nbsp;&nbsp;Calendar</a>
						<a class="dropdown-item" href="dashboard?boardID=${boardID}">&nbsp;&nbsp;DashBoard</a>
						<!--<div class="dropdown-divider"></div> 구분선-->
					</div>
					&nbsp;&nbsp;
					<button id="WsName" class="btn btn-secondary boardheaderbtn"
						type="button" title="workspace"
						data-wkId="${workspace.workspace_id}">
						${workspace.workspace_title}</button>
					&nbsp;&nbsp;
					<button id="BorName" class="btn btn-secondary boardheaderbtn"
						type="button" title="board" data-boardId="${boardID}">
						${workspace.board_Title}</button>
					&nbsp;&nbsp;
					<c:if test="${starYesOrNo > 0}">
						<button id="addstar" class="btn btn-secondary boardheaderbtn"
							type="button" data-boardId="${boardID}">
							<i id="star" class="fas fa-star" style="color: yellow;"
								data-boardId="${boardID}"></i>
						</button>
					</c:if>
					<c:if test="${starYesOrNo == 0}">
						<button id="addstar" class="btn btn-secondary boardheaderbtn"
							type="button" data-boardId="${boardID}">
							<i id="star" class="fas fa-star" data-boardId="${boardID}"></i>
						</button>
					</c:if>
					<div class="ml-1">
						<button class="btn btn-secondary dropdown-toggle boardheaderbtn"
							type="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">Thema</button>
						<div class="dropdown-menu dropdown-menu-right "
							style="overflow: scroll; overflow-x: hidden; height: 300px;">
							<div class="dropdown-title text-right">What's your favorite
								color? 🌈</div>
							<!-- 백그라운드 색깔 종류 리스트 -->
							<div class="d-flex">
								<span title="red" class="dropdown-item boardColor"
									style="background-color: rgb(247, 123, 123);"
									onclick="changeBoardColor('red')"></span> <span title="orange"
									class="dropdown-item boardColor"
									style="background-color: rgb(252, 187, 127);"
									onclick="changeBoardColor('orange')"></span> <span
									title="yellow" class="dropdown-item boardColor"
									style="background-color: rgb(255, 245, 157);"
									onclick="changeBoardColor('yellow')"></span>
							</div>
							<div class="d-flex mt-3">
								<span title="green" class="dropdown-item boardColor"
									style="background-color: rgb(86, 161, 111);"
									onclick="changeBoardColor('green')"></span> <span
									title="skyblue" class="dropdown-item boardColor"
									style="background-color: rgb(123, 243, 247);"
									onclick="changeBoardColor('skyblue')"></span> <span
									title="blue" class="dropdown-item boardColor"
									style="background-color: rgb(121, 162, 250);"
									onclick="changeBoardColor('blue')"></span>
							</div>
							<div class="d-flex mt-3">
								<span title="darkblue" class="dropdown-item boardColor"
									style="background-color: rgb(123, 125, 247);"
									onclick="changeBoardColor('darkblue')"></span> <span
									title="purple" class="dropdown-item boardColor"
									style="background-color: rgb(171, 127, 252);"
									onclick="changeBoardColor('purple')"></span> <span title="pink"
									class="dropdown-item boardColor"
									style="background-color: rgb(250, 167, 243);"
									onclick="changeBoardColor('pink')"></span>
							</div>
							<div class="d-flex mt-3">
								<span title="gray" class="dropdown-item boardColor"
									style="background-color: rgb(184, 184, 184);"
									onclick="changeBoardColor('gray')"></span> <span
									title="darkgray" class="dropdown-item boardColor"
									style="background-color: rgb(116, 115, 115);"
									onclick="changeBoardColor('darkgray')"></span> <span
									title="black" class="dropdown-item boardColor"
									style="background-color: rgb(12, 12, 12);"
									onclick="changeBoardColor('black')"></span>
							</div>
							<div class="d-flex mt-3">
								<span title="No Thema" class="dropdown-item default"
									style="background-color: #ECE9FE;"
									onclick="changeBoardColor('base')"></span>
							</div>
						</div>
					</div>
					<div class="ml-1 dropdown">
						<button
							class="btn btn-secondary dropdown-toggle InviteBTN boardheaderbtn fa fa-user-plus"
							type="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" onclick="showInvite()">Invite</button>
						<div class="dropdown-menu showInvite"
							style="overflow: scroll; height: 300px; display: none;">
							<span class="fa fa-times ml-2 mt-1" title="close"
								style="cursor: pointer;" onclick="closeInvite()"></span>
							<div class="dropdown-title">Your Partners 👫</div>
							<div class="ml-1 mr-1 text-center Invite_selectMember">
								<!--선택된 멤버들-->
								<c:forEach items="${boardJoinMembers}" var="boardmember">
									<span class="btn btn-light mr-1 ml-1 mt-1">${boardmember.name}</span>
								</c:forEach>
							</div>
							<div class="dropdown-divider"></div>
							<div class="dropdown-title">Member List 🙌</div>
							<div id="Invite_member">
								<c:forEach items="${boardOthers}" var="workspaceMember">
									<a class="dropdown-item" href="#"> <input type="checkbox"
										class="Invite_check" onclick="inviteBoard()"
										value="${workspaceMember.id}"
										data-memName="${workspaceMember.name}"
										data-workspaceID="${workspaceID}" data-boardID="${boardID}">
										${workspaceMember.name}(${workspaceMember.email})
									</a>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="btn-group col-rg">
					<button
						class="btn btn-outline-secondary dropdown-toggle boardheaderFilter"
						type="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false" style="display: none;">Filter</button>
					<div class="dropdown-menu dropdown-menu-right filtermenu"
						style="overflow: scroll; height: 300px;">
						<div class="dropdown-title Members">Your Partners 👫</div>
						<c:forEach items="${boardJoinMembers}" var="boardmember">
							<a class="dropdown-item" href="#"> <input type="checkbox"
								name="filterMember" data-memid="${boardmember.id}"
								onclick="filterApply()">
								${boardmember.id}(${boardmember.name})
							</a>
						</c:forEach>
					</div>
				</div>
				<!-- 보드헤더 끝 -->
			</div>

			<!-- 보드바디 -->

			<div id="timeline-wrap">

				<div id="timeline-list">
					<div id="timeline-list-header">
						<h4>TIMELINE LIST 📆</h4>
					</div>

					<div id="timeline-list-box">
						<div id="timeline-list-body">
							<ul class="listOfCard">
								<c:forEach items="${lists }" var="list">
									<li onclick="listClick(this)" data-listid="${list.list_id }">${list.list_title }</li>
								</c:forEach>
							</ul>
						</div>

						<div id="timeline-list-footer">
							<div class="modal" id="modal">
								<div style="margin-bottom: 20px;">
									<ion-icon name="close-outline" class="icon" id="close1"></ion-icon>
								</div>
								<ul>
									<li id="card">Card</li>
									<li id="list">List</li>
								</ul>
							</div>

							<button type="button" id="addBtn">＋Add</button>
						</div>
					</div>
					<!-- end of timeline-list-box-->

				</div>
				<!-- end of timeline-list-->


				<div id='calendar'></div>

			</div>

		</section>

	</div>


	<!-- 카드, 리스트 추가 모달-->
	<div id="modalOfCard">
		<div style="margin-bottom: 20px;">
			<ion-icon name="close-outline" class="icon" id="close2"></ion-icon>
		</div>
		<form id="cardfrm" method="post" action="insertTimeCard.do">
			<input type="hidden" name="board_id" value="${boardID}">
			<div class="form-group">
				<label>Title</label> <input type="text" class="form-control" name="card_title">
			</div>
			<div class="form-group">
				<label>Select</label> <select class="form-control" id="listSelect">
					<c:forEach items="${lists }" var="list">
						<option data-listId="${list.list_id }">${list.list_title }</option>
					</c:forEach>
				</select>
				<input type="hidden" id="listid" name="list_id" value="">
			</div>
			<div class="form-group" id="dateWrap">
				<div id="startDate">
					<label>Start date</label> <input type="date" class="form-control"
						name="card_start_date">
				</div>
				<div id="dueDate">
					<label>Due date</label> <input type="date" class="form-control"
						name="card_end_date">
				</div>
			</div>
			<!-- end of dateWrap -->
			<br>
			<div class="form-group">
				<button type="button" class="addBtn" id="addCard"
					onclick="cardSubmit()">Add Card</button>
			</div>
		</form>
		<br>
	</div>
	<!--end of 카드모달모달-->

	<div id="modalOfList">
		<div style="margin-bottom: 20px;">
			<ion-icon name="close-outline" class="icon" id="close3"></ion-icon>
		</div>
		<form id="listfrm" method="post" action="insertTimeList.do">
			<div class="form-group">
				<label>Title</label> <input type="text" class="form-control" name="list_title"> 
				<input type="hidden" name="board_id" value="${boardID}">
			</div>

			<br>
			<div class="form-group">
				<button type="button" class="addBtn" id="addList" onclick="listSubmit()">Add List</button>
			</div>
		</form>
		<br>
	</div>
	<!--end of 리스트모달모달-->


	<script>
		let calendar;
		// 풀캘린더
		let event = [];
			<c:forEach items="${cardlists}" var="item">
	 		var info = {
	 				title: '${item.card_title}',
	 				start: '${item.card_start_date}',
	 				end: '${item.card_end_date}'
	 		}
	 		event.push(info);
 		</c:forEach>
		
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
			calendar = new FullCalendar.Calendar(calendarEl, {
				timeZone : 'local',
				initialView : 'dayGridWeek',
				headerToolbar : {
					left : 'today,prev,next',
					center : '',
					right : ''
				},

				locale : "ko",
				editable : true,
				events : event
			});

			calendar.render();
		});

		// 모달
		document.getElementById("addBtn").onclick = function() {
			$("#modal").fadeIn();
		};
		document.getElementById("card").onclick = function() {
			$("#modalOfCard").fadeIn();
			$("#modal").fadeOut();
		};

		document.getElementById("list").onclick = function() {
			$("#modalOfList").fadeIn();
			$("#modal").fadeOut();
		};

		document.getElementById("close1").onclick = function() {
			$("#modal").fadeOut();
		};

		document.getElementById("close2").onclick = function() {
			$("#modalOfCard").fadeOut();
		};

		document.getElementById("close3").onclick = function() {
			$("#modalOfList").fadeOut();
		};

		// 리스트 추가 
		function listSubmit() {
			let form = document.getElementById('listfrm');
			console.log("왜 못 찾아와?", form);
			form.submit();
			alert('리스트 등록 성공!');
		}

		// 카드 추가 
		function cardSubmit() {
			let listSelect = document.getElementById('listSelect');
			let listid = listSelect.options[listSelect.selectedIndex].dataset.listid;
			let listInput = document.getElementById("listid");
			listInput.value = listid;
			
			let form2 = document.getElementById('cardfrm');
			console.log("왜 못 찾아와?", form2);
			form2.submit();
			alert('카드 등록 성공!');
		}
		
		function listClick(li) {
		
			let liVal = li.dataset.listid;
			console.log(liVal);
		
			$.ajax({
				url : "clickList.do",
				type : "post",
				data : {list_id : liVal},
				dataType : "json",
				success : function(datas){
					if(datas.length == 0){
						alert('날짜 데이터가 없습니다.');
					}
					
					calendar.destroy();
					
					let events = [];
					
					for(data of datas){
						var info = {
				 				title: data.card_title,
				 				start: data.card_start_date,
				 				end: data.card_end_date
				 		}
				 		events.push(info);
					}
					
					console.log('나와라',events);
					var calendarEl = document.getElementById('calendar');
					calendar = new FullCalendar.Calendar(calendarEl, {
						timeZone : 'local',
						initialView : 'dayGridWeek',
						headerToolbar : {
							left : 'today,prev,next',
							center : '',
							right : ''
						},

						locale : "ko",
						editable : true,
						events : events
					});

					calendar.render();
				}
			
			})
		};
		
	</script>
	<script src="resources/js/board/board-header.js"></script>
</body>

</html>