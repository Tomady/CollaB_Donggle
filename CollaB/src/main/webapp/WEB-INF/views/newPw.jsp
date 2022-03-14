<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change the PW</title>
<!-- General CSS Files -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">

<!-- Template CSS -->
<link rel="stylesheet" href="resources/assets/css/style.css">
<link rel="stylesheet" href="resources/assets/css/components.css">
<style>
#addListBtn:hover {
	background-color: rgb(224, 224, 224);
	cursor: pointer;
}

th {
	width: 200px;
	background-color: #FAFAFA;
}

.form-control, .input-group {
	width: 400px;
}

.input-group-text {
	width: 45px;
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
							<div class="d-sm-none d-lg-inline-block">Hi, ${nickname}</div></a>
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
								<h4>Change the password</h4>
							</div>
							<div class="card-body">
								<div class="div-table">
									<form action="pwUpdate" method="post" id="frm">
										<table class="table table-bordered mt-3 ml-1">
										<!-- <tr>
						                        <th>기존 비밀번호</th>
						                        <td>
						                          <div class="input-group">
						                            <div class="input-group-prepend">
						                              <div class="input-group-text">
						                                <i class="fas fa-lock"></i>
						                              </div>
						                            </div>
						                            <input type="password" class="form-control pwstrength" data-indicator="pwindicator"
						                              name="oldPw">
						                          </div>
						                        </td>
						                      </tr> -->
											<tr>
												<th>New Password</th>
												<td>
													<div class="input-group">
														<div class="input-group-prepend">
															<div class="input-group-text">
																<i class="fas fa-lock"></i>
															</div>
														</div>
														<input type="password" class="form-control phone-number"
															name="password">
													</div>
												</td>
											</tr>
											<tr>
												<th>Confirm Password</th>
												<td>
													<div class="input-group">
														<div class="input-group-prepend">
															<div class="input-group-text">
																<i class="fas fa-lock"></i>
															</div>
														</div>
														<input type="password" class="form-control"
															name="pwConfirm">
													</div>
												</td>
											</tr>
										</table>
										<input type="hidden" name="id" value="${user_info.id }">
										<input type="hidden" name="oldPwConfirm"
											value="${user_info.password }">
									</form>
								</div>
							</div>
							<div class="card-footer text-center">
								<button class="btn btn-primary mb-5" onclick="pwUpdate()">SAVE</button>
								<button class="btn btn-secondary mb-5 ml-2" onclick="location.href='myPageMain'">BACK</button>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>


	<script>
		function pwUpdate() {
			let pw = document.getElementsByName('password');
			let pwConfirm = document.getElementsByName('pwConfirm');

			// 비밀번호 확인
			if (pw[0].value != pwConfirm[0].value) {
				window.alert('비밀번호 확인이 틀렸습니다.');
				return;
			}

			if (pw[0].value == '') {
				window.alert('새 비밀번호를 입력하세요.')
			}

			window.alert('비밀번호 변경이 완료되었습니다.')
			frm.submit();
		}
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