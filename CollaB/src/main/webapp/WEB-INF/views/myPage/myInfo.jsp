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
							<form action="/CollaB/myInfoUpdate" method="post" id="frm">
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
													id="tel" name="tel" value="${user_info.tel }">
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
												<input type="text" class="form-control" id="email" name="email"
													value="${user_info.email }">
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
													id="company" name="company" value="${user_info.company }">
											</div>
										</td>
									</tr>
									<input type="hidden" id="id" name="id" value="${user_info.id }">
								</table>
							</form>
						</div>
					</div>
					<div class="card-footer text-center">
						<button class="btn btn-primary" onclick="userUpdate()">적용하기</button>
					</div>
				</div>
			</div>

		</section>
	</div>
	
	<script>
	
		function userUpdate() {
            if($('#tel').val().length==0){alert("연락처를 입력하세요"); $('#tel').focus(); return false; }
            if($('#email').val().length==0){alert("이메일을 입력하세요"); $('#email').focus(); return false; }
            if($('#company').val().length==0){alert("회사명을 입력하세요"); $('#company').focus(); return false; }

            window.alert("수정을 완료했습니다.");
            frm.submit();
		}
	
	</script>

</body>
</html>