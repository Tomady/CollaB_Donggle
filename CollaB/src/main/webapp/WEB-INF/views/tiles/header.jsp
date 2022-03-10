<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /*2.메인헤더배경색*/
    .mainheaderBackground{background-color: #9F90D9;}
    /*3.페이지바디배경색*/
    .pagebodybackground{background-color: #ECE9FE; overflow: scroll;}
    #create_board{
      display: none;
      width: 30%;
      height: 70%;
      padding: 20px 60px;
      background-color: #fefefe;
      border: 1px solid #888;
      border-radius: 4px;
    }
    #create_wk{
      display: none;
      width: 30%;
      height: 40%;
      padding: 20px 60px;
      background-color: #fefefe;
      border: 1px solid #888;
      border-radius: 4px;
    }
    #create_board .modal_close_btn {
        position: absolute;
        top: 10px;
        right: 10px;
    }
    #create_wk .modal_close_btn {
        position: absolute;
        top: 10px;
        right: 10px;
    }
    #modal-header{
      display: table-cell;
      vertical-align: middle;
      text-align: center;
    }
    #createboardBtn,#createWK{
      width: 100%;
    }
    .dropdown-item{
      cursor: pointer;
    }
    .modal_close_btn:hover{
    cursor: pointer;
    }
    #bkcolor:hover{
    cursor: pointer;
    }    
  </style>
</head>
<body class="pagebodybackground">
	<div id="app">
    <div class="main-wrapper">
      <div class="navbar-bg mainheaderBackground"  style="background-color: rgb(199, 174, 247);"></div>
      <!-- Main Header -->
      <nav class="navbar navbar-expand-lg main-navbar d-flex justify-content-between">
        <form class="form-inline mr-auto">
          <ul class="navbar-nav mr-3">
            <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="fas fa-bars"></i></a></li>
            <li><a href="#" data-toggle="search" class="nav-link nav-link-lg d-sm-none"><i class="fas fa-search"></i></a></li>
          </ul>
        </form>
        <div class="col-lg d-flex justify-content">
          <div class="btn-group">
            <button class="btn dropdown-toggle" type="button" style="background-color:transparent; color:white;"
            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Workspace</button>
            <div class="dropdown-menu" style="height: 300px; overflow:scroll; overflow-x:hidden;">
              <div class="dropdown-title">Your <p>Workspace 🎨</p></div>
              <!--사용자 워크스페이스 목록 뿌릴 때, id="mainHeadWork"+workspace.ID 지정해주기-->
              <c:forEach items="${workspaceList}" var="workspace">
              	<a class="dropdown-item" id="mainHeadWork${workspace.workspace_id}" 
	              onclick="location.href='Boards?wkid=${workspace.workspace_id}'">${workspace.workspace_title}</a>  
              </c:forEach>
            </div>
          </div>
          <div class="btn-group">
            <button class="btn dropdown-toggle" type="button" style="background-color:transparent; color:white;"
            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Recent</button>
            <div class="dropdown-menu">
              <div class="dropdown-title">History 🎡</div>
        	  <c:forEach items="${recent }" var="recent">
              	<a class="dropdown-item" onclick="location.href='boardDetail?boardID=${recent.board_id}'">${recent.board_title }</a>
        	  </c:forEach>
            </div>
          </div>
          <div class="btn-group">
            <button class="btn dropdown-toggle" type="button" style="background-color:transparent; color:white;"
            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Create</button>
            <div class="dropdown-menu">
              <div class="dropdown-title">What do you want<p>to make? 🛠</p></div>
              <a class="dropdown-item" onclick="create_workspaceModal()">CREATE WORKSPACE</a>
              <a class="dropdown-item" onclick="create_boardModal()">CREATE BOARD</a>
            </div>
          </div>
        </div>
        
        <ul class="navbar-nav navbar-right">
          <li class="dropdown"><a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
            <img alt="image" src="resources/assets/img/avatar/avatar-1.png" class="rounded-circle mr-1">
            <div class="d-sm-none d-lg-inline-block">Hi, Circle</div></a>
            <div class="dropdown-menu dropdown-menu-right">
              <!--소연걸 : 마이페이지 메인 으로 주소걸어주기-->
              <a class="dropdown-item has-icon" href="/CollaB/myPageMain">
                <i class="far fa-user"></i> Mypage
              </a>
              <div class="dropdown-divider"></div>
              <!--로그아웃처리 : 세션값삭제-->
              <a class="dropdown-item has-icon text-danger" href="logout.do">
                <i class="fas fa-sign-out-alt"></i> Logout
              </a>
            </div>
          </li>
        </ul>
      </nav>

      <!-- create workspace 모달창 -->
      <div id="create_wk">
        <div class="card" >
          <div id="modal-header" class="card-header">
            <h4>Create workspace</h4>
          </div>
          <div class="card-body">
            <div class="row form-group mt-3">
              <label>Workspace Name<span style="color: red;"> *</span></label>
              <input id="modal-workspace-title" type="text" class="form-control">
            </div>
            <div class="row buttons mt-3">
              <button class="mt-5 btn btn-icon icon-left btn-secondary" id="createWK"
              onclick="createWK()">Create</button>
            </div>
          </div>
        </div>
        <a class="modal_close_btn" onclick="closeWKModal()">
          <i class="fa fa-times" aria-hidden="true"></i>
        </a>
      </div>
      <!-- 워크스페이스생성 모달창 of end -->

    <!-- create board 모달창 -->
  <div id="create_board">
    <div class="card" >
      <div id="modal-header" class="card-header">
        <h4>Create board</h4>
      </div>
      <div class="card-body">
        <div class="row form-group mt-3">
          <label>Background</label>
          <div id="bkcolor" class="row ml-4 mt-2 mb-2">
            <div class="d-flex">
              <span id="red" class="bkcolor dropdown-item" style="width: 3%; height: 50px; background-color: rgb(247, 123, 123); margin-left: 5%;"></span>
              <span id="orange" class="bkcolor dropdown-item" style="width: 3%; height: 50px; background-color: rgb(252, 187, 127); margin-left: 5%;"></span>
              <span id="yellow" class="bkcolor dropdown-item" style="width: 3%; height: 50px; background-color: rgb(255, 245, 157); margin-left: 5%;"></span>
              <span id="green" class="bkcolor dropdown-item" style="width: 3%; height: 50px; background-color: rgb(86, 161, 111); margin-left: 5%;"></span>
              <span id="skyblue" class="bkcolor dropdown-item" style="width: 3%; height: 50px; background-color: rgb(123, 243, 247); margin-left: 5%;"></span>
              <span id="blue" class="bkcolor dropdown-item" style="width: 3%; height: 50px; background-color: rgb(121, 162, 250); margin-left: 5%;"></span>
            </div>
            <div class="d-flex mt-3">
              <span id="darkblue" class="bkcolor dropdown-item" style="width: 3%; height: 50px; background-color: rgb(123, 125, 247); margin-left: 5%;"></span>
              <span id="purple" class="bkcolor dropdown-item" style="width: 3%; height: 50px; background-color: rgb(171, 127, 252); margin-left: 5%;"></span>
              <span id="pink" class="bkcolor dropdown-item" style="width: 3%; height: 50px; background-color: rgb(250, 167, 243); margin-left: 5%;"></span>
              <span id="gray" class="bkcolor dropdown-item" style="width: 3%; height: 50px; background-color: rgb(184, 184, 184); margin-left: 5%;"></span>
              <span id="darkgray" class="bkcolor dropdown-item" style="width: 3%; height: 50px; background-color: rgb(116, 115, 115); margin-left: 5%;"></span>
              <span id="black" class="bkcolor dropdown-item" style="width: 3%; height: 50px; background-color: rgb(12, 12, 12); margin-left: 5%;"></span>
            </div>
          </div>
          <input id="modal-board-background" type="text" class="form-control" readonly>
        </div>
        <div class="row form-group mt-3">
          <label>Board Title<span style="color: red;"> *</span></label>
          <input id="modal-board-title" type="text" class="form-control">
        </div>
        <div class="row form-group mt-3">
          <label>Workspace</label>
          <select class="form-control" id="select-workspace">
	          <c:forEach items="${workspaceList}" var="workspace">
	          	<option value="${workspace.workspace_id}">${workspace.workspace_title}</option>
	          </c:forEach>
          </select>
        </div>
        <div class="row buttons mt-3">
          <button class="mt-5 btn btn-icon icon-left btn-secondary" id="createboardBtn"
          onclick="createBoard()">Create</button>
        </div>
      </div>
    </div>
    <a class="modal_close_btn" onclick="closeModal()">
      <i class="fa fa-times" aria-hidden="true"></i>
    </a>
  </div>
  <!-- 보드생성 모달창 of end -->
    </div>
  </div>
</body>
</html>