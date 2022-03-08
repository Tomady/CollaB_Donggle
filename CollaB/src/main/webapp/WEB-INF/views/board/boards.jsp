<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
  </style>
<script type="text/javascript">
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
				console.log(datas);
				let boardList = document.querySelector("#boardlist"); //여기다가 보드 붙여주기
				
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
					span.setAttribute("class","ml-4");
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
					                document.querySelector("#boardNewName").remove();
					                target.innerHTML=newBName;
					                // ajax로 보드 이름변경해주기
					                $.ajax({
					                	url : "AjaxBoardRename",
					                	data : {
					                		boardId : data.board_id,
					                		newname : newBName
					                	},
					                	dataType : "text",
					                	type : "POST",
					                	success : function(data){
					                		if(data == "YES"){
					                			console.log("board이름변경성공?"+data);
					                		}else if(data == "NO"){
					                			console.log("board이름변경성공?"+data);
					                		}
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
					});
					span.innerHTML = data.board_Title;
					let i = document.createElement("i");
					i.setAttribute("class","fa fa-times");
					i.setAttribute("aria-hidden","true");
					//보드탈퇴 클릭함수걸기
					i.addEventListener("click",function(){ 
						let target = event.target.parentElement.parentElement.parentElement;
						let answer = confirm("선택한 보드를 탈퇴하시겠습니까?");
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
										target.remove();
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
						card.style.backgroundColor="rgb(245, 245, 245)";
						secRow.style.backgroundColor="rgb(245, 245, 245)";
					}else if(data.board_thema == "red"){
						i.style.color="white";
						span.style.color="white";
						card.style.backgroundColor="rgb(247, 123, 123)";
						secRow.style.backgroundColor="rgb(247, 123, 123)";
					}else if(data.board_thema == "orange"){
						i.style.color="white";
						span.style.color="white";
						card.style.backgroundColor="rgb(252, 187, 127)";
						secRow.style.backgroundColor="rgb(252, 187, 127)";
					}else if(data.board_thema == "yellow"){
						i.style.color="rgb(247, 123, 123)";
						span.style.color="rgb(247, 123, 123)";
						card.style.backgroundColor="rgb(255, 245, 157)";
						secRow.style.backgroundColor="rgb(255, 245, 157)";
					}else if(data.board_thema == "green"){
						i.style.color="white";
						span.style.color="white";
						card.style.backgroundColor="rgb(86, 161, 111)";
						secRow.style.backgroundColor="rgb(86, 161, 111)";
					}else if(data.board_thema == "skyblue"){
						i.style.color="white";
						span.style.color="white";
						card.style.backgroundColor="rgb(123, 243, 247)";
						secRow.style.backgroundColor="rgb(123, 243, 247)";
					}else if(data.board_thema == "blue"){
						i.style.color="rgb(123, 243, 247)";
						span.style.color="rgb(123, 243, 247)";
						card.style.backgroundColor="rgb(121, 162, 250)";
						secRow.style.backgroundColor="rgb(121, 162, 250)";
					}else if(data.board_thema == "darkblue"){
						i.style.color="rgb(255, 245, 157)";
						span.style.color="rgb(255, 245, 157)";
						card.style.backgroundColor="rgb(123, 125, 247)";
						secRow.style.backgroundColor="rgb(123, 125, 247)";
					}else if(data.board_thema == "purple"){
						i.style.color="rgb(250, 167, 243)";
						span.style.color="rgb(250, 167, 243)";
						card.style.backgroundColor="rgb(171, 127, 252)";
						secRow.style.backgroundColor="rgb(171, 127, 252)";
					}else if(data.board_thema == "pink"){
						i.style.color="rgb(171, 127, 252)";
						span.style.color="rgb(171, 127, 252)"
						card.style.backgroundColor="rgb(250, 167, 243)";
						secRow.style.backgroundColor="rgb(250, 167, 243)";
					}else if(data.board_thema == "gray"){
						i.style.color="rgb(247, 123, 123)";
						span.style.color="rgb(247, 123, 123)";
						card.style.backgroundColor="rgb(184, 184, 184)";
						secRow.style.backgroundColor="rgb(184, 184, 184)";
					}else if(data.board_thema == "darkgray"){
						i.style.color="rgb(252, 187, 127)";
						span.style.color="rgb(252, 187, 127)";
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
</script>
</head>
<body>
<div id="app">
   <div class="main-wrapper">
      <!-- Main Content -->
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
                        <img class="img-fluid mr-2 mt-2 	-body">
                        <h3 class="mt-4" id="WsName" data-wkid="${workspace.workspace_id}">${workspace.workspace_title}</h3>
                      </div>
                    </div>  
                  </div>
                  <div class="card-body ml-5 mr-5" style="height: 100vh;">
                    <!-- 검색창 -->
                    <div class="row d-flex justify-content-end mr-5">
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
  
  <!-- 은지 코드 -->
  <script src="resources/js/eunji/boards.js"></script>
</body>
</html>