<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="co.Donggle.CollaB.calendar.service.calendarVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="co.Donggle.CollaB.calendar.service.calendarVO"%>
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
</style>

</head>
<body>
	<!-- Main Content -->
	<div class="main-content">
		<section class="section">
			<!-- 보드헤더 -->
			<div class="section-header d-flex justify-content-between">
				<div class="btn-group">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
						style="background-color: #6553C1;">Switch View</button>
					<div class="dropdown-menu">
						<div class="dropdown-title">
							Hi, [Nickname] ! 🤗
							<p>Where are you going ?</p>
						</div>
						<a class="dropdown-item" href="#">&nbsp;&nbsp;TimeLine</a> <a
							class="dropdown-item" href="#">&nbsp;&nbsp;Calendar</a> <a
							class="dropdown-item" href="#">&nbsp;&nbsp;DashBoard</a>
						<!--<div class="dropdown-divider"></div> 구분선-->
					</div>
					&nbsp;&nbsp;
					<button id="WsName" class="btn btn-secondary" type="button"
						style="background-color: #6553C1;">Workspace Name</button>
					&nbsp;&nbsp;
					<button id="BorName" class="btn btn-secondary" type="button"
						style="background-color: #6553C1;">Board Name</button>
					&nbsp;&nbsp;
					<button id="addstar" class="btn btn-secondary" type="button"
						style="background-color: #6553C1;">
						<i id="star" class="fas fa-star"></i>
					</button>
					<div class="ml-1">
						<button class="btn btn-secondary dropdown-toggle" type="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
							style="background-color: #6553C1;">Thema</button>
						<div class="dropdown-menu dropdown-menu-right "
							style="overflow: scroll; overflow-x: hidden; height: 300px;">
							<div class="dropdown-title text-right">What's your favorite
								color? 🌈</div>
							<!-- 백그라운드 색깔 종류 리스트 -->
							<div class="d-flex">
								<span class="dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(247, 123, 123); margin-left: 5%;"></span>
								<span class="dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(252, 187, 127); margin-left: 5%;"></span>
								<span class="dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(255, 245, 157); margin-left: 5%;"></span>
							</div>
							<div class="d-flex mt-3">
								<span class="dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(159, 255, 130); margin-left: 5%;"></span>
								<span class="dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(128, 253, 170); margin-left: 5%;"></span>
								<span class="dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(216, 247, 131); margin-left: 5%;"></span>
							</div>
							<div class="d-flex mt-3">
								<span class="dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(123, 243, 247); margin-left: 5%;"></span>
								<span class="dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(121, 199, 250); margin-left: 5%;"></span>
								<span class="dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(121, 162, 250); margin-left: 5%;"></span>
							</div>
							<div class="d-flex mt-3">
								<span class="dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(123, 125, 247); margin-left: 5%;"></span>
								<span class="dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(228, 151, 252); margin-left: 5%;"></span>
								<span class="dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(171, 127, 252); margin-left: 5%;"></span>
							</div>
							<div class="d-flex mt-3">
								<span class="dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(184, 184, 184); margin-left: 5%;"></span>
								<span class="dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(116, 115, 115); margin-left: 5%;"></span>
								<span class="dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(12, 12, 12); margin-left: 5%;"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="btn-group col-rg">
					<button class="btn btn-outline-secondary dropdown-toggle"
						type="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"
						style="color: #6553C1; border: 1px solid #6553C1;">Filter
					</button>
					<div class="dropdown-menu dropdown-menu-right"
						style="overflow: scroll; overflow-x: hidden; height: 300px;">
						<div class="dropdown-title text-right">Your Partner 🙌</div>
						<a class="dropdown-item" href="#"><input type="checkbox">&nbsp;&nbsp;eunji_97@abc.com</a>
						<a class="dropdown-item" href="#"><input type="checkbox">&nbsp;&nbsp;eunji_97@abc.com</a>
						<a class="dropdown-item" href="#"><input type="checkbox">&nbsp;&nbsp;eunji_97@abc.com</a>
						<a class="dropdown-item" href="#"><input type="checkbox">&nbsp;&nbsp;eunji_97@abc.com</a>
						<a class="dropdown-item" href="#"><input type="checkbox">&nbsp;&nbsp;eunji_97@abc.com</a>
						<a class="dropdown-item" href="#"><input type="checkbox">&nbsp;&nbsp;eunji_97@abc.com</a>
						<a class="dropdown-item" href="#"><input type="checkbox">&nbsp;&nbsp;eunji_97@abc.com</a>
						<a class="dropdown-item" href="#"><input type="checkbox">&nbsp;&nbsp;eunji_97@abc.com</a>
						<a class="dropdown-item" href="#"><input type="checkbox">&nbsp;&nbsp;eunji_97@abc.com</a>
						<a class="dropdown-item" href="#"><input type="checkbox">&nbsp;&nbsp;eunji_97@abc.com</a>
						<!--<div class="dropdown-divider"></div> 구분선-->
					</div>
				</div>
				<!-- 보드헤더 끝 -->
			</div>
			<!-- 보드바디 -->
			<div id="boardDetailBODY" class="section-body">
				<div class="card">
					<div class="card-header">
						<h4>Calendar</h4>
					</div>
					<div class="card-body">
						<div id='calendar'></div>
						<!-- Button trigger modal -->
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

	<!-- 카드 추가 모달 -->
	<div class="modal fade show" id="addCardModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Card</h5>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>Title</label> <input type="text" class="form-control">
					</div>
					<div class="form-group">
						<label>List</label> <select class="form-control">

							<!-- <c:forEach var="list" items="${List}" varStatus="status">
                        <option value="${list.id}">${list.title}</option>
                      <c:forEach> -->

							<option>리스트1</option>
							<option>리스트2</option>
							<option>리스트3</option>
						</select>
					</div>
					<div class="form-group">
						<label>Start Date</label> <input type="date" class="form-control">
					</div>
					<div class="form-group">
						<label>Due Date</label> <input type="date" class="form-control">
					</div>
				</div>
				<div class="modal-footer text-right">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" id="closeAddCard">Close</button>
					<button type="button" class="btn btn-primary">Save</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 리스트 추가 모달 -->
	<div class="modal fade" id="addListModal" tabindex="-1"
		aria-labelledby="listModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Add List</h5>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>Title</label> <input type="text" class="form-control">
					</div>
				</div>
				<div class="modal-footer text-right">
					<button type="button" class="btn btn-secondary" id="closeAddList">Close</button>
					<button type="button" class="btn btn-primary">Save</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 리스트 추가 모달 끝 -->
	</section>
	</div>

	<script>

    // 풀캘린더 일정 DB 연동
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth',
			nowIndicator: true,
			headerToolbar : {
	        	left: 'prev,next today',
	            center : 'title',
	            end : 'dayGridMonth,dayGridWeek,dayGridDay'
	            },
	        navLinks: true, // can click day/week names to navigate views
	        editable: true,
	        selectable: true,
	        selectMirror: true,
	        eventResize : function(info){
	        	updateDate(info);
	        },
	        eventDrop: function(info){
	        	updateDate(info);	
	        },
	        dayMaxEvents: true, // allow "more" link when too many events
			events : [ 
	    	    <%List<calendarVO> calendarList = (List<calendarVO>) request.getAttribute("calendarList");%>
	            <%if (calendarList != null) {%>
	            <%for (calendarVO vo : calendarList) {%>
	            {
	            	title : '<%=vo.getCard_title()%>',
	                start : '<%=vo.getCard_start_date()%>',
	                end : '<%=vo.getCard_end_date()%>',
	             },
			<%}
		}%>
					]
					
				});
				calendar.render();
			});


      // 날짜 변경
      function updateDate(info) {
    	  
    	  var data = {
    			  card_start_date: info.event.start,
    			  card_end_date: info.event.end
    	  }
    	  console.log(data);
    	  
    	  $.ajax({
    		  url : '/CollaB/dateUpdate.do',
    		  headers: {'Content-Type': 'application/json'},
    		  type : 'POST',
    		  data : JSON.stringify(data),
    		  dataType : 'text',
    		  success : function(data) {
    			  console.log(data);
    			  alert("일정변경을 성공했습니다.");
    		  },
    		  error : function(request, status, error) {
    			  alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
    		  }
    	  });
      }
      
      
	  // 모달
	  $('#addListBtn').on('click', function(){
	    $('#addListModal').modal('show');
	  })
	
	  $('#closeAddList').on('click', function(){
	    $('#addListModal').modal('hide');
	  })
	
	  const cardModal = document.getElementById("addCardModal")
	  const btnModal = document.getElementById("addCardBtn")
	  btnModal.addEventListener("click", e => {
	      addCardModal.style.display = "flex"
	  })
	
	  const closeBtn = modal.querySelector("#closeAddCard")
	  closeBtn.addEventListener("click", e => {
	      addCardModal.style.display = "none"
	  })
	
	  modal.addEventListener("click", e => {
	    const evTarget = e.target
	    if(evTarget.classList.contains("modal")) {
	        addCardModal.style.display = "none"
	    }
	  })
	
	  </script>
</body>
</html>