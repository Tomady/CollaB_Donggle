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
    .wkimg{
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
	function goBoardDetail(BoardId,BoardName,BoardThema,WkId,WkName){
		console.log(BoardId+"|"+BoardName+"|"+BoardThema+"|"+WkId+"|"+WkName);
		location.href="goBoardDetails?boardId="+BoardId+"&boardName="+BoardName+"&boardThema="+BoardThema+"&WkId="+WkId+"&WkName="+WkName;
	}
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
	                    <c:set var="name" value="${wkname}"></c:set>
                      	<c:if test="${fn:substring(name,0,1) == 'a' || fn:substring(name,0,1) == 'A'}"><img src="resources/img/a.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 'b' || fn:substring(name,0,1) == 'B'}"><img src="resources/img/b.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 'c' || fn:substring(name,0,1) == 'C'}"><img src="resources/img/c.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 'd' || fn:substring(name,0,1) == 'D'}"><img src="resources/img/d.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 'e' || fn:substring(name,0,1) == 'E'}"><img src="resources/img/e.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 'f' || fn:substring(name,0,1) == 'F'}"><img src="resources/img/f.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 'g' || fn:substring(name,0,1) == 'G'}"><img src="resources/img/g.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 'h' || fn:substring(name,0,1) == 'H'}"><img src="resources/img/h.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 'i' || fn:substring(name,0,1) == 'I'}"><img src="resources/img/i.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 'j' || fn:substring(name,0,1) == 'J'}"><img src="resources/img/j.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 'k' || fn:substring(name,0,1) == 'K'}"><img src="resources/img/k.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 'l' || fn:substring(name,0,1) == 'L'}"><img src="resources/img/l.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 'm' || fn:substring(name,0,1) == 'M'}"><img src="resources/img/m.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 'n' || fn:substring(name,0,1) == 'N'}"><img src="resources/img/n.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 'o' || fn:substring(name,0,1) == 'O'}"><img src="resources/img/o.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 'p' || fn:substring(name,0,1) == 'P'}"><img src="resources/img/p.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 'q' || fn:substring(name,0,1) == 'Q'}"><img src="resources/img/q.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 'r' || fn:substring(name,0,1) == 'R'}"><img src="resources/img/r.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 's' || fn:substring(name,0,1) == 'S'}"><img src="resources/img/s.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 't' || fn:substring(name,0,1) == 'T'}"><img src="resources/img/t.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 'u' || fn:substring(name,0,1) == 'U'}"><img src="resources/img/u.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 'v' || fn:substring(name,0,1) == 'V'}"><img src="resources/img/v.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 'w' || fn:substring(name,0,1) == 'W'}"><img src="resources/img/w.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 'x' || fn:substring(name,0,1) == 'X'}"><img src="resources/img/x.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 'y' || fn:substring(name,0,1) == 'Y'}"><img src="resources/img/y.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == 'z' || fn:substring(name,0,1) == 'Z'}"><img src="resources/img/z.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == '0'}"><img src="resources/img/0.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == '1'}"><img src="resources/img/1.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == '2'}"><img src="resources/img/2.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == '3'}"><img src="resources/img/3.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == '4'}"><img src="resources/img/4.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == '5'}"><img src="resources/img/5.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == '6'}"><img src="resources/img/6.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == '7'}"><img src="resources/img/7.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == '8'}"><img src="resources/img/8.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
	                    <c:if test="${fn:substring(name,0,1) == '9'}"><img src="resources/img/9.jpg" class="img-fluid mr-2 mt-2 wkimg"></c:if>
                        <h3 class="mt-4" id="WsName" data-wkid="${wkid}">${wkname}</h3>
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
                        <!-- BOARD DIV -->
                        <c:forEach items="${boards}" var="board">
                        	<!-- 보드색깔지정 : none -->
                       		<c:if test="${board.board_thema == ''}">
								<div class="col-12 col-md-6 col-lg-3 boardDIV" data-name="${board.board_Title}" 
								onclick="goBoardDetail(${board.board_id},'${board.board_Title}','${board.board_thema}',${wkid},'${wkname}')">
									<div class="card board" style="background-color:rgb(245,245,245);">
										<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
										style="text-align: right; display: table-cell;">
											<span class="ml-4" style="font-weight: bold;
											 color:rgb(245,245,245);" onclick="boardRename()">${board.board_Title}</span>
											<i class="fa fa-times" aria-hidden="true" onclick="boardDelete(${board.board_id},${wkid})"
											style="color:rgb(245,245,245);"></i>
										</div>
										<div class="row card-header"></div>
									</div>
								</div>
							</c:if>
							<!-- 보드색깔지정 : red -->
							<c:if test="${board.board_thema == 'red'}">
								<div class="col-12 col-md-6 col-lg-3 boardDIV" data-name="${board.board_Title}" 
								onclick="goBoardDetail(${board.board_id},'${board.board_Title}','${board.board_thema}',${wkid},'${wkname}')">
									<div class="card board" style="background-color:rgb(247, 123, 123);">
										<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
										style="text-align: right; display: table-cell;">
											<span class="ml-4" style="font-weight: bold;
											 color:white;" onclick="boardRename()">${board.board_Title}</span>
											 <i class="fa fa-times" aria-hidden="true" onclick="boardDelete(${board.board_id},${wkid})"
											style="color:white;"></i>
										</div>
										<div class="row card-header"></div>
									</div>
								</div>
							</c:if>
							<!-- 보드색깔지정 : orange -->
							<c:if test="${board.board_thema == 'orange'}">
								<div class="col-12 col-md-6 col-lg-3 boardDIV" data-name="${board.board_Title}" 
								onclick="goBoardDetail(${board.board_id},'${board.board_Title}','${board.board_thema}',${wkid},'${wkname}')">
									<div class="card board" style="background-color:rgb(252, 187, 127);">
										<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
										style="text-align: right; display: table-cell;">
											<span class="ml-4" style="font-weight: bold;
											color:white;" onclick="boardRename()">${board.board_Title}</span>
											<i class="fa fa-times" aria-hidden="true" onclick="boardDelete(${board.board_id},${wkid})"
											style="color:white;"></i>
										</div>
										<div class="row card-header"></div>
									</div>
								</div>
							</c:if>
							<!-- 보드색깔지정 : yellow -->
							<c:if test="${board.board_thema == 'yellow'}">
								<div class="col-12 col-md-6 col-lg-3 boardDIV" data-name="${board.board_Title}" 
								onclick="goBoardDetail(${board.board_id},'${board.board_Title}','${board.board_thema}',${wkid},'${wkname}')">
									<div class="card board" style="background-color:rgb(255, 245, 157);">
										<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
										style="text-align: right; display: table-cell;">
											<span class="ml-4" style="font-weight: bold;
											color:rgb(247, 123, 123);" onclick="boardRename()">${board.board_Title}</span>
											<i class="fa fa-times" aria-hidden="true" onclick="boardDelete(${board.board_id},${wkid})"
											style="color:rgb(247, 123, 123);"></i>
										</div>
										<div class="row card-header"></div>
									</div>
								</div>
							</c:if>
							<!-- 보드색깔지정 : green -->
							<c:if test="${board.board_thema == 'green'}">
								<div class="col-12 col-md-6 col-lg-3 boardDIV" data-name="${board.board_Title}" 
								onclick="goBoardDetail(${board.board_id},'${board.board_Title}','${board.board_thema}',${wkid},'${wkname}')">
									<div class="card board" style="background-color:rgb(86, 161, 111);">
										<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
										style="text-align: right; display: table-cell;">
											<span class="ml-4" style="font-weight: bold;
											color:white;" onclick="boardRename()">${board.board_Title}</span>
											<i class="fa fa-times" aria-hidden="true" onclick="boardDelete(${board.board_id},${wkid})"
											style="color:white;"></i>
										</div>
										<div class="row card-header"></div>
									</div>
								</div>
							</c:if>
							<!-- 보드색깔지정 : skyblue -->
							<c:if test="${board.board_thema == 'skyblue'}">
								<div class="col-12 col-md-6 col-lg-3 boardDIV" data-name="${board.board_Title}" 
								onclick="goBoardDetail(${board.board_id},'${board.board_Title}','${board.board_thema}',${wkid},'${wkname}')">
									<div class="card board" style="background-color:rgb(123, 243, 247);">
										<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
										style="text-align: right; display: table-cell;">
											<span class="ml-4" style="font-weight: bold;
											color:white;" onclick="boardRename()">${board.board_Title}</span>
											<i class="fa fa-times" aria-hidden="true" onclick="boardDelete(${board.board_id},${wkid})"
											style="color:white;"></i>
										</div>
										<div class="row card-header"></div>
									</div>
								</div>
							</c:if>
							<!-- 보드색깔지정 : blue -->
							<c:if test="${board.board_thema == 'blue'}">
								<div class="col-12 col-md-6 col-lg-3 boardDIV" data-name="${board.board_Title}" 
								onclick="goBoardDetail(${board.board_id},'${board.board_Title}','${board.board_thema}',${wkid},'${wkname}')">
									<div class="card board" style="background-color:rgb(121, 162, 250);">
										<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
										style="text-align: right; display: table-cell;">
											<span class="ml-4" style="font-weight: bold;
											color:rgb(123, 243, 247);" onclick="boardRename()">${board.board_Title}</span>
											<i class="fa fa-times" aria-hidden="true" onclick="boardDelete(${board.board_id},${wkid})"
											style="color:rgb(123, 243, 247);"></i>
										</div>
										<div class="row card-header"></div>
									</div>
								</div>
							</c:if>
							<!-- 보드색깔지정 : darkblue -->
							<c:if test="${board.board_thema == 'darkblue'}">
								<div class="col-12 col-md-6 col-lg-3 boardDIV" data-name="${board.board_Title}" 
								onclick="goBoardDetail(${board.board_id},'${board.board_Title}','${board.board_thema}',${wkid},'${wkname}')">
									<div class="card board" style="background-color:rgb(123, 125, 247);">
										<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
										style="text-align: right; display: table-cell;">
											<span class="ml-4" style="font-weight: bold;
											color:rgb(255, 245, 157);" onclick="boardRename()">${board.board_Title}</span>
											<i class="fa fa-times" aria-hidden="true" onclick="boardDelete(${board.board_id},${wkid})"
											style="color:rgb(255, 245, 157);"></i>
										</div>
										<div class="row card-header"></div>
									</div>
								</div>
							</c:if>
							<!-- 보드색깔지정 : purple -->
							<c:if test="${board.board_thema == 'purple'}">
								<div class="col-12 col-md-6 col-lg-3 boardDIV" data-name="${board.board_Title}" 
								onclick="goBoardDetail(${board.board_id},'${board.board_Title}','${board.board_thema}',${wkid},'${wkname}')">
									<div class="card board" style="background-color:rgb(171, 127, 252);">
										<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
										style="text-align: right; display: table-cell;">
											<span class="ml-4" style="font-weight: bold;
											color:rgb(250, 167, 243);" onclick="boardRename()">${board.board_Title}</span>
											<i class="fa fa-times" aria-hidden="true" onclick="boardDelete(${board.board_id},${wkid})"
											style="color:rgb(250, 167, 243);"></i>
										</div>
										<div class="row card-header"></div>
									</div>
								</div>
							</c:if>
							<!-- 보드색깔지정 : pink -->
							<c:if test="${board.board_thema == 'pink'}">
								<div class="col-12 col-md-6 col-lg-3 boardDIV" data-name="${board.board_Title}" 
								onclick="goBoardDetail(${board.board_id},'${board.board_Title}','${board.board_thema}',${wkid},'${wkname}')">
									<div class="card board" style="background-color:rgb(250, 167, 243);">
										<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
										style="text-align: right; display: table-cell;">
											<span class="ml-4" style="font-weight: bold;
											color:rgb(171, 127, 252);" onclick="boardRename()">${board.board_Title}</span>
											<i class="fa fa-times" aria-hidden="true" onclick="boardDelete(${board.board_id},${wkid})"
											style="color:rgb(171, 127, 252);"></i>
										</div>
										<div class="row card-header"></div>
									</div>
								</div>
							</c:if>
							<!-- 보드색깔지정 : gray -->
							<c:if test="${board.board_thema == 'gray'}">
								<div class="col-12 col-md-6 col-lg-3 boardDIV" data-name="${board.board_Title}" 
								onclick="goBoardDetail(${board.board_id},'${board.board_Title}','${board.board_thema}',${wkid},'${wkname}')">
									<div class="card board" style="background-color:rgb(184, 184, 184);">
										<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
										style="text-align: right; display: table-cell;">
											<span class="ml-4" style="font-weight: bold;
											color:rgb(247, 123, 123);" onclick="boardRename()">${board.board_Title}</span>
											<i class="fa fa-times" aria-hidden="true" onclick="boardDelete(${board.board_id},${wkid})"
											style="color:rgb(247, 123, 123);"></i>
										</div>
										<div class="row card-header"></div>
									</div>
								</div>
							</c:if>
							<!-- 보드색깔지정 : darkgray -->
							<c:if test="${board.board_thema == 'darkgray'}">
								<div class="col-12 col-md-6 col-lg-3 boardDIV" data-name="${board.board_Title}" 
								onclick="goBoardDetail(${board.board_id},'${board.board_Title}','${board.board_thema}',${wkid},'${wkname}')">
									<div class="card board" style="background-color:rgb(116, 115, 115);">
										<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
										style="text-align: right; display: table-cell;">
											<span class="ml-4" style="font-weight: bold;
											color:rgb(252, 187, 127);" onclick="boardRename()">${board.board_Title}</span>
											<i class="fa fa-times" aria-hidden="true" onclick="boardDelete(${board.board_id},${wkid})"
											style="color:rgb(252, 187, 127);"></i>
										</div>
										<div class="row card-header"></div>
									</div>
								</div>
							</c:if>
							<!-- 보드색깔지정 : black -->
							<c:if test="${board.board_thema == 'black'}">
								<div class="col-12 col-md-6 col-lg-3 boardDIV" data-name="${board.board_Title}" 
								onclick="goBoardDetail(${board.board_id},'${board.board_Title}','${board.board_thema}',${wkid},'${wkname}')">
									<div class="card board" style="background-color:rgb(12, 12, 12);">
										<div class="row col-rg mr-2 mt-1 d-flex justify-content-between"
										style="text-align: right; display: table-cell;">
											<span class="ml-4" style="font-weight: bold;
											color:white;" onclick="boardRename()">${board.board_Title}</span>
											<i class="fa fa-times" aria-hidden="true" onclick="boardDelete(${board.board_id},${wkid})"
											style="color:white;"></i>
										</div>
										<div class="row card-header"></div>
									</div>
								</div>
							</c:if>
                        </c:forEach>
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