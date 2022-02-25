<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .boardColor{width: 3%; height: 50px; margin-left: 5%;}
   .default{margin-right: 6%; height: 50px; margin-left: 5%;}
   .boardColor:hover, .default:hover{cursor: pointer;}
</style>
<script type="text/javascript">
//페이지 그려줄때 테마적용, 사이드바 워크스페이스 이미지적용
document.addEventListener("DOMContentLoaded", function(){
	let color = "${workspace.board_thema}";
	boardColorFnc(color);
	
	let name = "${workspace.workspace_title}".substring(0, 1);
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
	
	//해당 워크스페이스에 있는 모든 참여자 목록 가져오기
	$.ajax({
		url : "AjaxWorkspaceTotalMember",
		type : "POST",
		data : {
			workspaceId : ${workspace.workspace_id}
		},
		dataType : "json",
		success : function(datas){
			console.log(datas);
		},
		error : function(){
			console.log("보드상세 | AjaxWorkspaceTotalMember 실패");
		}
		
	})
});
	
</script>
</head>
<body>
<div id="app">
   <div class="main-wrapper">
     <!-- Main Content -->
     <div class="main-content">
       <section class="section">
         <!-- 보드헤더 -->
         <div class="section-header d-flex justify-content-between">
           <div class="btn-group">
             <button class="btn btn-secondary dropdown-toggle boardheaderbtn" type="button" 
             data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             Switch View
             </button>
             <div class="dropdown-menu">
               <!-- 세션에다 닉네임 저장해주세여....부탁드려보자.... -->
               <div class="dropdown-title">Hi, [Nickname] ! 🤗<p>Where are you going ?</p></div>
               <a class="dropdown-item" href="#">&nbsp;&nbsp;Board</a>
               <a class="dropdown-item" href="#">&nbsp;&nbsp;TimeLine</a>
               <a class="dropdown-item" href="#">&nbsp;&nbsp;Calendar</a>
               <a class="dropdown-item" href="#">&nbsp;&nbsp;DashBoard</a>
               <!--<div class="dropdown-divider"></div> 구분선-->
             </div>
             &nbsp;&nbsp;
             <button id="WsName" class="btn btn-secondary boardheaderbtn" type="button" title="workspace">
               ${workspace.workspace_title}
             </button>
             &nbsp;&nbsp;
             <button id="BorName" class="btn btn-secondary boardheaderbtn" type="button" title="board" data-boardId="${boardID}">
               ${workspace.board_Title}
             </button>
             &nbsp;&nbsp;
             <button id="addstar" class="btn btn-secondary boardheaderbtn" type="button">
               <i id="star" class="fas fa-star"></i>
             </button>
             <div class="ml-1">
               <button class="btn btn-secondary dropdown-toggle boardheaderbtn" 
               type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Thema </button>
               <div class="dropdown-menu dropdown-menu-right " 
               style="overflow: scroll; overflow-x: hidden; height: 300px;">
                 <div class="dropdown-title text-right">What's your favorite color? 🌈</div>
                 <!-- 백그라운드 색깔 종류 리스트 -->
                 <div class="d-flex">
                   <span title="red" class="dropdown-item boardColor" style="background-color: rgb(247, 123, 123);" onclick="changeBoardColor('red')"></span>
                   <span title="orange" class="dropdown-item boardColor" style="background-color: rgb(252, 187, 127);" onclick="changeBoardColor('orange')"></span>
                   <span title="yellow" class="dropdown-item boardColor" style="background-color: rgb(255, 245, 157);" onclick="changeBoardColor('yellow')"></span>
                 </div>
                 <div class="d-flex mt-3">
                   <span title="green" class="dropdown-item boardColor" style="background-color: rgb(86, 161, 111);" onclick="changeBoardColor('green')"></span>
                   <span title="skyblue" class="dropdown-item boardColor" style="background-color: rgb(123, 243, 247);" onclick="changeBoardColor('skyblue')"></span>
                   <span title="blue" class="dropdown-item boardColor" style="background-color: rgb(121, 162, 250);" onclick="changeBoardColor('blue')"></span>
                 </div>
                 <div class="d-flex mt-3">
                   <span title="darkblue" class="dropdown-item boardColor" style="background-color: rgb(123, 125, 247);" onclick="changeBoardColor('darkblue')"></span>
                   <span title="purple" class="dropdown-item boardColor" style="background-color: rgb(171, 127, 252);" onclick="changeBoardColor('purple')"></span>
                   <span title="pink" class="dropdown-item boardColor" style="background-color: rgb(250, 167, 243);" onclick="changeBoardColor('pink')"></span>
                 </div>
                 <div class="d-flex mt-3">
                   <span title="gray" class="dropdown-item boardColor" style="background-color: rgb(184, 184, 184);" onclick="changeBoardColor('gray')"></span>
                   <span title="darkgray" class="dropdown-item boardColor" style="background-color: rgb(116, 115, 115);" onclick="changeBoardColor('darkgray')"></span>
                   <span title="black" class="dropdown-item boardColor" style="background-color: rgb(12, 12, 12);" onclick="changeBoardColor('black')"></span>
                 </div>
                 <div class="d-flex mt-3">
                   <span title="No Thema" class="dropdown-item default" style="background-color: #ECE9FE;" onclick="changeBoardColor('base')"></span>
                 </div>
                 
               </div>
             </div>
             <div class="ml-1 dropdown">
               <button class="btn btn-secondary dropdown-toggle InviteBTN boardheaderbtn fa fa-user-plus" type="button" 
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="showInvite()">
               Invite
               </button>
               <div class="dropdown-menu showInvite" 
               style="overflow: scroll; overflow-x: hidden; height: 300px; display:none;">
                 <span class="fa fa-times ml-2 mt-1" title="close" style="cursor:pointer;"
                 onclick="closeInvite()"></span>
                 <div class="dropdown-title">Your Partners 👫</div>
                 <div class="ml-1 mr-1 text-center Invite_selectMember"> <!--선택된 멤버들-->
                   <span class="btn btn-light mr-1 ml-1 mt-1" style="visibility:hidden">김은지</span>
                 </div>
                 <div class="dropdown-divider"></div>
                 <div class="dropdown-title">Member List 🙌</div>
                 <div id="Invite_member"> 
                   <!--워크스페이스에 있는 모든 참여자 목록 나오게끔 하기 => 같이 보드쓰자고 초대하기 -->
                   <!--이미 초대된 멤버들은 input박스 생기면 안됨-->
                   <a class="dropdown-item" href="#"><input type="checkbox" class="Invite_check" onclick="inviteBoard()" value="멤버PK" data-memName="박소연"> 박소연</a>
                 </div>
               </div>
             </div>
           </div>
           <div class="btn-group col-rg">
             <button class="btn btn-outline-secondary dropdown-toggle boardheaderFilter" 
             type="button" data-toggle="dropdown" aria-haspopup="true" 
             aria-expanded="false">Filter </button>
             <div class="dropdown-menu dropdown-menu-right" style="overflow: scroll; overflow-x: hidden; height: 300px;">
               <div class="dropdown-title Members">Your Partners 👫</div>
               <a class="dropdown-item" href="#"><input type="checkbox">해당 보드에 있는</a>
               <a class="dropdown-item" href="#"><input type="checkbox">모든 참여자목록ㄹㄹㄹㄹ</a>
               <a class="dropdown-item" href="#"><input type="checkbox">해당 보드에 있는</a>
               <a class="dropdown-item" href="#"><input type="checkbox">모든 참여자목록ㄹㄹㄹㄹ</a>
               <a class="dropdown-item" href="#"><input type="checkbox">해당 보드에 있는</a>
               <a class="dropdown-item" href="#"><input type="checkbox">모든 참여자목록ㄹㄹㄹㄹ</a>
               <a class="dropdown-item" href="#"><input type="checkbox">해당 보드에 있는</a>
               <a class="dropdown-item" href="#"><input type="checkbox">모든 참여자목록ㄹㄹㄹㄹ</a>
               <a class="dropdown-item" href="#"><input type="checkbox">해당 보드에 있는</a>
               <a class="dropdown-item" href="#"><input type="checkbox">모든 참여자목록ㄹㄹㄹㄹ</a>
               <!--<div class="dropdown-divider"></div> 구분선-->
             </div>
           </div>
           <!-- 보드헤더 끝 -->
         </div>
         
         <!-- 보드바디 -->
         <div class="section-body">
           <div id="boardDetailBODY" class="row">
             
             <!--5. 카드 여러개 추가한 리스트 : 완-->
             <div class="col-12 col-sm-6 col-lg-2" style="display: none;">
               <div class="card">
                 <div class="first card-header d-flex justify-content-between">
                   <h4 class="listName">list name</h4>
                   <i class="fa fa-times col-rg" aria-hidden="true"></i>
                 </div>
                 <div class="cardArea">
                   <div class="card card-light ml-2 mr-2"> <!--라벨표시-->
                     <div class="card-header d-flex justify-content-between">
                       <span class="cardName ml-0">CARD NAME</span> <!--카드이름-->
                       <i class="fa fa-times col-rg" aria-hidden="true"></i>
                     </div>
                     <div class="ml-2 text-right card-owner">
                       <!--책임자표시-->
                     </div>
                     <div class="ml-3 card-option"> 
                       <!--옵션표시(file,checklist,dates)-->
                     </div>
                   </div>
                   <!--===============여기서부터===============-->
                   <div class="card card-primary ml-2 mr-2"> <!--라벨표시-->
                     <div class="card-header d-flex justify-content-between">
                       <span class="cardName ml-0">CARD NAME</span> <!--카드이름-->
                       <i class="fa fa-times col-rg" aria-hidden="true"></i>
                     </div>
                     <div class="ml-2 text-right card-owner">
                       <!--책임자표시-->
                     </div>
                     <div class="ml-3 card-option"> <!--옵션표시(file,checklist,dates)-->
                       <i class="fa fa-check-square check" style="color:rgb(59, 59, 59);"></i>
                       <i class="fa fa-calendar ml-1 dates" style="color: rgb(59, 59, 59);;"></i>
                       <i class="fa fa-paperclip ml-1 files" style="color: rgb(59, 59, 59);;"></i>
                     </div>
                   </div>
                   <!--===============여기까지가 하나의 카드!===============-->
                   <div class="card card-secondary ml-2 mr-2"> <!--라벨표시-->
                     <div class="card-header d-flex justify-content-between">
                       <span class="cardName ml-0">CARD NAME</span> <!--카드이름-->
                       <i class="fa fa-times col-rg" aria-hidden="true"></i>
                     </div>
                     <div class="ml-2 text-right card-owner">
                       <!--책임자표시-->
                     </div>
                     <div class="ml-3 card-option"> 
                       <!--옵션표시(file,checklist,dates)-->
                     </div>
                   </div>
                   <div class="card card-danger ml-2 mr-2"> <!--라벨표시-->
                     <div class="card-header d-flex justify-content-between">
                       <span class="cardName ml-0">CARD NAME</span> <!--카드이름-->
                       <i class="fa fa-times col-rg" aria-hidden="true"></i>
                     </div>
                     <div class="ml-2 text-right card-owner">
                       <!--책임자표시-->
                     </div>
                     <div class="ml-3 card-option">  
                       <!--옵션표시(file,checklist,dates)-->
                     </div>
                   </div>
                   <div class="card card-warning ml-2 mr-2"> <!--라벨표시-->
                     <div class="card-header d-flex justify-content-between">
                       <span class="cardName ml-0">CARD NAME</span> <!--카드이름-->
                       <i class="fa fa-times col-rg" aria-hidden="true"></i>
                     </div>
                     <div class="ml-2 text-right card-owner">
                       <!--책임자표시-->
                     </div>
                     <div class="ml-3 card-option"> 
                       <!--옵션표시(file,checklist,dates)-->
                     </div>
                   </div>
                   <div class="card card-info ml-2 mr-2"> <!--라벨표시-->
                     <div class="card-header d-flex justify-content-between">
                       <span class="cardName ml-0">CARD NAME</span> <!--카드이름-->
                       <i class="fa fa-times col-rg" aria-hidden="true"></i>
                     </div>
                     <div class="ml-2 text-right card-owner">
                       <!--책임자표시-->
                     </div>
                     <div class="ml-3 card-option"> 
                       <!--옵션표시(file,checklist,dates)-->
                     </div>
                   </div>
                   <div class="card card-success ml-2 mr-2"> <!--라벨표시-->
                     <div class="card-header d-flex justify-content-between">
                       <span class="cardName ml-0">CARD NAME</span> <!--카드이름-->
                       <i class="fa fa-times col-rg" aria-hidden="true"></i>
                     </div>
                     <div class="ml-2 text-right card-owner">
                       <!--책임자표시-->
                     </div>
                     <div class="ml-3 card-option"> 
                       <!--옵션표시(file,checklist,dates)-->
                     </div>
                   </div>
                   <div class="card card-dark ml-2 mr-2"> <!--라벨표시-->
                     <div class="card-header d-flex justify-content-between">
                       <span class="cardName ml-0">CARD NAME</span> <!--카드이름-->
                       <i class="fa fa-times col-rg" aria-hidden="true"></i>
                     </div>
                     <div class="ml-2 text-right card-owner">
                       <!--책임자표시-->
                     </div>
                     <div class="ml-3 card-option"> 
                       <!--옵션표시(file,checklist,dates)-->
                     </div>
                   </div>
                   <div class="last card-header"> 
                     <div class="addCardBtn">
                       <h4 class="fas fa-plus">&nbsp;&nbsp;Add Card</h4>
                     </div>
                   </div>
                 </div>
               </div>
             </div>

             <!--5. 카드 추가한 리스트 : 완-->
             <div class="col-12 col-sm-6 col-lg-2" style="display: none;">
               <div class="card">
                 <div class="first card-header d-flex justify-content-between">
                   <h4 class="listName">list name</h4>
                   <i class="fa fa-times col-rg" aria-hidden="true"></i>
                 </div>
                 <div class="cardArea">
                   <div class="card card-light ml-2 mr-2"> <!--라벨표시-->
                     <div class="card-header d-flex justify-content-between">
                       <span class="cardName">CARD NAME</span> <!--카드이름-->
                       <i class="fa fa-times col-rg" aria-hidden="true"></i>
                     </div>
                     <div class="ml-2 text-right card-owner">
                       <!--책임자표시-->
                     </div>
                     <div class="ml-3 card-option"> 
                       <!--옵션표시(file,checklist,dates)-->
                     </div>
                   </div>
                   <div class="last card-header"> 
                     <div class="addCardBtn">
                       <h4 class="fas fa-plus">&nbsp;&nbsp;Add Card</h4>
                     </div>
                   </div>
                 </div>
               </div>
             </div>

             <!--4. 리스트에 카드 추가시, 카드 이름 설정DIV : 완-->
             <!--.cardArea밑에 card-header > input태그 생김-->
             <!--카드이름입력시 input태그 삭제됨-->
             <!--.cardArea바로 밑에 있는 card-header가 하나의 카드라고 생각하면 됨(5번모양)-->
             <div class="col-12 col-sm-6 col-lg-2" style="display: none;">
               <div class="card">
                 <div class="first card-header d-flex justify-content-between">
                   <h4 class="listName">list name</h4>
                   <i class="fa fa-times col-rg" aria-hidden="true"></i>
                 </div>
                 <div class="cardArea">
                   <div class="card-header">
                     <input type="text" class="form-control mb-2" id="newCardName"
                     style="width: 100%; height: 90%; text-align: center;">
                   </div>
                   <div class="last card-header">
                     <div class="addCardBtn">
                       <h4 class="fas fa-plus">&nbsp;&nbsp;Add Card</h4>
                     </div>
                   </div>
                 </div>
               </div>
             </div> 

             <!--3. 완성된 리스트 : 완 : 항상 존재함 -->
             <!--addcard눌렀을때 .cardArea밑으로 카드이름생성하는 div추가됨(4번모양) -->
             <div class="col-12 col-sm-6 col-lg-2" style="display: none;">
               <div class="card">
                 <div class="first card-header d-flex justify-content-between">
                   <h4 class="listName">list name</h4>
                   <i class="fa fa-times col-rg" aria-hidden="true"></i>
                 </div>
                 <div class="cardArea"> 
                   <div class="last card-header">
                     <div class="addCardBtn">
                       <h4 class="fas fa-plus">&nbsp;&nbsp;Add Card</h4>
                     </div>
                   </div>
                 </div>
               </div>
             </div> 

             <!--2. 리스트 이름 설정DIV : 완 : 1의 addlist클릭시 생김, 리스트이름설정후 삭제됨 -->
             <div class="col-12 col-sm-6 col-lg-2" style="display: none;">
               <div class="card">
                 <div class="card-header">
                   <input type="text" class="form-control" style="width: 100%; height: 80%;">
                 </div>
               </div>
             </div> 

             <!--1. 리스트생성DIV : 완 : 항상 존재함-->
             <div class="col-12 col-sm-6 col-lg-2" id="addList">
               <div class="card">
                 <div class="card-header">
                   <div class="addListBtn" style="cursor:pointer;">
                     <h4><i class="fas fa-plus"></i>&nbsp;&nbsp;Add List</h4>
                   </div>
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
<script src="resources/js/eunji/board-header.js"></script>
<script src="resources/js/eunji/board-detail_body.js"></script>
</body>
</html>