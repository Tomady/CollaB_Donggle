<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정</title>
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
						<h4>정보 수정</h4>
					</div>
					<div class="card-body">
						<div class="div-table">
							<table class="table table-bordered">
								<tr>
									<th>연락처</th>
									<td>
										<div class="input-group">
											<div class="input-group-prepend">
												<div class="input-group-text">
													<i class="fas fa-phone"></i>
												</div>
											</div>
											<input type="text" class="form-control phone-number"
												value="010-1111-1111">
										</div>
									</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>
										<div class="input-group">
											<div class="input-group-prepend">
												<div class="input-group-text">
													<i class="fas fa-envelope"></i>
												</div>
											</div>
											<input type="text" class="form-control" value="ask@yedam.ac">
										</div>
									</td>
								</tr>
								<tr>
									<th>회사</th>
									<td>
										<div class="input-group">
											<div class="input-group-prepend">
												<div class="input-group-text">
													<i class="fas fa-laptop"></i>
												</div>
											</div>
											<input type="text" class="form-control phone-number"
												value="예담">
										</div>
									</td>
								</tr>
							</table>
						</div>
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