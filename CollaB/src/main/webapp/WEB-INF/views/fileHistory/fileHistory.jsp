<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main-content">
		<section class="section">

			<div class="row">
				<div class="col-12">
					<div class="card" style="height: 100vh;">
						<div class="section-body">
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
							<div class="card-body">
								<div class="tableTopMenu">
									<div class="tableTopMenu__left"></div>
									<div class="tableTopMenu__right">
										<!-- <select class="selectEl" name="" id="">
                          <option value="">제목</option>
                          <option value="">제목</option>
                        </select>
                        <input type="text" placeholder="이름 검색">
                        <button type="button">검색</button> -->
									</div>
								</div>


								<div class="clearfix mb-3"></div>

								<div class="table-responsive" style="text-align: center;">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>글번호</th>
												<th>타이틀</th>
												<th>날짜</th>
												<th>조회수</th>
											</tr>
										</thead>
										<tbody>
											<tr class="tableTr">
												<td>1</td>
												<td>최종프로젝트</td>
												<td>2022-03-06</td>
												<td>15</td>
											</tr>

										</tbody>
									</table>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>




		</section>
	</div>
</body>
<input type="hidden" id="hWorkspace_id"
	value="${workspace.workspace_id}">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	//워크프페이스 프로필이미지
	let name = $('#hWorkspace_id').val();

	$(function() {
	console.log(name)
		changeWKIMG(name);
	})
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
		} else {
			img.setAttribute("src",
					"resources/img/workspace_default_profile.png");
			img2.setAttribute("src",
					"resources/img/workspace_default_profile.png");
		}
	}
</script>
</html>