<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
<title>Insert title here</title>
<!-- General CSS Files -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">

<!-- Template CSS -->
<link rel="stylesheet" href="resources/assets/css/style.css">
<link rel="stylesheet" href="resources/assets/css/components.css">
<style type="text/css">
	.mainheaderBackground{background-color: rgb(199, 174, 247);}
	#Workspace_create:hover{cursor: pointer; color: red; text-decoration: underline;}
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
    .dropdown-item, .workspace, .board{
      cursor: pointer;
    }
    .modal_close_btn:hover{
    cursor: pointer;
    }
    #bkcolor:hover{
    cursor: pointer;
    }
    
    /*워크스페이스 삭제 모달*/
     #del_workspace {
   	  display: none;
      width: 450px;
      padding: 20px 60px;
      background-color: #fefefe;
      border: 1px solid #888;
      border-radius: 3px;
    }
    #del_workspace .del_workspace_close_btn {
        position: absolute;
        top: 10px;
        right: 10px;
    }
    
</style>
</head>
<body class="sidebar-mini mr-5">
<div id="app">

  <!-- 워크스페이스 삭제 모달창 -->
  <div id="del_workspace" class="card">
      <a class="del_workspace_close_btn fa fa-times" style="cursor:pointer;" onclick="closeDelWorkspace()"></a>
      <div class="mb-4 text-center">
    	<label class="mb-3" style="font-weight:bold; font-size:30px;">All the Workspaces</label>
    	<label style="color:tomato;">Please select the workspace you want to delete.</label>
   	    <div class="card" style="height:300px; overflow:scroll; overflow-x:hidden;">
    	   		<button class="btn btn-light mt-2 mb-2 ml-2" style="width:95%"
    	   		onclick="del_SelectedWorkspace()">워크스페이스이름</button>
   	    </div>
   	    <hr>
   	    <div class="card" id="deleteTargetWorkspace">
   	    	<!-- 삭제할 워크스페이스 여기 오도록 -->
   	    </div>
   	    <label style="color:tomato;">Deleted data can never be recovered.</label>
   	    <label style="color:tomato;">Do you want to proceed?</label>
   	    <div>
   	    	<button id="proceedWorkspaceDelete" class="btn btn-danger mt-2 mb-2" style="width:90%">PROCEED</button>
   	    </div>
      </div>
   </div>

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
	          <c:forEach items="${workspaces}" var="workspace">
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
      
  <div class="main-wrapper">
    <div class="navbar-bg mainheaderBackground"></div>
    <!-- Main Header -->
    <nav class="navbar navbar-expand-lg main-navbar d-flex justify-content-between">
      <div class="col-lg d-flex justify-content">
        <div class="btn-group">
          <button class="btn dropdown-toggle" type="button" style="background-color:transparent; color:white;"
          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Workspaces</button>
          <div class="dropdown-menu" style="height: 300px; overflow:scroll; overflow-x:hidden;">
            <div class="dropdown-title">Your Workspace 🎨</div>
            <!--사용자 워크스페이스 목록 뿌릴 때, id="mainHeadWork"+workspace.ID 지정해주기-->
            <c:forEach items="${workspaces}" var="workspace">
            	<a class="dropdown-item" 
            	onclick="location.href='Boards?wkid=${workspace.workspace_id}'">${workspace.workspace_title}</a>            
            </c:forEach>
          </div>
        </div>
        <div class="btn-group">
          <button class="btn dropdown-toggle" type="button" style="background-color:transparent; color:white;"
          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Recent</button>
          <div class="dropdown-menu">
            <div class="dropdown-title">History 🎡</div>
            <a class="dropdown-item" href="#">board_2</a>
            <a class="dropdown-item" href="#">board_1</a>
            <a class="dropdown-item" href="#">board_4</a>
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
      <ul class="navbar-nav navbar-right mr-5">
        <li class="dropdown"><a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
          <img alt="image" src="resources/assets/img/avatar/avatar-1.png" class="rounded-circle mr-1">
          <div class="d-sm-none d-lg-inline-block">Hi, Circle</div></a>
          <div class="dropdown-menu dropdown-menu-right">
            <!--소연걸 : 마이페이지 메인 으로 주소걸어주기-->
            <a class="dropdown-item has-icon" onclick="mainHead_gotoMypage()">
              <i class="far fa-user"></i> Mypage
            </a>
            <div class="dropdown-divider"></div>
            <!--로그아웃처리 : 세션값삭제-->
            <a class="dropdown-item has-icon text-danger" onclick="mainHead_logout()">
              <i class="fas fa-sign-out-alt"></i> Logout
            </a>
          </div>
        </li>
      </ul>
    </nav>
    
    <!-- Main Content -->
    <div class="main-content" >
      <!-- 보드바디 -->
      <div class="section-body">
        <div class="row">
          <div class="col-12 col-md-6 col-lg-12">
            <div class="card">
              <div class="card-body ml-5 mr-5" style="height: 500vh;" >
                <!-- 검색창 -->
                <div class="row d-flex justify-content-end mr-5 ml-5">
                  <div class="col-lg ml-5 mt-5">
                  	<button class="btn btn-danger" onclick="deleteWorkspace('del_workspace')">DELETE WORKSPACE</button>
                  </div>
                  <form action="#">
                    <div class="d-flex mr-5 mt-5 mb-5">
                      <input id="searchWKNAME" type="search" class="form-control" placeholder="Search Workspace">
                        <button class="btn btn-primary btn-icon" type="button" onclick="searchWorkspace()">
                          <i class="fas fa-search"></i>
                        </button>
                    </div>
                  </form>
                </div>
                <!--워크스페이스 목록-->
                <div class="ml-5 mr-5">
                  <div class="col-12 col-md-6 col-lg-3 mb-5 ml-5">
                    <h4>Your workspaces</h4>
                  </div>
                  <!--여기서부터-->
                  <c:forEach items="${workspaces}" var="workspace">
                  	<div class="ml-5 mr-5 mt-5 mb-5 workspace" style="position: relative;" data-name="${workspace.workspace_title}">
	            	<div class="row ml-5 mr-5">
						<div class="col-lg-5 d-flex justify-content-between" style="background-color:rgb(251, 251, 255);">
							<!-- 워크스페이스 하나 클릭시 boards페이지로 이동 -->
							<div class="btn" style="width:90%; background-color:rgb(251, 251, 255);"
							onclick="location.href='Boards?wkid=${workspace.workspace_id}'">
							<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
								style="text-align: right; display: table-cell;">
								<span class="ml-4 mt-1" style="font-weight: bold;">${workspace.workspace_title}</span>
							</div>
							<div class="row card-header"></div>
							</div>
							<!-- 워크스페이스 탈퇴버튼 -->
							<div class="fa fa-times mt-3" onclick="workspaceJoinDelete(${workspace.workspace_id})"></div>
						</div>
						<!-- 해당 워크스페이스의 보드목록 출력버튼-->
                    	<button class="btn mt-5 ml-2 fa fa-chevron-down" onclick="showBoards()">&nbsp;&nbsp;Boards</button>
                    </div>
                    <!-- Boards클릭시 해당 워크스페이스의 보드목록 출력됨 -->
                    <div class="boardList" style="display: none;">
                      <div class="ml-5 mr-5" style="position: relative; background-color: rgb(251, 251, 255);">
                        <div class="row mr-5 ml-5">
              			<!--여기서부터-->
						<c:forEach items="${boards}" var="board">
							<!-- 해당워크스페이스의 보드인지 확인 -->
							<c:if test="${workspace.workspace_id eq board.workspace_id}">
								<!-- 보드색깔지정 : 색깔없음 -->
								<c:if test="${board.board_thema == ''}">
									<div class="col-12 col-md-6 col-lg-3 mt-4">
										<div class="card board" style="background-color:rgb(245,245,245);"
										onclick="location.href='boardDetail?boardID=${board.board_id}'">
											<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
											style="text-align: right; display: table-cell;">
												<span class="ml-4" style="font-weight: bold;
												 color:rgb(245,245,245);">${board.board_Title}</span>
											</div>
											<div class="row card-header"></div>
										</div>
									</div>
								</c:if>
								<!-- 보드색깔지정 : red -->
								<c:if test="${board.board_thema == 'red'}">
									<div class="col-12 col-md-6 col-lg-3 mt-4">
										<div class="card board" style="background-color:rgb(247, 123, 123);"
										onclick="location.href='boardDetail?boardID=${board.board_id}'">
											<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
											style="text-align: right; display: table-cell;">
												<span class="ml-4" style="font-weight: bold;
												 color:white;">${board.board_Title}</span>
											</div>
											<div class="row card-header"></div>
										</div>
									</div>
								</c:if>
								<!-- 보드색깔지정 : orange -->
								<c:if test="${board.board_thema == 'orange'}">
									<div class="col-12 col-md-6 col-lg-3 mt-4">
										<div class="card board" style="background-color:rgb(252, 187, 127);"
										onclick="location.href='boardDetail?boardID=${board.board_id}'">
											<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
											style="text-align: right; display: table-cell;">
												<span class="ml-4" style="font-weight: bold;
												color:white;">${board.board_Title}</span>
											</div>
											<div class="row card-header"></div>
										</div>
									</div>
								</c:if>
								<!-- 보드색깔지정 : yellow -->
								<c:if test="${board.board_thema == 'yellow'}">
									<div class="col-12 col-md-6 col-lg-3 mt-4">
										<div class="card board" style="background-color:rgb(255, 245, 157);"
										onclick="location.href='boardDetail?boardID=${board.board_id}'">
											<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
											style="text-align: right; display: table-cell;">
												<span class="ml-4" style="font-weight: bold;
												color:rgb(247, 123, 123);">${board.board_Title}</span>
											</div>
											<div class="row card-header"></div>
										</div>
									</div>
								</c:if>
								<!-- 보드색깔지정 : green -->
								<c:if test="${board.board_thema == 'green'}">
									<div class="col-12 col-md-6 col-lg-3 mt-4">
										<div class="card board" style="background-color:rgb(86, 161, 111);"
										onclick="location.href='boardDetail?boardID=${board.board_id}'">
											<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
											style="text-align: right; display: table-cell;">
												<span class="ml-4" style="font-weight: bold;
												color:white;">${board.board_Title}</span>
											</div>
											<div class="row card-header"></div>
										</div>
									</div>
								</c:if>
								<!-- 보드색깔지정 : skyblue -->
								<c:if test="${board.board_thema == 'skyblue'}">
									<div class="col-12 col-md-6 col-lg-3 mt-4">
										<div class="card board" style="background-color:rgb(123, 243, 247);"
										onclick="location.href='boardDetail?boardID=${board.board_id}'">
											<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
											style="text-align: right; display: table-cell;">
												<span class="ml-4" style="font-weight: bold;
												color:white;">${board.board_Title}</span>
											</div>
											<div class="row card-header"></div>
										</div>
									</div>
								</c:if>
								<!-- 보드색깔지정 : blue -->
								<c:if test="${board.board_thema == 'blue'}">
									<div class="col-12 col-md-6 col-lg-3 mt-4">
										<div class="card board" style="background-color:rgb(121, 162, 250);"
										onclick="location.href='boardDetail?boardID=${board.board_id}'">
											<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
											style="text-align: right; display: table-cell;">
												<span class="ml-4" style="font-weight: bold;
												color:rgb(123, 243, 247);">${board.board_Title}</span>
											</div>
											<div class="row card-header"></div>
										</div>
									</div>
								</c:if>
								<!-- 보드색깔지정 : darkblue -->
								<c:if test="${board.board_thema == 'darkblue'}">
									<div class="col-12 col-md-6 col-lg-3 mt-4">
										<div class="card board" style="background-color:rgb(123, 125, 247);"
										onclick="location.href='boardDetail?boardID=${board.board_id}'">
											<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
											style="text-align: right; display: table-cell;">
												<span class="ml-4" style="font-weight: bold;
												color:rgb(255, 245, 157);">${board.board_Title}</span>
											</div>
											<div class="row card-header"></div>
										</div>
									</div>
								</c:if>
								<!-- 보드색깔지정 : purple -->
								<c:if test="${board.board_thema == 'purple'}">
									<div class="col-12 col-md-6 col-lg-3 mt-4">
										<div class="card board" style="background-color:rgb(171, 127, 252);"
										onclick="location.href='boardDetail?boardID=${board.board_id}'">
											<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
											style="text-align: right; display: table-cell;">
												<span class="ml-4" style="font-weight: bold;
												color:rgb(250, 167, 243);">${board.board_Title}</span>
											</div>
											<div class="row card-header"></div>
										</div>
									</div>
								</c:if>
								<!-- 보드색깔지정 : pink -->
								<c:if test="${board.board_thema == 'pink'}">
									<div class="col-12 col-md-6 col-lg-3 mt-4">
										<div class="card board" style="background-color:rgb(250, 167, 243);"
										onclick="location.href='boardDetail?boardID=${board.board_id}'">
											<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
											style="text-align: right; display: table-cell;">
												<span class="ml-4" style="font-weight: bold;
												color:rgb(171, 127, 252);">${board.board_Title}</span>
											</div>
											<div class="row card-header"></div>
										</div>
									</div>
								</c:if>
								<!-- 보드색깔지정 : gray -->
								<c:if test="${board.board_thema == 'gray'}">
									<div class="col-12 col-md-6 col-lg-3 mt-4">
										<div class="card board" style="background-color:rgb(184, 184, 184);"
										onclick="location.href='boardDetail?boardID=${board.board_id}'">
											<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
											style="text-align: right; display: table-cell;">
												<span class="ml-4" style="font-weight: bold;
												color:rgb(247, 123, 123);">${board.board_Title}</span>
											</div>
											<div class="row card-header"></div>
										</div>
									</div>
								</c:if>
								<!-- 보드색깔지정 : darkgray -->
								<c:if test="${board.board_thema == 'darkgray'}">
									<div class="col-12 col-md-6 col-lg-3 mt-4">
										<div class="card board" style="background-color:rgb(116, 115, 115);"
										onclick="location.href='boardDetail?boardID=${board.board_id}'">
											<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
											style="text-align: right; display: table-cell;">
												<span class="ml-4" style="font-weight: bold;
												color:rgb(252, 187, 127);">${board.board_Title}</span>
											</div>
											<div class="row card-header"></div>
										</div>
									</div>
								</c:if>
								<!-- 보드색깔지정 : black -->
								<c:if test="${board.board_thema == 'black'}">
									<div class="col-12 col-md-6 col-lg-3 mt-4">
										<div class="card board" style="background-color:rgb(12, 12, 12);"
										onclick="location.href='boardDetail?boardID=${board.board_id}'">
											<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
											style="text-align: right; display: table-cell;">
												<span class="ml-4" style="font-weight: bold;
												color:white;">${board.board_Title}</span>
											</div>
											<div class="row card-header"></div>
										</div>
									</div>
								</c:if>
							</c:if>
						</c:forEach>
						<!--여기까지가 하나의 보드-->
					</div>
                      </div>
                    </div>
                  </div>
                  </c:forEach>
                  <!--여기까지 하나의 워크스페이스-->
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
  
  <!-- General JS Scripts -->
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="resources/assets/js/stisla.js"></script>

  <!-- Template JS File -->
  <script src="resources/assets/js/scripts.js"></script>
  <script src="resources/assets/js/custom.js"></script>

  <!-- 은지 코드 -->
  <script src="resources/js/workspace/workspaceList.js"></script>
</body>
</html>