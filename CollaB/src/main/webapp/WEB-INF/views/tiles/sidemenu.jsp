<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.wkimg{
      width: 40px; 
      height: 40px;
      border-radius: 3px; 
      border: 2px solid rgb(228, 227, 227);
    }
</style>
</head>
<body style="background-color: #ECE9FE; overflow:scroll; overflow-x:hidden;">
	<div id="app">
    <div class="main-wrapper">
      <!-- Main Sidebar -->
      <div class="main-sidebar">
        <aside id="sidebar-wrapper">
          <div class="sidebar-brand mt-4">
            <a href="WorkspaceList"><img src="resources/img/logo222.png" width="120px;"></a>
          </div>
          <ul class="sidebar-menu">
          	<li class="menu-header mt-4 mb-1">workspace</li>
            <li class="d-flex justify-content-between">
	           	<a class="nav-link"><img class="img-fluid wkimg mr-1">
            	<span class="sidebar_workspace${workspace.workspace_id}">&nbsp;&nbsp;${workspace.workspace_title}</span></a>
            </li>
            <li class="menu-header">MENU</li>
            <li>
              <a class="nav-link" href="Boards?wkid=${workspace.workspace_id}">
                <i class="fas fa-columns"></i>
                <span>Boards</span>
              </a>
            </li>
            <li>
              <a class="nav-link" href="memberPage.do">
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
            <li class="menu-header">Your Workspaces</li>
            <c:forEach items="${workspaceList}" var="workspace">
            	<li>
            		<a class="nav-link" href="Boards?wkid=${workspace.workspace_id}">
            		<span class="sidebar_workspace${workspace.workspace_id}">&nbsp;&nbsp;${workspace.workspace_title}</span></a>
            	</li>
            </c:forEach>
            <c:if test="${boardStar ne null}">
            <li class="menu-header">Your Boards</li>
            <c:forEach items="${boardStar}" var="starBoard">
            	<li>
            	  <a class="nav-link d-flex justify-content-between sidebar_boardStar${starBoard.board_id}" href="boardDetail?boardID=${starBoard.board_id}">
	                <span class="sidebar_board${starBoard.board_id}">&nbsp;&nbsp;${starBoard.board_Title}</span>
	                <span class="sidebarstar${starBoard.board_id} fas fa-star col-rg text-right" style="color:yellow;"></span>
	              </a>
            	</li>
            </c:forEach>
            <c:forEach items="${unStarBoards}" var="board">
	            <li>
	              <a class="nav-link d-flex justify-content-between sidebar_boardStar${board.board_id}" href="boardDetail?boardID=${board.board_id}">
	                <span class="sidebar_board${board.board_id}">&nbsp;&nbsp;${board.board_Title}</span>
	              </a>
	            </li>
            </c:forEach>
            </c:if>
          </ul>
        </aside>
      </div>
    </div>
  </div>
</body>
</html>