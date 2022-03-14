<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
<title>Insert title here</title>
<!-- General CSS Files -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
<!-- Template CSS -->
<link rel="stylesheet" href='<c:url value="/resources/assets/css/style.css"></c:url>'>
<link rel="stylesheet" href='<c:url value="/resources/assets/css/components.css"></c:url>'>
<style>
	/*header*/
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
    
    /*side*/
    .wkimg{
      width: 40px; 
      height: 40px;
      border-radius: 3px; 
      border: 2px solid rgb(228, 227, 227);
    }
   
    /*body*/
    .board:hover{
      cursor: pointer;
    }
    #workspace-body{
      display: table-cell;
      vertical-align: middle;
      text-align: center;
    }                
    #answer{
      position: absolute;
      margin-top: -25px;
      z-index: 10; /*좌우이동*/
      font-size: 15px;
      background-color: white;
      border: rgb(197, 196, 196) 1px solid;
      color: rgb(53, 53, 53);
      display: none;
      box-shadow: 5px 5px 10px rgb(128, 128, 128);
    }
    #createBoard{
      z-index: 1;
    }
    #createBoard-a{
      background-color: rgb(245, 245, 245);
      box-shadow: inset 3px 3px .3em rgb(211, 210, 210);
    }
    #createBoard-a:hover{
      background-color: rgb(245, 245, 245);
      box-shadow: 5px 5px .5em rgb(128, 128, 128);
      font-weight: bold;
    }
    .wkimg-body{
      width: 60px; 
      height: 60px;
      border-radius: 5px; 
      border: 3px solid rgb(228, 227, 227);
    }
    /*
    (position 디폴트 값이 static 이고 static은 그 태그 속성에 따라 정해짐! 
    div면 (display: block;)속성으로 span은 (display: inline;) 
    그리고 relation은 static 기준으로 이동 top left 등등! 이해 되셨ㅅ으면 좋겠어요.. ) 
    << 이건 몰라도 상관 없긴해요..! 저도 잘 몰라서 찾아봤음!! 도움이 되셨으면!!
    */
    
    /*보드삭제모달*/
    #del_board {
   	  display: none;
      width: 450px;
      padding: 20px 60px;
      background-color: #fefefe;
      border: 1px solid #888;
      border-radius: 3px;
    }
    #del_board .del_board_close_btn {
        position: absolute;
        top: 10px;
        right: 10px;
    }
  </style>
<script type="text/javascript">
	//화면그려줌과 동시에 해당 워크스페이스에 사용자가 초대된 보드목록 뿌려주는 함수 실행
	document.addEventListener("DOMContentLoaded", function(){
		let name = "${workspace.workspace_title}";
		changeWKIMG(name);
		
		$.ajax({
			url : "AjaxBoardList",
			type : "POST",
			data : {
				workspaceID : "${workspace.workspace_id}"
			},
			dataType : "json",
			success : function(datas){
				//바디에 해당 워크스페이스의 보드 붙여주기
				let boardList = document.querySelector("#boardlist"); 
				for(let data of datas){
					let boardDIV = document.createElement("div");
					boardDIV.setAttribute("class","col-12 col-md-6 col-lg-3 boardDIV");
					boardDIV.setAttribute("data-name",data.board_Title);
					let card = document.createElement("div");
					card.setAttribute("class","card board");
					let row = document.createElement("div");
					row.setAttribute("class","row col-rg mr-2 mt-1 d-flex justify-content-between");
					row.style.textAlign="right";
					row.style.display = "table-cell";
					let span = document.createElement("span");
					span.setAttribute("id","borRename"+data.board_id);
					span.setAttribute("class","ml-4");
					span.innerHTML = data.board_Title;
					span.style.fontWeight="bold";
					//보드이름수정 클릭함수걸기
					span.addEventListener("click",function(){ 
						let target = event.target;
						target.innerHTML = "";
						let input = document.createElement("input");
					    input.style.width = "200px";
					    input.style.height = "20px";
					    input.setAttribute("type","text");
					    input.setAttribute("id","boardNewName");
					    input.setAttribute("name","boardNewName");
					    input.addEventListener("keyup",function(){
					        if (window.event.keyCode == 13) {
					            // 엔터키가 눌렸을 때
					            let newBName = document.querySelector("#boardNewName").value;
					            if(newBName == ""){
					                input.style.border="2px solid red";
					                input.setAttribute("placeholder","Please name it.");
					                input.focus();
					            }else{
					                // ajax로 보드 이름변경해주기
					                $.ajax({
					                	url : "AjaxBoardRename",
					                	data : {
					                		boardId : data.board_id,
					                		newname : newBName
					                	},
					                	dataType : "json",
					                	type : "POST",
					                	success : function(data){
					                		document.querySelector("#boardNewName").remove();
							                target.innerHTML=data.board_Title;
					                	},
					                	error : function(){
					                		console.log("boards페이지 AjaxBoardRename 실패");
					                	}
					                })
					            }
					        }
					    	
					    });
					    target.append(input);
					    document.getElementById("boardNewName").focus();
					    
					    //body클릭시 이름수정 취소되도록
				        var body = document.querySelector("body");
				    	var clickCnt = 0;
				    	body.addEventListener("click", board_renameCancel);
				    	function board_renameCancel(){
				    		clickCnt += 1;
				    		if(event.target == event.currentTarget.querySelector("#borRename"))
				    			return ;
				    		if(event.target == event.currentTarget.querySelector("#boardNewName"))
				    			return ;
				    		if(boardNewName.value == "" && clickCnt > 1){
				    			document.querySelector("#boardNewName").remove();
				    			let originName = document.querySelector("#borRename"+data.board_id);
				    			originName.innerHTML = data.board_Title;
				    			//클릭 이벤트 없애주기
				    			body.removeEventListener("click",board_renameCancel);
				    		}
				    	}
					});
					let i = document.createElement("i");
					i.setAttribute("class","fa fa-times");
					i.setAttribute("aria-hidden","true");
					//보드탈퇴 클릭함수걸기
					i.addEventListener("click",function(){ 
						let target = event.target.parentElement.parentElement.parentElement;
						let answer = confirm("Do you want to leave the selected board?");
						if(answer){
							$.ajax({
								url : "AjaxBoardJoinDelete",
								data : {
									workID : "${workspace.workspace_id}",
									boardID : data.board_id
								},
								type : "POST",
								dataType : "text",
								success : function(data){
									if(data == "YES"){
										console.log("보드가입 탈퇴 성공?"+data);
										window.location.reload();
									}else if(data == "NO"){
										console.log("보드가입 탈퇴 성공?"+data);
									}
								},
								error : function(){
									console.log("AjaxBoardJoinDelete 실패");
								}
							})
						}
					});
					let secRow = document.createElement("div");
					secRow.setAttribute("class","row card-header");
					//board-details페이지로 넘어갈 클릭이벤트 걸기
					secRow.addEventListener("click",function(){
						location.href="boardDetail?boardID="+data.board_id;
					})
					
					if(data.board_thema == ""){
						card.style.border="3px solid rgb(245, 245, 245)";
						secRow.style.backgroundColor="rgb(245, 245, 245)";
					}else if(data.board_thema == "red"){
						i.style.color="#ffeeee";
						span.style.color="#ffeeee";
						card.style.backgroundColor="rgb(247, 123, 123)";
						secRow.style.backgroundColor="rgb(247, 123, 123)";
					}else if(data.board_thema == "orange"){
						i.style.color="#fde9d6";
						span.style.color="#fde9d6";
						card.style.backgroundColor="rgb(252, 187, 127)";
						secRow.style.backgroundColor="rgb(252, 187, 127)";
					}else if(data.board_thema == "yellow"){
						i.style.color="rgb(230 201 32)";
						span.style.color="rgb(230 201 32)";
						card.style.backgroundColor="rgb(255, 245, 157)";
						secRow.style.backgroundColor="rgb(255, 245, 157)";
					}else if(data.board_thema == "green"){
						i.style.color="#075314";
						span.style.color="#075314";
						card.style.backgroundColor="#76c483";
						secRow.style.backgroundColor="#76c483";
					}else if(data.board_thema == "skyblue"){
						i.style.color="#4ac1ff";
						span.style.color="#4ac1ff";
						card.style.backgroundColor="#99fcff";
						secRow.style.backgroundColor="#99fcff";
					}else if(data.board_thema == "blue"){
						i.style.color="#d4e2ff";
						span.style.color="#d4e2ff";
						card.style.backgroundColor="rgb(121, 162, 250)";
						secRow.style.backgroundColor="rgb(121, 162, 250)";
					}else if(data.board_thema == "darkblue"){
						i.style.color="#dddefa";
						span.style.color="#dddefa";
						card.style.backgroundColor="rgb(123, 125, 247)";
						secRow.style.backgroundColor="rgb(123, 125, 247)";
					}else if(data.board_thema == "purple"){
						i.style.color="#803bff";
						span.style.color="#803bff";
						card.style.backgroundColor="#b28df6";
						secRow.style.backgroundColor="#b28df6";
					}else if(data.board_thema == "pink"){
						i.style.color="rgb(250, 167, 243)";
						span.style.color="rgb(250, 167, 243)"
						card.style.backgroundColor="#ffd2fb";
						secRow.style.backgroundColor="#ffd2fb";
					}else if(data.board_thema == "gray"){
						i.style.color="#e6e4e4";
						span.style.color="#e6e4e4";
						card.style.backgroundColor="rgb(184, 184, 184)";
						secRow.style.backgroundColor="rgb(184, 184, 184)";
					}else if(data.board_thema == "darkgray"){
						i.style.color="#e4e4e4";
						span.style.color="#e4e4e4";
						card.style.backgroundColor="rgb(116, 115, 115)";
						secRow.style.backgroundColor="rgb(116, 115, 115)";
					}else if(data.board_thema == "black"){
						i.style.color="white";
						span.style.color="white";
						card.style.backgroundColor="rgb(12, 12, 12)";
						secRow.style.backgroundColor="rgb(12, 12, 12)";
					}
					
					row.append(span);
					row.append(i);
					card.append(row);
					card.append(secRow);
					boardDIV.append(card);
					boardList.append(boardDIV);
				}
				
				
			},
			error : function(){
				console.log("boards페이지 AjaxBoardList 실패");
			}
		})
	});
	function sidebarWorkspace(){
		if(sidebar_wk_icon.className=="fa fa-caret-up ml-3"){
			sidebar_wk_icon.className="fa fa-caret-down ml-3";
		}else if(sidebar_wk_icon.className=="fa fa-caret-down ml-3"){
			sidebar_wk_icon.className="fa fa-caret-up ml-3";
		}
		const wkitems = document.querySelectorAll(".sidebar_workspace_item");
		wkitems.forEach((wk)=>{
			if(wk.style.display == "none"){
				wk.style.display = "block";
			}else if(wk.style.display == "block"){
				wk.style.display = "none";
			}
		})
	}

	function sidebarBoard(){
		if(sidebar_bo_icon.className=="fa fa-caret-up ml-5"){
			sidebar_bo_icon.className="fa fa-caret-down ml-5";
		}else if(sidebar_bo_icon.className=="fa fa-caret-down ml-5"){
			sidebar_bo_icon.className="fa fa-caret-up ml-5";
		}
		const boitems = document.querySelectorAll(".sidebar_board_item");
		boitems.forEach((bo)=>{
			if(bo.style.display == "none"){
				bo.style.display = "block";
			}else if(bo.style.display == "block"){
				bo.style.display = "none";
			}
		})
	}
</script>
</head>
<body style="background-color: #ECE9FE; overflow:scroll; overflow-x:hidden;">
<div id="app">
   <div class="main-wrapper">
   
	<!-- ////////////////////MAIN HEADER//////////////////// -->
	  <div class="navbar-bg" style="background-color: rgb(199, 174, 247);"></div>
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
              <c:forEach items="${workspaceList}" var="workspace">
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
        
        <ul class="navbar-nav navbar-right">
          <li class="dropdown"><a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
            <img alt="image" src="resources/assets/img/avatar/avatar-1.png" class="rounded-circle mr-1">
            <div class="d-sm-none d-lg-inline-block">Hi, ${nickname}</div></a>
            <div class="dropdown-menu dropdown-menu-right">
              <!--소연걸 : 마이페이지 메인 으로 주소걸어주기-->
              <a class="dropdown-item has-icon" href="myPageMain.do">
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

	<!-- ////////////////////SIDE BAR//////////////////// -->
	   <div class="main-sidebar">
        <aside id="sidebar-wrapper">
          <div class="sidebar-brand mt-4">
            <a href="WorkspaceList">Colla B</a>
          </div>
          <ul class="sidebar-menu">
          	<li class="menu-header mt-4 mb-1">workspace</li>
            <li class="d-flex justify-content-between">
            	<a class="nav-link"><img class="img-fluid wkimg mr-1">
            	<span id="workspaceName">&nbsp;&nbsp;${workspace.workspace_title}</span></a>
            </li>
            <li class="menu-header">MENU</li>
            <li>
              <a class="nav-link" href="Boards?wkid=${workspace.workspace_id}">
                <i class="fas fa-columns"></i>
                <span>Boards</span>
              </a>
            </li>
            <li>
              <a class="nav-link" href="memberPage.do?">
                <i class="far fa-user"></i>
                <span>Members</span>
              </a>
            </li>
            <li>
              <a class="nav-link" href="issueBoard.do?workspace_id=${workspace.workspace_id}">
                <i class="fas fa-fire"></i>
                <span>Issues</span>
              </a>
            </li>
            <li>
              <a class="nav-link" href="#">
                <i class="fas fa-th"></i>
                <span>Files</span>
              </a>
            </li>
            <li id="sidebar_workspace" class="menu-header mt-3" onclick="sidebarWorkspace()" style="cursor:pointer;">Your Workspaces<i id="sidebar_wk_icon" class="fa fa-caret-down ml-3" style="font-size:15px;"></i></li>
            <c:forEach items="${workspaceList}" var="workspace">
            <li class="sidebar_workspace_item" style="display:none;">
            	<a class="nav-link" href="Boards?wkid=${workspace.workspace_id}">
            	<span id="sidebar_workspace${workspace.workspace_id}">&nbsp;&nbsp;${workspace.workspace_title}</span></a>
            </li>
            </c:forEach>
            <c:if test="${boardStar ne null}">
            <li id="sidebar_board" class="menu-header" onclick="sidebarBoard()" style="cursor:pointer;">Your Boards<i id="sidebar_bo_icon" class="fa fa-caret-down ml-5" style="font-size:15px;"></i></li>
            <c:forEach items="${boardStar}" var="starBoard">
            	<li class="sidebar_board_item" style="display:none;">
            	  <a class="nav-link d-flex justify-content-between sidebar_boardStar${starBoard.board_id}" href="boardDetail?boardID=${starBoard.board_id}">
	                <span class="sidebar_board${starBoard.board_id}">&nbsp;&nbsp;${starBoard.board_Title}</span>
	                <span class="sidebarstar${starBoard.board_id} fas fa-star col-rg text-right" style="color:yellow;"></span>
	              </a>
            	</li>
            </c:forEach>
            <c:forEach items="${unStarBoards}" var="board">
	            <li class="sidebar_board_item" style="display:none;">
	              <a class="nav-link d-flex justify-content-between sidebar_boardStar${board.board_id}" href="boardDetail?boardID=${board.board_id}">
	                <span class="sidebar_board${board.board_id}">&nbsp;&nbsp;${board.board_Title}</span>
	              </a>
	            </li>
            </c:forEach>
            </c:if>
          </ul>
        </aside>
      </div>
	
	<!-- ////////////////////BODY//////////////////// -->
      <div class="main-content">
        <section class="section">
          <!-- 보드바디 -->
          <div class="section-body">
            <div class="row">
              <div class="col-12 col-md-6 col-lg-12">
                <div class="card">
                  <!-- 워크스페이스 명, rename, 프로필 -->
                  <div class="card-header d-flex justify-content-center" style="text-align:center;">
                    <div id="workspace-body" class="card-body col-lg-3 mt-5 mb-5 d-flex justify-content-center">
                      <div class="row workspaceNAME">
                        <img class="img-fluid mr-2 mt-2 wkimg-body">
                        <h3 class="mt-4" id="WsName" data-wkid="${workspace.workspace_id}">${workspace.workspace_title}</h3>
                      </div>
                    </div>  
                  </div>
                  <div class="card-body ml-5 mr-5" style="height: 75vh;">
                    <!-- 검색창 -->
                    <div class="row d-flex justify-content-end mr-5 ml-5">
                      <form action="#">
                        <div class="d-flex mr-5 mt-5 mb-5">
                          <input id="searchBOARDNAME" type="search" class="form-control" placeholder="Search boards">
                            <button class="btn btn-primary btn-icon" type="button" onclick="searchBoard()">
                              <i class="fas fa-search"></i>
                            </button>
                        </div>
                      </form>
                    </div>
                    <div class="ml-5 mr-5" style="position: relative;">
                      <span id="answer">Create a new board to spread your imagination ! 🦄</span>
                      <div id="boardlist" class="row ml-5 mr-5">
                        <!-- 새 보드 생성 DIV -->
                        <div id="createBoard" class="col-12 col-md-6 col-lg-3" onclick="create_boardModal()">
                          <div id="createBoard-a" class="d-flex justify-content-between card board">
                            <div class="row col-rg mr-2 mt-1" style="text-align: right; display: table-cell;">
                              <i id="question" class="fa fa-question" aria-hidden="true"></i>
                            </div>
                            <div class="card-header" 
                            style="display: table-cell; vertical-align:middle; 
                            text-align: center; line-height: 20px;">Create new board</div>
                          </div>
                        </div>
                        <!-- BOARD DIV 올 자리 -->
                      </div>
                    </div>
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
  <script src='<c:url value="/resources/assets/js/stisla.js"></c:url>'></script>

  <!-- Template JS File -->
  <script src='<c:url value="/resources/assets/js/scripts.js"></c:url>'></script>
  <script src='<c:url value="/resources/assets/js/custom.js"></c:url>'></script>
  
  <!-- 은지 코드 -->
  <script src="resources/js/workspace/workspaceBoards.js"></script>
</body>
</html>