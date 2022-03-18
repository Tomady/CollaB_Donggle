<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이슈 수정</title>
<!-- 제이쿼리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- icon -->
<script type="module"
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>


<style>
.wkimg-body {
	width: 60px;
	height: 60px;
	border-radius: 5px;
	border: 3px solid rgb(228, 227, 227);
}
/* 수정 취소 버튼 */
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

/* 이슈 리스트 */
.items li {
	list-style: none;
	margin-top: 10px;
}

.plus {
	cursor: pointer;
	font-size: 13px;
	vertical-align: sub;
}

#addadd {
	margin: 20px auto;
	width: 40%;
}

.checkbox {
	margin-right: 10px;
}

/* 폼 */
.form-group>label {
	font-size: 16px;
	padding-top: 10px;
}

textarea {
	height: 10em;
}

#accordion {
	margin-left: 15px;
	width: 50%;
}

.accordion .accordion-header {
	background-color: #9F90D9;
	color: white;
}

.accordion .accordion-header:hover {
	background-color: #6553C1;
}

.accordion .accordion-header[aria-expanded="true"] {
	background-color: #6553C1;
}

.text-blank {
	border: 1px solid #e4e6fc;
	border-radius: 5px;
	width: 80%;
	height: 35px;
	font-size: 13px;
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
							<div class="card-header">
								<h3 style="color: #6553C1;">이슈 수정</h3>
							</div>
							<form id="frm" method="post">
								<div class="card-body">
									<div class="form-group row mb-4">
										<label
											class="col-form-label text-md-right col-12 col-md-3 col-lg-3">제목</label>
										<div class="col-sm-12 col-md-7">
											<input type="text" class="form-control" value="${issue.issueTitle }" name="issueTitle">
											<input type="hidden" name="issueId" value="${issue.issueId }">
										</div>
									</div>
									<div class="form-group row mb-4">
										<label
											class="col-form-label text-md-right col-12 col-md-3 col-lg-3">카테고리</label>
										<div class="col-sm-12 col-md-7">
											<select class="form-control selectric"
												value="${issue.issueCategory }" name="issueCategory">
												<option>Tech</option>
												<option>News</option>
												<option>Political</option>
											</select>
										</div>
									</div>
									<div class="form-group row mb-4">
										<label
											class="col-form-label text-md-right col-12 col-md-3 col-lg-3">내용</label>
										<div class="col-sm-12 col-md-7">
											<textarea style="width: inherit; background-color: #fdfdff; border-color: #e4e6fc;"
												name="issueContent">${issue.issueContent }</textarea>
										</div>
									</div>
									<div class="form-group row mb-4">
										<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">이슈리스트</label>
										<div id="accordion">
											<div class="profile-widget-description pb-0">
												<div class="accordion">
													<div class="accordion-header" role="button" data-toggle="collapse" data-target="#panel-body-1">
														<h4>${checkList.checklist_title}</h4>
													</div>
													<div class="accordion-body collapse show" id="panel-body-1" data-parent="#accordion">
														<div class="items">
															<ul>
																<c:forEach items="${itemList }" var="item">
																	<li>
																		<span class="chkbox">
																		<c:if test="${item.item_status eq 'Y' }">
																			<input type="checkbox" class="itemchk" name="itemchk" value="" checked>																		
																		</c:if>
																		<c:if test="${item.item_status eq 'N' }">
																			<input type="checkbox" class="itemchk" name="itemchk" value="">
																		</c:if>
																		<input type="hidden" id="item_status" name="item_status" class="item_status" value="${item.item_status }">
																		<input type="hidden" id="item_id" name="item_id" class="item_id" value="${item.item_id }">
																	</span>${item.item_title }</li>
																</c:forEach>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- end of accordion-->
									</div>
								</div>
								<div id="btnGroup">
									<button type="button" class="btn btn-primary" id="insertBtn">수정</button>
									<button class="btn btn-primary" id="cancelBtn">취소</button>
								</div>
							</form>
							<br> <br>
						</div>
					</div>
				</div>
			</div>
	</div>
	</section>
	</div>


	<script>
    // 이슈리스트 아이템 추가
    function item_add(){
      let ul = event.target.closest("ul");
      let li = document.createElement("li");
      let input = ul.firstChild;
      li.innerHTML = '<input type="checkbox" class="checkbox">' + input.value;
      ul.append(li);
      input.value = '';
    }


    // 수정, 취소 버튼 클릭 	
    $(function() {
		$("#insertBtn").click(function() {
			// 체크박스 값 받아오기
			let itemchk = $(".itemchk");
			
			for(let i=0; i<itemchk.length; i++){
				console.log(itemchk[i].checked);
				
				if(itemchk[i].checked) {
					itemchk[i].nextSibling.nextSibling.value = 'Y';
				} else {
					itemchk[i].nextSibling.nextSibling.value = 'N';
				}
			}
			
			// 아이템 아이디 받아오기
			let item_id = $(".item_id");
			console.log(item_id);
			
			for(let i=0; i<item_id.length; i++) {
				console.log(item_id[i].value);
			}
			
			frm.action = "issueUpdate.do";
			frm.submit();			
		});
		
		$("#cancelBtn").click(function() {
			location.href = "issueBoard.do";

		});		
	});
    
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