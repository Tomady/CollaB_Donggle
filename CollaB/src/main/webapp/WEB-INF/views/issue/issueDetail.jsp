<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이슈 글 상세</title>
<!-- 제이쿼리 -->  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- icon -->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

<style>
	#btnGroup{
       margin-left: 45%;
     }
     #insertBtn{
       background-color: #9F90D9;
       border: 1px solid #9F90D9;
     }
     #insertBtn:hover, #insertBtn:focus{
       background-color: #6553C1 !important;
     }
     #cancelBtn{
       background-color: white;
       border: 1px solid #9F90D9;
       color: #6553C1;
     }
     #cancelBtn:hover, #cacelBtn:focus{
       background-color: white !important;
       border: 1px solid #6553C1 !important;
       color: #6553C1 !important;
     }
   /* 글 내용*/
   .profile-widget .profile-widget-description{
     width: 90%;
     margin: 30px auto;
    }
    .profile-widget-description{
      display: flex;
    }
    .issue-content{
      width: 50%;
    }


     /* 이슈리스트 */
     #accordion{
      width: 40%;
    }
    .accordion .accordion-header{
      border:#e4e6fc 1px solid;
      color:#9F90D9;
      background-color:#e4e6fc;
    }
    .accordion .accordion-header:hover{
      background-color: #6553C1;
      color: white;
    }
    .accordion .accordion-header[aria-expanded="true"]{
      background-color: #6553C1;
    }
    .items li{
      list-style: none;
    }
    .chkbox{
      margin-right: 10px;
    }



    /* 댓글 */
    .form-group{
        width: 100%;
    }
    .form-control{
       width: 60%;
    }
    .reply-box{
       display: flex;
       margin-left: 25%;
    }
    #insertBtn{
      background-color: #9F90D9;
      border: 1px solid #9F90D9;
    }
    #insertBtn:hover, #insertBtn:focus{
      background-color: #6553C1 !important;
    }
</style>
</head>
<body style="background-color: #ECE9FE;">
<!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <div style="margin: 0 auto">
              <figure class="avatar mr-2 avatar-xl" data-initial="W" style="background-color:#6553C1"></figure>
              <h1>Workspace Name</h1>
            </div>
          </div>

          <div class="section-body">
            <div class="row mt-4">
              <div class="col-12">
                <div class="card">
                  <div class="card-body">
                    <div class="card profile-widget">
                        <div class="profile-widget-header">
                          
                          <div class="profile-widget-items">
                            <div class="profile-widget-item">
                              <div class="profile-widget-item-label">카테고리</div>
                              <div class="profile-widget-item-value">${issue.issueCategory }</div>
                            </div>
                            <div class="profile-widget-item">
                              <div class="profile-widget-item-label">글제목</div>
                              <div class="profile-widget-item-value">${issue.issueTitle }</div>
                            </div>
                            <div class="profile-widget-item">
                              <div class="profile-widget-item-label">작성자</div>
                              <div class="profile-widget-item-value">${issue.id }</div>
                            </div>
                          </div>
                        </div>
                        <div class="profile-widget-description pb-0">
                          <div class="issue-content">${issue.issueContent }</div>
                          <div id="accordion">
                            <div class="accordion">
                              <div class="accordion-header" role="button" data-toggle="collapse" data-target="#panel-body-1" >
                                <h4>이슈가 나타났다</h4>        
                              </div>        
                              <div class="accordion-body collapse show" id="panel-body-1" data-parent="#accordion">
                                <div class="items">
                                  <ul>
                                    <li><span class="chkbox"><input type="checkbox"></span>고구마호박</li>
                                    <li><span class="chkbox"><input type="checkbox"></span>호박고구마</li>
                                    <li><span class="chkbox"><input type="checkbox"></span>호구마</li>
                                  </ul>
                                </div>
                              </div>
                            </div>
                            <div class="accordion">
                              <div class="accordion-header" role="button" data-toggle="collapse" data-target="#panel-body-2">
                                <h4>이슈가 또 나타났다</h4>
                              </div>
                              <div class="accordion-body collapse" id="panel-body-2" data-parent="#accordion">
                                <div class="items">
                                  <ul>
                                    <li><span class="chkbox"><input type="checkbox"></span>힝</li>
                                    <li><span class="chkbox"><input type="checkbox"></span>힝이 뭐니 어른처럼 말해야지</li>
                                    <li><span class="chkbox"><input type="checkbox"></span>힝입니다</li>
                                  </ul>
                              </div>
                              </div>
                            </div>
                            <div class="accordion">
                              <div class="accordion-header" role="button" data-toggle="collapse" data-target="#panel-body-3">
                                <h4>이슈가 또 또 나타났다</h4>
                              </div>
                              <div class="accordion-body collapse" id="panel-body-3" data-parent="#accordion">
                                <div class="items">
                                  <ul>
                                    <li><span class="chkbox"><input type="checkbox"></span>머리부터</li>
                                    <li><span class="chkbox"><input type="checkbox"></span>발끝까지</li>
                                    <li><span class="chkbox"><input type="checkbox"></span>핫 이 슈</li>
                                  </ul>
                              </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div id="btnGroup">
                          <button type="button" class="btn btn-primary" id="insertBtn" onclick="location.href='issueUpdate.do?issueId=${issue.issueId}'">수정</button>           
                          <button type="button" class="btn btn-primary" id="cancelBtn" onclick="#">삭제</button>
                        </div>
                        
                </div>
              
                <!-- 댓글 -->
                <div class="card-footer text-center pt-0">
                  <div class="form-group">
                      <div class="reply-box">
                          <input type="text" class="form-control" placeholder="댓글을 입력해주세요." style="margin-right:20px;">
                          <button class="btn btn-primary" id="insertBtn" >등록</button>
                      </div>
                    </div>       
            </div>
              </div>
            </div>
          </div>
        </section>
      </div>
      
<script type="text/javascript">

// 체크박스 체크 방지
$(document).ready(function func() {
	$("input[type=checkbox]").bind("click",false);
});

</script>
</body>
</html>