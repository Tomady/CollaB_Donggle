<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .boardColor{width: 3%; height: 50px; margin-left: 5%;}
   .default{margin-right: 6%; height: 50px; margin-left: 5%;}
   .boardColor:hover, .default:hover{cursor: pointer;}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(){
	let color = "${workspace.board_thema}";
	let name = "${workspace.workspace_title}".substring(0, 1);
	boardColorFnc(color);
	changeWKIMG(name);
	
	//워크t스페이스 프로필이미지
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
<div id="app">
    <div class="main-wrapper">
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <!-- Board Header -->
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
            <div class="btn-group col-rg" style="display: none;">
              <button class="btn btn-outline-secondary dropdown-toggle boardheaderFilter" 
              type="button" data-toggle="dropdown" aria-haspopup="true" 
              aria-expanded="false">Filter </button>
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
          <div id="boardDetailBODY" class="row-1">
            <div class="card">
              <div class="card-header">
                <h4>DashBoard</h4>
              </div>
              <div class="card-body" style="height: 110vh;">
                <!--보드 기본정보-->
                <h5 class="mt-3 ml-2 mb-4">Info</h5>
                <table class="table mb-5">
                  <tbody>
                    <tr>
                      <th style="background-color: rgb(248, 248, 248);">Workspace Name</th>
                      <td>${workspace.workspace_title}</td>
                      <th style="background-color: rgb(248, 248, 248);">Board Name</th>
                      <td>${workspace.board_Title}</td>
                    </tr>
                    <tr>
                      <th style="background-color: rgb(248, 248, 248);">Members</th>
                      <td>${boardMemberCnt}</td>
                      <th style="background-color: rgb(248, 248, 248);">Project State</th>
                      <td>
                      	<div id="project_state" style="background-color: #dee2e6; 
                      	border-radius:50%; width:35px; height: 35px;"></div>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <hr>
                <h5 class="mt-5 ml-2 mb-2">delayed works</h5>
                <div class="d-flex justify-content-between">
                  <div class="mt-5 text-center" style="width: 550px; height: 550px;">
                    <h5 class="mb-3">The Overall Progress</h5>
                    <canvas id="stateChart"></canvas>
                  </div>
                  <hr>
                  <!--진행상황 상세 : 카드별로-->
                  <div class="card" style="height: 630px; overflow: scroll; overflow-x: hidden;">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>Card Name</th>
                          <th>State</th>
                          <th>Label</th>
                          <th>Manager</th>
                          <th>Start Date</th>
                          <th>Due Date</th>
                          <th>Progress</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>카드이름</td>
                          <td>진행/완료</td>
                          <td>
                            <div style="background-color: rgb(248, 59, 59); 
                            width: 50px; height: 15px; border-radius: 10px;"></div>
                          </td>
                          <td>매니저</td>
                          <td>2022/03/09</td>
                          <td>2022/03/12</td>
                          <td>
                            <div style="background-color: rgb(221, 221, 221); width: 200px; height: 30px;">
                              <div style="background-color: rgb(255, 90, 40); height: 30px; width: 100px;"></div>
                            </div>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
  </div>
  <script>
	let itemTotalCnt = parseInt("${itemsCnt}"); //전체 아이템 개수
	let yesItem = parseInt("${YesItemCnt}"); //상태가 yes인 아이템 개수
	let noItem =  itemTotalCnt-yesItem//상태가 no인 아이템 개수
	let nodata = 0;
	if(itemTotalCnt==0){
		nodata=100;
	}
	let state = Math.ceil(yesItem/itemTotalCnt*100); //현재 진척도
	
	if(state < 25){
		project_state.style.backgroundColor="red";
	}else if(state < 50){
		project_state.style.backgroundColor="orange";
	}else if(state < 75){
		project_state.style.backgroundColor="rgb(2, 192, 18)";
	}else if(state <= 100){
		project_state.style.backgroundColor="rgb(95, 218, 255)";
	}
	
	
    new Chart(document.getElementById("stateChart"), {
    type: 'pie',
    data: {
      labels: ["Done","Remaining Work","No Work"],
      datasets: [{
        label: "Population (millions)",
        backgroundColor: ["rgb(102, 250, 110)","rgb(255, 131, 131)","#dee2e6"],
        data: [yesItem,noItem,nodata]
      }]
    },
       options: {
        title: {
        display: false,
        text: 'The overall progress'
        }
      }
    });
  </script>
  
<!-- 은지 코드 -->
<script src="resources/js/board/board-header.js"></script>
</body>
</html>