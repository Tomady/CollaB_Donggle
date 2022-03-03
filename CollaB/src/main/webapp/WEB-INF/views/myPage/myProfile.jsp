<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 수정</title>
<style>
    #addListBtn:hover{
      background-color: rgb(224, 224, 224);
      cursor: pointer;
    }

    .profileImg {
      height: 100px;
      width: 100px;
    }

    th {
      background-color: #FAFAFA;
      width: 200px;
    }

    .form-control {
      width: 300px;
    }
</style>
</head>
<body>

	<!-- Main Content -->
	<div class="main-content">
		<section class="section">
			<!-- 보드헤더 -->
			<div class="section-header d-flex justify-content-between">
				<h1>My Page</h1>
				<!-- 보드헤더 끝 -->
			</div>
			<!-- 보드바디 -->

			<div id="boardDetailBODY" class="section-body">
				<div class="card">
					<div class="card-header">
						<h4>
							<i class="far fa-user"></i> &nbsp; 프로필 수정
						</h4>
					</div>
					<div class="card-body">
						<form action="single-file" method="post" enctype="multipart/form-data" id="frm">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th>프로필사진</th>
										<td>
											<c:choose>
												<c:when test="${user_info.prof_pic == null }">
													<img src="/CollaB/resources/assets/img/avatar/avatar-1.png" alt="" class="profileImg my-2">
												</c:when>
												<c:when test="${not empty user_info.prof_pic }">
													<img src="${user_info.prof_pic }" alt="" class="profileImg my-2">
												</c:when>
											</c:choose>
											<input type="file" name="prof_pic">
										</td>
									</tr>
									<tr>
										<th>이름</th>
										<td><input type="text" class="form-control" name="name" id="name"
											value="${user_info.name }"></td>
									</tr>
									<tr>
										<th>닉네임</th>
										<td><input type="text" class="form-control" value="${user_info.nickname }" name="nickname" id="nickname"></td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" name="id" value="${user_info.id }">
						</form>
					</div>
					<div class="card-footer text-center">
						<button class="btn btn-primary" onclick="updateProfile()">적용하기</button>
					</div>
				</div>
			</div>

		</section>
	</div>
	
	<script>
		function updateProfile() {
            if($('#name').val().length==0){alert("이름을 입력하세요"); $('#name').focus(); return false; }
            if($('#nickname').val().length==0){alert("닉네임을 입력하세요"); $('#nickname').focus(); return false; }
            
            //window.alert("수정이 완료되었습니다.");
			//frm.submit();
		}
	</script>

</body>
</html>