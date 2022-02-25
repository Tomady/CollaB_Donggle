<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style>
    #addListBtn:hover{
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
                <h4>비밀번호 수정</h4>
              </div>
              <div class="card-body">
                <div class="div-table">
                  <table class="table table-bordered">
                    <tr>
                      <th>기존 비밀번호</th>
                      <td>
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <div class="input-group-text">
                              <i class="fas fa-lock"></i>
                            </div>
                          </div>
                          <input type="password" class="form-control pwstrength" data-indicator="pwindicator" value="thdus">
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <th>새 비밀번호</th>
                      <td>
                        <div class="input-group">
                        <div class="input-group-prepend">
                          <div class="input-group-text">
                            <i class="fas fa-lock"></i>
                          </div>
                        </div>
                        <input type="text" class="form-control phone-number">
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <th>비밀번호 확인</th>
                      <td>
                        <div class="input-group">
                        <div class="input-group-prepend">
                          <div class="input-group-text">
                            <i class="fas fa-lock"></i>
                          </div>
                        </div>
                        <input type="text" class="form-control">
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