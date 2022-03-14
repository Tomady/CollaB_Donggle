<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
      height: 30px;
      background-color: gray;
      border-radius : 5px;
      color: white;
      opacity: 0;
      transition: all 0.3s;
      position: absolute;
      top: -25px;
      left: -15px;
      z-index : 999;
      line-height : 30px;
    }
    /* 임의 스타일 */
    .test1234{ 
      transition: all 0.2s;
      opacity: 1;
    }
    /* 카드상세메뉴 - 일정추가, 관리자 지정모달창 */
    #add_Dates, #add_Member {
      display: none;
      width: 450px;
      padding: 20px 60px;
      background-color: #fefefe;
      border: 1px solid #888;
      border-radius: 3px;
    }
    #add_Dates .add_Dates_close_btn,
    #add_Member .add_Member_close_btn {
        position: absolute;
        top: 10px;
        right: 10px;
    }
    /* 카드상세메뉴 - 체크리스트추가모달창 */
     #add_Check {
      display: none;
      width: 500px;
      padding: 20px 60px;
      background-color: #fefefe;
      border: 1px solid #888;
      border-radius: 3px;
    }
    #add_Check .add_Check_close_btn {
        position: absolute;
        top: 10px;
        right: 10px;
    }
    /*카드내용저장버튼*/
    .saveDone{
      width: 80px;
      height: 30px;
      background-color: gray;
      border-radius : 5px;
      color: white;
      opacity: 0;
      transition: all 0.3s;
      position: absolute;
      top: -25px;
      left: -15px;
      z-index : 999;
      line-height : 30px;
    }
    .saveDone123{
   	  transition: all 0.2s;
      opacity: 1;
    }
    .thumbnail{
      box-shadow : 2px 2px 2px 1px #adb5bd;
      width : 200px;
      height : 80px;
      border : solid 1px #D3D3D3;
      line-height : 80px;
      border-radius : 10px;
      overflow: hidden;
    }
	.thumbnail img {
	  width: 100%;
	  height: 100%;
	  object-fit: cover;
	}
	.filedelbtn:hover, .filedownbtn:hover {
	  text-decoration : underline;
	  cursor : pointer;	
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
		}else{
			img.setAttribute("src","resources/img/workspace_default_profile.png");
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
	
	//현재카드의 체크리스트 아이디 목록
	let cardId = document.querySelector("#selectedCard").getAttribute("data-cardId");
	$.ajax({
		url : "AjaxSelectedCardCheckList",
		type : "POST",
		data : {
			card_id : cardId
		},
		dataType : "json",
		success : function(datas){
			const checkIds = new Array();
			for(let i=0; i<datas.length; i++){
				checkIds[i] = datas[i].checklist_id; 
			}//아이디목록 checkIds 배열에 담아주고
			
			checkIds.forEach((checkId)=>{
				const items = document.querySelectorAll(".checkitem"+checkId); //총 아이템
				let checkedCnt = 0; //체크된 아이템 수 
				items.forEach((item)=>{
					if(item.getAttribute("checked") == "checked"){
						checkedCnt += 1;
					}	
				})
				let itemCnt = items.length;  //총 아이템 수
				let width = Math.ceil(checkedCnt/itemCnt*100);
				if(itemCnt != 0){
					document.querySelector(".checkChart"+checkId).innerHTML = "&nbsp;&nbsp;&nbsp;"+width+"%";
					document.querySelector(".checkChart"+checkId).style.color="white";
					document.querySelector(".checkChart"+checkId).style.width=width+"%";
					if(itemCnt == checkedCnt){
						document.querySelector(".checkChart"+checkId).style.backgroundColor="#A9E81F";						
					}else{
						document.querySelector(".checkChart"+checkId).style.backgroundColor="tomato";						
					}
				}
			})
		},
		error : function(){
			console.log("AjaxSelectedCardCheckList 실패");
		}
	})
})
</script>
</head>
<body>
 <div id="app">
    <div class="main-wrapper">
      
      <!-- add CheckList 모달창 -->
      <div id="add_Check" class="card">
         <a class="add_Check_close_btn fa fa-times" 
         style="cursor:pointer;" onclick="closeAddCheck()"></a>
         <div class="mb-4 mt-1 text-center">
			<h5>Add a Checklist</h5>
         </div>
         <div class="form-group">
            <label style="font-size:15px;">Title</label>
            <input type="text" class="form-control"
            id="checklist_title" name="checklist_title">
         </div>
         <div>
         	<a id="ChecklistSectionMove" href="#checklistAppendTarget"><button id="checkAddBtn"
         	class="btn btn-secondary" style="width:100%;">ADD</button></a>
         </div>
       </div>
      
      <!-- add Dates 모달창 -->
      <div id="add_Dates" class="card">
         <a class="add_Dates_close_btn fa fa-times" style="cursor:pointer;" onclick="closeAddDates()"></a>
         <div class="mb-4">
         	<div class="d-flex justify-content-between mt-2 mb-2">
         		<label class="mt-2" style="font-size:15px;">START DATE</label>
         		<input id="cardStartDate" type="date" 
         		style="width:60%;" onclick="startDateLimit()">
         	</div>
         	<div class="d-flex justify-content-between mt-2 mb-2">
         		<label class="mt-2" style="font-size:15px;">DUE DATE</label>
         		<input id="cardEndDate" type="date" 
         		style="width:60%;" onclick="endDateLimit()">
         	</div>
         </div>
         <div>
         	<button id="datesSaveBtn" onclick="cardDateSave(${cardinfo.card_id})" class="btn btn-secondary" style="width:100%;">SAVE</button>
         </div>
       </div>
       
       <!-- 카드 관리자 추가 모달창 -->
      <div id="add_Member" class="card">
         <a class="add_Member_close_btn fa fa-times" style="cursor:pointer;" onclick="closeAddMember()"></a>
         <div class="card" style="height:350px; overflow:scroll; overflow-x:hidden;">
         	<label class="ml-3">Your Partners 👫</label>
         	<!-- 해당 보드에 초대된 멤버목록 -->
         	<c:forEach items="${boardJoinMembers}" var="member">
         		<span class="member ml-3 mt-1 mb-1" style="font-size:15px;">
         			<button class="btn btn-light" style="width:95%;" data-memid="${member.id}"
         			onclick="managerSelect('${member.id}')"> ${member.name}(${member.id})</button>
         		</span>
         	</c:forEach>
         </div>
         <hr>
         <div class="card selectedMember">
         	<label class="ml-3">Manager  </label>
	         <button id="cardManager" class="ml-3 mb-3 btn btn-light" style="width:90%;">${cardinfo.manager}</button>
         	 <c:if test="${cardinfo.manager ne null}">
	         	 <span class="ml-2" style="font-size:13px; color:tomato;">* If you click this button, the manager will be deleted.</span>
         	 </c:if>
         </div>
         <div>
         	<button id="managerSaveBtn" class="btn btn-secondary" style="width:100%;">SAVE</button>
         </div>
       </div>
       
      <!-- Main Content -->
      <div class="main-content" style="min-height: 829px;">
        <section class="section">
          <div class="row">
            <!--사용자가 선택한 리스트-->
            <div id="selectedList" class="col-lg-2 cardDetail" data-listId="${listinfo.list_id}"
            style="background-color: rgb(252, 250, 250);">
              <div class="card.h-100 listnameAppendTarget">
                <h4 class="listName${listinfo.list_id} mt-5 mb-4 ml-4" onclick="renameList(${listinfo.list_id})">${listinfo.list_title}</h4> <!--리스트 이름 표시-->
                <div class="cardArea">
                <!--해당 리스트안에 카드리스트-->
                <c:forEach items="${samelistcards}" var="card">
                  <div id="card${card.card_id}" style="cursor:pointer;" data-cardId="${card.card_id}"
                   onclick="location.href='cardDetail?list=${card.list_id}&card=${card.card_id}'"
                   class="cards card card-${card.card_label} ml-2 mr-2"> <!--라벨표시-->
                    <div class="card-header d-flex justify-content-between">
                      <span class="cardName${card.card_id} ml-0">${card.card_title}</span> <!--카드이름-->
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
                <h4 class="closeCardDetail mr-3 mt-3" style="cursor:pointer;"
                  onclick="location.href='boardDetail?boardID=${workspace.board_id}'">
                  <i class="fa fa-window-close" title="close_card" aria-hidden="true"></i>
                </h4>
              </div>
              <div class="row" id="selectedCard" data-cardId="${cardinfo.card_id}" data-cardManager="${cardinfo.manager}">
                <!--카드상세내용-->
                <div class="col-lg-7 ml-3" style="border-right: whitesmoke 1px solid;">
                  <!--카드이름 & 책임자-->
                  <div id="cardTitleAppendTarget" class="d-flex justify-content-between">
                      <h4 id="card_Title" class="cardName mt-5 mb-4" onclick="renameCard(${cardinfo.card_id})">${cardinfo.card_title}</h4>
                      <!-- 책임자 존재할때만 뜨도록 -->
                      <c:if test="${cardinfo.manager ne null}">
                      	<span class="btn mt-5 mb-5 ml-5">Member.  ${cardinfo.manager}
                      </span>
                      </c:if>
                  </div>
                  <!--카드메뉴-->
                  <div class="row d-flex justify-content-center mr-2 cardmenu">
                    <button class="btn menu" onclick="cardDatesSet('add_Dates')"> Dates </button>
                    <button class="btn menu" onclick="cardCheckListSet('add_Check',${cardinfo.card_id})"> CheckList </button>
                    <label class="btn menu mt-2" for="input-file"> Attachments </label>
                    <input type="file" id="input-file" style="display:none;">
                    <button class="btn menu" onclick="cardMemberSet('add_Member')"> Member </button>
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
	                        <h4>Dates</h4>
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
                        <button class="btn btn-light ml-2" onclick="contentsEdit()">Edit</button>
                      </div>  
                      <div class="card-body">
                        <textarea class="cardContents" rows="4" style="width:100%;" readonly>${cardinfo.card_contents}</textarea>
                        <button class="saveBtn btn btn-secondary mt-1" style="position:relative;"
                         onclick="contentsSave(${cardinfo.card_id})">SAVE
                        	<div class="saveDone">SUCCESS !</div>
                        </button>
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
                      <div class="card-body" id="checklistAppendTarget">
                      	<c:forEach items="${checkList}" var="check">
                        <!--여기서부터-->
                        <div class="card ckDIV${check.checklist_id}">
                          <div class="card-body" id="checkbody${check.checklist_id}">
                            <div class="d-flex justify-content-between" onclick="checklistTitleRename(${check.checklist_id})"
                            style="font-size:18px; font-weight:bold; color:#868e96;" id="checklistTitle${check.checklist_id}">
                            	${check.checklist_title}
                            	<button class="btn ml-2 fa fa-times col-rg" 
                            	onclick="checklistDelete(${check.checklist_id})"></button>
                            </div>
                            <div class="progress mb-2"><span class="checkChart${check.checklist_id}"></span></div>
                            <c:forEach items="${checkItems}" var="item">
	                            <c:if test="${item.checklist_id eq check.checklist_id}">
    	                        <c:if test="${item.item_status eq 'Y'}">
        		                    <input type="checkbox" checked="checked" onclick="checkItem(${item.checklist_id},${item.item_id})"
   	    		                    class="ckitem${item.item_id} mt-1 mb-1 checkitem${item.checklist_id}">
   	    		                    <span id="ckItemTitle${item.item_id}" class="ckitem${item.item_id}" onclick="itemTitleRename(${item.item_id})">${item.item_title}</span>
       			                    <i class="ml-5 fa fa-times ckitem${item.item_id}" style="color:#ced4da; 
       			                    cursor:pointer;" onclick="ckItemDelete(${item.item_id})"></i><br>
                	            </c:if>
                    	        <c:if test="${item.item_status eq 'N'}">
                       		    	<input type="checkbox" onclick="checkItem(${item.checklist_id},${item.item_id})"
   	                    		    class="ckitem${item.item_id} mt-1 mb-1 checkitem${item.checklist_id}">
   	                    		    <span id="ckItemTitle${item.item_id}" class="ckitem${item.item_id}" onclick="itemTitleRename(${item.item_id})">${item.item_title}</span>
       	                		    <i class="ml-5 fa fa-times ckitem${item.item_id}" style="color:#ced4da; 
 	                		    	cursor:pointer;" onclick="ckItemDelete(${item.item_id})"></i><br>
                            	</c:if>
                            	</c:if>
                            </c:forEach>
                          </div>
                          <button class="btn btn-secondary fa fa-plus ml-4 mb-5 additem${check.checklist_id}" 
                          style="width:15%;" onclick="addCheckListItems(${check.checklist_id})"> item</button>
                        </div>
                        <!--여기까지가 하나의 체크리스트-->
                      	</c:forEach>
                      </div>
                    </div>
                   </div>
                  <!--카드아이템 : 파일첨부-->
                  <div class="row mb-5">
                    <div class="card">
                      <div style="width: 740px;"></div>
                      <div class="card-header" style="font-size: large;">
                        <i class="fa fa-paperclip ml-1 files">&nbsp;&nbsp;Attachments</i>
                      </div>
                      <div class="card-body" id="file_append_target">
                      <c:forEach items="${fileinfoList}" var="file">
                        <!--여기서부터-->
                        <div class="card" id="file${file.file_id}">
                          <div class="card-body d-flex">
                          	<div style="box-shadow:2px 2px 2px 1px #adb5bd; width:200px; 
                          	height:80px; border:solid 1px #D3D3D3; line-height:80px; 
                          	border-radius:10px;" class="mr-2 text-center thumbnail">
                          	<c:if test="${fn:substringAfter(file.pfile_name,'.') eq 'jpg' 
                          	|| fn:substringAfter(file.pfile_name,'.') eq 'png' 
                          	|| fn:substringAfter(file.pfile_name,'.') eq 'gif'}">
                          		<img src="${file.pfile_name}">
                          	</c:if>
                          		<h5 style="display:inline-block;">${fn:substringAfter(file.pfile_name,'.')}</h5>
                          	</div>
                            <div class="ml-3 mt-2">
								<div class="row mb-2">
									<span>&nbsp;&nbsp;&nbsp;${file.file_name}</span>
								</div>
								<div class="row">
									<span class="btn filedelbtn" onclick="fileDelete(${file.file_id})">Delete</span>
									<span class="btn filedownbtn" onclick="fileDownload(${file.file_id})">Download</span>
								</div>
							</div>
                          </div>
                        </div>
                      </c:forEach>
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
<script type="text/javascript">
//카드 파일업로드
$("#input-file").on("change", function(){
	var form = new FormData();
	form.append("file", $("#input-file")[0].files[0]);
	form.append("card_id", $("#selectedCard").attr("data-cardId"));
	$.ajax({
		url : "AjaxCardFileUpload",
		type : "POST",
		data : form,
		dataType : "json",
		contentType : false,
		processData : false,
		success : function(data){
			console.log(data);
			let file_end = (data.file_name).substring((data.file_name).lastIndexOf(".")+1); //확장자명
			
			let card = document.createElement("div");
			card.setAttribute("class","card");
			card.setAttribute("id","file"+data.file_id);
			let hhhhead = document.createElement("div");
			hhhhead.setAttribute("class","card-body d-flex");
			let thumbnail = document.createElement("div");
			thumbnail.setAttribute("class","mr-2 text-center thumbnail");
			
			let cardbody = document.createElement("div");
			cardbody.setAttribute("class","ml-3 mt-2");
			let frow = document.createElement("div");
			frow.setAttribute("class","row mb-2");
			let filename = document.createElement("span");
			filename.innerHTML = "&nbsp;&nbsp;&nbsp;"+data.file_name;
			let srow = document.createElement("div");
			srow.setAttribute("class","row");
			let delbtn = document.createElement("span");
			delbtn.setAttribute("class","btn filedelbtn");
			delbtn.innerHTML = "Delete";
			delbtn.onclick = function(){
				fileDelete(file_id);
			}
			let downbtn = document.querySelector("span");
			downbtn.setAttribute("class","btn filedownbtn");
			downbtn.innerHTML = "Download";
			downbtn.onclick = function(){
				fileDownload(file_id);
			}
			
			let input = document.querySelector("#input-file");
			if(input.files[0].type.match(/image\//)){
				let img = document.createElement("img");
				getFileSrc(input,img);
				thumbnail.append(img);
			}else{
				let thumbname = document.createElement("h5");
				thumbname.style.display="inline-block";
				thumbname.innerText=file_end;
				thumbnail.append(thumbname);
			}
			
			frow.append(filename);
			srow.append(delbtn);
			srow.append(downbtn);
			cardbody.append(frow);
			cardbody.append(srow);
			hhhhead.append(thumbnail);
			hhhhead.append(cardbody);
			card.append(hhhhead);
			
			file_append_target.prepend(card);
		},
		error : function(){
			console.log("AjaxCardFileUpload 실패");
		}
	})
})
 
function getFileSrc(input,img){
      var reader = new FileReader();
      
      reader.onload = function (e) {
      	img.setAttribute("src", e.target.result)
      }
      reader.readAsDataURL(input.files[0])
 }
 </script>
 
 <!-- 은지 코드 -->
 <script src="resources/js/card/card-details.js"></script>
</body>
</html>