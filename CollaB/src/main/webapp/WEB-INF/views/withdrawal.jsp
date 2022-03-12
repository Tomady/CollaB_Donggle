<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<!-- General CSS Files -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">

<!-- Template CSS -->
<link rel="stylesheet" href="resources/assets/css/style.css">
<link rel="stylesheet" href="resources/assets/css/components.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#addListBtn:hover {
	background-color: rgb(224, 224, 224);
	cursor: pointer;
}

label {
	color: black;
}

#Workspace_create:hover {
	cursor: pointer;
	color: red;
	text-decoration: underline;
}

#create_board {
	display: none;
	width: 30%;
	height: 70%;
	padding: 20px 60px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 4px;
}

#create_wk {
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

#modal-header {
	display: table-cell;
	vertical-align: middle;
	text-align: center;
}

#createboardBtn, #createWK {
	width: 100%;
}

.dropdown-item {
	cursor: pointer;
}

.modal_close_btn:hover {
	cursor: pointer;
}

#bkcolor:hover {
	cursor: pointer;
}
/*2.메인헤더배경색*/
.mainheaderBackground {
	background-color: rgb(199, 174, 247);
}
/*3.페이지바디배경색*/
.pagebodybackground {
	background-color: #ECE9FE;
}
</style>
</head>
<body class="pagebodybackground mr-5 sidebar-mini">
	<div id="app">
		<!-- create workspace 모달창 -->
		<div id="create_wk">
			<div class="card">
				<div id="modal-header" class="card-header">
					<h4>Create workspace</h4>
				</div>
				<div class="card-body">
					<div class="row form-group mt-3">
						<label>Workspace Name<span style="color: red;"> *</span></label> <input
							id="modal-workspace-title" type="text" class="form-control">
					</div>
					<div class="row buttons mt-3">
						<button class="mt-5 btn btn-icon icon-left btn-secondary"
							id="createWK" onclick="createWK()">Create</button>
					</div>
				</div>
			</div>
			<a class="modal_close_btn" onclick="closeWKModal()"> <i
				class="fa fa-times" aria-hidden="true"></i>
			</a>
		</div>
		<!-- 워크스페이스생성 모달창 of end -->

		<!-- create board 모달창 -->
		<div id="create_board">
			<div class="card">
				<div id="modal-header" class="card-header">
					<h4>Create board</h4>
				</div>
				<div class="card-body">
					<div class="row form-group mt-3">
						<label>Background</label>
						<div id="bkcolor" class="row ml-4 mt-2 mb-2">
							<div class="d-flex">
								<span id="red" class="bkcolor dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(247, 123, 123); margin-left: 5%;"></span>
								<span id="orange" class="bkcolor dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(252, 187, 127); margin-left: 5%;"></span>
								<span id="yellow" class="bkcolor dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(255, 245, 157); margin-left: 5%;"></span>
								<span id="green" class="bkcolor dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(86, 161, 111); margin-left: 5%;"></span>
								<span id="skyblue" class="bkcolor dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(123, 243, 247); margin-left: 5%;"></span>
								<span id="blue" class="bkcolor dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(121, 162, 250); margin-left: 5%;"></span>
							</div>
							<div class="d-flex mt-3">
								<span id="darkblue" class="bkcolor dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(123, 125, 247); margin-left: 5%;"></span>
								<span id="purple" class="bkcolor dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(171, 127, 252); margin-left: 5%;"></span>
								<span id="pink" class="bkcolor dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(250, 167, 243); margin-left: 5%;"></span>
								<span id="gray" class="bkcolor dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(184, 184, 184); margin-left: 5%;"></span>
								<span id="darkgray" class="bkcolor dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(116, 115, 115); margin-left: 5%;"></span>
								<span id="black" class="bkcolor dropdown-item"
									style="width: 3%; height: 50px; background-color: rgb(12, 12, 12); margin-left: 5%;"></span>
							</div>
						</div>
						<input id="modal-board-background" type="text"
							class="form-control" readonly>
					</div>
					<div class="row form-group mt-3">
						<label>Board Title<span style="color: red;"> *</span></label> <input
							id="modal-board-title" type="text" class="form-control">
					</div>
					<div class="row form-group mt-3">
						<label>Workspace</label> <select class="form-control"
							id="select-workspace">
							<c:forEach items="${myWorkspaceList}" var="workspace">
								<option value="${workspace.workspace_id}">${workspace.workspace_title}</option>
							</c:forEach>
						</select>
					</div>
					<div class="row buttons mt-3">
						<button class="mt-5 btn btn-icon icon-left btn-secondary"
							id="createboardBtn" onclick="createBoard()">Create</button>
					</div>
				</div>
			</div>
			<a class="modal_close_btn" onclick="closeModal()"> <i
				class="fa fa-times" aria-hidden="true"></i>
			</a>
		</div>
		<!-- 보드생성 모달창 of end -->

		<div class="main-wrapper">
			<div class="navbar-bg mainheaderBackground"></div>
			<!-- Main Header -->
			<nav
				class="navbar navbar-expand-lg main-navbar d-flex justify-content-between">
				<div class="col-lg d-flex justify-content">
					<div class="btn-group">
						<button class="btn dropdown-toggle" type="button"
							style="background-color: transparent; color: white;"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Workspaces</button>
						<div class="dropdown-menu">
							<div class="dropdown-title">Your Workspace 🎨</div>
							<!--사용자 워크스페이스 목록 뿌릴 때, id="mainHeadWork"+workspace.ID 지정해주기-->
							<c:forEach items="${myWorkspaceList}" var="workspace">
								<a class="dropdown-item"
									onclick="location.href='Boards?wkid=${workspace.workspace_id}'">${workspace.workspace_title}</a>
							</c:forEach>
						</div>
					</div>
					<div class="btn-group">
						<button class="btn dropdown-toggle" type="button"
							style="background-color: transparent; color: white;"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Recent</button>
						<div class="dropdown-menu">
							<div class="dropdown-title">History 🎡</div>
							<a class="dropdown-item" href="#">board_2</a> <a
								class="dropdown-item" href="#">board_1</a> <a
								class="dropdown-item" href="#">board_4</a>
						</div>
					</div>
					<div class="btn-group">
						<button class="btn dropdown-toggle" type="button"
							style="background-color: transparent; color: white;"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Create</button>
						<div class="dropdown-menu">
							<div class="dropdown-title">
								What do you want
								<p>to make? 🛠</p>
							</div>
							<a class="dropdown-item" onclick="create_workspaceModal()">CREATE
								WORKSPACE</a> <a class="dropdown-item" onclick="create_boardModal()">CREATE
								BOARD</a>
						</div>
					</div>
				</div>
				<ul class="navbar-nav navbar-right mr-5">
					<li class="dropdown"><a href="#" data-toggle="dropdown"
						class="nav-link dropdown-toggle nav-link-lg nav-link-user"> <img
							alt="image" src="resources/assets/img/avatar/avatar-1.png"
							class="rounded-circle mr-1">
							<div class="d-sm-none d-lg-inline-block">Hi, Circle</div></a>
						<div class="dropdown-menu dropdown-menu-right">
							<!--소연걸 : 마이페이지 메인 으로 주소걸어주기-->
							<a class="dropdown-item has-icon" href="myPageMain.do"> <i
								class="far fa-user"></i> Mypage
							</a>
							<div class="dropdown-divider"></div>
							<!--로그아웃처리 : 세션값삭제-->
							<a class="dropdown-item has-icon text-danger" href="logout.do">
								<i class="fas fa-sign-out-alt"></i> Logout
							</a>
						</div></li>
				</ul>
			</nav>
			<!-- sidebar -->
		      <div class="main-sidebar">
		        <aside id="sidebar-wrapper">
		          <ul class="sidebar-menu mt-3">
		            <li>
		            	<a class="nav-link fa fa-home" href="WorkspaceList"
		            	style="font-size:20px;"></a>
		            </li>
		          </ul>
		        </aside>
		      </div>
			<!-- Main Content -->
			<div class="main-content">
				<section class="section">
					<!-- 보드헤더 -->
					<div class="section-header d-flex justify-content-between">
						<h1>My Page</h1>
						<!-- 보드헤더 끝 -->
					</div>

					<!-- 보드바디 -->
					<div id="boardDetailBODY" class="section-body mt-5">
						<div class="card" style="height: 75vh;">
							<div class="card-header">
								<h4>Member Withdrawal</h4>
							</div>
							<div class="card-body ml-3 mt-2">
								<div class="section-title mt-0">탈퇴 안내</div>
								<p>
									회원 탈퇴를 신청하기 전에 꼭
									<mark>안내사항</mark>
									을 확인해주세요.
								</p>
								<br>
								<ul style="color:tomato; font-weight: bold;">
									<li>탈퇴한 아이디는 복구가 불가능합니다.</li>
									<li>탈퇴 후에는 데이터를 복구할 수 없습니다.</li>
								</ul>
								<br>
								<hr>
								<br>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox"
										id="inlineCheckbox1" value="option1"> <label
										class="form-check-label" for="inlineCheckbox1"> 안내사항을
										모두 확인하였으며, 이에 동의합니다. </label>
								</div>
							</div>
							<div class="card-footer text-center">
								<button class="btn btn-danger mb-5" id="withdrawBtn">PROCEED</button>
								<button class="btn btn-secondary mb-5 ml-2" onclick="location.href='myPageMain'">BACK</button>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>

	<script>
		// 탈퇴
		$('#withdrawBtn').on('click', function() {
			if (!$('#inlineCheckbox1').is(':checked')) {
				window.alert('탈퇴정책에 동의해주시기 바랍니다.');
				return;
			} else {
				if (confirm("정말 탈퇴하시겠습니까?")) {
					//탈퇴
					$.ajax({
						url : '/CollaB/userDelete',
						type : 'get',
						success : function(data) {
							console.log(data);
							if (data.trim() === 'Y') {
								alert("탈퇴가 완료되었습니다.")
								location.href = "/CollaB/";
							} else if (data.trim() === 'F') {
								alert("에러가 발생하였습니다.")
							}
						},
						error : function(data) {
							console.log(data);
						}
					})
				}
			}
		})
	</script>

	<!-- General JS Scripts -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	<script src="resources/assets/js/stisla.js"></script>

	<!-- Template JS File -->
	<script src="resources/assets/js/scripts.js"></script>
	<script src="resources/assets/js/custom.js"></script>

	<!-- mypage header -->
	<script src="resources/js/mypage/mypage_header.js"></script>
</body>
</html>