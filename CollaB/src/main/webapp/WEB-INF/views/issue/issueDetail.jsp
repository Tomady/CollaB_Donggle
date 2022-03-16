<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이슈 글 상세</title>
<!-- 제이쿼리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- icon -->
<script type="module"
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

<style>
#btnGroup {
	margin-left: 45%;
}

#insertBtn {
	background-color: #9F90D9;
	border: 1px solid #9F90D9;
}

#insertBtn:hover, #insertBtn:focus {
	background-color: #6553C1 !important;
}

#cancelBtn {
	background-color: white;
	border: 1px solid #9F90D9;
	color: #6553C1;
}

#cancelBtn:hover, #cacelBtn:focus {
	background-color: white !important;
	border: 1px solid #6553C1 !important;
	color: #6553C1 !important;
}

.wkimg-body {
	width: 60px;
	height: 60px;
	border-radius: 5px;
	border: 3px solid rgb(228, 227, 227);
}

/* 글 내용*/
.profile-widget .profile-widget-description {
	width: 90%;
	margin: 30px auto;
}

.profile-widget-description {
	display: flex;
}

.issue-content {
	width: 50%;
	white-space: pre;
}
.progress-bar{
	background-color: red !important;
}

/* 이슈리스트 */
#accordion {
	width: 40%;
}

.accordion .accordion-header {
	border: #e4e6fc 1px solid;
	color: #9F90D9;
	background-color: #e4e6fc;
}

.accordion .accordion-header:hover {
	background-color: #6553C1;
	color: white;
}

.accordion .accordion-header[aria-expanded="true"] {
	background-color: #6553C1;
}

.items li {
	list-style: none;
}

.chkbox {
	margin-right: 10px;
}

/* 댓글 */
.form-group {
	width: 100%;
}

.form-control {
	width: 60%;
}

.reply-box {
	display: flex;
	margin-left: 25%;
}
.replyWrap{
	width: 550px;
	margin: auto;
	margin-bottom: 20px;
}
#writer{
	width: 200px;
	margin: 10px;
}

#myReplyBtn{
	float: right;
}
#replyBtn {
	background-color: #9F90D9;
	border: 1px solid #9F90D9;
}

#insertBtn:hover, #insertBtn:focus {
	background-color: #6553C1 !important;
}
.text-center{
	text-align: left !important;
}
#replyDel{
	border: none;
	background: transparent;
}
#nickname{
	font-size: 18px;
    font-weight: bold;
    margin-left: 10px;
    margin-top: 10px;
}

#replyDel, #replyDate{
	font-size: 12px;
	float: right;
	padding-top: 10px;
	color: gray;
}


</style>
</head>
<body style="background-color: #ECE9FE;">
	<!-- Main Content -->
	<div class="main-content">
		<section class="section">
			<div class="section-body">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<div class="card-header d-flex justify-content-center"
									style="text-align: center;">
									<div id="workspace-body"
										class="card-body col-lg-3 mt-5 mb-5 d-flex justify-content-center">
										<div class="row workspaceNAME">
											<img class="img-fluid mr-2 mt-2 wkimg-body">
											<h3 class="mt-4" id="WsName"
												data-wkid="${workspace.workspace_id}">${workspace.workspace_title}</h3>
										</div>
									</div>
								</div>
								<a href="javascript:window.history.back();">
									<ion-icon name="arrow-back"></ion-icon> 
									BACK
								</a>
								<div class="card profile-widget">
									<div class="profile-widget-header">
										<div class="profile-widget-items">
											<div class="profile-widget-item">
												<div class="profile-widget-item-label">카테고리</div>
												<div class="profile-widget-item-value">${issue.issueCategory }</div>
											</div>
											<div class="profile-widget-item">
												<div class="profile-widget-item-label">글제목</div>
												<div class="profile-widget-item-value">${issue.issueTitle }</div>
											</div>
											<div class="profile-widget-item">
												<div class="profile-widget-item-label">작성자</div>
												<div class="profile-widget-item-value">${issue.id }</div>
											</div>
										</div>
									</div>
									<div class="profile-widget-description pb-0">
										<div class="issue-content">${issue.issueContent }</div>
										<div id="accordion">
											<div class="accordion">
												<div class="accordion-header" role="button"
													data-toggle="collapse" data-target="#panel-body-1">
													<h4>${checkList.checklist_title}</h4>
												</div>
												<div class="accordion-body collapse show" id="panel-body-1"
													data-parent="#accordion">
													<div class="items">
														<ul>
															<c:forEach items="${itemList }" var="item">
																<li>
																	<span class="chkbox">
																		<c:if test="${item.item_status eq 'Y' }">
																			<input type="checkbox" checked>
																		</c:if>
																		<c:if test="${item.item_status eq 'N' }">
																			<input type="checkbox">
																		</c:if>
																	</span>${item.item_title }
																</li>
															</c:forEach>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
									<c:if test="${issue.id == id }">
										<div id="btnGroup">
											<button type="button" class="btn btn-primary" id="insertBtn"
												onclick="location.href='goIssueUpdate.do?issueId=${issue.issueId}&workspace_id=${workspace.workspace_id}'">수정</button>
											<button type="button" class="btn btn-primary" id="cancelBtn"
												onclick="issueDelete('${issue.issueId}')">삭제</button>
										</div>
									</c:if>
									<br>
								</div>

								<!-- 댓글 -->
								<div class="card-footer text-center pt-0">
									<div class="form-group">
										<div class="reply-box">
											<input type="text" class="form-control" id="replyContent"
												placeholder="댓글을 입력해주세요." style="margin-right: 20px;" onkeyup="replyEnter()">
											<button class="btn btn-primary" id="replyBtn">등록</button>
										</div>
									</div>
									
									<c:forEach items="${reply }" var="re">
										<div class="replyWrap">
											<span id="writer">
												<span id="profPic">
													<c:if test="${not empty re.prof_pic  }">
														<img src="${re.prof_pic }" width="40px;" height="40px;" style="border-radius: 70%;">
													</c:if>													
													
													<c:if test="${empty re.prof_pic }">
														<img src="resources/img/noprof.png" width="40px;" height="40px;" style="border-radius: 70%;">
													</c:if>
												</span>
												<span id="nickname" data-replyid="${re.replyid }">${re.nickname }</span>
											</span>
												<span id="comment">${re.replycomment }</span>
											
												<span id="replyDate">${re.replydate }</span>

											<c:if test="${re.id == id}">
												<button id="replyDel"><ion-icon name="trash-outline"></ion-icon></button>
											</c:if>
										</div>
									</c:forEach>
								</div>
								
							</div>
						</div>
					</div>
		</section>
	</div>

	<script type="text/javascript">
	
		// 댓글 등록 ajax
		$("#replyBtn").click(function(){
			$.ajax({
				url : "AjaxIssueReply",
				type : "POST",
				data : {
					  replycomment : $("#replyContent").val()
					, issueid : ${issue.issueId}
				},
				dataType : "text",
				success : function(result){
					if(result == "true"){
						console.log("등록 성공");
						location.reload();
					}else{
						console.log("안 됐 다");
					}
				},
			
			})
		});
		function replyEnter(){
			if(window.event.keyCode == 13){
				$.ajax({
					url : "AjaxIssueReply",
					type : "POST",
					data : {
						  replycomment : $("#replyContent").val()
						, issueid : ${issue.issueId}
					},
					dataType : "text",
					success : function(result){
						if(result == "true"){
							console.log("등록 성공");
							location.reload();
						}else{
							console.log("안 됐 다");
						}
					},
				
				})
			}
		}
		
		// 댓글 삭제 ajax
		$("#replyDel").click(function(){
			let replyid = $("#nickname").data('replyid');
			console.log(replyid);
			
			$.ajax({
				url : "AjaxDelReply",
				type : "post",
				data : { 
					replyid : replyid
				},
				dataType : "text",
				success : function(result){
					if(result == "true"){
						console.log("삭제 완료");
						location.reload();
					}else{
						console.log("댓글 삭제 실패");
					}
				}
			})
			
		});
		
	
		// 체크박스 체크 방지
		$(document).ready(function func() {
			$("input[type=checkbox]").bind("click", false);
		});

		// 삭제 ajax function
		function issueDelete(issueId) {
			console.log(issueId);

			$.ajax({
				url : "issueDelete.do",
				type : "post",
				data : {
					issueid : issueId
				},
				dataType : "text",
				success : function(data) {
					if (data == "true") {
						alert("✔ 삭제 완료");
						location.href = "issueBoard.do?workspace_id=" + $
						{
							workspace.workspace_id
						}
						;
					}
				},
				error : function() {
					alert("⁉ 삭제 실패");
				}
			})
		}

		$(function() {
			let name = "${workspace.workspace_title}";
			changeWKIMG(name);
		})

		//워크프페이스 프로필이미지
		function changeWKIMG(newWKname) {
			let name = newWKname.substring(0, 1);
			let img = document.querySelector(".wkimg");
			let img2 = document.querySelector(".wkimg-body");
			if (name == 'a' || name == 'A') {
				img.setAttribute("src", "resources/img/a.jpg");
				img2.setAttribute("src", "resources/img/a.jpg");
			} else if (name == 'b' || name == 'B') {
				img.setAttribute("src", "resources/img/b.jpg");
				img2.setAttribute("src", "resources/img/b.jpg");
			} else if (name == 'c' || name == 'C') {
				img.setAttribute("src", "resources/img/c.jpg");
				img2.setAttribute("src", "resources/img/c.jpg");
			} else if (name == 'd' || name == 'D') {
				img.setAttribute("src", "resources/img/d.jpg");
				img2.setAttribute("src", "resources/img/d.jpg");
			} else if (name == 'e' || name == 'E') {
				img.setAttribute("src", "resources/img/e.jpg");
				img2.setAttribute("src", "resources/img/e.jpg");
			} else if (name == 'f' || name == 'F') {
				img.setAttribute("src", "resources/img/f.jpg");
				img2.setAttribute("src", "resources/img/f.jpg");
			} else if (name == 'g' || name == 'G') {
				img.setAttribute("src", "resources/img/g.jpg");
				img2.setAttribute("src", "resources/img/g.jpg");
			} else if (name == 'h' || name == 'H') {
				img.setAttribute("src", "resources/img/h.jpg");
				img2.setAttribute("src", "resources/img/h.jpg");
			} else if (name == 'i' || name == 'I') {
				img.setAttribute("src", "resources/img/i.jpg");
				img2.setAttribute("src", "resources/img/i.jpg");
			} else if (name == 'j' || name == 'J') {
				img.setAttribute("src", "resources/img/j.jpg");
				img2.setAttribute("src", "resources/img/j.jpg");
			} else if (name == 'k' || name == 'K') {
				img.setAttribute("src", "resources/img/k.jpg");
				img2.setAttribute("src", "resources/img/k.jpg");
			} else if (name == 'l' || name == 'L') {
				img.setAttribute("src", "resources/img/l.jpg");
				img2.setAttribute("src", "resources/img/l.jpg");
			} else if (name == 'm' || name == 'M') {
				img.setAttribute("src", "resources/img/m.jpg");
				img2.setAttribute("src", "resources/img/m.jpg");
			} else if (name == 'n' || name == 'N') {
				img.setAttribute("src", "resources/img/n.jpg");
				img2.setAttribute("src", "resources/img/n.jpg");
			} else if (name == 'o' || name == 'O') {
				img.setAttribute("src", "resources/img/o.jpg");
				img2.setAttribute("src", "resources/img/o.jpg");
			} else if (name == 'p' || name == 'P') {
				img.setAttribute("src", "resources/img/p.jpg");
				img2.setAttribute("src", "resources/img/p.jpg");
			} else if (name == 'q' || name == 'Q') {
				img.setAttribute("src", "resources/img/q.jpg");
				img2.setAttribute("src", "resources/img/q.jpg");
			} else if (name == 'r' || name == 'R') {
				img.setAttribute("src", "resources/img/r.jpg");
				img2.setAttribute("src", "resources/img/r.jpg");
			} else if (name == 's' || name == 'S') {
				img.setAttribute("src", "resources/img/s.jpg");
				img2.setAttribute("src", "resources/img/s.jpg");
			} else if (name == 't' || name == 'T') {
				img.setAttribute("src", "resources/img/t.jpg");
				img2.setAttribute("src", "resources/img/t.jpg");
			} else if (name == 'u' || name == 'U') {
				img.setAttribute("src", "resources/img/u.jpg");
				img2.setAttribute("src", "resources/img/u.jpg");
			} else if (name == 'v' || name == 'V') {
				img.setAttribute("src", "resources/img/v.jpg");
				img2.setAttribute("src", "resources/img/v.jpg");
			} else if (name == 'w' || name == 'W') {
				img.setAttribute("src", "resources/img/w.jpg");
				img2.setAttribute("src", "resources/img/w.jpg");
			} else if (name == 'x' || name == 'X') {
				img.setAttribute("src", "resources/img/x.jpg");
				img2.setAttribute("src", "resources/img/x.jpg");
			} else if (name == 'y' || name == 'Y') {
				img.setAttribute("src", "resources/img/y.jpg");
				img2.setAttribute("src", "resources/img/y.jpg");
			} else if (name == 'z' || name == 'Z') {
				img.setAttribute("src", "resources/img/z.jpg");
				img2.setAttribute("src", "resources/img/z.jpg");
			} else if (name == '0') {
				img.setAttribute("src", "resources/img/0.jpg");
				img2.setAttribute("src", "resources/img/0.jpg");
			} else if (name == '1') {
				img.setAttribute("src", "resources/img/1.jpg");
				img2.setAttribute("src", "resources/img/1.jpg");
			} else if (name == '2') {
				img.setAttribute("src", "resources/img/2.jpg");
				img2.setAttribute("src", "resources/img/2.jpg");
			} else if (name == '3') {
				img.setAttribute("src", "resources/img/3.jpg");
				img2.setAttribute("src", "resources/img/3.jpg");
			} else if (name == '4') {
				img.setAttribute("src", "resources/img/4.jpg");
				img2.setAttribute("src", "resources/img/4.jpg");
			} else if (name == '5') {
				img.setAttribute("src", "resources/img/5.jpg");
				img2.setAttribute("src", "resources/img/5.jpg");
			} else if (name == '6') {
				img.setAttribute("src", "resources/img/6.jpg");
				img2.setAttribute("src", "resources/img/6.jpg");
			} else if (name == '7') {
				img.setAttribute("src", "resources/img/7.jpg");
				img2.setAttribute("src", "resources/img/7.jpg");
			} else if (name == '8') {
				img.setAttribute("src", "resources/img/8.jpg");
				img2.setAttribute("src", "resources/img/8.jpg");
			} else if (name == '9') {
				img.setAttribute("src", "resources/img/9.jpg");
				img2.setAttribute("src", "resources/img/9.jpg");
			}
		}
	</script>
</body>
</html>