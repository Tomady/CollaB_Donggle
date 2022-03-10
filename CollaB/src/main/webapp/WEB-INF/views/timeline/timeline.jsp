<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타임라인</title>
<!-- fullcalendar -->
<link href='/CollaB/resources/fullcalendar/main.css' rel='stylesheet' />
<script src='/CollaB/resources/fullcalendar/main.js'></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- icon -->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

<style>
	body{
		background-color: white !important;
	}
    #timeline-wrap{
        width: 100%;
        height: auto;
        display: flex;
    }
    #timeline-list{
        width: 20%;      
    }
    #timeline-list-header{
        padding-top: 16%;
        padding-bottom: 7%;
        color:#6553C1;
        text-align: center;
    }
    #timeline-list-box{
        height: 85%;
        background-color: #ECE9FE;
        border-radius: 20px;
    }
    #timeline-list-body{
        height: 90%;
    } 
    #timeline-list-footer{
        height: 10%;
    }

    /* calendar */
    #calendar {
        width: 80%;
        margin: 40px auto;
    }
    #calendar button{
        background-color: white;
        border: 1px solid #6553C1;
        color: #6553C1;
    }
    .fc-button-group{
        margin-left: 5%;
        background-color: white;
        border: none;
        color: #6553C1;
    }
    .fc-daygrid{
        padding: 5px;
    }

    /* 왼쪽 div*/
    #addBtn{
        background-color: #9F90D9;
        border: none;
        border-radius: 5px;
        color: #F6F6F6;
        font-size: 18px;
        margin: auto;
        display: block;
        width: 30%;
        border: 1px solid #9F90D9;
    }
    #addBtn:active, #addBtn:hover{
        background-color: white;
        border: 1px solid #9F90D9;
        border-radius: 5px;
        color: #9F90D9;
        outline: 0;
    }
    button:focus{
      outline: 0;
    }
    .listOfCard{
        padding: 10%;;
    }
    .listOfCard li{
        border-bottom: 1px solid lightgray;
        list-style-type: none;
        cursor: pointer;
        height: 100px;
    }
    #modal{
        position: absolute;
        width: 200px; height: 90px;
        background: white;
        display: none;
        border: 1px solid lightgray;    
        top: 80%; left: 7%;
    }
    #modal li{
        list-style-type: none;
        cursor: pointer; 
    }
    #modal li:hover{
        color:#6553C1;
        font-weight: bold;
    } 
    .icon{
      cursor: pointer;
      float: right;
      margin: 10px;
    }
    #modalOfCard, #modalOfList{
        width: 500px;
        border: 1px solid lightgray;
        border-radius: 0.25rem;
        display: none;
        transform: translate(-50%, -50%);
        top: 50%; left: 60%;
        background-color: white;
        z-index: 1060;
        position: fixed; 
    }
    .alert.alert-primary{
        background-color: #9F90D9;
        color: #F6F6F6;
        font-weight: bold;
        text-align: center;
        font-size: 20px;
    }
    .form-group{
        width: 70%;
        margin: 10px auto;
    }
    #dateWrap{ 
        display: flex;
    }
    #startDate{
        width: 150px;
        margin-right: 50px;
    }
    #dueDate{
        width: 150px;
    }
    .addBtn{
        background-color: #9F90D9;
        border: none;
        border-radius: 5px;
        color: #F6F6F6;
        font-size: 18px;
        margin: auto;
        display: block;
        border: 1px solid #9F90D9;
        width: -webkit-fill-available;
    }
    .addBtn:active, .addBtn:hover{
        background-color: white;
        border: 1px solid #9F90D9;
        border-radius: 5px;
        color: #9F90D9;
        outline: 0;
    }
  </style>

</head>
<body style="background-color: white;">
  
        <!-- Main Content -->
        <div class="main-content">
          <section class="section">
            <!-- 보드헤더 -->
            <div class="section-header d-flex justify-content-between" style="margin-bottom: 5px;">
              <div class="btn-group">
                <button class="btn btn-secondary dropdown-toggle" type="button" 
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                style="background-color: #6553C1;">
                Switch View
                </button>
                <div class="dropdown-menu">
                  <div class="dropdown-title">Hi, [Nickname] ! 🤗<p>Where are you going ?</p></div>
                 	<a class="dropdown-item" href="boardDetail">&nbsp;&nbsp;Board</a>
	             	<a class="dropdown-item" href="timeline.do">&nbsp;&nbsp;TimeLine</a>
	             	<a class="dropdown-item" href="calendar.do">&nbsp;&nbsp;Calendar</a>
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
            
            <div id="timeline-wrap">
              
                <div id="timeline-list">
                    <div id="timeline-list-header"> 
                        <h4>TIMELINE LIST 📆</h4>
                    </div>
                    <div id="timeline-list-box">
                        <div id="timeline-list-body">
                            <ul class="listOfCard">
                                <li>list 1</li>
                              <!-- <li>${list.list_title }</li> -->
                            </ul>
                        </div>
                        <div id="timeline-list-footer">
                            <div class="modal" id="modal">
                              <div style="margin-bottom: 20px;"><ion-icon name="close-outline" class="icon" id="close1"></ion-icon></div>
                              <ul>
                                <li id="card">Card</li>
                                <li id="list">List</li>
                              </ul>
                            </div>

                            <button type="button" id="addBtn" >＋Add</button>
                        </div>
                    </div> <!-- end of timeline-list-box-->
                    
                </div> <!-- end of timeline-list-->

                
                <div id='calendar'></div>
                
            </div>

          </section>
          
        </div>

      </div>
      <!-- 카드, 리스트 추가 모달-->
      <div id="modalOfCard">
        <div style="margin-bottom: 20px;"><ion-icon name="close-outline" class="icon" id="close2"></ion-icon></div>
        <div class="form-group">
            <label>Title</label>
            <input type="text" class="form-control">
        </div>
        <div class="form-group">
            <label>Select</label>
            <select class="form-control">
              <option>Option 1</option>
              <option>Option 2</option>
              <option>Option 3</option>
            </select>
        </div>
        <div class="form-group" id="dateWrap">
            <div id="startDate">
                <label>Start date</label>
                <input type="date" class="form-control">
            </div>
            <div id="dueDate">
                <label>Due date</label>
                <input type="date" class="form-control">
            </div>
        </div> <!-- end of dateWrap -->
        <br>
        <div class="form-group">
            <button type="button" class="addBtn" id="addCard">Add Card </button>
        </div>
        <br>
      </div> <!--end of 카드모달모달-->

      <div id="modalOfList">
        <div style="margin-bottom: 20px;"><ion-icon name="close-outline" class="icon" id="close3"></ion-icon></div>
        <div class="form-group">
            <label>Title</label>
            <input type="text" class="form-control">
        </div>
        
        <br>
        <div class="form-group">
            <button type="button" class="addBtn" id="addList">Add List </button>
        </div>
        <br>
      </div> <!--end of 리스트모달모달-->
      
    </div>
    
    
<!-- Fullcalendar-->
    <link href='../sources/fullcalendar/main.css' rel='stylesheet' />
    <script src='../sources/fullcalendar/main.js'></script>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
      
        var calendar = new FullCalendar.Calendar(calendarEl, {
          timeZone: 'local',
          initialView: 'dayGridWeek',
          headerToolbar: {
              left: 'today,prev,next',
              center: '',
              right: ''
          },
         
          locale: "ko",
          editable: true,
          events: 'https://fullcalendar.io/api/demo-feeds/events.json'
        });
      
        calendar.render();
      });


     // 모달
     document.getElementById("addBtn").onclick = function() {
        $("#modal").fadeIn();
    };
    document.getElementById("card").onclick = function() {
        $("#modalOfCard").fadeIn();
        $("#modal").fadeOut();
    };

    document.getElementById("list").onclick = function() {
        $("#modalOfList").fadeIn();
        $("#modal").fadeOut();
    };

    document.getElementById("close1").onclick = function() {
        $("#modal").fadeOut();
    };

    document.getElementById("close2").onclick = function() {
        $("#modalOfCard").fadeOut();
    };

    document.getElementById("close3").onclick = function() {
        $("#modalOfList").fadeOut();
    };
  

      </script>
</body>
</html>