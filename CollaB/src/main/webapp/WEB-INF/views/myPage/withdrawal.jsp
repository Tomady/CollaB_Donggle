<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<style>
    #addListBtn:hover{
      background-color: rgb(224, 224, 224);
      cursor: pointer;
    }

    label {
      color: black;
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
                <h4>회원탈퇴</h4>
              </div>
              <div class="card-body">
                <div class="section-title mt-0">탈퇴 안내</div>
                <p>회원 탈퇴를 신청하기 전에 꼭 <mark>안내사항</mark>을 확인해주세요.</p>
                <br>
                <ul>
                  <li>탈퇴한 아이디는 복구가 불가능합니다.</li>
                  <li>탈퇴 후에는 데이터를 복구할 수 없습니다.</li>
                </ul>
                <br>
                <hr>
                <br>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                  <label class="form-check-label" for="inlineCheckbox1">
                    안내사항을 모두 확인하였으며, 이에 동의합니다.
                  </label>
                </div>
              </div>
              <div class="card-footer text-center">
                <button class="btn btn-primary">확인</button>
              </div>
            </div>
          </div>
        </section>
      </div>
</body>
</html>