<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이슈 등록</title>
<!-- 제이쿼리 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <!-- icon -->
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
  
  <style>
     /* 등록 취소 버튼 */
     #btnGroup{
       margin: auto;
       display: block;
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


    /* 이슈 리스트 */
     .items li{
       list-style: none;
       margin-top: 10px;
     }
     .plus{
       cursor: pointer;
       font-size: 13px;
       vertical-align: sub;
     }
     #addadd{
      margin: 20px auto;
      width: 40%;
     }
    

     /* 폼 */
     .form-group > label{
       font-size: 16px;
       padding-top: 10px;
     }
      textarea{ 
       height: 10em;
     }
     #accordion{
       margin-left: 15px;
       width: 50%;
     }
     .accordion .accordion-header{
       background-color: #9F90D9;
       color: white;
     }
     .accordion .accordion-header:hover{
       background-color: #6553C1;
     }
     .accordion .accordion-header[aria-expanded="true"]{
       background-color: #6553C1;
     }
     .text-blank{
       border: 1px solid #e4e6fc;
       border-radius: 5px;
       width: 80%;
       height: 35px;
       font-size: 13px;
     }
  </style>
</head>
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
                    <div class="row">
                        <div class="col-12">
                          <div class="card">
                            <div class="card-header">
                              <h3 style="color: #6553C1;">이슈 등록</h3>
                            </div>
                            <div class="card-body">
                              <div class="form-group row mb-4">
                                <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">제목</label>
                                <div class="col-sm-12 col-md-7">
                                  <input type="text" class="form-control">
                                </div>
                              </div>
                              <div class="form-group row mb-4">
                                <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">카테고리</label>
                                <div class="col-sm-12 col-md-7">
                                  <select class="form-control selectric">
                                    <option>Tech</option>
                                    <option>News</option>
                                    <option>Political</option>
                                  </select>
                                </div>
                              </div>
                              <div class="form-group row mb-4">
                                <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">내용</label>
                                <div class="col-sm-12 col-md-7">
                                  <textarea style="width:inherit; background-color: #fdfdff; border-color: #e4e6fc;"></textarea>
                                </div>
                              </div>
                              <div class="form-group row mb-4">
                                <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">이슈리스트</label>
 
                           
                              <div id="accordion">
                                
                              </div>
                              <div id="addadd">
                                <input type="text" class="text-blank" id="istitle" placeholder="이슈 타이틀을 입력하세요.">
                                <span class="plus" id="isadd" onclick="issue_add()"><ion-icon name="add-outline"></ion-icon> 이슈추가</span>
                              </div>
                              <!-- end of accordion-->
                          </div>
                          
                        </div>
                        <div id="btnGroup">
                          <button class="btn btn-primary" id="insertBtn">등록</button>
                          <button class="btn btn-primary" id="cancelBtn">취소</button>
                        </div>
                        <br><br>
                      </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
      
<script>
    // 이슈리스트 아이템 추가
    function item_add(){
      let ul = event.target.closest("ul");
      let li = document.createElement("li");
      let input = ul.firstChild;
      li.innerHTML = input.value;
      ul.append(li);
      input.value = '';
    }


    // 이슈리스트 타이틀 추가
    function issue_add(){
      let wrap = document.getElementById("accordion");
      let div = document.createElement('div');

      let div_header = document.createElement('div');
      div.classList.add('accordion');
      div_header.classList.add('accordion-header');
      div_header.setAttribute('role','button');
      div_header.setAttribute('data-toggle','collapse');
      let count = document.querySelectorAll('.accordion').length;
      let str = '#panel-body-' + (count+1);
      div_header.setAttribute('data-target', str);
      let input = document.getElementById("istitle");
      div_header.innerHTML = '<h4>'+input.value+'</h4>';
      div.append(div_header);
      
      let div_body = document.createElement('div');
      div_body.classList.add('accordion-body'); 
      let body_id = 'panel-body-' + (count+1);
      div_body.setAttribute('id', body_id);
      div_body.setAttribute('data-parent', '#accordion');
      div.append(div_body);
      

      let items = document.createElement('div');
      items.classList.add('items');
      div_body.append(items);
      let ul = document.createElement('ul');
      ul.innerHTML = '<input type="text" class="text-blank" placeholder="이슈 아이템을 입력하세요"><span class="plus" id="itadd" onclick="item_add()"><ion-icon name="add-outline"></ion-icon> 아이템추가</span>';
      
      items.append(ul);

      wrap.append(div);
      input.value = '';

    }
</script>
</body>
</html>