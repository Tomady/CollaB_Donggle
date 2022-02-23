<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
    #addListBtn:hover{
      background-color: rgb(224, 224, 224);
      cursor: pointer;
    }

    .card {
      height: 300px;
    }

    .profileimg {
      height: 100px;
      width: 100px;
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
            <div class="row">
              <div class="col-12 col-md-4 col-lg-4">
                <div class="card">
                  <div class="card-header">
                    <h4>내 프로필</h4>
                  </div>
                  <div class="card-body">
                    <div class="row">
                      <div class="col-md-3">
                        <img src="/CollaB/resources/assets/img/example-image.jpg" alt="" class="profileimg">
                      </div>
                      <div class="col-md-9">
                        <p>
                          <b>이름</b>&nbsp;&nbsp;박소연<br>
                          <b>닉네임</b>&nbsp;&nbsp;sy
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="card-footer text-right">
                    <button class="btn btn-primary">프로필 수정</button>
                  </div>
                </div>
                <div class="card">
                  <div class="card-header">
                    <h4>초대코드 입력</h4>
                  </div>
                  <div class="card-body">
                    <p class="card-text">초대코드를 입력하세요 &#127915;</p>
                  </div>
                  <div class="card-footer text-right">
                    <button class="btn btn-primary">코드 입력하기</button>
                  </div>
                </div>
              </div>
              <div class="col-12 col-md-4 col-lg-4">
                <div class="card">
                  <div class="card-header">
                    <h4 class="card-title">내 정보</h4>
                  </div>
                  <div class="card-body">
                    <p class="card-text">
                      <b>연락처</b> &nbsp;&nbsp; 010-1111-1111<br>
                      <b>이메일</b> &nbsp;&nbsp; ask@yedam.ac<br>
                      <b>회사</b> &nbsp;&nbsp; 예담
                    </p>
                  </div>
                  <div class="card-footer text-right">
                    <button class="btn btn-primary">정보 수정</button>
                  </div>
                </div>
                <div class="card">
                  <div class="card-header">
                    <h4>쪽지함</h4>
                  </div>
                  <div class="card-body">
                    <p class="card-text">나에게 온 쪽지를 확인하세요 &#128231;</p>
                  </div>
                  <div class="card-footer text-right">
                    <button class="btn btn-primary">쪽지함 가기</button>
                  </div>
                </div>
              </div>
              <div class="col-12 col-md-4 col-lg-4">
                <div class="card">
                  <div class="card-header">
                    <h4>비밀번호 변경</h4>
                  </div>
                  <div class="card-body">
                    비밀번호를 변경하세요 &#128272;
                  </div>
                  <div class="card-footer text-right">
                    <button class="btn btn-primary">비밀번호 변경</button>
                  </div>
                </div>
                <div class="card">
                  <div class="card-header">
                    <h4>회원탈퇴</h4>
                  </div>
                  <div class="card-body">
                    <p class="card-text">서비스를 더이상 이용하지 않는다면.. &#128549;</p>
                  </div>
                  <div class="card-footer text-right">
                    <button class="btn btn-primary">탈퇴 바로가기</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>

</body>
</html>