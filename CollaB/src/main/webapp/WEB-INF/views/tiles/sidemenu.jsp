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
<body>
	<div id="app">
    <div class="main-wrapper">
      <!-- Main Sidebar -->
      <div class="main-sidebar">
        <aside id="sidebar-wrapper">
          <div class="sidebar-brand">
            <a href="#">Colla B</a>
          </div>
          <ul class="sidebar-menu">
          	<li class="menu-header mt-4 mb-1">workspace</li>
            <li class="d-flex justify-content-between">
	           	<table class="mb-1 ml-3" style="cursor:pointer;">
	           		<tbody>
	           			<tr>
	           				<td><img class="img-fluid wkimg mr-1"></td>
	           				<td><h4 class="sidebar_wkname">${workspace.workspace_title}</h4></td>
	           			</tr>
	           		</tbody>
	           	</table>
            </li>
            <li class="menu-header">MENU</li>
            <li>
              <a class="nav-link" href="#">
                <i class="fas fa-columns"></i>
                <span>Boards</span>
              </a>
            </li>
            <li>
              <a class="nav-link" href="#">
                <i class="far fa-user"></i>
                <span>Members</span>
              </a>
            </li>
            <li>
              <a class="nav-link" href="issueBoard.do">
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
            	<a class="nav-link" href="#">
                	<span class="ml-3" style="color:black; font-size:17px;"> ${workspace.workspace_title}</span>
              	</a>
            </c:forEach>
            <li class="menu-header">Your Boards</li>
            <li>
              <a class="nav-link" href="#">
                <span> [board 1]</span>
              </a>
            </li>
            <li>
              <a class="nav-link" href="#">
                <span> [board 2]</span>
              </a>
            </li>
          </ul>
        </aside>
      </div>
    </div>
  </div>
</body>
</html>