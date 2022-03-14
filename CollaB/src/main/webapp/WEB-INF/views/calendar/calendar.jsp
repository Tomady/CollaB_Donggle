<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="co.Donggle.CollaB.calendar.service.calendarVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar</title>
<!-- fullcalendar -->
<link href='/CollaB/resources/fullcalendar/main.css' rel='stylesheet' />
<script src='/CollaB/resources/fullcalendar/main.js'></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
#addListBtn:hover {
	background-color: rgb(224, 224, 224);
	cursor: pointer;
}

#addCardBtn, #addListBtn {
	background-color: #6553C1;
	outline: #6553C1;
}

#calendarCard {
	border: 1px solid #ECE9FE;
	/*height: 1000px;
	overflow: scroll;*/
}

.calendar {
	width: 800px;
}

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

</style>
<script type="text/javascript">
	//페이지 그려줌과 동시에 실행
	document.addEventListener(
			"DOMContentLoaded",
			function() {
				let color = "${workspace.board_thema}";
				let name = "${workspace.workspace_title}".substring(0, 1);
				console.log(color);
				console.log(name);
				boardColorFnc(color);
				changeWKIMG(name);

				//워크프페이스 프로필이미지
				function changeWKIMG(newWKname) {
					let img = document.querySelector(".wkimg");
					if (name == 'a' || name == 'A') {
						img.setAttribute("src", "resources/img/a.jpg");
					} else if (name == 'b' || name == 'B') {
						img.setAttribute("src", "resources/img/b.jpg");
					} else if (name == 'c' || name == 'C') {
						img.setAttribute("src", "resources/img/c.jpg");
					} else if (name == 'd' || name == 'D') {
						img.setAttribute("src", "resources/img/d.jpg");
					} else if (name == 'e' || name == 'E') {
						img.setAttribute("src", "resources/img/e.jpg");
					} else if (name == 'f' || name == 'F') {
						img.setAttribute("src", "resources/img/f.jpg");
					} else if (name == 'g' || name == 'G') {
						img.setAttribute("src", "resources/img/g.jpg");
					} else if (name == 'h' || name == 'H') {
						img.setAttribute("src", "resources/img/h.jpg");
					} else if (name == 'i' || name == 'I') {
						img.setAttribute("src", "resources/img/i.jpg");
					} else if (name == 'j' || name == 'J') {
						img.setAttribute("src", "resources/img/j.jpg");
					} else if (name == 'k' || name == 'K') {
						img.setAttribute("src", "resources/img/k.jpg");
					} else if (name == 'l' || name == 'L') {
						img.setAttribute("src", "resources/img/l.jpg");
					} else if (name == 'm' || name == 'M') {
						img.setAttribute("src", "resources/img/m.jpg");
					} else if (name == 'n' || name == 'N') {
						img.setAttribute("src", "resources/img/n.jpg");
					} else if (name == 'o' || name == 'O') {
						img.setAttribute("src", "resources/img/o.jpg");
					} else if (name == 'p' || name == 'P') {
						img.setAttribute("src", "resources/img/p.jpg");
					} else if (name == 'q' || name == 'Q') {
						img.setAttribute("src", "resources/img/q.jpg");
					} else if (name == 'r' || name == 'R') {
						img.setAttribute("src", "resources/img/r.jpg");
					} else if (name == 's' || name == 'S') {
						img.setAttribute("src", "resources/img/s.jpg");
					} else if (name == 't' || name == 'T') {
						img.setAttribute("src", "resources/img/t.jpg");
					} else if (name == 'u' || name == 'U') {
						img.setAttribute("src", "resources/img/u.jpg");
					} else if (name == 'v' || name == 'V') {
						img.setAttribute("src", "resources/img/v.jpg");
					} else if (name == 'w' || name == 'W') {
						img.setAttribute("src", "resources/img/w.jpg");
					} else if (name == 'x' || name == 'X') {
						img.setAttribute("src", "resources/img/x.jpg");
					} else if (name == 'y' || name == 'Y') {
						img.setAttribute("src", "resources/img/y.jpg");
					} else if (name == 'z' || name == 'Z') {
						img.setAttribute("src", "resources/img/z.jpg");
					} else if (name == '0') {
						img.setAttribute("src", "resources/img/0.jpg");
					} else if (name == '1') {
						img.setAttribute("src", "resources/img/1.jpg");
					} else if (name == '2') {
						img.setAttribute("src", "resources/img/2.jpg");
					} else if (name == '3') {
						img.setAttribute("src", "resources/img/3.jpg");
					} else if (name == '4') {
						img.setAttribute("src", "resources/img/4.jpg");
					} else if (name == '5') {
						img.setAttribute("src", "resources/img/5.jpg");
					} else if (name == '6') {
						img.setAttribute("src", "resources/img/6.jpg");
					} else if (name == '7') {
						img.setAttribute("src", "resources/img/7.jpg");
					} else if (name == '8') {
						img.setAttribute("src", "resources/img/8.jpg");
					} else if (name == '9') {
						img.setAttribute("src", "resources/img/9.jpg");
					} else {
						img.setAttribute("src",
								"resources/img/workspace_default_profile.png");
					}
				}
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
							Hi, [Nickname] ! 🤗
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
							<a class="dropdown-item" href="#"><input type="checkbox">
								${boardmember.name}(${boardmember.email})</a>
						</c:forEach>
					</div>
				</div>
				<!-- 보드헤더 끝 -->
			</div>
			<!-- 보드바디 -->
			<div id="boardDetailBODY" class="section-body"
				data-boardId="${boardID}">
				<div class="card" id="calendarCard">
					<div class="card-header">
						<h4>Calendar</h4>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-lg-2">
								<h4 mt-2>Lists</h4>
								<c:forEach items="${lists }" var="list" varStatus="status">
									<div class="card">
										<div class="card-body" style="background-color: #FAFAFA;" data-listId="${list.list_id}" id="list + ${list.list_id}" onclick="listPlan()">
											<p data-listId="${list.list_id}" id="list + ${list.list_id}" onclick="listPlan()">${list.list_title }</p>
										</div>
									</div>
								</c:forEach>
							</div>
							<div class="col-lg-10">
								<div id='calendar'></div>
							</div>
							<div class="row ml-2 mt-2">
								<button type="button" class="btn btn-primary" id="addCardBtn"
								   data-toggle="modal" data-target="#addCardModal">Add
								   Card</button>
								<button type="button" class="btn btn-primary ml-2"
								   id="addListBtn">Add List</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- 카드 추가 모달 -->
				<div class="modal fade show" id="addCardModal" tabindex="-1" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Add Card</h5>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<label>Title</label> 
									<input type="text" class="form-control" name="card_title" id="card_title">
								</div>
								<div class="form-group">
									<label>List</label> 
									<select class="form-control" name="list_id" id="list_id">
										<option value="">Choose a list</option>
										<c:forEach items="${lists }" var="list" varStatus="status">
	                        				<option value="${list.list_id}">${list.list_title}</option>
	                      				</c:forEach>
									</select>
								</div>
								<div class="form-group">
									<label>Start Date</label>
									<input type="date" class="form-control" name="card_start_date" id="card_start_date">
								</div>
								<div class="form-group">
									<label>Due Date</label> 
									<input type="date" class="form-control" name="card_end_date" id="card_end_date">
								</div>
							</div>
							<div class="modal-footer text-right">
								<button type="button" class="btn btn-secondary" data-dismiss="modal"
									id="closeAddCard">Close</button>
								<button type="button" class="btn btn-primary" id="saveCardBtn">Save</button>
							</div>
						</div>
					</div>
				</div>

            <!-- 리스트 추가 모달 -->
				<div class="modal fade" id="addListModal" tabindex="-1" aria-labelledby="listModalLabel"
					aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add List</h5>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<label>Title</label> 
									<input type="text" class="form-control" name="list_title" id="list_title">
									<input type="hidden" name="id" id="id" value="${id}">
									<input type="hidden" name="board_id" id="board_id">
								</div>
							</div>
							<div class="modal-footer text-right">
								<button type="button" class="btn btn-secondary" id="closeAddList">Close</button>
								<button type="button" class="btn btn-primary" id="saveListBtn">Save</button>
							</div>
						</div>
					</div>
				</div>
			<!-- 리스트 추가 모달 끝 -->
	</div>

	<script>
		let calendar;
		let list_idd = '${lists[0].list_id}';

		//풀캘린더 일정 DB 연동
		document.addEventListener('DOMContentLoaded', function() {
			let boardId = document.querySelector("#boardDetailBODY")
					.getAttribute("data-boardId");
			let xhtp = new XMLHttpRequest();
			xhtp.open('get', '/CollaB/dbCalendar?boardid=' + boardId);
			xhtp.send();
			xhtp.onload = function() {
				let dbData = JSON.parse(xhtp.responseText);
				
				console.log(xhtp.responseText);
				console.log(dbData);
				
				if(dbData.length == 0) {
					console.log("fff")
					dbData = {}
				}
				var calendarEl = document.getElementById('calendar');

				calendar = new FullCalendar.Calendar(calendarEl, {
					initialView : 'dayGridMonth',
					nowIndicator : true,
					headerToolbar : {
						left : 'prev,next today',
						center : 'title',
						end : 'dayGridMonth,dayGridWeek,dayGridDay'
					},
					navLinks : true, // can click day/week names to navigate views
					editable : true,
					selectable : true,
					selectMirror : true,
					eventResize : function(info) {
						updateDate(info);
					},
					eventDrop : function(info) {
						updateDate(info);
					},
					eventClick : function(info) {
						moveCard(info);
					},
					dayMaxEvents : true, // allow "more" link when too many events
					events : dbData
				});
				calendar.render();
			}
		});

		// 리스트 클릭하면 해당 리스트의 카드만 캘린더에 불러오기
		function listPlan() {
			// 기존 달력 삭제
			calendar.destroy();

			list_idd = event.target.dataset.listid;
			let listId = event.target.dataset.listid;
			console.log("data: ");
			console.log(listId);
			let url = '/CollaB/listCalendar?listid=' + listId + '&boardid=${workspace.board_id}';
			let xhtp = new XMLHttpRequest();
			xhtp.open('get', url);
			xhtp.send();

			xhtp.onload = function() {
				let dbData = JSON.parse(xhtp.responseText);
				console.log(xhtp.responseText);
				console.log(dbData);

				var calendarEl = document.getElementById('calendar');

				calendar = new FullCalendar.Calendar(calendarEl, {
					initialView : 'dayGridMonth',
					nowIndicator : true,
					headerToolbar : {
						left : 'prev,next today',
						center : 'title',
						end : 'dayGridMonth,dayGridWeek,dayGridDay'
					},
					navLinks : true, // can click day/week names to navigate views
					editable : true,
					selectable : true,
					selectMirror : true,
					eventResize : function(info) {
						updateDate(info);
					},
					eventDrop : function(info) {
						updateDate(info);
					},
					eventClick : function(info) {
						moveCard(info);
					},
					dayMaxEvents : true, // allow "more" link when too many events
					events : dbData
				});
				calendar.render();
			} 
		}

		// 날짜 변경
		function updateDate(info) {
			var data = {
				card_id : info.event.id,
				card_start_date : info.event.start,
				card_end_date : info.event.end
			}
			console.log(data);

			$.ajax({
				url : '/CollaB/dateUpdate',
				headers : {
					'Content-Type' : 'application/json'
				},
				type : 'POST',
				data : JSON.stringify(data),
				dataType : 'text',
				success : function(data) {
					console.log(data);
					alert("The schedule has changed.");
				},
				error : function(request, status, error) {
				alert("code : " + request.status + "\n"
					+ "message : " + request.responseText
					+ "\n" + "error : " + error);
				}

			});
		}
		
		// 해당 카드 상세보기 페이지로 가기
		function moveCard(info) {
			var lid = info.event.classNames
			location.href = "cardDetail?list="+lid+"&card=" + info.event.id
		}
		
		// 리스트 추가 모달 열고 닫기
		$('#addListBtn').on('click', function () {
			$('#addListModal').modal('show');
		})

		$('#closeAddList').on('click', function () {
			$('#addListModal').modal('hide');
		})

		// list 추가 처리
		$('#saveListBtn').on('click', function(){
			let boardId = document.querySelector("#boardDetailBODY").getAttribute("data-boardId");

			if($('#list_title').val().length==0){alert("Please enter the list title"); $('#list_title').focus(); return false; }
			
			$.ajax({ // 아이디, 리스트타이틀, 보드아이디
				url: '/CollaB/calListInsert',
				type: 'post',
				data: {
					id: $('#id').val(),
					list_title: $('#list_title').val(),
					board_id: boardId
				},
				dataType: 'text',
				success: function(data){
					alert('List registration is complete.');
					console.log(data);
					$('#addListModal').modal('hide');
					location.reload();
				},
				error: function(error){
					console.log(error);
				}
			})
		})

		// 카드 추가 모달 열고 닫기
		$('#addCardBtn').on('click', function(){
			$('#addCardModal').modal('show');
		})

		$('#closeAddCard').on('click', function(){
			$('#addCardModal').modal('hide');
		})

		// 카드 추가 처리
		$('#saveCardBtn').on('click', function(){
			if($('#card_title').val().length==0){alert("Please enter the card title"); $('#card_title').focus(); return false; }
            if($('#list_id').val()==""){alert("Please choose a list"); $('#list_id').focus(); return false; }
            if($('#card_start_date').val()==""){alert("Please choose the start date"); $('#card_start_date').focus(); return false; }
            if($('#card_end_date').val()==""){alert("Please choose the end date."); $('#card_end_date').focus(); return false; }
			
			$.ajax({ // 카드아이디, 카드타이틀, 리스트아이디, 시작일, 종료일
				url: '/CollaB/calCardInsert',
				type: 'post',
				data: {
					card_title: $('#card_title').val(),
					list_id: $('#list_id').val(),
					card_start_date: $('#card_start_date').val(),
					card_end_date: $('#card_end_date').val()
				},
				dataType: 'text',
				success: function(data){
					alert('Card registration is complete.');
					$('#addCardModal').modal('hide');
					location.reload();
				},
				error: function(error){
					console.log(error);
				}
			})
		})
		

	</script>
	<script src="resources/js/board/board-header.js"></script>
</body>
</html>