<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checklist</title>
<style>
    #addListBtn:hover{
      background-color: rgb(224, 224, 224);
      cursor: pointer;
    }
    .card {
        width: 600px;
    }
    h3 {
        font-size: 20px;
        line-height: 28px;
        color: #6553C1;
        padding-right: 10px;
        margin-bottom: 0;
    }
    th {
        width: 50px;
    }
    .xtd {
        width: 50px;
    }
    .check::after {
      position: absolute;
      top: 0.25rem;
      left: -1.5rem;
      display: block;
      width: 1rem;
      height: 1rem;
      content: "";
      background: no-repeat 50%/50% 50%;
  }
  .progress-bar {
    background-color: #6553C1;
  }
  .btn-primary {
    background-color: #6553C1;
  }
  </style>

  <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>

<!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <!-- 보드헤더 -->
          <div class="section-header d-flex justify-content-between">
            <div class="btn-group">
              <button class="btn btn-secondary dropdown-toggle" type="button" 
              data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
              style="background-color: #6553C1;">
              Switch View
              </button>
              <div class="dropdown-menu">
                <div class="dropdown-title">Hi, [Nickname] ! 🤗<p>Where are you going ?</p></div>
                <a class="dropdown-item" href="#">&nbsp;&nbsp;TimeLine</a>
                <a class="dropdown-item" href="#">&nbsp;&nbsp;Calendar</a>
                <a class="dropdown-item" href="#">&nbsp;&nbsp;DashBoard</a>
                <!--<div class="dropdown-divider"></div> 구분선-->
              </div>
              &nbsp;&nbsp;
              <button id="WsName" class="btn btn-secondary" type="button" style="background-color: #6553C1;">
                Workspace Name
              </button>
              &nbsp;&nbsp;
              <button id="BorName" class="btn btn-secondary" type="button" style="background-color: #6553C1;">
                Board Name
              </button>
              &nbsp;&nbsp;
              <button id="addstar" class="btn btn-secondary" type="button" style="background-color: #6553C1;">
                <i id="star" class="fas fa-star"></i>
              </button>
              <div class="ml-1">
                <button class="btn btn-secondary dropdown-toggle" 
                type="button" data-toggle="dropdown" aria-haspopup="true" 
                aria-expanded="false" style="background-color: #6553C1;">Thema </button>
                <div class="dropdown-menu dropdown-menu-right " 
                style="overflow: scroll; overflow-x: hidden; height: 300px;">
                  <div class="dropdown-title text-right">What's your favorite color? 🌈</div>
                  <!-- 백그라운드 색깔 종류 리스트 -->
                  <div class="d-flex">
                    <span class="dropdown-item" style="width: 3%; height: 50px; background-color: rgb(247, 123, 123); margin-left: 5%;"></span>
                    <span class="dropdown-item" style="width: 3%; height: 50px; background-color: rgb(252, 187, 127); margin-left: 5%;"></span>
                    <span class="dropdown-item" style="width: 3%; height: 50px; background-color: rgb(255, 245, 157); margin-left: 5%;"></span>
                  </div>
                  <div class="d-flex mt-3">
                    <span class="dropdown-item" style="width: 3%; height: 50px; background-color: rgb(159, 255, 130); margin-left: 5%;"></span>
                    <span class="dropdown-item" style="width: 3%; height: 50px; background-color: rgb(128, 253, 170); margin-left: 5%;"></span>
                    <span class="dropdown-item" style="width: 3%; height: 50px; background-color: rgb(216, 247, 131); margin-left: 5%;"></span>
                  </div>
                  <div class="d-flex mt-3">
                    <span class="dropdown-item" style="width: 3%; height: 50px; background-color: rgb(123, 243, 247); margin-left: 5%;"></span>
                    <span class="dropdown-item" style="width: 3%; height: 50px; background-color: rgb(121, 199, 250); margin-left: 5%;"></span>
                    <span class="dropdown-item" style="width: 3%; height: 50px; background-color: rgb(121, 162, 250); margin-left: 5%;"></span>
                  </div>
                  <div class="d-flex mt-3">
                    <span class="dropdown-item" style="width: 3%; height: 50px; background-color: rgb(123, 125, 247); margin-left: 5%;"></span>
                    <span class="dropdown-item" style="width: 3%; height: 50px; background-color: rgb(228, 151, 252); margin-left: 5%;"></span>
                    <span class="dropdown-item" style="width: 3%; height: 50px; background-color: rgb(171, 127, 252); margin-left: 5%;"></span>
                  </div>
                  <div class="d-flex mt-3">
                    <span class="dropdown-item" style="width: 3%; height: 50px; background-color: rgb(184, 184, 184); margin-left: 5%;"></span>
                    <span class="dropdown-item" style="width: 3%; height: 50px; background-color: rgb(116, 115, 115); margin-left: 5%;"></span>
                    <span class="dropdown-item" style="width: 3%; height: 50px; background-color: rgb(12, 12, 12); margin-left: 5%;"></span>
                  </div>
                </div>
              </div>
            </div>
            <div class="btn-group col-rg">
              <button class="btn btn-outline-secondary dropdown-toggle" 
              type="button" data-toggle="dropdown" aria-haspopup="true" 
              aria-expanded="false" style="color: #6553C1; border: 1px solid #6553C1;">Filter </button>
                <div class="dropdown-menu dropdown-menu-right" style="overflow: scroll; overflow-x: hidden; height: 300px;">
                  <div class="dropdown-title text-right">Your Partner 🙌</div>
                  <a class="dropdown-item" href="#"><input type="checkbox">&nbsp;&nbsp;eunji_97@abc.com</a>
                  <a class="dropdown-item" href="#"><input type="checkbox">&nbsp;&nbsp;eunji_97@abc.com</a>
                  <a class="dropdown-item" href="#"><input type="checkbox">&nbsp;&nbsp;eunji_97@abc.com</a>
                  <a class="dropdown-item" href="#"><input type="checkbox">&nbsp;&nbsp;eunji_97@abc.com</a>
                  <a class="dropdown-item" href="#"><input type="checkbox">&nbsp;&nbsp;eunji_97@abc.com</a>
                  <a class="dropdown-item" href="#"><input type="checkbox">&nbsp;&nbsp;eunji_97@abc.com</a>
                  <a class="dropdown-item" href="#"><input type="checkbox">&nbsp;&nbsp;eunji_97@abc.com</a>
                  <a class="dropdown-item" href="#"><input type="checkbox">&nbsp;&nbsp;eunji_97@abc.com</a>
                  <a class="dropdown-item" href="#"><input type="checkbox">&nbsp;&nbsp;eunji_97@abc.com</a>
                  <a class="dropdown-item" href="#"><input type="checkbox">&nbsp;&nbsp;eunji_97@abc.com</a>
                  <!--<div class="dropdown-divider"></div> 구분선-->
                </div>
            </div>
            <!-- 보드헤더 끝 -->
          </div>
          <!-- 보드바디 -->

          <div id="boardDetailBODY" class="section-body">
          <button class="btn btn-primary mb-3" id="addChkListBtn">Add a checklist</button>
          <!-- 체크리스트 리스트 -->
          <c:forEach items="${checklist }" var="checklist" varStatus="status">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4">
                            <h3><i class="fas fa-check"></i>&nbsp;&nbsp;<c:out value="${checklist.checklist_title }"/> </h3>    
                        </div>
                        <div class="col-md-8 d-flex justify-content-end">
                            <button class="btn btn-primary" id="deletechkBtn">Delete</button>        
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            <h6 class="mt-3 text-center"><div id="Rate"></div></h6> <!-- 달성률 -->
                        </div>
                        <div class="col-md-10">
                            <div class="progress mt-3">
                                <div class="progress-bar" role="progressbar" data-width="25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width: 25%;"></div>
                            </div>
                        </div>    
                    </div>
                    <div>
                    	<!-- 아이템 리스트 -->
                        <table class="table">
                        	<c:forEach items="${itemlist }" var="itemlist" varStatus="status">
                            <tr>
                                <th>
	                                <c:choose>
		                                <c:when test="${itemlist.item_status == 'Y' }">
			                                <div class="custom-checkbox custom-control">
			                                    <input type="checkbox" data-checkboxes="mygroup" class="custom-control-input" id="checkbox-{i}" name="chkList" onclick="getCheckCnt()" checked="checked">
			                                    <label for="checkbox-{i}" class="custom-control-label">&nbsp;</label>
			                                </div>
		                                </c:when>
		                                <c:when test="${itemlist.item_status == 'N' }">
		                                	<div class="custom-checkbox custom-control">
			                                    <input type="checkbox" data-checkboxes="mygroup" class="custom-control-input" id="checkbox-{i}" name="chkList" onclick="getCheckCnt()">
			                                    <label for="checkbox-{i}" class="custom-control-label">&nbsp;</label>
			                                </div>
		                                </c:when>
		                            </c:choose>  
                                </th>
                                <td class="task-td">
                                    <a id="tasklist"><c:out value="${itemlist.item_title }"></c:out></a>
                                    <div id="moditask">
                                      <input type="text" class="form-control mt-3" placeholder="내용을 입력해주세요" value="${item_info.item_title }">
                                      <div class="row m-1 mt-3">
                                          <button class="btn btn-primary">Save</button>
                                          <button class="btn btn-primary ml-2" id="closemodiitem">Close</button>
                                      </div>
                                    </div>
                                </td>
                                <td class="xtd"><a href="#" class="btn btn-icon icon-left" id="deleteItemA" onclick="location.href='/CollaB/itemdelete?item_id=${itemlist.item_id}'">
                                	<i class="fas fa-times"></i></a>
                                </td>
                            </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <button class="btn btn-primary" id="additem">Add an item</button>
                    <div id="additemdiv">
                        <input type="text" class="form-control mt-3" name="item_title" id="item_title" placeholder="내용을 입력해주세요">
                        <div class="row m-1 mt-3">
                            <button class="btn btn-primary" id="addItemBtn">Add</button>
                            <button class="btn btn-primary ml-2" id="closenewitem">Close</button>
                        </div>
                    </div>              
                </div>
            </div>
          </c:forEach>
          </div>
            
        </section>

        <!-- 체크리스트 추가 모달 -->
        <div class="modal fade" id="addChkModal" tabindex="-1" aria-labelledby="chkModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Add a Checklist</h5>
              </div>
              <div class="modal-body">
                <div class="form-group">
                  <label>Title</label>
                  <input type="text" class="form-control" id="checklist_title" name="checklist_title">
                </div>
              </div>
              <div class="modal-footer text-right">
                <button type="button" class="btn btn-secondary" id="closeAddChk">Close</button>
                <button type="button" class="btn btn-primary" id="insertChkListBtn">Save</button>
              </div>
            </div>
          </div>
        </div>
      </div>
     
    </div>
  </div>


  <!-- 자바스크립트 코드 -->
  <script src="./js/board-header.js"></script>
  <script src="./js/board-detail_body.js"></script>
  <!-- General JS Scripts -->
  <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="../assets/js/stisla.js"></script>

  <!-- JS Libraies -->
  <script src="../node_modules/chocolat/dist/js/jquery.chocolat.min.js"></script>
  <script src="../node_modules/jquery-ui-dist/jquery-ui.min.js"></script>

  <!-- Template JS File -->
  <script src="../assets/js/scripts.js"></script>
  <script src="../assets/js/custom.js"></script>

  <!-- Page Specific JS File -->

  <script>
      $(document).ready(function(){
          $('#additemdiv').hide();
          $('#moditask').hide();
      })
      $('#additem').click(function(){
          $('#additemdiv').show();
          $('#additem').hide();
      })
      $('#closenewitem').click(function(){
          $('#additemdiv').hide();
          $('#additem').show();
      })
      $('#tasklist').click(function() {
        $('#moditask').show();
        $('#tasklist').hide();
      })
      $('#closemodiitem').click(function(){
        $('#moditask').hide();
        $('#tasklist').show();
      }) 
      
/*    $(document).ready(function(){
        $(".custom-control-input").change(function(){
            if($(".custom-control-input").is(":checked")){ // 체크
               $("#tasklist").css("text-decoration", "line-through");
            } else { // 체크 해제
               $("#tasklist").css("text-decoration", "none")
            }
          });
      }); */

      // 달성률 계산하기
      function getCheckCnt(){
        // 전체 체크박스 개수
        var allcheck = $("input:checkbox[name=chkList]").length;
        // 선택된 목록 가져오기
        var checks = 'input[name="chkList"]:checked';
        var selectedElements = 
            document.querySelectorAll(checks);
        
        // 선택된 목록의 개수 세기
        var selectedChecks =
            selectedElements.length;
        // 달성률
        var achiveRate = Math.floor((selectedChecks / allcheck)*100)+"%"
        // 출력
        document.getElementById('Rate').innerText
            = achiveRate;  
      }

      // 체크리스트 추가 모달
      $('#addChkListBtn').on('click', function(){
        $('#addChkModal').modal('show');
      })
      $('#closeAddChk').on('click', function(){
        $('#addChkModal').modal('hide');
      })
      
      // 새 체크리스트 등록하기
      $('#insertChkListBtn').click(function(){
    	  event.stopPropagation();
          event.preventDefault();
    	  if($('#checklist_title').val().length==0){alert("내용을 입력하세요"); $('#checklist_title').focus(); return false; }
    	  var data = { checklist_title : $('#checklist_title').val() }
    	  console.log(data)
    	  $.ajax({
    		  url: '/CollaB/addchecklist',
    		  data: data,
    		  type: 'POST',
    		  success: function(){
    			  location.href="/CollaB/checklist.do";
    		  },
    		  error: function(err){
    			  console.log(err);
    		  }
    	  })
      })
      
      // 새 아이템 등록 처리
      $('#addItemBtn').click(function(){
        event.stopPropagation();
        event.preventDefault();
        if($('#item_title').val.length==0){alert("내용을 입력하세요"); $('#item_title').focus(); return false; }
        var data = { item_title : $('#item_title').val() }
    	 $.ajax({
         url: '/CollaB/additem',
         data: data,
         type: 'POST',
         success: function(){
           console.log('아이템 추가 성공');
           location.href="/CollaB/checklist.do";
         },
         error: function(request, status, error) {
    			  alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
         }
       })
      })

      // 새 체크리스트 생성
      function newChkList(checklist) {
        var card = document.createElement('div')
        card.className = 'card';
        var cardBody = document.createElement('div');
        cardBody.className = 'card-body';
        document.getElementById('boardDetailBODY').appendChild('card');
        document.getElementsByClassName('card').appendChild('cardBody');

        var h3 = document.createElement('h3');
        var  progressBar = document.createElement('div');
        progressBar.className = 'progress-bar'
        h3.createTextNode();
        document.getElementsByClassName('card-body').appendChild('h3');

        var table = document.createElement('table');
        table.className = 'table';
      }

      // 새 아이템 생성
      function newItem(){
        // table, tr, th, td;
        var tr = document.createElement('tr');
        var th = document.createElement('th');
        var td = document.createElement('td');
        document.getElementsByClassName('table').appendChild('tr');

      }
      
  </script>

</body>
</html>