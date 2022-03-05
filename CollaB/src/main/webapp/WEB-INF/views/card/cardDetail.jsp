<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>  
    .cardDetail{
      width: 100%; 
      height: 850px; 
      overflow : scroll; 
      overflow-x: hidden;
      border-radius: 2px;
    }
    .label{
      width: 25px; 
      height: 25px; 
      border:rgb(240, 240, 240) 1px solid;
      text-align: center;
      line-height: 2;
      cursor: pointer;
    }
    .fa-check{color:black;}
    .cardmenu{background-color: whitesmoke; border-radius: 10px;}
    .menu{font-size: medium; color: gray;}
    #testbtn{position: relative;}
    .test123{
      width: 50px;
      height: 25px;
      background-color: gray;
      border-radius : 5px;
      color: white;
      opacity: 0;
      transition: all 0.3s;
      position: absolute;
      top: -30px;
      left: -15px;
      z-index : 999;
      line-height : 25px;
    }
    /* 임의 스타일 */
    .test1234{ 
      transition: all 0.2s;
      opacity: 1;
    }
    #add_Dates {
      display: none;
      width: 400px;
      padding: 20px 60px;
      background-color: #fefefe;
      border: 1px solid #888;
      border-radius: 3px;
    }
    #add_Dates .add_Dates_close_btn {
        position: absolute;
        top: 10px;
        right: 10px;
    }
</style>
<script type="text/javascript">
//페이지 그려줌과 동시에 실행
document.addEventListener("DOMContentLoaded", function(){
	let color = "${workspace.board_thema}";
	let name = "${workspace.workspace_title}".substring(0, 1);
	boardColorFnc(color);
	changeWKIMG(name);
	
	//워크프페이스 프로필이미지
	function changeWKIMG(newWKname){
		let img = document.querySelector(".wkimg");
		if(name == 'a' || name == 'A'){
			img.setAttribute("src","resources/img/a.jpg");
		}else if(name == 'b' || name == 'B'){
			img.setAttribute("src","resources/img/b.jpg");
		}else if(name == 'c' || name == 'C'){
			img.setAttribute("src","resources/img/c.jpg");
		}else if(name == 'd' || name == 'D'){
			img.setAttribute("src","resources/img/d.jpg");
		}else if(name == 'e' || name == 'E'){
			img.setAttribute("src","resources/img/e.jpg");
		}else if(name == 'f' || name == 'F'){
			img.setAttribute("src","resources/img/f.jpg");
		}else if(name == 'g' || name == 'G'){
			img.setAttribute("src","resources/img/g.jpg");
		}else if(name == 'h' || name == 'H'){
			img.setAttribute("src","resources/img/h.jpg");
		}else if(name == 'i' || name == 'I'){
			img.setAttribute("src","resources/img/i.jpg");
		}else if(name == 'j' || name == 'J'){
			img.setAttribute("src","resources/img/j.jpg");
		}else if(name == 'k' || name == 'K'){
			img.setAttribute("src","resources/img/k.jpg");
		}else if(name == 'l' || name == 'L'){
			img.setAttribute("src","resources/img/l.jpg");
		}else if(name == 'm' || name == 'M'){
			img.setAttribute("src","resources/img/m.jpg");
		}else if(name == 'n' || name == 'N'){
			img.setAttribute("src","resources/img/n.jpg");
		}else if(name == 'o' || name == 'O'){
			img.setAttribute("src","resources/img/o.jpg");
		}else if(name == 'p' || name == 'P'){
			img.setAttribute("src","resources/img/p.jpg");
		}else if(name == 'q' || name == 'Q'){
			img.setAttribute("src","resources/img/q.jpg");
		}else if(name == 'r' || name == 'R'){
			img.setAttribute("src","resources/img/r.jpg");
		}else if(name == 's' || name == 'S'){
			img.setAttribute("src","resources/img/s.jpg");
		}else if(name == 't' || name == 'T'){
			img.setAttribute("src","resources/img/t.jpg");
		}else if(name == 'u' || name == 'U'){
			img.setAttribute("src","resources/img/u.jpg");
		}else if(name == 'v' || name == 'V'){
			img.setAttribute("src","resources/img/v.jpg");
		}else if(name == 'w' || name == 'W'){
			img.setAttribute("src","resources/img/w.jpg");
		}else if(name == 'x' || name == 'X'){
			img.setAttribute("src","resources/img/x.jpg");
		}else if(name == 'y' || name == 'Y'){
			img.setAttribute("src","resources/img/y.jpg");
		}else if(name == 'z' || name == 'Z'){
			img.setAttribute("src","resources/img/z.jpg");
		}else if(name == '0'){
			img.setAttribute("src","resources/img/0.jpg");
		}else if(name == '1'){
			img.setAttribute("src","resources/img/1.jpg");
		}else if(name == '2'){
			img.setAttribute("src","resources/img/2.jpg");
		}else if(name == '3'){
			img.setAttribute("src","resources/img/3.jpg");
		}else if(name == '4'){
			img.setAttribute("src","resources/img/4.jpg");
		}else if(name == '5'){
			img.setAttribute("src","resources/img/5.jpg");
		}else if(name == '6'){
			img.setAttribute("src","resources/img/6.jpg");
		}else if(name == '7'){
			img.setAttribute("src","resources/img/7.jpg");
		}else if(name == '8'){
			img.setAttribute("src","resources/img/8.jpg");
		}else if(name == '9'){
			img.setAttribute("src","resources/img/9.jpg");
		}
	}
	
	//카드아이템
	//현재 페이지에 있는 리스트 내 카드 아이디들을 cardIds배열에다 담아줌
	let listId = document.querySelector("#selectedList").getAttribute("data-listId");
	const cardIds = new Array();
	const cards = document.querySelectorAll(".cards");
	for(let i = 0; i<cards.length; i++){
		cardIds[i] = cards[i].getAttribute("data-cardId");
	}
	
	//for문돌면서 카드아이템들 장착해주기~!
	for(let cardId of cardIds){
		$.ajax({
			url : "AjaxCardDetail_CardItemsCheck",
			type : "POST",
			data : {
				cardId : cardId
			},
			dataType : "json",
			success : function(data){
				if(data.managerImg != null){
					document.querySelector(".profimg"+cardId).setAttribute("src",data.managerImg);					
				}
				if(data.file == "YES"){
					document.querySelector(".files"+cardId).style.color="tomato";
				}
				if(data.checkList == "YES"){
					document.querySelector(".check"+cardId).style.color="tomato";
				}
			},
			error : function(){
				console.log("AjaxCardDetail_CardItemsCheck 카드아이템체크 실패")
			}
		})
	}
	
	//현재 카드의 아이템들 가져오기
	//관리자프로필,체크리스트,파일
	let selectedCard = document.querySelector("#selectedCard").getAttribute("data-cardId");
	$.ajax({
		url : "AjaxCardDetail_SelectCardItems",
		type : "POST",
		data : {
			cardId : selectedCard
		},
		dataType : "json",
		success : function(data){
			console.log(data);
		},
		error : function(){
			console.log("AjaxCardDetail_SelectCardItems 해당카드 상세조회실패");
		}
		
	})
})
</script>
</head>
<body>
 <div id="app">
    <div class="main-wrapper">
      
      <!-- add Dates 모달창 -->
      <div id="add_Dates" class="card">
         <a class="add_Dates_close_btn fa fa-times" style="cursor:pointer;"></a>
         <div class="mb-4">
         	<div class="d-flex justify-content-between mt-2 mb-2">
         		<label class="mt-2">START DATE</label>
         		<input id="cardStartDate" type="date" 
         		style="width:60%;" onclick="startDateLimit()">
         	</div>
         	<div class="d-flex justify-content-between mt-2 mb-2">
         		<label class="mt-2">DUE DATE</label>
         		<input id="cardEndDate" type="date" 
         		style="width:60%;" onclick="endDateLimit()">
         	</div>
         </div>
         <div>
         	<button onclick="cardDateSave(${cardinfo.card_id})" class="btn btn-secondary" style="width:100%;">SAVE</button>
         </div>
       </div>
    	
      <!-- Main Content -->
      <div class="main-content" style="min-height: 829px;">
        <section class="section">
          <div class="row">
            <!--사용자가 선택한 리스트-->
            <div id="selectedList" class="col-lg-2 cardDetail" data-listId="${listinfo.list_id}"
            style="background-color: rgb(252, 250, 250);">
              <div class="card.h-100">
                <h4 class="listName mt-5 mb-4 ml-4">${listinfo.list_title}</h4> <!--리스트 이름 표시-->
                <div class="cardArea">
                <!--해당 리스트안에 카드리스트-->
                <c:forEach items="${samelistcards}" var="card">
                  <div id="card${card.card_id}" style="cursor:pointer;" data-cardId="${card.card_id}"
                   onclick="location.href='cardDetail?list=${card.list_id}&card=${card.card_id}'"
                   class="cards card card-${card.card_label} ml-2 mr-2"> <!--라벨표시-->
                    <div class="card-header d-flex justify-content-between">
                      <span class="cardName ml-0">${card.card_title}</span> <!--카드이름-->
                    </div>
                     <c:if test="${card.manager ne null}">
	                    <div class="ml-2 mt-1 text-right card-owner" style="font-weight:bold; height:50px;">
	                     	${card.manager}<img style="height: 20px; width: 20px;" 
	                       class="rounded-circle mr-1 ml-1 mb-1 profimg${card.card_id}">
		                </div>
                     </c:if>
                    <div class="ml-3"> <!--옵션표시(file,checklist,dates)-->
                      <i class="fa fa-check-square check${card.card_id}" style="color:#e9ecef;"></i>
                      <c:if test="${card.card_start_date ne null}">
                      	<i class="fa fa-calendar ml-1 dates${card.card_id}" style="color: tomato;"></i>
                      </c:if>
                      <c:if test="${card.card_start_date eq null}">
                      	<i class="fa fa-calendar ml-1 dates${card.card_id}" style="color: #e9ecef;"></i>
                      </c:if>
                      <i class="fa fa-paperclip ml-1 files${card.card_id}" style="color:#e9ecef;"></i>
                    </div>
                  </div>
                </c:forEach>
                </div>
              </div>
            </div>
            <!--사용자가 선택한 카드 상세-->
            <div class="col-lg-10 cardDetail" style="background-color: white;">
              <div class="row" style="float: right;">
                <!--카드상세조회 닫기버튼-->
                <h4 class="closeCardDetail mr-3 mt-3" 
                  onclick="location.hfer='boardDetail?boardID=${workspace.board_id}'">
                  <i class="fa fa-window-close" title="close_card" aria-hidden="true"></i>
                </h4>
              </div>
              <div class="row" id="selectedCard" data-cardId="${cardinfo.card_id}">
                <!--카드상세내용-->
                <div class="col-lg-7 ml-3" style="border-right: whitesmoke 1px solid;">
                  <!--카드이름 & 책임자-->
                  <div class="d-flex justify-content-between">
                      <h4 class="cardName mt-5 mb-4">${cardinfo.card_title}</h4>
                      <!-- 책임자 존재할때만 뜨도록 -->
                      <c:if test="${cardinfo.manager ne null}">
                      	<span class="btn mt-5 mb-5 ml-5">Member.  ${cardinfo.manager}
                        <img alt="image" class="rounded-circle mr-1" id="cardManagerImg${cardinfo.card_id}"
                        style="width: 30px; height: 30px; position: relative; top:-2px;">
                      </span>
                      </c:if>
                  </div>
                  <!--카드메뉴-->
                  <div class="row d-flex justify-content-center mr-2 cardmenu">
                    <button class="btn menu" onclick="cardDatesSet('add_Dates')"> Dates </button>
                    <button class="btn menu"> CheckList </button>
                    <button class="btn menu"> Attachments </button>
                    <button class="btn menu"> Member </button>
                  </div>
                  <!--카드아이템 : 라벨, 일정-->
                  <div class="row mt-4">
                    <div class="card">
                      <div style="width: 370px;"></div>
                      <div class="card-header">
                        <div class="row">
                          <h4>Label</h4>
                          <div class="label light" style="background-color: white;" onclick="selectLabel('None')"> </div>
                          <div class="label danger" style="background-color: rgb(253, 38, 38);" onclick="selectLabel('Red')"></div>
                          <div class="label warning" style="background-color: rgb(255, 184, 52);" onclick="selectLabel('Orange')"></div>
                          <div class="label success" style="background-color: rgb(58, 231, 95);" onclick="selectLabel('Green')"></div>
                          <div class="label info" style="background-color: rgb(0, 217, 255);" onclick="selectLabel('SkyBlue')"></div>
                          <div class="label primary" style="background-color: rgb(85, 73, 248);" onclick="selectLabel('Blue')"></div>
                          <div class="label secondary" style="background-color: rgb(165, 165, 165);" onclick="selectLabel('Gray')"></div>
                          <div class="label dark" style="background-color: rgb(7, 7, 7);" onclick="selectLabel('Black')"> </div>
                          <c:if test="${cardinfo.card_label eq 'light'}">
                          	<input class="selectedLabel form-control ml-1 mr-1" type="text" style="width: 80px; 
                          	height: 25px;" value="None" readonly>
                          </c:if>
                          <c:if test="${cardinfo.card_label eq 'danger'}">
                          	<input class="selectedLabel form-control ml-1 mr-1" type="text" style="width: 80px; 
                          	height: 25px;" value="Red" readonly>
                          </c:if>
                          <c:if test="${cardinfo.card_label eq 'warning'}">
	                          <input class="selectedLabel form-control ml-1 mr-1" type="text" style="width: 80px; 
	                          height: 25px;" value="Orange" readonly>
                          </c:if>
                          <c:if test="${cardinfo.card_label eq 'success'}">
                          	<input class="selectedLabel form-control ml-1 mr-1" type="text" style="width: 80px; 
                          	height: 25px;" value="Green" readonly>
                          </c:if>
                          <c:if test="${cardinfo.card_label eq 'info'}">
                          	<input class="selectedLabel form-control ml-1 mr-1" type="text" style="width: 80px; 
                          	height: 25px;" value="SkyBlue" readonly>
                          </c:if>
                          <c:if test="${cardinfo.card_label eq 'primary'}">
                          	<input class="selectedLabel form-control ml-1 mr-1" type="text" style="width: 80px; 
                          	height: 25px;" value="Blue" readonly>
                          </c:if>
                          <c:if test="${cardinfo.card_label eq 'secondary'}">
                          	<input class="selectedLabel form-control ml-1 mr-1" type="text" style="width: 80px; 
                          	height: 25px;" value="Gray" readonly>
                          </c:if>
                          <c:if test="${cardinfo.card_label eq 'dark'}">
                          	<input class="selectedLabel form-control ml-1 mr-1" type="text" style="width: 80px; 
                          	height: 25px;" value="Black" readonly>
                          </c:if>
                          <button id="testbtn" class="fa fa-check" onclick="cardLabelSelect(${cardinfo.card_id})"
                          style="border:solid 1px rgb(240, 238, 238); background-color: white;">
                          	<div class="test123">SAVE!</div>
                          </button>
                        </div>
                      </div>
                    </div>
                    <div class="card">
                      <div id="datesAppendTarget" style="width: 350px;"></div>
                      	<c:if test="${cardinfo.card_start_date ne null}">
                      	  <div class="card-header" id="cardDates">
	                        <h4 onclick="cardDatesSet(${cardinfo.card_id})">Dates</h4>
	                        <div>
	                          <span id="cardDatesSpan" style="background-color: rgb(235, 251, 252);
	                          border-radius: 3px; font-size: 15px;">${cardinfo.card_start_date} - ${cardinfo.card_end_date}</span>
	                        </div>
	                        <div class="fa fa-times ml-3 mb-1" style="cursor:pointer;" 
	                        onclick="deleteDates(${cardinfo.card_id})"></div>
	                      </div>
                      	</c:if>
                    </div>
                  </div>
                  <!--카드아이템 : 카드내용-->
                  <div class="row">
                    <div class="card">
                      <div style="width: 740px;"></div>
                      <div class="card-header" style="font-size: large;">
                        <i class="fa fa-align-left" aria-hidden="true">&nbsp;&nbsp;Description</i>
                      </div>  
                      <div class="card-body">
                        <textarea rows="4" style="width:100%;" readonly>${cardinfo.card_contents}</textarea>
                        <button class="btn btn-secondary mt-1">SAVE</button>
                      </div>
                    </div>
                  </div>
                  <!--카드아이템 : 체크리스트-->
                  <div class="row">
                    <div class="card">
                      <div style="width: 740px;"></div>
                      <div class="card-header" style="font-size: large;">
                        <i class="fa fa-check-square" aria-hidden="true">&nbsp;&nbsp;CheckList</i>
                      </div>
                      <div class="card-body">
                        <!--여기서부터-->
                        <div class="card">
                          <div class="card-body">
                            <div>체크리스트 제목<button class="btn ml-2 fa fa-times"></button></div>
                            <div class="progress mb-2"></div>
                            <input type="checkbox"> 할일<br>
                            <input type="checkbox"> 할일<br>
                            <input type="checkbox"> 할일<br>
                          </div>
                        </div>
                        <!--여기까지가 하나의 체크리스트-->
                        <div class="card">
                          <div class="card-body">
                            <div>체크리스트 제목<button class="btn ml-2 fa fa-times"></button></div>
                            <div class="progress mb-2"></div>
                            <input type="checkbox"> 할일<br>
                            <input type="checkbox"> 할일<br>
                            <input type="checkbox"> 할일<br>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!--카드아이템 : 파일첨부-->
                  <div class="row">
                    <div class="card">
                      <div style="width: 740px;"></div>
                      <div class="card-header" style="font-size: large;">
                        <i class="fa fa-paperclip ml-1 files">&nbsp;&nbsp;Attachments</i>
                      </div>
                      <div class="card-body">
                        <!--여기서부터-->
                        <div class="card">
                          <div class="card-body">
                            <div>파일이름<button class="btn ml-2 fa fa-times"></button></div>
                          </div>
                        </div>
                        <!--여기까지가 하나의 첨부파일-->
                      </div>
                    </div>
                  </div>
                </div>
                <!--카드댓글-->
                <!--////////////////////////재의님 여기예요~!!!/////////////////////-->
                <div class="col-lg-4 mt-5">
                <h4 class="cardName ml-2">Activity <i class="fa fa-comment" aria-hidden="true"></i></h4>
                  <div class="card-body" >
                    <textarea rows="4" style="width:100%;"></textarea>
                    <button class="btn btn-primary">SAVE</button>
                    <hr>
                    <ul class="mt-4 list-unstyled list-unstyled-border">
                      <li class="media">
                        <img class="mr-3 rounded-circle" width="50" src="resources/assets/img/avatar/avatar-1.png" alt="avatar">
                        <div class="media-body">
                          <div class="float-right fa fa-times"></div>
                          <div class="media-title">김은지</div>
                          <span class="text-small text-muted">~~댓글댓글댓글</span>
                          <div class="mt-2" style="font-size: 10px;">2022/02/22</div>
                        </div>
                      </li>
                      <li class="media">
                        <img class="mr-3 rounded-circle" width="50" src="resources/assets/img/avatar/avatar-2.png" alt="avatar">
                        <div class="media-body">
                          <div class="float-right fa fa-times"></div>
                          <div class="media-title">김가루</div>
                          <span class="text-small text-muted">냐냐ㅑ냐ㅑ~~~</span>
                          <div class="mt-2" style="font-size: 10px;">2022/02/22</div>
                        </div>
                      </li>
                      <li class="media">
                        <img class="mr-3 rounded-circle" width="50" src="resources/assets/img/avatar/avatar-3.png" alt="avatar">
                        <div class="media-body">
                          <div class="float-right fa fa-times"></div>
                          <div class="media-title">Rizal Fakhri</div>
                          <span class="text-small text-muted">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.</span>
                          <div class="mt-2" style="font-size: 10px;">2022/02/22</div>
                        </div>
                      </li>
                      <li class="media">
                        <img class="mr-3 rounded-circle" width="50" src="resources/assets/img/avatar/avatar-4.png" alt="avatar">
                        <div class="media-body">
                          <div class="float-right fa fa-times"></div>
                          <div class="media-title">Alfa Zulkarnain</div>
                          <span class="text-small text-muted">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.</span>
                          <div class="mt-2" style="font-size: 10px;">2022/02/22</div>
                        </div>
                      </li>
                    </ul>
                  </div>
                </div>
            </div>
          </div>
       	  </div>
        </section>
      </div>
    </div>
  </div>
 <!-- 은지 코드 -->
 <script src="resources/js/card/card-details.js"></script>
</body>
</html>