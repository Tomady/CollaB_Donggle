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
    
    /*페이징*/
    .off-screen {
      display: none;
    }
    #pagebtn {
      width: 500px;
      text-align: center;

      margin: 0 auto;
      margin-top : 70px;
      height: 50px;
      line-height: 60px;
    }

    #pagebtn a {
      all: initial;
      display: inline-block;
      margin-right: 10px;
      border-radius: 3px;
      border: 1px solid #f9fafe;
      font-family: Tahoma;
      /*background: #f9fafe;*/
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
</style>
<script type="text/javascript">
//즐겨찾기
function starFnc(id){
	let d = "";
	let target = event.target;
	if(event.target.style.color == "red"){
		d = "N";
	}else{
		d = "Y";
	}
	$.ajax({
		url : "AjaxStarInbox",
		data : {
			inboxID : id,
			d : d
		},
		dataType : "text",
		type : "POST",
		success : function(data){
			if(d == "N"){
				console.log("즐겨찾기해제성공?"+data);	
				target.style.color = "gray";
			}else if(d == "Y"){
				console.log("즐겨찾기추가성공?"+data);
				target.style.color = "red";
			}
		},
		error : function(){
			console.log("AjaxStarInbox 실패");
		}
	})
	
}
//안읽은메시지 조회
function unread(){
	$.ajax({
		url : "AjaxUnreadInbox",
		dataType : "json",
		success : function(datas){
			console.log(datas);
			let msgBODY = document.getElementById("msgBODY");
			msgBODY.textContent="";
			
			for(let data of datas){			
				let tr = document.createElement("tr");
				tr.setAttribute("class","onemsgRow");
				tr.addEventListener("click",selectMSG(data.inbox_id));
				let th = document.createElement("th");
				th.setAttribute("scope","row");
				let input = document.createElement("input");
				input.setAttribute("id",data.inbox_id);
				input.setAttribute("type","checkbox");
				input.setAttribute("class","onemsg");
				input.setAttribute("name","onemsg");
				input.addEventListener("click",checkSelect());
				let starTd = document.createElement("td");
				let star = document.createElement("i");
				star.setAttribute("class","star fas fa-star");
				star.addEventListener("click",starFnc(data.inbox_id)); 
				let from = document.createElement("td"); 
				from.innerHTML = data.receive_from;
				let title = document.createElement("td"); 
				title.innerHTML = data.receive_title;
				let contents = document.createElement("td");
				contents.innerHTML = data.receive_contents; 
				let date = document.createElement("td"); 
				date.innerHTML = data.receive_date;
				
				starTd.append(star);
				th.append(input);
				
				tr.append(th);
				tr.append(starTd);
				tr.append(from);
				tr.append(title);
				tr.append(contents);
				tr.append(date);
				
				msgBODY.append(tr);		
			}

		},
		error : function(){
			console.log("unread가져오기이벤트 AjaxUnreadInbox 실패");
		}
	})
}
</script>
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
            <h4>write</h4>
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
        <button id="reply" title="reply" class="btn fa fa-reply" type="button">
        </button>
        <button id="star" class="btn fas fa-star" title="star" type="button">
        </button>
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
                <span>From.&nbsp;&nbsp;</span><span id="msgFrom"></span><!-- 보낸이 -->
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
              <c:forEach items="${recents}" var="recent">
        	  	  <c:if test="${recent.board_id ne boardid}">
        	  	  	<c:set var="count" value="${count + 1}"/>
        	  	  	<c:if test="${count < 6}">
		              	<a class="dropdown-item" onclick="location.href='boardDetail?boardID=${recent.board_id}'">${recent.board_title}</a>        	  
        	  	  	</c:if>
	        	  </c:if>
	        	  <c:set var="boardid" value="${recent.board_id}"></c:set>
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
            <img alt="image" src="${prof_pic}" class="rounded-circle mr-1">
            <div class="d-sm-none d-lg-inline-block">Hi,${nickname}</div></a>
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
              <input id="modal-workspace-title" type="text" maxlength="10" class="form-control">
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
          <input id="modal-board-title" type="text" maxlength="20" class="form-control">
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
            <a href="WorkspaceList">Colla B</a>
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
            <li>
              <a class="nav-link" href="message_sent">
                <i class="fas fa-paper-plane"></i>
                <span>Sent</span>
              </a>
            </li>
            <li style="background-color:#F9F6F6;">
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
                    <h4 id="starredTitle" data-id="${id}">Starred</h4>
                    <!--검색창-->
                    <div class="search-element d-flex justify-content-between col-lg mt-2">
                      <div class="btn-group mb-2">
                        <select id="starred_search_jogun" class="btn btn-sm dropdown-toggle mr-2" type="button" data-toggle="dropdown" 
                        aria-haspopup="true" aria-expanded="false">
                          <option class="dropdown-menu dropdown-item" value="writer">From&nbsp;&nbsp;&nbsp;</option>
                          <option class="dropdown-menu dropdown-item" value="title">Title&nbsp;&nbsp;&nbsp;</option>
                        </select>
                        <input id="starredSearchVal" class="form-control" type="search" placeholder="Mail Search" 
                        aria-label="Search" data-width="250" style="width: 30%;">
                        <button id="starredSearch" class="btn" type="button"><i class="fas fa-search"></i></button>
                      </div>
                    </div>
                  </div>
                  <div class="card-body" style="height: 100vh;">
                    <!--메시지 삭제-->
                    <button id="starredMsgDelete" class="btn mb-2" type="button">
                      <a href="#" title="delete"><i class="fas fa-trash"></i></a>
                    </button>
                    <!--새로고침 => 화면 다시 그려주면 될듯-->
                    <button id="refresh" class="btn mb-2" type="button" onclick="window.location.reload()">
                      <a href="#" title="refresh"><i class="fas fa-spinner" aria-hidden="true"></i></a>
                    </button>
                    <!--안읽은메시지 조회-->
                    <button class="btn mb-2" type="button" onclick="unread()">
                      <a href="#" title="unread"><i class="fa fa-envelope" aria-hidden="true"></i></a>
                    </button>
                    <!--메시지 목록-->
                  	<table id="starredMSGlist" class="table table-hover" style="text-align: center;">
                      <thead>
                        <tr>
                          <th scope="col" width="1%">
                            <input type="checkbox" id="allcheck" name="allcheck" onclick="selectAll(this)">
                          </th>
                          <th scope="col" width="1%"></th>
                          <th scope="col" width="12%">FROM</th>
                          <th scope="col" width="20%">TITLE</th>
                          <th scope="col" width="51%">CONTENTS</th>
                          <th scope="col" width="15%">DATE</th>
                        </tr>
                      </thead>
                      <tbody id="msgBODY">
                      <c:forEach items="${starList}" var="star">
                      <c:if test="${star.receive_confirm == 'Y'}">
                      	<tr class="onemsgRow">
                          <th scope="row">
                            <input id="${star.inbox_id}" type="checkbox" 
                            class="onemsg" name="onemsg" onclick="checkSelect()">
                          </th>
                          <td>
	                          <c:if test="${star.receive_star == 'Y'}">
	                            <i style="color:red;" class="star fas fa-star" onclick="starFnc(${star.inbox_id})"></i>
	                          </c:if>
	                          <c:if test="${star.receive_star == 'N'}">
	                            <i style="color:gray;" class="star fas fa-star" onclick="starFnc(${star.inbox_id})"></i>
	                          </c:if>
                          </td>
                          <td onclick="selectMSG(${star.inbox_id})">${star.receive_from}</td>
                          <td onclick="selectMSG(${star.inbox_id})">${star.receive_title}</td>
                          <td onclick="selectMSG(${star.inbox_id})" style="text-align: left;">${star.receive_contents}</td>
                          <td onclick="selectMSG(${star.inbox_id})">${star.receive_date}</td>
                        </tr>  
                      </c:if>
                      <c:if test="${star.receive_confirm == 'N'}">
                      	<tr class="onemsgRow" style="background-color:#F9F6F6;">
                          <th scope="row">
                            <input id="${star.inbox_id}" type="checkbox" 
                            class="onemsg" name="onemsg" onclick="checkSelect()">
                          </th>
                          <td>
	                          <c:if test="${star.receive_star == 'Y'}">
	                            <i style="color:red;" class="star fas fa-star" onclick="starFnc(${star.inbox_id})"></i>
	                          </c:if>
	                          <c:if test="${star.receive_star == 'N'}">
	                            <i style="color:gray;" class="star fas fa-star" onclick="starFnc(${star.inbox_id})"></i>
	                          </c:if>
                          </td>
                          <td onclick="selectMSG(${star.inbox_id})">${star.receive_from}</td>
                          <td onclick="selectMSG(${star.inbox_id})">${star.receive_title}</td>
                          <td onclick="selectMSG(${star.inbox_id})" style="text-align: left;">${star.receive_contents}</td>
                          <td onclick="selectMSG(${star.inbox_id})">${star.receive_date}</td>
                        </tr>  
                      </c:if>
                                            
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
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src="resources/js/jay/confirmForm.js"></script>
  <script type="text/javascript">
   function logout(){
      swal({
         title: "정말 로그아웃을 하시겠습니까?",
         icon : "warning",
         buttons : ["취소", "확인"]
      })
      .then(function(value) {
         if(value) {
      
            ajaxCompanyChk();
         }
      })
   }

   function ajaxCompanyChk() {
      $.ajax({
         url : 'ajaxTokenChk.do',
         dataType : 'text',
         success : function(data) {
            if(data == "No") {
               location.href="logout.do";
            } else {
               logoutSwitchFn(data);
            }
         }
      })
   }
   
   function logoutSwitchFn(data){
      switch(data) {
         case "카카오": 
            kakaoLogoutFn();   
            break;
            
         case "네이버":
            
            naverLogoutFn();
            break;
            
         case "구글": 
         
            googleLogoutFn();
            break;
            
         case "페이스북":
         
            location.href="facebookLogout.do";
            break;
      }
   }
   
   function kakaoLogoutFn(){
      $.ajax({
         url : 'kakaoLogoutUrl.do',
         dataType : 'text',
         type : 'post',
         success : function(data){
            location.href=data;
         
         }
      })
   }
      
   function googleLogoutFn(){
      $.ajax({
         url : 'googleLogout.do',
         type : 'post',
         dataType : 'text',
         success : function(data){
            popupFn(data);
         }
      })
   }
   
   function naverLogoutFn(){
      
      $.ajax({
         url : 'naverLogout.do',
         type : 'post',
         dataType : 'text',
         success : function(data){
            
            popupFn(data);
         }
      })
   }
   
   function popupFn(url){
      var popupWidth = 1000;
      var popupHeight = 700;
      
      var popupX = (window.screen.width / 2) - (popupWidth /2);
      var popupY = (window.screen.height / 2) - (popupHeight /2);
      
      window.open(url, 'popup', 'z-lock=yes, width='+popupWidth+', height='+popupHeight+', top='+popupY+', left='+popupX);
      location.href='login.do'
   }
  
  var pagenumber = 10 //한페이지에 보여줄 메시지 수
  var pageCount = 3
  var currentPage = 1;

  var tableEl = $('#starredMSGlist');
  var tr = tableEl.find('tbody tr');
  var trtotal = tr.length;
  
  function page(pagenumber, pageCount, currentPage) {

    if (trtotal == 0) return;
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
      $('<a href="#"></a>')
        .attr('data', 'prev')
        .html("<")
        .appendTo('#pagebtn');
    }

    for (let i = first; i <= last; i++) {
      $('<a href="#"></a>')
        .attr('data', i)
        .html(i)
        .appendTo('#pagebtn');
    }
    if (last < pagetotal) {
      $('<a href="#"></a>')
        .attr('data', 'next')
        .html(">")
        .appendTo('#pagebtn');
    }
    var paginglink = $('#pagebtn a');
    paginglink.removeClass('active');
    $("[data=" + currentPage + "]").addClass("active")
    var startval = (currentPage - 1) * pagenumber;
    var endval = startval + pagenumber;

    tr.css('opacity', '0.0')
      .addClass('off-screen')
      .slice(startval, endval)
      .removeClass('off-screen')
      .animate({
        opacity: 1
      }, 500);



    paginglink.on('click', function (e) {
      e.preventDefault();
      var thisval = $(this);
      var data = thisval.attr("data");
      var selectedPage = thisval.text();
      if (data == "next") selectedPage = next;
      if (data == "prev") selectedPage = prev;

      page(pagenumber, pageCount, selectedPage);

    });
  }
  page(pagenumber, pageCount, currentPage);
  </script>

  <!-- General JS Scripts -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="resources/assets/js/stisla.js"></script>

  <!-- JS Libraies -->

  <!-- Template JS File -->
  <script src="resources/assets/js/scripts.js"></script>
  <script src="resources/assets/js/custom.js"></script>

  <!-- 은지 코드 -->
  <script src="resources/js/message/starred_message.js"></script>
  <script src="resources/js/message/message_header.js"></script>
</body>
</html>