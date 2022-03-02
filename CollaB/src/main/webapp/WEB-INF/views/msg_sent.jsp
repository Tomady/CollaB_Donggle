<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
<title>Insert title here</title>
 <!-- General CSS Files -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">

<!-- CSS Libraries -->

<!-- Template CSS -->
<link rel="stylesheet" href="resources/assets/css/style.css">
<link rel="stylesheet" href="resources/assets/css/components.css">
<style>
	.modal_close_btn{cursor:pointer;}
	#my_modal {
	  display: none;
	  width: 60%;
	  height: 80%;
	  padding: 20px 60px;
	  background-color: #fefefe;
	  border: 1px solid #888;
	  border-radius: 4px;
	}
	#my_modal .modal_close_btn {
	    position: absolute;
	    top: 10px;
	    right: 10px;
	}
	#modal-header{
	  display: table-cell;
	  vertical-align: middle;
	  text-align: center;
	}
	#select_msg {
	  display: none;
	  width: 60%;
	  height: 70%;
	  padding: 20px 60px;
	  background-color: #fefefe;
	  border: 1px solid #888;
	  border-radius: 4px;
	}
	#select_msg .modal_close_btn {
	    position: absolute;
	    top: 10px;
	    right: 10px;
	}
	.modal_close_btn {
	  cursor:pointer;
	}
	#newMsgAlert { 
	  width: 20%; 
	  height: 50%; 
	  text-align: center; 
	  border-radius: 50%; 
	  color: white; 
	  background-color: #6553C1;
	}
	 .arrow_box { 
	  display: none;
	}
	 #msgBODY:hover { 
	  cursor: pointer;
	}
	 .list-group-item:hover { 
	  cursor:pointer; background-color: rgb(243, 242, 242);
	}
	 #members { 
	  cursor: pointer;
	}
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

<body style="background-color: rgb(204, 195, 226); overflow:scroll; overflow-x:hidden;">
 <!-- 메시지 작성 모달 -->
  <div id="my_modal">
    <div class="card" >
      <div id="modal-header" class="card-header">
        <h5>New letter</h5>
      </div>
    </div>
    <div class="d-flex justify-content-between">
      <!--메세지 작성란-->
      <div class="card">
        <div class="card-body">
          <div class="card-header justify-content-center">
          </div>
          <div class="row form-group ml-1">
            <label><span style="color: red;">* </span>Attn.</label>
            <input id="modal-msg-dear" type="text" class="form-control ml-3" style="width: 80%;" readonly>
          </div>
          <div class="row form-group ml-1">
            <label><span style="color: red;">* </span>Title.</label>
            <input id="modal-msg-title" type="text" class="form-control ml-3" style="width: 80%;">
          </div>
          <div class="row form-group mt-1">
            <textarea id="letterContents" cols="60" rows="10"
            style="border: rgb(206, 206, 206) 1px solid;"></textarea>
          </div>
          <div class="row buttons mt-1 justify-content-center">
            <button class="btn btn-icon btn-secondary" id="sendMsg">Send</button>
          </div>
        </div>
      </div>
      <!--주소록-->
      <div class="card">
        <div class="card-body">
          <div class="card-header justify-content-center">
            <h4>members</h4>
          </div>
          <div class="row form-group d-flex justify-content-between">
            <input type="text" class="form-control" style="visibility: hidden;">
            <div class="col">
              <ul id="workspaces" class="list-group">
              <c:forEach items="${workspaceList}" var="workspace">
                <li class="list-group-item" onclick="show_joinMembers(${workspace.workspace_id})">${workspace.workspace_title}</li>              
              </c:forEach>
              </ul>
            </div>
            <div class="col form-group">
              <select id="members" class="form-control" multiple data-height="300px">
              	<option>Click on the workspace<option>
              	<option>to select a member😉<option>
              </select>
            </div>
          </div>
        </div>
      </div>
    </div>
    <a class="modal_close_btn" style="width: 30px; height: 30px;">
      <i class="fa fa-times" aria-hidden="true"></i>
    </a>
  </div>
  <!-- 메시지 작성 모달 of END-->

  <!-- 메시지 조회 모달 -->
 <div id="select_msg">
  <div class="card-body">
    <section class="section">
      <div class="section-header">
        <button class="btn delete fas fa-trash" title="delete" type="button" >
        </button>
      </div>
      <div class="section-body">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
              	<h4>Title.&nbsp;&nbsp;</h4><h4 id="msgTitle"></h4><!-- 제목 -->
              </div>
              <div class="card-header">
               	<span>To.&nbsp;&nbsp;</span><span id="msgTo"></span><!-- 받는이 -->
                <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date.&nbsp;&nbsp;</span><span id="msgDate"></span><!-- 보낸날짜 -->
              </div>
              <div class="card-body">
                <div class="form-group row mb-4">
                	<div style="width: 450px; visibility:hidden;"></div>
                    <textarea id="msgContents" class="summernote-simple" readonly
                    rows="7" style="font-size: larger; width:100%;">
                    </textarea>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
<a class="modal_close_btn" style="width: 30px; height: 30px;">
  <i class="fa fa-times" aria-hidden="true"></i>
</a>
</div>
<!-- 메시지 조회 모달 of END-->

  <div id="app">
    <div class="main-wrapper">
      <div class="navbar-bg" style="background-color: rgb(199, 174, 247);"></div>
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
        
        <ul class="navbar-nav navbar-right">
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
 
      <!-- Message sidebar -->
      <div class="main-sidebar">
        <aside id="sidebar-wrapper">
          <div class="sidebar-brand mt-4">
            <a href="#">Message</a>
          </div>
          <ul class="sidebar-menu mt-3">
            <li id="newMsgMenu" onclick="newMsgSend('my_modal')">
              <a class="nav-link ml-2" href="#">
                <i class="fas fa-plus"></i>
                <span>New letter</span>
              </a>
            </li>
            <hr width="90%">
            <li>
              <a class="nav-link" href="message_inbox">
                <i class="fas fa-archive"></i>
                <span>Inbox</span>
                <c:if test="${unreadMSG > 0}">
	                <span id="newMsgAlert" class="mr-2">${unreadMSG}</span>                
                </c:if>
              </a>
            </li>
            <li style="background-color:#F9F6F6;">
              <a class="nav-link" href="message_sent">
                <i class="fas fa-paper-plane"></i>
                <span>Sent</span>
              </a>
            </li>
            <li>
              <a class="nav-link" href="message_starred">
                <i class="fas fa-star"></i>
                <span>Starred</span>
              </a>
            </li>
          </ul>
        </aside>
      </div>
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-body">
            <div class="row">
              <div class="col-12 col-md-6 col-lg-12">
                <div class="card">
                  <div class="card-header d-flex justify-content-between">
                    <h4>Sent</h4>
                    <!--검색창-->
                    <div class="search-element d-flex justify-content-between col-lg mt-2">
                      <div class="btn-group mb-2">
                        <select id="sent_search_jogun" class="btn btn-sm dropdown-toggle mr-2" type="button" data-toggle="dropdown" 
                        aria-haspopup="true" aria-expanded="false">
                          <option class="dropdown-menu dropdown-item" value="to">To&nbsp;&nbsp;&nbsp;</option>
                          <option class="dropdown-menu dropdown-item" value="title">Title&nbsp;&nbsp;&nbsp;</option>
                        </select>
                        <input id="sentSearchVal" class="form-control" type="search" placeholder="Mail Search" 
                        aria-label="Search" data-width="250" style="width: 30%;">
                        <button id="sentSearch" class="btn" type="button"><i class="fas fa-search"></i></button>
                      </div>
                    </div>
                    <!--페이징처리-->
                    <ul class="pagination col-rg mt-2">
                      <li class="page-item mt-2">
                        <span class="col-rg mt-2" style="font-size: 13px; color: cornflowerblue;">1 - 10</span>
                        <span class="col-rg mt-2 ml-1 mr-1" style="font-size: 13px; color: cornflowerblue;">of</span>
                        <span class="col-rg mt-2 mr-3" style="font-size: 13px; color: cornflowerblue;">total</span>
                      </li>
                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                          <span class="sr-only">Previous</span>
                        </a>
                      </li>
                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                          <span aria-hidden="true">&raquo;</span>
                          <span class="sr-only">Next</span>
                        </a>
                      </li>
                    </ul>
                  </div>
                  <div class="card-body" style="height: 100vh;">
                    <!--메시지 삭제-->
                    <button id="sentMsgDelete" class="btn mb-2" type="button">
                      <a href="#" title="delete"><i class="fas fa-trash"></i></a>
                    </button>
                    <!--새로고침 => 화면 다시 그려주면 될듯-->
                    <button class="btn mb-2" type="button" onclick="window.location.reload()">
                      <a href="#" title="refresh"><i class="fas fa-spinner" aria-hidden="true"></i></a>
                    </button>
                    <!--메시지 목록-->
                    <table class="table table-hover" style="text-align: center;">
                      <thead>
                        <tr>
                          <th scope="col" width="1%">
                            <input type="checkbox" id="allcheck" name="allcheck" onclick="selectAll(this)">
                          </th>
                          <th scope="col" width="10%">TO</th>
                          <th scope="col" width="20%">TITLE</th>
                          <th scope="col" width="54%">CONTENTS</th>
                          <th scope="col" width="15%">DATE</th>
                        </tr>
                      </thead>
                      <tbody id="msgBODY">
                      <c:forEach items="${sent}" var="sent">
                        <tr class="oneSentMsgRow">
                          <th scope="row">
                            <input id="${sent.sent_id}" type="checkbox" 
                            class="onemsg" name="onemsg" onclick="checkSelect()">
                          </th>
                          <td onclick="selectMSG(${sent.sent_id})">${sent.sent_to}</td>
                          <td onclick="selectMSG(${sent.sent_id})">${sent.sent_title}</td>
                          <td onclick="selectMSG(${sent.sent_id})" style="text-align: left;">${sent.sent_contents}</td>
                          <td onclick="selectMSG(${sent.sent_id})">${sent.sent_date}</td>
                        </tr>                      
                      </c:forEach>
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

  <!-- General JS Scripts -->
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="resources/assets/js/stisla.js"></script>

  <!-- JS Libraies -->

  <!-- Template JS File -->
  <script src="resources/assets/js/scripts.js"></script>
  <script src="resources/assets/js/custom.js"></script>

  <!-- Page Specific JS File -->
  
  <!-- 은지코드 -->
  <script src="resources/js/message/sent_message.js"></script>
  <script src="resources/js/message/message_header.js"></script>
</body>
</html>