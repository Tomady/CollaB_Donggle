<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>Insert title here</title>

  <style>
.cardDetail {
	width: 100%;
	height: 850px;
	overflow: scroll;
	overflow-x: hidden;
	border-radius: 2px;
}

.label {
	width: 25px;
	height: 25px;
	border: rgb(240, 240, 240) 1px solid;
	text-align: center;
	line-height: 2;
	cursor: pointer;
}

.fa-check {
	color: black;
}

.cardmenu {
	background-color: whitesmoke;
	border-radius: 10px;
}

.menu {
	font-size: medium;
	color: gray;
}

#testbtn {
	position: relative;
}

.test123 {
	width: 50px;
	height: 30px;
	background-color: gray;
	border-radius: 5px;
	color: white;
	opacity: 0;
	transition: all 0.3s;
	position: absolute;
	top: -5px;
	left: 280px;
	z-index: 999;
	line-height: 30px;
}
/* 임의 스타일 */
.test1234 {
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

#add_Dates .add_Dates_close_btn, #add_Member .add_Member_close_btn {
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
.saveDone {
	width: 80px;
	height: 30px;
	background-color: gray;
	border-radius: 5px;
	color: white;
	opacity: 0;
	transition: all 0.3s;
	position: absolute;
	top: -25px;
	left: -15px;
	z-index: 999;
	line-height: 30px;
}

.saveDone123 {
	transition: all 0.2s;
	opacity: 1;
}

.thumbnail {
	box-shadow: 2px 2px 2px 1px #adb5bd;
	width: 200px;
	height: 80px;
	border: solid 1px #D3D3D3;
	line-height: 80px;
	border-radius: 10px;
	overflow: hidden;
}

.thumbnail img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.filedelbtn:hover, .filedownbtn:hover, .cardThema:hover, .fileeditbtn:hover
	{
	text-decoration: underline !important;
	cursor: pointer;
}

.fas.fa-bars {

	cursor: pointer;
	position: relative;
}

.fas__menu {
	display: none;
	position: absolute;
	left: 18px;
	top: -3px;
	width: 45px;
	height: 50px;
	border-radius: 7px;
	border: 1px solid black;
}

.fas__menu__btnC {
	border-radius: 7px 7px 0 0;
	border-bottom: 1px solid black;
}

.fas__menu__btnD {
	border-radius: 0 0 7px 7px;
}

.fas__menu__btnC, .fas__menu__btnD {
	width: 100%;
	height: 50%;
	text-align: center;
	line-height: 25px;
	/* background-color: #e3eaef; */
	background-color: #fff;
}

.fas__menu__btn:first-child {
	border-bottom: 1px solid #b1b6b9;
}

.goodBtnRow {
	cursor: pointer;
	margin-right: 5px;
	width: 15px;
	height: 100%;
}

.badBtnRow {
	cursor: pointer;
	width: 15px;
	height: 100%;
}

.comment__input__row {
	display: flex;
}

.comment__input__Box {
	border: 1px solid rgb(202, 202, 202);
	border-radius: 5px;
	width: 100%;
	box-shadow: 0 2px 4px -1px rgb(9 30 66/ 20%), 0 0 0 1px rgb(9 30 66/ 8%);
}

.textarea__Box {
	padding: 9px 12px 0 12px;
	height: auto;
}

.textarea__Box textarea {
	width: 100%;
	overflow: hidden;
	overflow-wrap: break-word;
	outline: none;
	border: none;
	resize: none;
}

.textareaEl {
	height: 20px;
	min-height: 20px;
	padding: 0;
}

.input__Box__Btns__none {
	display: none;
}

.input__Box__Btns {
	display: flex;
	justify-content: space-between;
	height: 50px;
	align-items: center;
	padding: 0 10px;
}

.input__Box__btns__left {
	display: flex;
	align-items: center;
}

.input__Box__btns__left label {
	margin-bottom: 1px;
}

.file__icon {
	cursor: pointer;
	font-size: 18px;
}

#emoji-button {
	position: relative;
	border: none;
	background: none;
	font-size: 18px;
	margin-left: 5px;
}

.emoji-picker {
	z-index: 999;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.emoji-picker__content {
	border-bottom: none;
}

.emoji-picker__preview {
	padding-top: 25px;
	height: 100%;
	border-top: none;
}

.comment__input__filetext {
	cursor: pointer;
	margin-left: 10px;
}

.save_btn {
	border-radius: 5px;
	background-color: #6777ef;
	color: #fff;
	border: none;
	width: 65px;
	height: 32px;
	text-align: center;
	line-height: 32px;
	cursor: pointer;
	font-weight: bold;
}

.img__box__wrap {
	top: 0;
	left: 0;
	position: fixed;
	width: 100%;
	height: 100%;
	display: none;
	z-index: 999;
	background-color: rgba(0, 0, 0, 0.9);
}

.img__box {
	width: auto;
	height: auto;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 999;
	/* display: none; */
}

.img__box img {
	width: auto;
	height: auto;
	object-fit: cover;
}

.comment__row {
	display: flex;
	flex-direction: column;
	border-bottom: 1px dotted black;
}

.comment__class__1 {
	display: flex;
	/* 	padding-right: 5px; */
}

.comment__row__left {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.recomment__btn {
	border: 1px solid rgb(182, 182, 182);
	text-align: center;
	cursor: pointer;
	width: 45px;
	height: 20px;
	font-size: 14px;
	line-height: 20px;
	border-radius: 1px;
	display: flex;
	justify-content: center;
	border-radius: 4px;
	margin-right: 10px;
}

.recomment__btn i {
	display: inline-block;
	margin-top: 1.8px;
	font-size: 15px;
	margin-right: 5px;
}

.recomment__num {
	display: inline-block;
}

.comment__row__right {
	width: 100%;
	display: flex;
	flex-direction: column;
}

.comment__writer__box {
	margin-bottom: 10px;
	display: flex;
	justify-content: space-between;
}

.recomment__wrap .comment__writer__box {
	
}

.comment__writer {
	font-size: 15px;
	font-weight: 600;
}

.comment__context {
	margin-bottom: 5px;
	font-size: 14px;
	color: #98a6ad;
	min-height: 70px;
}

.comment__context__file__prev {
	display: none;
	align-items: center;
	border: 3px solid rgb(248, 248, 248);
	border-radius: 10px;
	padding: 5px 15px 5px 5px;
}

.context__file__prev__imgBox {
	margin-right: 3px;
	width: 50px;
	height: 50px;
	overflow: hidden;
}

.context__file__prev__imgBox img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.comment__context__file {
	margin-bottom: 10px;
	font-size: 13px;
	display: none;
	border: 3px solid rgb(248, 248, 248);
	border-radius: 10px;
	padding: 5px 15px 5px 5px;
}

.comment__context__file span i {
	font-size: 15px;
}

.comment__context__file a {
	text-decoration: underline;
	font-size: 13px;
	font-weight: 600;
}

.comment__info {
	display: flex;
	justify-content: space-between;
	font-size: 13px;
	font-weight: 500;
	margin-top: 15px;
}

.comment__class__1__underline {
	width: 100%;
	height: 1px;
	background-color: #e8eaeb;
	margin: 1rem 0;
}

.class2 {
	padding: 0;
}

.class2 li {
	border-bottom: 1px dotted rgb(190, 190, 190);
}

.class2 li:last-child {
	border-bottom: 1px dotted rgb(190, 190, 190);
	padding-bottom: 10px;
	margin-bottom: 10px;
}

.recomment__row {
	margin-bottom: 10px;
	padding-bottom: 10px;
	display: flex;
	width: 100%;
	display: flex
}

.recomment__left {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.imgHd {
	visibility: hidden;
}

.recomment__icon {
	width: 11px;
	height: 11px;
	border-bottom: 2px solid rgb(104, 104, 104);
	border-left: 2px solid rgb(104, 104, 104);
	margin-top: 5px;
}

.recomment__right {
	display: flex;
	width: 100%;
}

.recomment__content {
	width: 100%;
}

.recommentgoodbadBtn {
	
}

.recomment__wrap {
	padding: 0 10px 0 10px;
	background-color: rgb(235, 235, 235);
	display: none;
	border-radius: 20px;
	margin-top: 10px;
}

.recomment__wrap .comment__input__Box {
	background-color: #fff;
}

.recomment__input__box {
	/* border-top: 1px dotted rgb(216, 216, 216); */
	padding: 15px 0px 20px 0px;
	display: flex;
	width: 100%;
}

.recomment__input__box .comment__input__row {
	width: 100%;
}

.recomment__box {
	/* 	padding-top: 10px; */
	
}

.commentContainer {
	margin: 0 auto;
	flex: 0 0 33.333333%;
	max-width: 33.333333%;
	position: relative;
	width: 100%;
	box-sizing: border-box;
}

.list-unstyled-border li {
	border-bottom: 1px solid rgb(235, 235, 235);
}

.context__file__prev__removeBtn {
	display: none;
	margin-left: auto;
}

.context__file__prev__removeBtn i {
	cursor: pointer;
	font-size: 25px;
}

.comment__card__body {
	/* 	min-width: 310px; */
	border: 5px solid rgb(235, 235, 235);
	border-radius: 20px;
	padding: 10px;
}

.comment__date {
	margin-left: 5px;
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
					document.querySelector(".profimg"+cardId).setAttribute("src","/profilePic/"+data.managerImg);					
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
				}else if(itemCnt == 0){
					document.querySelector(".checkChart"+checkId).innerHTML = "&nbsp;&nbsp;&nbsp;"+0+"%";
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
	                     	<img style="height: 25px; width: 25px;" 
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
                      	<span class="btn mt-5 mb-5 ml-5" style="font-size:17px;">📌Manager. ${manager}</span>
                      </c:if>
                      <c:if test="${cardinfo.manager eq null}">
                      	<span class="btn mt-5 mb-5 ml-5" style="font-size:17px; visibility:hidden"></span>
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
                          <div class="label light" style="background-color: white;" onclick="selectLabel('None',${cardinfo.card_id})"> </div>
                          <div class="label danger" style="background-color: rgb(253, 38, 38);" onclick="selectLabel('Red',${cardinfo.card_id})"></div>
                          <div class="label warning" style="background-color: rgb(255, 184, 52);" onclick="selectLabel('Orange',${cardinfo.card_id})"></div>
                          <div class="label success" style="background-color: rgb(58, 231, 95);" onclick="selectLabel('Green',${cardinfo.card_id})"></div>
                          <div class="label info" style="background-color: rgb(0, 217, 255);" onclick="selectLabel('SkyBlue',${cardinfo.card_id})"></div>
                          <div class="label primary" style="background-color: rgb(85, 73, 248);" onclick="selectLabel('Blue',${cardinfo.card_id})"></div>
                          <div class="label secondary" style="background-color: rgb(165, 165, 165);" onclick="selectLabel('Gray',${cardinfo.card_id})"></div>
                          <div class="label dark" style="background-color: rgb(7, 7, 7);" onclick="selectLabel('Black',${cardinfo.card_id})"> </div>
                          <c:if test="${cardinfo.card_label eq 'light'}">
                          	<input id="testbtn" class="selectedLabel form-control ml-1 mr-1" type="text" style="width: 80px; 
                          	height: 25px;" value="None" readonly>
                          </c:if>
                          <c:if test="${cardinfo.card_label eq 'danger'}">
                          	<input id="testbtn" class="selectedLabel form-control ml-1 mr-1" type="text" style="width: 80px; 
                          	height: 25px;" value="Red" readonly>
                          </c:if>
                          <c:if test="${cardinfo.card_label eq 'warning'}">
                            <input id="testbtn" class="selectedLabel form-control ml-1 mr-1" type="text" style="width: 80px; 
                            height: 25px;" value="Orange" readonly>
                          </c:if>
                          <c:if test="${cardinfo.card_label eq 'success'}">
                          	<input id="testbtn" class="selectedLabel form-control ml-1 mr-1" type="text" style="width: 80px; 
                          	height: 25px;" value="Green" readonly>
                          </c:if>
                          <c:if test="${cardinfo.card_label eq 'info'}">
                          	<input id="testbtn" class="selectedLabel form-control ml-1 mr-1" type="text" style="width: 80px; 
                          	height: 25px;" value="SkyBlue" readonly>
                          </c:if>
                          <c:if test="${cardinfo.card_label eq 'primary'}">
                          	<input id="testbtn" class="selectedLabel form-control ml-1 mr-1" type="text" style="width: 80px; 
                          	height: 25px;" value="Blue" readonly>
                          </c:if>
                          <c:if test="${cardinfo.card_label eq 'secondary'}">
                          	<input id="testbtn" class="selectedLabel form-control ml-1 mr-1" type="text" style="width: 80px; 
                          	height: 25px;" value="Gray" readonly>
                          </c:if>
                          <c:if test="${cardinfo.card_label eq 'dark'}">
                          	<input id="testbtn" class="selectedLabel form-control ml-1 mr-1" type="text" style="width: 80px; 
                          	height: 25px;" value="Black" readonly>
                          </c:if>
                          	<div class="test123">&nbsp;SAVE!</div>
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
                      </div>  
                      <div class="card-body" >
                        <textarea onclick="contentsEdit()" class="cardContents" rows="4" style="width:100%;" readonly>${cardinfo.card_contents}</textarea>
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
                            <div class="progress mb-2">
                         		<c:set var="itemCnt" value="0"></c:set>
                            	<c:forEach items="${checkItems}" var="item">
                            		<c:if test="${item.checklist_id eq check.checklist_id}">
                            			<c:if test="${item.item_status eq 'Y'}">
			                         		<c:set var="itemCnt" value="${itemCnt+1}"></c:set>                            			
                            			</c:if>
                            		</c:if>
                            	</c:forEach>
                            	<span class="checkChart${check.checklist_id}" style="font-weight:bold;">
                            		<c:if test="${itemCnt eq 0}">&nbsp;&nbsp;&nbsp;0%</c:if>
                            	</span>
                            </div>
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
                      	<c:if test="${file.pfile_name ne null}">
							 <!--여기서부터-->
                        <div class="card" id="file${file.file_id}">
                          <div class="card-body d-flex">
                          	<div style="box-shadow:2px 2px 2px 1px #adb5bd; width:200px; 
                          	height:80px; border:solid 1px #D3D3D3; line-height:80px; 
                          	border-radius:10px;" class="mr-2 text-center thumbnail">
                          	<c:if test="${fn:substringAfter(file.pfile_name,'.') eq 'jpg' 
                          	|| fn:substringAfter(file.pfile_name,'.') eq 'png' 
                          	|| fn:substringAfter(file.pfile_name,'.') eq 'gif'}">
                          		<img id="thumbnailImg${file.file_id}" src="/cardFile/${file.pfile_name}">
                          	</c:if>
                          		<h5 style="display:inline-block;">${fn:substringAfter(file.pfile_name,'.')}</h5>
                          	</div> 
                            <div class="ml-3 mt-2">
								<div class="row mb-2">
									<span>&nbsp;&nbsp;&nbsp;${file.file_name}</span>
								</div>
								<div class="row">
									<span class="btn filedelbtn" onclick="fileDelete(${file.file_id})">Delete</span>
									<a class="btn filedownbtn" href="cardFileDownload?file_name=${file.file_name}&pfile_name=${file.pfile_name}">Download</a>
									<!-- <label class="btn fileeditbtn" for="input-fileEdit${file.file_id}" onclick="cardFileEdit(${file.file_id})">Edit</label>
                    				<input type="file" id="input-fileEdit${file.file_id}" style="display:none;">  -->
									<c:if test="${fn:substringAfter(file.pfile_name,'.') eq 'jpg' 
		                          	|| fn:substringAfter(file.pfile_name,'.') eq 'png' 
		                          	|| fn:substringAfter(file.pfile_name,'.') eq 'gif'}">
																			<c:if test="${cardinfo.card_thema ne file.file_id}">
																				<span class="btn cardThema"
																					onclick="cardThemaSelect(${file.file_id},${file.card_id})">Make
																					Cover</span>
																			</c:if>
																			<c:if test="${cardinfo.card_thema eq file.file_id}">
																				<span class="btn cardThema"
																					onclick="cardThemaRemove(${file.file_id},${file.card_id})">Remove
																					Cover</span>
																			</c:if>
																		</c:if>
																	</div>
																</div>
															</div>
														</div>
													</c:if>
												</c:forEach>
												<!--여기까지가 하나의 첨부파일-->
											</div>
										</div>
									</div>
								</div>
								<!--카드댓글-->
								<!--////////////////////////재의님 여기예요~!!!/////////////////////-->
								<div class="mt-5 commentContainer">
									<h4 class="cardName ml-2">
										Activity <i class="fa fa-comment" aria-hidden="true"></i>
									</h4>
									<div class="card-body comment__card__body">
										<div class="comment__input__row">
											<img class="mr-3 rounded-circle" width="40" height="40px"
												src="" alt="avatar">
											<div class="comment__input__Box">
												<div class="textarea__Box">
													<textarea name="" id=""
														class="textareaEl textareaEl__class1"></textarea>
												</div>
												<div class="input__Box__Btns__none">
													<div class="input__Box__Btns">
														<div class="input__Box__btns__left">
															<label for="input_file"
																class="file__icon fa fa-paperclip ml-1 files"></label> <input
																type="file" id="input_file" name="file"
																class="input_file" style="display: none;">
															<button id="emoji-button" data="1"
																class="emoji_button_class1 emojibutEl">😀</button>
															<div class="comment__input__filetext filetext__class1"></div>
														</div>
														<div class="input__Box__btns__right">
															<div class="save_btn" onclick="commentCreate()">SAVE</div>

														</div>
													</div>
												</div>
											</div>
										</div>
										<hr>
										<ul
											class="comment__box mt-4 list-unstyled list-unstyled-border">


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

	<div class="class1Temaplate" style="display: none;"
		id="commentPlusTemplate">
		<li class="comment__row classTarget">
			<div class="comment__class__1">
				<div class="comment__row__left">
					<img class="mr-3 rounded-circle" width="30" height="30px"
						src="resources/assets/img/avatar/avatar-1.png" alt="avatar">
					<div class="recomment__btn">
						<i class="fas fa-comment-medical"></i><span class="recomment__num">0</span>
					</div>
				</div>
				<div class="comment__row__right">
					<div class="comment__writer__box">
						<div class="comment__writer"></div>
						<div class="fas__fa__menu">
							<div class="fas fa-bars">
								<div class="fas__menu">
									<div class="fas__menu__btnC">수정</div>
									<div class="fas__menu__btnD">삭제</div>
								</div>
							</div>
						</div>
					</div>

					<div class="comment__context"></div>
					<div class="comment__context__file__prev">
						<div class="context__file__prev__imgBox">
							<img alt="" src="">
						</div>
						<div class="context__file__prev__text">
							파일명 : <a href="#" class="fileContent"></a>
						</div>
						<span class="context__file__prev__removeBtn"> <i
							class="fas fa-times"></i>
						</span>
					</div>
					<div class="comment__context__file">
						파일명 : <a href="#" class="fileContent"></a> <span
							class="context__file__prev__removeBtn"> <i
							class="fas fa-times"></i>
						</span>
					</div>
					<div class="comment__info">
						<span class="comment__date"></span> <span class="comment__right">
							<span class="goodBtnRow"> <span class="goodBtnRow__icon">👍🏻</span>
								<span class="goodBtnRow__num">0</span>
						</span> <span class="badBtnRow"> <span class="badBtnRow__icon">👎🏻</span>
								<span class="badBtnRow__num">0</span>
						</span>
						</span>
					</div>
				</div>
			</div>
			<div class="recomment__wrap">
				<ul
					class="recomment__box mt-4 list-unstyled list-unstyled-border class2">
				</ul>
				<div class="recomment__input__box">
					<div class="recomment__left">
						<div class="recomment__icon"></div>
						<img class="mr-3 rounded-circle imgHd" width="20" height="22px"
							src="" alt="avatar">
					</div>
					<div class="comment__input__row">
						<img class="mr-3 rounded-circle" width="40" height="40px"
							src="" alt="avatar">
						<div class="comment__input__Box">
							<div class="textarea__Box">
								<textarea name="" id="" class="textareaEl textareaEl__class2"></textarea>
							</div>

						</div>
					</div>
				</div>
			</div>
		</li>

	</div>


	<div style="display: none;" class="filePrevTemplate">
		<div class="comment__context__file__prev">
			<div class="context__file__prev__imgBox">
				<img alt="" src="">
			</div>
			<div class="context__file__prev__text">
				파일명 : <a href="#" class="fileContent"></a>
			</div>
			<span class="context__file__prev__removeBtn"> <i
				class="fas fa-times"></i>
			</span>
		</div>
	</div>
	<div style="display: none;" class="textPrevTemplate">
		<div class="comment__context__file">
			파일명 : <a href="#" class="fileContent"></a> <span
				class="context__file__prev__removeBtn"> <i
				class="fas fa-times"></i>
			</span>
		</div>

	</div>

	<div style="display: none;" id="recommentBtnsTemplate">
		<div class="input__Box__Btns__none">
			<div class="input__Box__Btns">
				<div class="input__Box__btns__left">
					<label for="input_file__re"
						class="file__icon fa fa-paperclip ml-1 files"></label> <input
						type="file" id="input_file__re" class="input_file"
						style="display: none;">
					<button id="emoji-button" class="emoji_button_class2 emojibutEl">😀</button>
					<div class="comment__input__filetext filetext__class2"></div>
				</div>
				<div class="input__Box__btns__right">
					<div class="save_btn" onclick="createRecomment()">SAVE</div>
				</div>
			</div>
		</div>

	</div>

	<div style="display: none;" id="recommentTemplate"
		class="class2Temaplate">
		<li class="recomment__row classTarget">
			<div class="recomment__left">
				<div class="recomment__icon"></div>
				<img class="mr-3 rounded-circle imgHd" width="20" height="40px"
					src="" alt="avatar">
			</div>
			<div class="recomment__right">
				<img class="mr-3 rounded-circle" width="40" height="40px"
					src="" alt="avatar">
				<div class="recomment__content">
					<div class="comment__writer__box">
						<div class="comment__writer"></div>
						<div class="fas__fa__menu">
							<div class="fas fa-bars">
								<div class="fas__menu">
									<div class="fas__menu__btnC">수정</div>
									<div class="fas__menu__btnD">삭제</div>
								</div>
							</div>
						</div>
					</div>
					<div class="comment__context"></div>
					<div class="comment__context__file__prev"
						style="border: 3px solid #cbc6c6;">
						<div class="context__file__prev__imgBox">
							<img alt="" src="">
						</div>
						<div class="context__file__prev__text">
							파일명 : <a href="#" class="fileContent"></a>
						</div>
						<span class="context__file__prev__removeBtn"> <i
							class="fas fa-times"></i>
						</span>

					</div>
					<div class="comment__context__file">
						파일명 : <a href="#" class="fileContent"></a> <span
							class="context__file__prev__removeBtn"> <i
							class="fas fa-times"></i>
						</span>
					</div>
					<div class="comment__info">
						<span class="comment__date"></span> <span
							class="comment__right recommentgoodbadBtn"> <span
							class="goodBtnRow"> <span class="goodBtnRow__icon">👍🏻</span>
								<span class="goodBtnRow__num">0</span>
						</span> <span class="badBtnRow"> <span class="badBtnRow__icon">👎🏻</span>
								<span class="badBtnRow__num">0</span>
						</span>
						</span>
					</div>
				</div>
			</div>
		</li>

	</div>

	<div id="modify__input__Box" style="display: none;">
		<div class="comment__input__Box" data="modify__input">
			<div class="textarea__Box">
				<textarea name="" id="" class="textareaEl textareaEl__class2"></textarea>
			</div>

		</div>
	</div>

	<!-- 댓글 사진 미리보기 -->
	<div class="img__box__wrap">
		<div class="img__box">
			<img src="" alt="" class="img_preview">
		</div>
	</div>
	<input type="hidden" id="currentUserProfPic" value="${prof_pic }">
	<input type="hidden" id="currentCardId" value="${cardinfo.card_id}">
	<script src="https://cdn.jsdelivr.net/npm/emoji-button@0.6.0/dist/index.min.js"></script>
	<script type="text/javascript">
		let imgTag = document.querySelectorAll('.rounded-circle');
		console.log(imgTag);
		let prof_picTag = "${prof_pic}";
		let imgSrc = "/profilePic/" + prof_picTag;
		
		imgTag.forEach(function(val, ind) {
	        console.log(val);
	        if(prof_picTag.substring(0, 4) == 'http') {
	            val.setAttribute("src", prof_picTag);
	        } else {
	            val.setAttribute("src", imgSrc);
	        }
	    }) 
	</script>
	<script type="text/javascript">
//카드 파일업로드
$("#input-file").on("change", function(){
	let cardId = $("#selectedCard").attr("data-cardId");
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
			file_append_target.innerHTML=""
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
				fileDelete(data.file_id,cardId);
			}
			let downbtn = document.createElement("a");
			downbtn.removeAttribute("data-toggle");
			downbtn.setAttribute("class","btn filedownbtn");
			downbtn.setAttribute("href","cardFileDownload?file_name="+data.file_name+"&pfile_name="+data.pfile_name);
			downbtn.innerHTML = "Download";

			//let editbtn = document.createElement("label");
			//editbtn.setAttribute("class","btn filedelbtn");
			//editbtn.setAttribute("for","input-fileEdit"+data.file_id);
			//editbtn.innerHTML = "Edit";
			//editbtn.onclick = function(){
			//	cardFileEdit(data.file_id);
			//}
			//let fileInput = document.createElement("input");
			//fileInput.setAttribute("type","file")
			//fileInput.setAttribute("id","input-fileEdit"+data.file_id);
			//fileInput.style.display = "none";
			
			frow.append(filename);
			srow.append(delbtn);
			srow.append(downbtn);
			//editbtn.append(fileInput);
			//srow.append(editbtn);
			
			let input = document.querySelector("#input-file");
			if(input.files[0].type.match(/image\//)){
				let img = document.createElement("img");
				img.setAttribute("id","thumbnailImg"+data.file_id);
				getFileSrc(input,img);
				thumbnail.append(img);
				let themaBtn = document.createElement("span");
				themaBtn.setAttribute("class","btn cardThema");
				themaBtn.innerHTML = "Make cover";
				themaBtn.onclick = function(){
					cardThemaSelect(data.file_id, data.card_id);
				}
				srow.append(themaBtn);
			}else{
				let thumbname = document.createElement("h5");
				thumbname.style.display="inline-block";
				thumbname.innerText=file_end;
				thumbnail.append(thumbname);
			}
			
			cardbody.append(frow);
			cardbody.append(srow);
			hhhhead.append(thumbnail);
			hhhhead.append(cardbody);
			card.append(hhhhead);
			
			file_append_target.prepend(card);
			document.querySelector(".files"+cardId).style.color="tomato";
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
 
//카드 첨부파일 편집
//function cardFileEdit(file_id){
//	$("#input-fileEdit"+file_id).on("change", function(){
//		var form = new FormData();
//		form.append("file",$("#input-fileEdit"+file_id)[0].files[0]);
//		form.append("file_id", file_id);
//		$.ajax({
//			url : "AjaxCardFileEdit",
//			type : "POST",
//			data : form,
//			dataType : "text",
//			contentType : false,
//			processData : false,
//			success : function(data){
//				if(data != "NO"){
//					var reader = new FileReader();
//			        reader.onload = function (e) {
//			        	document.querySelector("#thumbnailImg"+file_id).setAttribute("src", e.target.result)
//			        }
//			        reader.readAsDataURL($("#input-fileEdit"+file_id)[0].files[0]);
//				}else{
//					alert("파일수정이 실패하였습니다.\n관리자에게 문의하세요.");
//				}
//			},
//			error : function(){
//				console.log("카드첨부파일 변경 실패");
//			}
//		})
//	})
//}
	


const currentCardId = $('#currentCardId').val();
const currentUserProfPic = $('#currentUserProfPic').val();

function checkFile(str){
	 
	 var ext =  str.split('.').pop().toLowerCase();
	 if($.inArray(ext, ['jpg' , 'jpeg', 'gif', 'bmp', 'png', 'tiff', 'svg', 'ico']) == -1) {
	     return false;
	 }
	 return true;
	}
	
function getDateStr(date){
    var sYear = date.getFullYear();
    var sMonth = date.getMonth() + 1;
    var sDate = date.getDate();
    sMonth = sMonth > 9 ? sMonth : "0" + sMonth;
    sDate  = sDate > 9 ? sDate : "0" + sDate;
    return sYear +"/"+ sMonth +"/"+ sDate;
}

function commentFileChk(commentFiles, commentId){
	for(let data of commentFiles){
		
		if(data.comment_id === commentId){
			
			return data;
		}
	}
	
	return null;
}
CommentApp = {
		
		init : async function(){
		
			$.ajax({
				url : 'ajaxCardIdSelect.do',
				type : 'post',
				dataType : 'json',
				data : {
					card_id : currentCardId
				},
				success : function(data){
					
					CommentApp.createComment(data);	
				}
			})
		
	},
	
	
	
	createComment : function(data){
	
		let recommentNum = 0;
		let prevComment_group;
		let commentFiles = CommentApp.ajaxFileSelectList();
		
		for(let comment of data){
		
			let template;
			
			
			console.log("asdfasdfasdf:" + comment.prof_pic);
			
			let src;
			
			if(comment.prof_pic.substring(0, 4) == 'http') {
				src = comment.prof_pic;	
			} else {
				src = "/profilePic/" + comment.prof_pic;
			}
			
			let nickname = comment.nickname;
			let id = comment.id;
			let commentId = comment.comment_id;
			let content = comment.comment_content;
			let sdate = new Date(comment.comment_date);
			let good = comment.comment_good;
			let bad = comment.comment_bad;
			let group = comment.comment_group;
			
			let cdate = getDateStr(sdate)
			let comment_order = comment.comment_order;
			
			if(prevComment_group == group && comment_order != 0){
				recommentNum++ 
				template = $('#recommentTemplate')
				template.find('.recomment__row').attr('data-id', id)
				template.find('.recomment__row').attr('data-commentId', commentId)
				template.find('.recomment__row').attr('data-group', group)
				template.find('.recomment__row').attr('data-order', comment_order)
				template.find('.recomment__right>img').attr('src', src)
				
			}else{
			
				recommentNum = 0;
				template = $('#commentPlusTemplate');
				template.find('.comment__row').attr('data-id', id)
				template.find('.comment__row').attr('data-commentId', commentId)
				template.find('.comment__row').attr('data-group', group)
				template.find('.comment__row').attr('data-order', comment_order)
				template.find('.comment__row__left>img').attr('src', src)
		
				
			
			}
			template.find('.comment__writer').text(nickname)
			template.find('.comment__context').html(content)
			template.find('.comment__date').text(cdate)
			template.find('.file__icon').attr('for', 'fileInput'+group)
			template.find('.input_file').attr('id', 'fileInput'+group)
			template.find('.comment__info').attr('data-commentId', commentId)
			template.find('.comment__context').attr('data-commentId', commentId)		
			
			prevComment_group = group
			let commnetFileInfo = commentFileChk(commentFiles, commentId)
		
			if(commnetFileInfo){
				let fileId = commnetFileInfo.file_id;
				let filename = commnetFileInfo.file_name;
				let pfile_name = commnetFileInfo.pfile_name;
				
				
				if(checkFile(filename)){
					
				
					template.find('.comment__context__file__prev').css("display", "flex");
					
					template.find('.comment__context__file__prev').addClass('classFileTarget')
					template.find('.comment__context__file__prev').attr('data-commentId', commentId)
					template.find('.context__file__prev__imgBox>img').attr("src", "/commentFile/"+pfile_name)
					template.find('.fileContent').text(filename)
					template.find('.fileContent').attr("href", "commentDownload.do?pfile_name="+pfile_name+"&file_name="+filename)
				}else{
				
					template.find('.comment__context__file').css("display", "flex")
					template.find('.comment__context__file').addClass('classFileTarget')
					template.find('.comment__context__file').attr('data-commentId', commentId)
					template.find('.comment__context__file>a').text(filename)
					template.find('.comment__context__file>a').attr('href', "commentDownload.do?pfile_name="+pfile_name+"&file_name="+filename)
				}
			
			}else{
				template.find('.comment__context__file').css('display', 'none')
			}
			let commentBadSum = CommentApp.ajaxCommentBadSum(commentId) 
			let commentGoodSum = CommentApp.ajaxCommentGoodSum(commentId)
			
			if(commentGoodSum == 0){
				template.find('.goodBtnRow__num').text(0)
			}else{
				template.find('.goodBtnRow__num').text(commentGoodSum)
			}
			
			if(commentBadSum == 0){
				template.find('.badBtnRow__num').text(0)
			}else{
				template.find('.badBtnRow__num').text(commentBadSum)
			}
			
			if(template.attr('class') == 'class1Temaplate'){
			
				$('.comment__box').append(template.html())
			}else{
				
				
				let comment__row = $('.comment__box').find('.comment__row')
				
				for(let commentbox of comment__row){
					
					if($(commentbox).attr('data-group')== group){
						let recommentNumb = Number($(commentbox).find('.recomment__num').text());
						recommentNumb += 1;
						
						$(commentbox).find('.recomment__num').text(recommentNumb);
						$(commentbox).find('.recomment__box').append(template.html())
					}
					
				}
				
			}
			
			CommentApp.templateRemoveFn(template)
			
		}
		CommentApp.bindEvents();
	},
	
	ajaxCommentGoodSum : function(commentId){
		let result;
		$.ajax({
			url : 'ajaxCommentGoodSum.do',
			type : 'post',
			dataType : 'text',
			async : false,
			data : {
				 comment_id : commentId
			},
			success : function(data){
			
				if(data != null){
					result = data;
				}else{
					result = 0;
				}
			}
			
		})
		
		return result;
	},
	
	ajaxCommentBadSum : function(commentId){
		
		let result;
		
		$.ajax({
			url : 'ajaxCommentBadSum.do',
			type : 'post',
			dataType : 'text',
			async : false,
			data : {
				comment_id : commentId
			},
			success : function(data){
				result = data
			}
		})
		
		return result;
	}
	
	,
	
	bindEvents : function(){
		$(document).on('click', '.recomment__btn', CommentApp.recommentEvt)
		$(document).on('click', '.goodBtnRow', goodBtnRowFn)
		$(document).on('click', '.badBtnRow', badBtnRowFn)
		$(document).on('click', '.context__file__prev__imgBox', commentImgprevFn)
		$(document).on('keydown keyup', '.textareaEl', textareaHeightFn)
		$(document).on('focus', '.textareaEl__class1', textareaFocusFn)
		$(document).on('focus', '.textareaEl__class2', textarea2FocusFn)
		$(document).on('change', '#input_file', inputFileFn)
		$(document).on('change', '#input_file__re', inputFileFn)
		$(document).on('click', '.context__file__prev__removeBtn', modifyFileDeleteBtnFn)
		$(document).on('click', '.comment__input__filetext', fileClickFn)
		$(document).on('click', '.fas__fa__menu', menuShowFn)
		$(document).on('click','.fas__menu__btnC', menuUpdateBtnFn)
		$(document).on('click','.fas__menu__btnD', menuDeleteBtnFn)
	},
	
	recommentEvt : function(event){
		$(event.target).closest('.comment__row').find('.recomment__wrap').slideToggle()
	},
	
	ajaxFileSelectList : function(commentId){
		let result;
		$.ajax({
			url : 'ajaxFileSelectList.do',
			type : 'post',
			dataType : 'json',
			async : false,
			data : {
				 comment_id : commentId
			},
			success : function(data){
				if(data == "false"){
					
				}else{
					result = data;
				}
				
			}
		})
		
		return result;
	},
	
	templateRemoveFn : function(template){
		
		if(template.attr("id") == commentPlusTemplate){
			
			template.find('.comment__row').removeAttr('data-id')
			template.find('.comment__row').removeAttr('data-group')
			template.find('.comment__row__left>img').attr('src', '')
		}else{
		
			template.find('.recomment__row').removeAttr('data-id')
			template.find('.recomment__row').removeAttr('data-group')
			template.find('.recomment__right>img').attr('src', '')
		}
	
		template.find('.comment__writer').text('')
		template.find('.comment__context').html('')
		template.find('.comment__date').text('')
		template.find('.file__icon').removeAttr('for')
		template.find('.input_file').removeAttr('id')
		
		
		template.find('.comment__context__file__prev').css("display", "none");
		template.find('.context__file__prev__imgBox>img').removeAttr("src")
		template.find('.context__file__perv__text').removeAttr("data")
		template.find('.fileContent').text('')
		template.find('.fileContent').removeAttr("href")
			
			
			
		template.find('.comment__context__file').removeAttr('data').css("display", "none")
		template.find('.comment__context__file>a').text('')
		template.find('.comment__context__file>a').removeAttr('href')
	
	}
	
	
}



 $(function(){
	 CommentApp.init();	
					
 })





function commentCreate() {
  let today = new Date();   
  let textareaElVal = $(event.target).closest('.comment__input__Box').find('.textareaEl').val()
  let file = $('#input_file')

  textareaElVal = textareaElVal.replace(/(?:\r\n|\r|\n)/g, '<br/>');
  let commentMaxGroup = ajaxCommentMaxGroup();
  let dateTypedate = today;
  let comment_date = getDateStr(today)
  let currentUserNickname = ajaxGetSessionUserNickname();

  let currentUserId = ajaxGetSessionUserId();
  
  if(file.val()){
	  let result = formCommentFileInsert(textareaElVal, commentMaxGroup, currentUserId, dateTypedate, file)

	  if(result){
		  commentFileCreateRow(textareaElVal, commentMaxGroup, currentUserId, comment_date, file, result)
		
	  }
	  
  }else{
		 let result = ajaxCommentInsert(textareaElVal, commentMaxGroup, currentUserId, dateTypedate)
	  if(result){
		 
		 commentCreateRow(textareaElVal, commentMaxGroup, currentUserId, currentUserNickname, comment_date, result)
	  }
  }
  
  $(event.target).closest('.comment__input__Box').find('.textareaEl').val('');
}

function createRecomment(evert){
	 let test = $(event.target);
	 let target
	 if(test.attr('class') == 'save_btn'){
		 target = test;
	 }else{
		 target = $('.comment__box').find('[data="modify__input"]').find('.save_btn')
	 }
	
 let targetData = target.closest('.comment__input__Box').attr('data');
 if(targetData == "modify__input"){
	
	 return modifyResult(target);
 }	
 let today = new Date();  
	 let file = target.closest('.input__Box__Btns').find('.input_file')
	 let targetGroup = target.closest('.comment__row').attr('data-group')
	 let textareaElVal = target.closest('.comment__input__Box').find('.textareaEl').val()
	 textareaElVal = textareaElVal.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	 let comment_date = getDateStr(today)
	 let currentUserNickname = ajaxGetSessionUserNickname();
	 let currentUserId = ajaxGetSessionUserId();
	 let targetOrder = ajaxRecommentMaxOrder(targetGroup);
	 let nickname = ajaxGetSessionUserNickname()
	 
	 let targetappend = target.closest('.recomment__wrap').find('.recomment__box')
	 if(file.val()){
		 let result = formRecommentFileInsert(textareaElVal, targetGroup, currentUserId, today, file, targetOrder)
		 
		 if(result){
			 recommentFileCreateRow(textareaElVal, targetGroup, currentUserId, comment_date, file, result, targetappend, target)
		 }
	 }else{
		let result = ajaxRecommentInsert(textareaElVal, targetGroup, currentUserId, today, targetOrder)
		
		recommentCreateRow(result, nickname, textareaElVal, comment_date, targetappend, target)
	 }
	 let recomment__amount = Number(target.closest('.comment__row').find('.recomment__num').text())
	 target.closest('.comment__row').find('.recomment__num').text(recomment__amount+1)
	
}

function recommentFileCreateRow(textareaElVal, targetGroup, currentUserId, comment_date, file, result, targetappend, target){
	
	let template = $('#recommentTemplate');
	
	let nickname = ajaxGetSessionUserNickname();
	let fileName = result.file_name;
	template.find('.comment__info').attr("data-commentid", result.comment_id)
	template.find('.recomment__row').attr('data-id', result.id)
	template.find('.recomment__row').attr('data-group', result.comment_group)
	template.find('.recomment__row').attr('data-order', result.comment_order)
	template.find('.recomment__right>img').attr('src', "/profilePic/"+currentUserProfPic)
	
	template.find('.comment__writer').text(nickname)
	template.find('.comment__context').html(textareaElVal)
	template.find('.comment__date').text(comment_date)
	template.find('.file__icon').attr('for', 'fileInput'+result.comment_group)
	template.find('.input_file').attr('id', 'fileInput'+result.comment_group)
	
	if(checkFile(fileName)){
	let img = template.find('.context__file__prev__imgBox').find('img')
	img.attr("class", "imgTarget");
	file.attr("class", "fileTarget");
	prevRowFileRead()
	template.find('.fileContent').text(fileName)
	template.find('.fileContent').attr("href", "commentDownload.do?pfile_name="+result.pfile_name+"&file_name="+result.file_name)	
	template.find('.context__file__perv__text').attr("data", result.file_id)
	template.find('.comment__context__file__prev').css("display", "flex");
	template.find('.comment__context__file__prev').addClass("classFileTarget");
	
	}else{
		template.find('.comment__context__file').attr('data', result.file_id).css("display", "flex")
		template.find('.comment__context__file>a').text(result.file_name)
		template.find('.comment__context__file').addClass("classFileTarget");
		template.find('.comment__context__file>a').attr('href', "commentDownload.do?pfile_name="+result.pfile_name+"&file_name="+result.file_name)
	}
	
	targetappend.append(template.html())
	

	
	let textareaEl = target.closest('.comment__input__Box').find('.textareaEl')
	target.closest('.input__Box__Btns').find('.input_file__re').val('')
	target.closest('.input__Box__Btns').find('.comment__input__filetext').text('')
	textareaEl.val('')
	textareaEl[0].style.height = '20px';

	CommentApp.templateRemoveFn(template)
	
	
}

function formRecommentFileInsert(textareaElVal, targetGroup, currentUserId, today, file, targetOrder){
	var form = new FormData()
	let result = null;
	let commentGroup = $('<input>').val(targetGroup)
	let commentOrder = $('<input>').val(targetOrder)
	let commentContent = $('<input>').val(textareaElVal)
	let userId = $('<input>').val(currentUserId)
	let date = $('<input>').val(today)
	let cardId = $('<input>').val(currentCardId)
	form.append("comment_group",commentGroup.val())
	
	form.append("comment_content",commentContent.val())
	
	form.append("id", userId.val())
	
	form.append("comment_date", date.val())
	
	form.append("card_id", cardId.val())
	
	form.append("comment_order", commentOrder.val())
	
	form.append("file", file[0].files[0]);

	
	result = ajaxRecommentFileInsert(form)
	return result;
}

function ajaxRecommentFileInsert(form){
	let flag = null;
	$.ajax({
		url : 'ajaxReCommentFileInsert.do',
		type : 'post',
		dataType : 'json',
		data : form,
		contentType :false,
		processData : false,
		async : false,
		success : function(data){
			flag = (data != null) ? data : null 
		}
	})
	
	return flag;
}

function recommentCreateRow(result, nickname, textareaElVal, comment_date, targetappend, target){
	let template = $('#recommentTemplate')
	template.find('.comment__info').attr("data-commentid", result.comment_id)
	console.log(template.find('.comment__info'))
	template.find('.recomment__row').attr('data-id', result.id)
	template.find('.recomment__row').attr('data-group', result.comment_group)
	template.find('.recomment__row').attr('data-order', result.comment_order)
	template.find('.recomment__right>img').attr('src', "/profilePic/"+currentUserProfPic)
	
	template.find('.comment__writer').text(nickname)
	template.find('.comment__context').html(textareaElVal)
	template.find('.comment__date').text(comment_date)
	template.find('.file__icon').attr('for', 'fileInput'+result.comment_group)
	template.find('.input_file').attr('id', 'fileInput'+result.comment_group)
	
	targetappend.append(template.html())
	
	CommentApp.templateRemoveFn(template)
	
	let textareaEl = target.closest('.comment__input__Box').find('.textareaEl')
	textareaEl.val('')
	textareaEl[0].style.height = '20px';
	
	
}

function ajaxRecommentInsert(textareaElVal, targetGroup, currentUserId, today, targetOrder){
	 	let result;
	$.ajax({
		url : 'ajaxRecommentInsert.do',
		type : 'post',
		dataType : 'json',
		async : false,
		data : {
			comment_group : targetGroup,
			comment_content : textareaElVal,
			card_id : currentCardId,
			id : currentUserId,
			comment_date : today,
			comment_order : targetOrder		
		},
		success : function(data){
			result = (data != null)? data : null;
		}
		
	})
	return result;
}

function ajaxRecommentMaxOrder(targetGroup){
	
	let targetOrder;
	$.ajax({
		url : 'ajaxRecommentMaxOrder.do',
		type : 'post',
		dataType: 'text',
		async : false,
		data : {
			comment_group : targetGroup,
				card_id : currentCardId
		},
		success : function(data){
		
			targetOrder = data;
		}
	})
	
	return targetOrder;
}

function commentFileCreateRow(textareaElVal, commentMaxGroup, currentUserId, comment_date, file, result){
	let template = $('#commentPlusTemplate');
	
	let nickname = ajaxGetSessionUserNickname();
	let fileName = result.file_name;
	template.find('.comment__info').attr("data-commentid", result.comment_id)
	template.find('.comment__writer').text(nickname)
	template.find('.comment__context').html(textareaElVal)
		
	template.find('.comment__row').attr('data-id', result.id)
	template.find('.comment__row').attr('data-group', result.comment_group)
	template.find('.comment__row__left>img').attr("src", "/profilePic/"+currentUserProfPic)
				
	template.find('.comment__date').text(comment_date)
	template.find('.file__icon').attr('for', 'fileInput'+result.comment_group)
	template.find('.input_file').attr('id', 'fileInput'+result.comment_group)
	
	if(checkFile(fileName)){
	let img = template.find('.context__file__prev__imgBox').find('img')
	img.attr("class", "imgTarget");
	file.attr("class", "fileTarget");
	prevRowFileRead()
	template.find('.fileContent').text(fileName)
	template.find('.fileContent').attr("href", "commentDownload.do?pfile_name="+result.pfile_name+"&file_name="+result.file_name)	
	template.find('.context__file__perv__text').attr("data", result.file_id)
	template.find('.comment__context__file__prev').addClass('classFileTarget')
	template.find('.comment__context__file__prev').css("display", "flex");
	
	
	}else{
		template.find('.comment__context__file').attr('data', result.file_id).css("display", "block")
		template.find('.comment__context__file>a').text(result.file_name)
		template.find('.comment__context__file').addClass('classFileTarget')
		template.find('.comment__context__file>a').attr('href', "commentDownload.do?pfile_name="+result.pfile_name+"&file_name="+result.file_name)
	}
	

	let templateTargetClass =template.find('.comment__context__file__prev');
	templateTargetClass.addClass('classFileTarget')

	$('.comment__box').append(template.html())
	
	CommentApp.templateRemoveFn(template)
	
	inputresultRemove()
}

function inputresultRemove(){
	let textareaEl = $('.textareaEl').val('');
	textareaEl[0].style.height = '20px';
	$('.filetext__class1').text('')
	$('#input_file').val('')
	
}


function prevRowFileRead(){
	  var file = document.querySelector('.fileTarget')
      var reader = new FileReader();
     
      reader.onload = function (e) {
    	  let imgtarget = $('.imgTarget')
    	  imgtarget.attr('src', e.target.result)
    	  let filetarget =$('.fileTarget')
    	  imgtarget.removeClass('imgTarget')
    	  filetarget.removeClass('fileTarget')
      }
      reader.readAsDataURL(file.files[0])
 }

function formCommentFileUpdate(textareaVal, input, commentId){
	
	var form = new FormData()
	let result;
	form.append("comment_id", commentId)
	form.append("comment_content", textareaVal)
	form.append("file", input[0].files[0]);
	result = ajaxFormCommentFileUpdate(form)
	return result;
}

function ajaxFormCommentFileUpdate(form){
	let result = null;
	$.ajax({
		url : 'ajaxFormCommentFileUpdate.do',
		type : 'post',
		dataType : 'json',
		data : form,
		contentType : false,
		processData : false,
		async : false,
		success : function(data){
			
			result = (data != null) ? data : null 
			
		}
	})
	
return result;
}

function formCommentFileInsert(textareaElVal, commentMaxGroup, currentUserId, dateTypedate, file){
	var form = new FormData()
	let result = null;

	form.append("comment_group", commentMaxGroup)
	
	form.append("comment_content", textareaElVal)
	
	form.append("id", currentUserId)
	
	form.append("comment_date", dateTypedate)
	
	form.append("card_id", currentCardId)
	
	form.append("file", $("#input_file")[0].files[0]);

	
	result = ajaxCommentFileInsert(form)
	return result;
}


function ajaxCommentFileInsert(form){
	let flag = null;
	$.ajax({
		url : 'ajaxCommentFileInsert.do',
		type : 'post',
		dataType : 'json',
		data : form,
		contentType :false,
		processData : false,
		async : false,
		success : function(data){
			flag = (data != null) ? data : null 
		}
	})
	
	return flag;
}

function ajaxGetSessionUserNickname(){
	let currentUserNickname;
	
	$.ajax({
		url : 'ajaxGetSessionUserNickname.do',
		type : 'post',
		dataType : 'text',
		async : false,
		success : function(data){

			currentUserNickname = (data !="false")? data : false;
		}
	})
	return currentUserNickname;
}

function ajaxGetSessionUserId(){
	let currentUserId;
	$.ajax({
		url : 'ajaxGetSessionUserId.do',
		type : 'post',
		dataType : 'text',
		async : false,
		success : function(data){
			currentUserId = (data != "false") ? data : false;
		}
	})
	
	return currentUserId;
}

function commentCreateRow(textareaElVal, commentMaxGroup, currentUserId, currentUserNickname, comment_date, result){
	
	let comment__box = $('.comment__box')
	
	let template = $('#commentPlusTemplate');
	template.find('.comment__info').attr("data-commentid", result.comment_id)
	template.find('.comment__row').attr("data-id", currentUserId);
	template.find('.comment__row').attr("data-group", commentMaxGroup);
	template.find('.comment__row__left>img').attr("src", "/profilePic/"+currentUserProfPic);
	template.find('.comment__writer').text(currentUserNickname);
	template.find('.comment__context').text(textareaElVal);
	template.find('.comment__date').text(comment_date);
	comment__box.append(template.html());
}


function ajaxCommentMaxGroup(){
	let commentMaxGroup;
	
	$.ajax({
		url : 'ajaxCommentMaxGroup.do',
		type : 'post',
		dataType : 'text',
		async : false,
		data : {
			card_id : currentCardId
		},
		success : function(data){
		
			commentMaxGroup = data;
		}
	})
	
	return commentMaxGroup;
}
function ajaxCommentInsert(textareaElVal, commentMaxGroup, currentUserId, comment_date){

	let flag;
	$.ajax({
		url : 'ajaxCommentInsert.do',
		type : 'post',
		dataType : 'json',
		async : false,
		data : {
			id : currentUserId,
			card_id : currentCardId,
			comment_content : textareaElVal,
			comment_group : commentMaxGroup,
			comment_date : comment_date
		},
		success : function(data){
			
			flag = (data != null) ? data : null;
		}
	})
	
	return flag;
}

window.addEventListener('DOMContentLoaded', () => {
  EmojiButton(document.querySelector('.emoji_button_class1'), function (emoji) {
	
    document.querySelector('.textareaEl__class1').value += emoji;
  });
  

});



function modifyFileDeleteBtnFn(event){
		
	let commentId = $(event.target).closest('.classFileTarget').attr('data-commentId');
	
	$(event.target).closest('.classFileTarget').remove();
	ajaxFileDelete(commentId);
}
	function ajaxFileDelete(commentId){
		
		$.ajax({
			url : 'ajaxFileDelete.do',
			type: 'post',
			dataType : 'text',
			data : {
				comment_id : commentId
			},
			success : function(data){
				
			}
		})
		
	}

	function commentImgprevFn(event){

  let src = $(event.target).attr('src');
  var image = $('.img_preview');
  image.attr('src', src)
  
  $('.img__box__wrap').css('display', 'block')


}

function textareaHeightFn(event){
	var textEle = $(event.target);
	textEle[0].style.height = '20px';
	var textEleHeight = textEle.prop('scrollHeight');
	textEle.css('height', textEleHeight)
}

function textareaFocusFn(event){
	$(event.target).closest('.comment__input__Box').find('.input__Box__Btns__none').slideDown(200)
}

function textarea2FocusFn(event){	
 let parentEl = $(event.target).closest('.comment__input__Box');
	
 let tgEl = $(event.target)
 
 
 if(parentEl.find('.input__Box__Btns__none').length){
	
	 return;
 }else{
	 
	 let tgElClass = $('.targetClass')
	 if(tgElClass.length){
		 
		 
		 tgElClass.closest('.comment__input__Box').find('.input__Box__Btns__none').slideUp(200)
	
		 tgElClass.removeClass('targetClass')
		 setTimeout(function() {
			 tgElClass.closest('.comment__input__Box').find('.input__Box__Btns__none').remove();
	    	 }, 200);  	
		 
		 setTimeout(function() {
				let btnsEl = $('#recommentBtnsTemplate');
				tgEl.addClass('targetClass')
			
				 $(event.target).parent().parent().append(btnsEl.html())
				 $(event.target).parent().parent().find('.input__Box__Btns__none').slideDown(200)
				 
				 EmojiButton(document.querySelector('.emoji_button_class2'), function (emoji) {
					   
					 document.querySelector('.targetClass').value += emoji;
			
			 	 });
		 }, 200);  
		 
	 }else{
		let btnsEl = $('#recommentBtnsTemplate');
		tgEl.addClass('targetClass')
		 $(event.target).parent().parent().append(btnsEl.html())
		 $(event.target).parent().parent().find('.input__Box__Btns__none').slideDown(200)
		 
		 EmojiButton(document.querySelector('.emoji_button_class2'), function (emoji) {
			   
			 document.querySelector('.targetClass').value += emoji;
	
	 	 });
		 
	 }
 }
}
function inputFileFn(event){

 readText(event.target)
}


function readText(input) {

  let tgInput = input;
  if (input.files && input.files[0]) {
	  

    $(tgInput).closest('.input__Box__Btns').find('.comment__input__filetext').text("파일명 : " + input.files[0].name)
  }
}


	function fileClickFn(e){
  let input = e.target.parentNode.querySelector('input');
  
  if (!input.files[0].type.match(/image\//)) {
    return;
  }
  var reader = new FileReader();
 
  reader.onload = function (e) {
    var image = $('.img_preview');
    image.attr('src', e.target.result)
  
    $('.img__box__wrap').css('display', 'block')
  }
  reader.readAsDataURL(input.files[0])
}



function badBtnRowFn(e){
	
	  let userId = ajaxGetSessionUserId();
	  let targetCommentId = $(e.target).closest('.comment__info').attr("data-commentid")
	  let badBtnRow__num = $(e.target).parent().find('.badBtnRow__num');
	  let badBtnRow__numVal = Number(badBtnRow__num.text())
	  let targetChkd = ajaxBadBtnChk(targetCommentId, userId)

	  if(targetChkd == "No"){
		  badBtnRow__numVal = badBtnRow__numVal +1; 
		  	ajaxBadInsert(targetCommentId, userId)
	  }else{
		  badBtnRow__numVal = badBtnRow__numVal -1;
		  ajaxBadDelect(targetCommentId, userId)
	  }
	  badBtnRow__num.text(badBtnRow__numVal)
}

function ajaxBadDelect(targetCommentId, userId){
	
	$.ajax({
		url : 'ajaxBadDelect.do',
		type : 'post',
		dataType : 'text',
		data : {
			comment_id : targetCommentId,
			id : userId
		},
		success : function(data){
			
		}
	})
	
}


function goodBtnRowFn(e) {
	  let userId = ajaxGetSessionUserId();
	  let targetCommentId = $(e.target).closest('.comment__info').attr("data-commentid")
	
  
      let goodBtnRow__num = $(e.target).parent().find('.goodBtnRow__num');
   
     
      let goodBtnRow__numVal = Number(goodBtnRow__num.text())
    
  
	  let targetChkd = ajaxGoodBtnChk(targetCommentId, userId)
	
	  if(targetChkd == "No"){
		  
		  	goodBtnRow__numVal = goodBtnRow__numVal+1; 
		  	ajaxGoodInsert(targetCommentId, userId)
	  }else{
		  
		  goodBtnRow__numVal = goodBtnRow__numVal-1;
	 		ajaxGoodDelete(targetCommentId, userId)
    }
	  goodBtnRow__num.text(goodBtnRow__numVal);
  }

function ajaxBadBtnChk(targetCommentId, userId){
		let result;
	$.ajax({
		url : 'ajaxBadBtnChk.do',
		type : 'post',
		dataType : 'text',
		async : false,
		data : {
			comment_id : targetCommentId,
			id : userId
		},
		success : function(data){
			result = data;
		}
	})
	return result;
	
}


function ajaxGoodDelete(targetCommentId, userId){
	
	$.ajax({
		url : 'ajaxGoodDelete.do',
		type : 'post',
		dataType : 'text',
		data : {
			comment_id : targetCommentId,
			id : userId
		},
		success : function(data){
		
		}
	})
}
function ajaxBadInsert(targetCommentId, userId){

		$.ajax({
			url : 'ajaxBadInsert.do',
			type : 'post',
			dataType : 'text',
			data : {
				comment_id : targetCommentId,
    			id : userId
			},
			success : function(data){
				
			}
		})
	}
function ajaxGoodInsert(targetCommentId, userId){
	
	$.ajax({
		url : 'ajaxGoodInsert.do',
		type : 'post',
		dataType : 'text',
		data : {
			comment_id : targetCommentId,
			id : userId
		},
		success : function(data){
		
		}
	})
}

function ajaxGoodBtnChk(targetCommentId, userId){
	let result;
	$.ajax({
		url : 'ajaxGoodBtnChk.do',
		type : 'post',
		dataType: 'text',
		async : false,
		data : {
			comment_id : targetCommentId,
			id : userId
		}, 
		success : function(data){
			
			result = data;
		
		}
	
	})
	return result;
}


$('body').on('click', function (e) {
  var tgPoint = $(e.target);
  var icon = tgPoint.hasClass('fas fa-bars')
  var btnC = tgPoint.hasClass('fas__menu__btnC')
  var btnD = tgPoint.hasClass('fas__menu__btnD')
  var fas__menu = tgPoint.hasClass('fas__menu')
  var preview = tgPoint.hasClass('img_preview')
  var modifyInput = tgPoint.hasClass('comment__input__Box')
  var modifyFileRemoveBtn = tgPoint.hasClass('context__file__prev__removeBtn')
  var modifyFileRemoveBtnIcon = tgPoint.hasClass('fas fa-times')
  if (!icon && !fas__menu && !btnC && !btnD) {
    $('.fas__menu').hide()
  }
	
  if(!tgPoint.closest('.comment__input__Box').length && $('.comment__box').find('[data="modify__input"]').length && !modifyFileRemoveBtn && !modifyFileRemoveBtnIcon && !tgPoint.closest('.emoji-picker').length){
	
	  if(!$('.comment__box').find('[data="modify__input"]').find('.save_btn').length){
		
		  $('.comment__box').find('[data="modify__input"]').find('.textareaEl').focus();
	  }
	 createRecomment();
  }

  if (!tgPoint.closest('.comment__input__Box').length && $('.textareaEl__class1').val() == '' && $(
      '.filetext__class1').text() == '') {
    $('.textareaEl__class1').closest('.comment__input__Box').find('.input__Box__Btns__none').slideUp(200)
  }
  

  if (!tgPoint.closest('.comment__input__Box').length && $('.targetClass').val() == '' && $(
      '.filetext__class2').text() == ''&& !tgPoint.hasClass('.emoji-picker')) {
    $('.textareaEl__class2').closest('.comment__input__Box').find('.input__Box__Btns__none').slideUp(200)
 
    setTimeout(function() {
      $('.textareaEl__class2').closest('.comment__input__Box').find('.input__Box__Btns__none').remove();
      let targetClass = $('.targetClass')
      targetClass.removeClass('targetClass')
    	}, 200);
  }

  

  if (preview) {
    $('.img__box__wrap').css('display', 'none')
  }
})


function menuShowFn(e) {
	let target = $(event.target).closest('.classTarget').attr("data-id")
	let userId = ajaxGetSessionUserId();

	if(target == userId){
		  $(e.target).find('.fas__menu').toggle()
		
	}
	
}


function menuDeleteBtnFn(event){
	let userId = $(event.target).closest('.classTarget').attr("data-id")
	let group = $(event.target).closest('.classTarget').attr("data-group")
	let order = $(event.target).closest('.classTarget').attr("data-order")
	let commentId = $(event.target).closest('.classTarget').attr("data-commentid")
	
	if(order == 0){
		let result = ajaxGroupListSelect(group);
		for(let data of result){
			let result = ajaxRemoveComment(data.id, data.comment_id);
		}
		$(event.target).closest('.classTarget').remove();
	}else{
		
	
		let result = ajaxRemoveComment(userId, commentId);
		if(result == "Yes"){
			let recomment_amount = $(event.target).closest('.comment__row').find('.recomment__num').text();
		
			$(event.target).closest('.comment__row').find('.recomment__num').text(Number(recomment_amount)-1)
			$(event.target).closest('.classTarget').remove();
		}
	}
	
	

}

   function menuUpdateBtnFn(event){
	   let targetOrder = $(event.target).closest('.classTarget').attr('data-order')
	   
	   let row__right;
	  
	   if(targetOrder == 0){
		   row__right = $(event.target).closest('.comment__row__right')
	   }else{
		   row__right = $(event.target).closest('.recomment__right')
	   }
    
    	let comment__context = row__right.find('.comment__context')
    	
    	
   		if(row__right.find('.classFileTarget').css('display') != "none"){
   			
    	row__right.find('.context__file__prev__removeBtn').css('display', 'flex')// 파일이 있을때
   		}
    	
    	let appendText = comment__context.html();
    	let brNum = appendText.split('<br>').length +1;
    	appendText = appendText.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
    
    	let modifyInputBox = $('#modify__input__Box');
    	modifyInputBox.find('.textareaEl').css('height', 20*brNum)
    	modifyInputBox.find('.textareaEl').html(appendText)


		comment__context.html('');
    	comment__context.append(modifyInputBox.html())
   
    	//context__file__prev__removeBtn 
    }
   
   function modifyResult(target){
	   
	   let input = target.closest('.input__Box__Btns').find('.input_file')

	   let commentId = target.closest('.comment__context').attr('data-commentid')
		
	   let textareaVal = target.closest('.comment__input__Box').find('.textareaEl').val();
	 	
	   textareaVal = textareaVal.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	   let targetContentBox = target.closest('.comment__context')
	   let targetOrder = target.closest('.classTarget').attr('data-order')
	   let templateTarget;
	   if(targetOrder == 0){
		   templateTarget = target.closest('.comment__row__right')
	   }else{
		   templateTarget = target.closest('.recomment__content')
	   }
	 
	   if(input.val() != ''){
		   

		   let result = formCommentFileUpdate(textareaVal, input, commentId)
	
			if(checkFile(result.file_name)){
			
				template = $('.filePrevTemplate')
				let img = template.find('.context__file__prev__imgBox>img')
				input.attr("class", "fileTarget");
				img.attr("class", "imgTarget");
				prevRowFileRead()
				template.find('.fileContent').text(result.file_name)
			
				template.find('.comment__context__file__prev').addClass('classFileTarget');
				template.find('.comment__context__file__prev').css('display', 'flex');
				template.find('.fileContent').attr("href", "commentDownload.do?pfile_name="+result.pfile_name+"&file_name="+result.file_name)	
				template.find('.context__file__perv__text').attr("data", result.file_id)
			}else{
			
				template = $('.textPrevTemplate')
				template.find('.comment__context__file').addClass('classFileTarget');
				template.find('.comment__context__file').attr('data', result.file_id)
				template.find('.comment__context__file').css('display', 'flex');
				template.find('.fileContent').text(result.file_name)
				template.find('.fileContent').attr('href', "commentDownload.do?pfile_name="+result.pfile_name+"&file_name="+result.file_name)
			}
		
		
		   templateTarget.find('.classFileTarget').remove();
	
		   target.closest('.comment__context').after(template.html())
	   }else{
	   ajaxCommentModify(textareaVal, commentId);
	   }

	
	   targetContentBox.html(textareaVal)
	   templateTarget.find('.context__file__prev__removeBtn').css('display', 'none')
	   target.closest('.comment__input__Box').remove();
 	 
   }

   function ajaxCommentModify(textareaVal, commentId){
	   
	   $.ajax({
		 url : 'ajaxCommentModify.do',
		 type : 'post',
		 dataType : 'text',
		 data : {
			 comment_content : textareaVal,
			 comment_id : commentId
		 },
		 success : function(data){
			 
		 }
	   })
   }
   
function ajaxGroupListSelect(group){
	let result;
	$.ajax({
		url : 'ajaxGroupListSelect.do',
		type : 'post',
		dataType : 'json',
		async : false,
		data : {
			comment_group : group
		},
		success : function(data){
			result = data
		}
		
	})
	return result;
}

function ajaxRemoveComment(userId, commentId){
	let result;
	$.ajax({
		url : 'ajaxRemoveComment.do',
		type : 'post',
		dataType : 'text',
		async : false,
		data : {
			id : userId,
			comment_id : commentId
		},
		success : function(data){
			
			result = data;
		}
	})
	
	return result;
}





 </script>

	<!-- 은지 코드 -->
	<script src="resources/js/card/card-details.js"></script>
</body>
</html>