<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		.off-screen {
			display: none;
		}

		#pagebtn {
			width: 500px;
			text-align: center;
			margin: 0 auto;
			height: 50px;
			line-height: 60px;
			padding: 200px;
		}

		#pagebtn a {
			all: initial;
			display: inline-block;
			margin-right: 10px;
			border-radius: 3px;
			border: none;
			font-family: Tahoma;
			background: #f9fafe;
			color: #000;
			text-decoration: none;
			height: 40px;
			width: 40px;
			text-align: center;
			line-height: 40px;
			transition: all .5s;
		}

		#pagebtn a:hover {
			background-color: #6553C1;
		}

		#pagebtn a.active {
			background: #6553C1;
			color: #fff;
		}

		.tr_off {
			display: none;
		}
	</style>
</head>

<body>
	<div class="main-content">
		<section class="section">
			<div class="row">
				<div class="col-12">
					<div class="card" style="">
						<div class="section-body">
							<div class="card-header d-flex justify-content-center" style="text-align: center;">
								<div id="workspace-body"
									class="card-body col-lg-3 mt-5 mb-5 d-flex justify-content-center">
									<div class="row workspaceNAME">
										<img class="img-fluid mr-2 mt-2 wkimg-body">
										<h3 class="mt-4" id="WsName" data-wkid="${workspace.workspace_id}">
											${workspace.workspace_title}</h3>
									</div>
								</div>
							</div>
							<div class="card-body">
								<div class="tableTopMenu">
									<div class="tableTopMenu__left"></div>
									<div class="tableTopMenu__right">
										<!-- 
										<select class="selectEl" name="" id="">
											<option value="">제목</option>
											<option value="">제목</option>
										</select>
										<input type="text" placeholder="이름 검색">
										<button type="button">검색</button>
										-->
									</div>
								</div>

								<div class="clearfix mb-3"></div>
								<div class="table-responsive" style="text-align: center;">
									<table class="table table-striped">
										<thead>
											<tr>
												<th width="">파일이름</th>
												<th>카드이름</th>
												<th width="">날짜</th>
												<th width="">조회수</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${fileInfoList }" var="fileInfo">												
												<tr class="" data-cardid="${fileInfo.card_id }">
													<td class="filehistory__title">${fileInfo.file_name }</td>
													<td>${fileInfo.card_title }</td>
													<td>${fileInfo.file_upload_date }</td>
													<td>${fileInfo.file_hits }</td>
													<td><button class="btn btn-dark" type="button" onclick="location.href='fileDownLoad?file_name=${fileInfo.file_name}&pfile_name=${fileInfo.pfile_name}'">Download</button></td>
												</tr>
												
												<c:forEach items="${filehistory }" var="fileHi">
													<c:if test="${fileInfo.card_id eq fileHi.card_id }">
														<tr class="tr_off" data="${fileHi.card_id }">
															<td style="text-align: right;">${fileHi.pre_file }</td>
															<td>${fileHi.card_title }</td>
															<td>${fileHi.upload_date }</td>
															<td>${fileHi.file_hits }</td>
															<td><button class="btn btn-secondary" type="button" onclick="location.href='fileDownLoad?file_name=${fileHi.pre_file}&pfile_name=${fileHi.pfile_name}'">Download</button>
															</td>
														</tr>
													</c:if>									
												</c:forEach>
											</c:forEach>											
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
<input type="hidden" id="hWorkspace_id" value="${workspace.workspace_id}">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	$('.filehistory__title').on("click", function (e) {
		let trTitle = $(event.target).parent().attr("data-cardid")
		let all = $('[data="' + trTitle + '"').toggle();
	})

	//워크프페이스 프로필이미지
	let name = $('#hWorkspace_id').val();

	$(function () {
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

	// 수정할 부분 있어서 일단 주석처리 했습니다!
	// 	var pagenumber = 3
	// 	var pageCount = 5
	// 	var currentPage = 1;

	// 	function page(pagenumber, pageCount, currentPage) {
	// 		console.log(currentPage);
	// 		var tableEl = $('.table-striped');

	// 		var tr = tableEl.find('tbody tr');
	// 		var trtotal = tr.length;

	// 		var pagetotal = Math.ceil(trtotal / pagenumber);
	// 		var pageGroup = Math.ceil(currentPage / pageCount);

	// 		var last = pageGroup * pageCount;
	// 		if (last > pagetotal)
	// 			last = pagetotal;
	// 		var first;

	// 		if (last % pageCount == 0) {
	// 			first = last - (pageCount - 1);
	// 		} else {
	// 			first = last + 1 - last % pageCount
	// 		}

	// 		var next = last + 1;
	// 		var prev = first - 1;

	// 		$('#pagebtn').remove();
	// 		tableEl.after('<div id="pagebtn">');
	// 		if (prev > 0) {
	// 			$('<a href="#"></a>').attr('data', 'prev').html("<").appendTo(
	// 					'#pagebtn');
	// 		}

	// 		for (let i = first; i <= last; i++) {
	// 			$('<a href="#"></a>').attr('data', i).html(i).appendTo('#pagebtn');
	// 		}
	// 		if (last < pagetotal) {
	// 			$('<a href="#"></a>').attr('data', 'next').html(">").appendTo(
	// 					'#pagebtn');
	// 		}
	// 		var paginglink = $('#pagebtn a');
	// 		paginglink.removeClass('active');
	// 		$("[data=" + currentPage + "]").addClass("active")
	// 		var startval = (currentPage - 1) * pagenumber;
	// 		var endval = startval + pagenumber;

	// 		tr.css('opacity', '0.0').addClass('off-screen').slice(startval, endval)
	// 				.removeClass('off-screen').animate({
	// 					opacity : 1
	// 				}, 500);

	// 		paginglink.on('click', function(e) {
	// 			e.preventDefault();
	// 			var thisval = $(this);
	// 			var data = thisval.attr("data");
	// 			var selectedPage = thisval.text();
	// 			if (data == "next")
	// 				selectedPage = next;
	// 			if (data == "prev")
	// 				selectedPage = prev;

	// 			page(pagenumber, pageCount, selectedPage);

	// 		});

	// 	}
	// 	page(pagenumber, pageCount, currentPage);
</script>

</html>