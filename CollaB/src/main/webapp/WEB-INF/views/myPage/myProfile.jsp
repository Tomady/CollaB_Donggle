<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

    .eximg {
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
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th>프로필사진</th>
									<td><img src="/CollaB/resources/assets/img/example-image.jpg" alt=""
										class="eximg mt-2"><br> <input type="file" name=""
										id="" class="my-2"></td>
								</tr>
								<tr>
									<th>이름</th>
									<td><input type="text" class="form-control" name="" id=""
										value="박소연"></td>
								</tr>
								<tr>
									<th>닉네임</th>
									<td><input type="text" class="form-control" value="sy"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="card-footer text-center">
						<button class="btn btn-primary">적용하기</button>
					</div>
				</div>
			</div>

		</section>
	</div>

</body>
</html>