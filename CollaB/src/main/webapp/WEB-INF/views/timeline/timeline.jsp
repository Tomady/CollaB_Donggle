<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

<style>
	.boardColor{width: 3%; height: 50px; margin-left: 5%;}
	.default{margin-right: 6%; height: 50px; margin-left: 5%;}
	.boardColor:hover, .default:hover{cursor: pointer;}
	body{
		background-color: white !important;
	}
    #timeline-wrap{
        width: 100%;
        height: auto;
        display: flex;
    }
    #timeline-list{
        width: 20%;      
    }
    #timeline-list-header{
        padding-top: 16%;
        padding-bottom: 7%;
        color:#6553C1;
        text-align: center;
    }
    #timeline-list-box{
        height: 85%;
        background-color: #ECE9FE;
        border-radius: 20px;
    }
    #timeline-list-body{
        height: 90%;
    } 
    #timeline-list-footer{
        height: 10%;
    }

    /* calendar */
    #calendar {
        width: 80%;
        margin: 40px auto;
    }
    #calendar button{
        background-color: white;
        border: 1px solid #6553C1;
        color: #6553C1;
    }
    .fc-button-group{
        margin-left: 5%;
        background-color: white;
        border: none;
        color: #6553C1;
    }
    .fc-daygrid{
        padding: 5px;
    }

    /* 왼쪽 div*/
    #addBtn{
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
    #addBtn:active, #addBtn:hover{
        background-color: white;
        border: 1px solid #9F90D9;
        border-radius: 5px;
        color: #9F90D9;
        outline: 0;
    }
    button:focus{
      outline: 0;
    }
    .listOfCard{
        padding: 10%;;
    }
    .listOfCard li{
        border-bottom: 1px solid lightgray;
        list-style-type: none;
        cursor: pointer;
        height: 100px;
    }
    #modal{
        position: absolute;
        width: 200px; height: 90px;
        background: white;
        display: none;
        border: 1px solid lightgray;    
        top: 80%; left: 7%;
    }
    #modal li{
        list-style-type: none;
        cursor: pointer; 
    }
    #modal li:hover{
        color:#6553C1;
        font-weight: bold;
    } 
    .icon{
      cursor: pointer;
      float: right;
      margin: 10px;
    }
    #modalOfCard, #modalOfList{
        width: 500px;
        border: 1px solid lightgray;
        border-radius: 0.25rem;
        display: none;
        transform: translate(-50%, -50%);
        top: 50%; left: 60%;
        background-color: white;
        z-index: 1060;
        position: fixed; 
    }
    .alert.alert-primary{
        background-color: #9F90D9;
        color: #F6F6F6;
        font-weight: bold;
        text-align: center;
        font-size: 20px;
    }
    .form-group{
        width: 70%;
        margin: 10px auto;
    }
    #dateWrap{ 
        display: flex;
    }
    #startDate{
        width: 150px;
        margin-right: 50px;
    }
    #dueDate{
        width: 150px;
    }
    .addBtn{
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
    .addBtn:active, .addBtn:hover{
        background-color: white;
        border: 1px solid #9F90D9;
        border-radius: 5px;
        color: #9F90D9;
        outline: 0;
    }
  </style>
  <script type="text/javascript">
  document.addEventListener("DOMContentLoaded", function(){
		let color = "${workspace.board_thema}";
		let name = "${workspace.workspace_title}".substring(0, 1);
		console.log(color);
		console.log(name);
		boardColorFnc(color);
		changeWKIMG(name);
		
		//워크프페이스 프로필이미지
		function changeWKIMG(newWKname){
			let img = document.querySelector(".wkimg");
			if(name == 'a' || name == 'A'){
				img.setAttribute("src","resources/img/a.jpg");
			}else if(name == 'b' || name == 'B'){
				img.setAttribute("src","resources/img/b.jpg");
			}else if(name == 'c' || name == 'C'){
				img.setAttribute("src","resources/img/c.jpg");
			}else if(name == 'd' || name == 'D'){
				img.setAttribute("src","resources/img/d.jpg");
			}else if(name == 'e' || name == 'E'){
				img.setAttribute("src","resources/img/e.jpg");
			}else if(name == 'f' || name == 'F'){
				img.setAttribute("src","resources/img/f.jpg");
			}else if(name == 'g' || name == 'G'){
				img.setAttribute("src","resources/img/g.jpg");
			}else if(name == 'h' || name == 'H'){
				img.setAttribute("src","resources/img/h.jpg");
			}else if(name == 'i' || name == 'I'){
				img.setAttribute("src","resources/img/i.jpg");
			}else if(name == 'j' || name == 'J'){
				img.setAttribute("src","resources/img/j.jpg");
			}else if(name == 'k' || name == 'K'){
				img.setAttribute("src","resources/img/k.jpg");
			}else if(name == 'l' || name == 'L'){
				img.setAttribute("src","resources/img/l.jpg");
			}else if(name == 'm' || name == 'M'){
				img.setAttribute("src","resources/img/m.jpg");
			}else if(name == 'n' || name == 'N'){
				img.setAttribute("src","resources/img/n.jpg");
			}else if(name == 'o' || name == 'O'){
				img.setAttribute("src","resources/img/o.jpg");
			}else if(name == 'p' || name == 'P'){
				img.setAttribute("src","resources/img/p.jpg");
			}else if(name == 'q' || name == 'Q'){
				img.setAttribute("src","resources/img/q.jpg");
			}else if(name == 'r' || name == 'R'){
				img.setAttribute("src","resources/img/r.jpg");
			}else if(name == 's' || name == 'S'){
				img.setAttribute("src","resources/img/s.jpg");
			}else if(name == 't' || name == 'T'){
				img.setAttribute("src","resources/img/t.jpg");
			}else if(name == 'u' || name == 'U'){
				img.setAttribute("src","resources/img/u.jpg");
			}else if(name == 'v' || name == 'V'){
				img.setAttribute("src","resources/img/v.jpg");
			}else if(name == 'w' || name == 'W'){
				img.setAttribute("src","resources/img/w.jpg");
			}else if(name == 'x' || name == 'X'){
				img.setAttribute("src","resources/img/x.jpg");
			}else if(name == 'y' || name == 'Y'){
				img.setAttribute("src","resources/img/y.jpg");
			}else if(name == 'z' || name == 'Z'){
				img.setAttribute("src","resources/img/z.jpg");
			}else if(name == '0'){
				img.setAttribute("src","resources/img/0.jpg");
			}else if(name == '1'){
				img.setAttribute("src","resources/img/1.jpg");
			}else if(name == '2'){
				img.setAttribute("src","resources/img/2.jpg");
			}else if(name == '3'){
				img.setAttribute("src","resources/img/3.jpg");
			}else if(name == '4'){
				img.setAttribute("src","resources/img/4.jpg");
			}else if(name == '5'){
				img.setAttribute("src","resources/img/5.jpg");
			}else if(name == '6'){
				img.setAttribute("src","resources/img/6.jpg");
			}else if(name == '7'){
				img.setAttribute("src","resources/img/7.jpg");
			}else if(name == '8'){
				img.setAttribute("src","resources/img/8.jpg");
			}else if(name == '9'){
				img.setAttribute("src","resources/img/9.jpg");
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
             <button class="btn btn-secondary dropdown-toggle boardheaderbtn" type="button" 
             data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             Switch View
             </button>
             <div class="dropdown-menu">
               <!-- 세션에다 닉네임 저장해주세여....부탁드려보자.... -->
               <div class="dropdown-title">Hi, ${nickname}! 🤗<p>Where are you going ?</p></div>
               <a class="dropdown-item" href="boardDetail?boardID=${boardID}">&nbsp;&nbsp;Board</a>
               <a class="dropdown-item" href="timeline.do?boardID=${boardID}">&nbsp;&nbsp;TimeLine</a>
               <a class="dropdown-item" href="calendar.do?boardID=${boardID}">&nbsp;&nbsp;Calendar</a>
               <a class="dropdown-item" href="dashboard?boardID=${boardID}">&nbsp;&nbsp;DashBoard</a>
               <!--<div class="dropdown-divider"></div> 구분선-->
             </div>
             &nbsp;&nbsp;
             <button id="WsName" class="btn btn-secondary boardheaderbtn" type="button" title="workspace" data-wkId="${workspace.workspace_id}">
               ${workspace.workspace_title}
             </button>
             &nbsp;&nbsp;
             <button id="BorName" class="btn btn-secondary boardheaderbtn" type="button" title="board" data-boardId="${boardID}">
               ${workspace.board_Title}
             </button>
             &nbsp;&nbsp;
             <c:if test="${starYesOrNo > 0}">
             	<button id="addstar" class="btn btn-secondary boardheaderbtn" type="button" data-boardId="${boardID}">
               		<i id="star" class="fas fa-star" style="color:yellow;" data-boardId="${boardID}"></i>
             	</button>
             </c:if>
             <c:if test="${starYesOrNo == 0}">
             	<button id="addstar" class="btn btn-secondary boardheaderbtn" type="button" data-boardId="${boardID}">
               		<i id="star" class="fas fa-star" data-boardId="${boardID}"></i>
             	</button>
             </c:if>
             <div class="ml-1">
               <button class="btn btn-secondary dropdown-toggle boardheaderbtn" 
               type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Thema </button>
               <div class="dropdown-menu dropdown-menu-right " 
               style="overflow: scroll; overflow-x: hidden; height: 300px;">
                 <div class="dropdown-title text-right">What's your favorite color? 🌈</div>
                 <!-- 백그라운드 색깔 종류 리스트 -->
                 <div class="d-flex">
                   <span title="red" class="dropdown-item boardColor" style="background-color: rgb(247, 123, 123);" onclick="changeBoardColor('red')"></span>
                   <span title="orange" class="dropdown-item boardColor" style="background-color: rgb(252, 187, 127);" onclick="changeBoardColor('orange')"></span>
                   <span title="yellow" class="dropdown-item boardColor" style="background-color: rgb(255, 245, 157);" onclick="changeBoardColor('yellow')"></span>
                 </div>
                 <div class="d-flex mt-3">
                   <span title="green" class="dropdown-item boardColor" style="background-color: rgb(86, 161, 111);" onclick="changeBoardColor('green')"></span>
                   <span title="skyblue" class="dropdown-item boardColor" style="background-color: rgb(123, 243, 247);" onclick="changeBoardColor('skyblue')"></span>
                   <span title="blue" class="dropdown-item boardColor" style="background-color: rgb(121, 162, 250);" onclick="changeBoardColor('blue')"></span>
                 </div>
                 <div class="d-flex mt-3">
                   <span title="darkblue" class="dropdown-item boardColor" style="background-color: rgb(123, 125, 247);" onclick="changeBoardColor('darkblue')"></span>
                   <span title="purple" class="dropdown-item boardColor" style="background-color: rgb(171, 127, 252);" onclick="changeBoardColor('purple')"></span>
                   <span title="pink" class="dropdown-item boardColor" style="background-color: rgb(250, 167, 243);" onclick="changeBoardColor('pink')"></span>
                 </div>
                 <div class="d-flex mt-3">
                   <span title="gray" class="dropdown-item boardColor" style="background-color: rgb(184, 184, 184);" onclick="changeBoardColor('gray')"></span>
                   <span title="darkgray" class="dropdown-item boardColor" style="background-color: rgb(116, 115, 115);" onclick="changeBoardColor('darkgray')"></span>
                   <span title="black" class="dropdown-item boardColor" style="background-color: rgb(12, 12, 12);" onclick="changeBoardColor('black')"></span>
                 </div>
                 <div class="d-flex mt-3">
                   <span title="No Thema" class="dropdown-item default" style="background-color: #ECE9FE;" onclick="changeBoardColor('base')"></span>
                 </div>
               </div>
             </div>
             <div class="ml-1 dropdown">
               <button class="btn btn-secondary dropdown-toggle InviteBTN boardheaderbtn fa fa-user-plus" type="button" 
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="showInvite()">
               Invite
               </button>
               <div class="dropdown-menu showInvite" 
               style="overflow: scroll; height: 300px; display:none;">
                 <span class="fa fa-times ml-2 mt-1" title="close" style="cursor:pointer;"
                 onclick="closeInvite()"></span>
                 <div class="dropdown-title">Your Partners 👫</div>
                 <div class="ml-1 mr-1 text-center Invite_selectMember"> <!--선택된 멤버들-->
                 	<c:forEach items="${boardJoinMembers}" var="boardmember">
	                   <span class="btn btn-light mr-1 ml-1 mt-1">${boardmember.name}</span>						                 	
                 	</c:forEach>
                 </div>
                 <div class="dropdown-divider"></div>
                 <div class="dropdown-title">Member List 🙌</div>
                 <div id="Invite_member"> 
                   <c:forEach items="${boardOthers}" var="workspaceMember">
               			<a class="dropdown-item" href="#">
                 		<input type="checkbox" class="Invite_check" onclick="inviteBoard()"
                 		value="${workspaceMember.id}" data-memName="${workspaceMember.name}" 
                 		data-workspaceID="${workspaceID}" data-boardID="${boardID}"> ${workspaceMember.name}(${workspaceMember.email})</a>
                   </c:forEach>
                 </div>
               </div>
             </div>
           </div>
           <div class="btn-group col-rg">
             <button class="btn btn-outline-secondary dropdown-toggle boardheaderFilter" 
             type="button" data-toggle="dropdown" aria-haspopup="true" 
             aria-expanded="false" style="display:none;">Filter </button>
             <div class="dropdown-menu dropdown-menu-right filtermenu" style="overflow: scroll; height: 300px;">
               <div class="dropdown-title Members">Your Partners 👫</div>
               <c:forEach items="${boardJoinMembers}" var="boardmember">
                 <a class="dropdown-item" href="#">
                 	<input type="checkbox" name="filterMember" data-memid="${boardmember.id}"
                 	onclick="filterApply()"> ${boardmember.id}(${boardmember.name})
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
                                <li>list 1</li>
                                <li>list 2</li>
                                <li>list 3</li>
                                <li>list 4</li>
                                <li>list 5</li>
                            </ul>
                        </div>
                        <div id="timeline-list-footer">
                            <div class="modal" id="modal">
                              <div style="margin-bottom: 20px;"><ion-icon name="close-outline" class="icon" id="close1"></ion-icon></div>
                              <ul>
                                <li id="card">Card</li>
                                <li id="list">List</li>
                              </ul>
                            </div>

                            <button type="button" id="addBtn" >＋Add</button>
                        </div>
                    </div> <!-- end of timeline-list-box-->
                    
                </div> <!-- end of timeline-list-->

                
                <div id='calendar'></div>
                
            </div>

          </section>
          
        </div>

      </div>
      <!-- 카드, 리스트 추가 모달-->
      <div id="modalOfCard">
        <div style="margin-bottom: 20px;"><ion-icon name="close-outline" class="icon" id="close2"></ion-icon></div>
        <div class="form-group">
            <label>Title</label>
            <input type="text" class="form-control">
        </div>
        <div class="form-group">
            <label>Select</label>
            <select class="form-control">
              <option>Option 1</option>
              <option>Option 2</option>
              <option>Option 3</option>
            </select>
        </div>
        <div class="form-group" id="dateWrap">
            <div id="startDate">
                <label>Start date</label>
                <input type="date" class="form-control">
            </div>
            <div id="dueDate">
                <label>Due date</label>
                <input type="date" class="form-control">
            </div>
        </div> <!-- end of dateWrap -->
        <br>
        <div class="form-group">
            <button type="button" class="addBtn" id="addCard">Add Card </button>
        </div>
        <br>
      </div> <!--end of 카드모달모달-->

      <div id="modalOfList">
        <div style="margin-bottom: 20px;"><ion-icon name="close-outline" class="icon" id="close3"></ion-icon></div>
        <div class="form-group">
            <label>Title</label>
            <input type="text" class="form-control">
        </div>
        
        <br>
        <div class="form-group">
            <button type="button" class="addBtn" id="addList">Add List </button>
        </div>
        <br>
      </div> <!--end of 리스트모달모달-->
      
    </div>
    
    
<!-- Fullcalendar-->
    <link href='../sources/fullcalendar/main.css' rel='stylesheet' />
    <script src='../sources/fullcalendar/main.js'></script>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
      
        var calendar = new FullCalendar.Calendar(calendarEl, {
          timeZone: 'local',
          initialView: 'dayGridWeek',
          headerToolbar: {
              left: 'today,prev,next',
              center: '',
              right: ''
          },
         
          locale: "ko",
          editable: true,
          events: 'https://fullcalendar.io/api/demo-feeds/events.json'
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
  

      </script>
      <script src="resources/js/board/board-header.js"></script>
</body>
</html>