//워크프페이스 프로필이미지
function changeWKIMG(newWKname){
	let name = newWKname.substring(0,1);
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

//워크스페이스 이름변경
document.getElementById("WsName").onclick=function(){ workspaceRename(); }
function workspaceRename(){
    let target = event.target;
    let wkid = document.getElementById("WsName").getAttribute("data-wkId");
    target.innerHTML="";
    let WsRename = document.createElement("input");
    WsRename.style.width="120px";
    WsRename.style.height="20px";
    WsRename.style.textAlign="center";
    WsRename.setAttribute("type","text");
    WsRename.setAttribute("id","WsRename");
    WsRename.setAttribute("class","form-control");
    WsRename.setAttribute("name","WsRename");
    WsRename.addEventListener("keyup",function(){
        if (window.event.keyCode == 13) {
            // 엔터키가 눌렸을 때
            let newWSName = document.querySelector("#WsRename").value;
            if(newWSName == ""){
                WsRename.style.border="2px solid red";
                WsRename.setAttribute("placeholder","required");
                WsRename.focus();
            }else{
                $.ajax({
					url : "AjaxWorkspaceRename",
					data : {
						newWSName : newWSName,
						wkid : wkid
					},
					type : "POST",
					dataType : "text",
					success : function(data){
						console.log("이름변경성공?"+data);
						document.querySelector("#WsRename").remove();
						changeWKIMG(newWSName);
		                document.getElementById("WsName").innerHTML=newWSName;
						const workspaces = document.querySelectorAll(".sidebar_workspace"+wkid);
						workspaces.forEach((workspace)=>{
							workspace.innerHTML="&nbsp;&nbsp;"+newWSName;
						})
					},
					error: function(){
						console.log("AjaxWorkspaceRename 아작스 실패");
					}
				})
            }
        }
    });
    target.append(WsRename);
    document.getElementById("WsRename").focus();
}

//보드 이름변경
document.getElementById("BorName").onclick=function(){
    let target = event.target;
    let boardid = document.getElementById("BorName").getAttribute("data-boardId");
    target.innerHTML="";
    
    let BorRename = document.createElement("input");
    BorRename.style.width="120px";
    BorRename.style.height="20px";
    BorRename.style.textAlign="center";
    BorRename.setAttribute("type","text");
    BorRename.setAttribute("id","BorRename");
    BorRename.setAttribute("class","form-control");
    BorRename.setAttribute("name","BorRename");
    BorRename.addEventListener("keyup",function(){
        if (window.event.keyCode == 13) {
            // 엔터키가 눌렸을 때
            let newBORName = document.querySelector("#BorRename").value;
            if(newBORName == ""){
                BorRename.style.border="2px solid red";
                BorRename.setAttribute("placeholder","required");
                BorRename.focus();
            }else{
                 $.ajax({
                	url : "AjaxBoardRename",
                	data : {
                		boardId : boardid,
                		newname : newBORName
                	},
                	dataType : "json",
                	type : "POST",
                	success : function(data){
                		console.log(data);
                		document.querySelector("#BorRename").remove();
                		target.innerHTML=newBORName;
                		document.querySelector(".sidebar_board"+data.board_id).innerHTML = "&nbsp;&nbsp;"+newBORName;
                	},
                	error : function(){
                		console.log("boards페이지 AjaxBoardRename 실패");
                	}
                })
            }
        }
    });
    target.append(BorRename);
    document.getElementById("BorRename").focus();
}

//즐겨찾기 버튼 클릭 했을 때
document.getElementById("addstar").onclick=function(){
	let boardId = event.target.getAttribute("data-boardId");
    // 1. <button> 클릭시
    if(event.target.nodeName == "BUTTON"){ 
        let star = document.getElementById("star"); 
        
        // 1-1. 이미 즐겨찾기 추가가 되어있을때
        if(star.style.color == "yellow"){ 
            addStar(boardId);
            star.style.color="white";
        // 1-2. 즐겨찾기 추가가 안되어있을경우
        }else{ 
            removeStar(boardId);
            star.style.color="yellow";
        }
    // 2. <i> 클릭시
    }else{ 
        let star = event.target;

        // 2-1. 이미 즐겨찾기 추가가 되어있을때
        if(event.target.style.color == "yellow"){ 
            addStar(boardId);
            star.style.color="white";
        // 2-2. 즐겨찾기 추가가 안되어있을경우
        }else{
            removeStar(boardId);
            star.style.color="yellow";
        }
    }
}

//즐겨찾기 추가 ajax
function addStar(boardId){
	$.ajax({
		url : "AjaxAddBoardStar",
		type : "POST",
		data : {
			boardId : boardId
		},
		dataType : "text",
		success : function(data){
			console.log(data);
		},
		error : function(){
			console.log("AjaxAddBoardStar 실패");
		}
	})
}

//즐겨찾기 해제 ajax
function removeStar(boardId){
	$.ajax({
		url : "AjaxRemoveBoardStar",
		type : "POST",
		data : {
			boardId : boardId
		},
		dataType : "text",
		success : function(data){
			console.log(data);
		},
		error : function(){
			console.log("AjaxRemoveBoardStar 실패");
		}
	})
}

//사용자가 테마색상 선택 시, 선택한 값으로 보드테마 변경
function changeBoardColor(color){
let boardId = document.querySelector("#BorName").getAttribute("data-boardid");
    $.ajax({
    	url : "AjaxChangeBoardThema",
    	type : "POST",
    	data : {
    		thema : color,
    		boardId : boardId
    	},
    	dataType : "text",
    	success : function(data){
    		if(data == "YES"){
    			console.log("보드테마변경성공?"+data);
    			boardColorFnc(color);
    		}else if(data == "NO"){
    			console.log("보드테마변경성공?"+data);
    		}
    	},
    	error : function(){
    		console.log("board-header.js에 AjaxChangeBoardThema 실패");
    	}
    })
    
}

function boardColorFnc(color){
    let boardheaderBtn = document.querySelectorAll(".boardheaderbtn");
    let boardheaderFilter = document.querySelector(".boardheaderFilter");
    let mainheaderBackground = document.querySelector(".mainheaderBackground");
    let pagebodybackground = document.querySelector(".pagebodybackground");

    //아작스로 디비값 먼저 바꿔주고 아작스 성공하면 실행하기
    if(color=="red"){
        boardheaderBtn.forEach((boardheaderBtn) => {
            boardheaderBtn.style.backgroundColor = "rgb(247,123,123)";
            boardheaderBtn.style.border = "solid 1px rgb(247,123,123)";
        })
        boardheaderFilter.style.border = "solid 1px rgb(247,123,123)";
        boardheaderFilter.style.color = "rgb(247,123,123)";
        mainheaderBackground.style.backgroundColor = "rgb(252,205,205)";
        pagebodybackground.style.backgroundColor = "rgb(252, 162, 162)";
    }else if(color=="orange"){
        boardheaderBtn.forEach((boardheaderBtn)=>{
            boardheaderBtn.style.backgroundColor = "rgb(252,187,127)";
            boardheaderBtn.style.border = "solid 1px rgb(252,187,127)";
        })
        boardheaderFilter.style.border = "solid 1px rgb(252,187,127)";
        boardheaderFilter.style.color = "rgb(252,187,127)";
        mainheaderBackground.style.backgroundColor = "rgb(255, 205, 158)";
        pagebodybackground.style.backgroundColor = "rgb(247,217,189)";
    }else if(color=="yellow"){
        boardheaderBtn.forEach((boardheaderBtn)=>{
            boardheaderBtn.style.backgroundColor = "rgb(253, 207, 80)";
            boardheaderBtn.style.border = "solid 1px rgb(253, 207, 80)";
        })
        boardheaderFilter.style.border = "solid 1px rgb(253, 207, 80)";
        boardheaderFilter.style.color = "rgb(253, 207, 80)";
        mainheaderBackground.style.backgroundColor = "rgb(255,242,130)";
        pagebodybackground.style.backgroundColor = "rgb(248,244,204)";
    }else if(color=="green"){
        boardheaderBtn.forEach((boardheaderBtn)=>{
            boardheaderBtn.style.backgroundColor = "rgb(86,161,111)";
            boardheaderBtn.style.border = "solid 1px rgb(86,161,111)";
        })
        boardheaderFilter.style.border = "solid 1px rgb(86,161,111)";
        boardheaderFilter.style.color = "rgb(86,161,111)";
        mainheaderBackground.style.backgroundColor = "rgb(164,230,186)";
        pagebodybackground.style.backgroundColor = "rgb(218,247,228)";
    }else if(color=="skyblue"){
        boardheaderBtn.forEach((boardheaderBtn)=>{
            boardheaderBtn.style.backgroundColor = "rgb(100,240,245)";
            boardheaderBtn.style.border = "solid 1px rgb(100,240,245)";
        })
        boardheaderFilter.style.border = "solid 1px rgb(100,240,245)";
        boardheaderFilter.style.color = "rgb(100,240,245)";
        mainheaderBackground.style.backgroundColor = "rgb(68, 209, 228)";
        pagebodybackground.style.backgroundColor = "rgb(203, 248, 250)";
    }else if(color=="blue"){
        boardheaderBtn.forEach((boardheaderBtn)=>{
            boardheaderBtn.style.backgroundColor = "rgb(121,162,250)";
            boardheaderBtn.style.border = "solid 1px rgb(121,162,250)";
        })
        boardheaderFilter.style.border = "solid 1px rgb(121,162,250)";
        boardheaderFilter.style.color = "rgb(121,162,250)";
        mainheaderBackground.style.backgroundColor = "rgb(168, 195, 252)";
        pagebodybackground.style.backgroundColor = "rgb(209, 231, 241)";
    }else if(color=="darkblue"){
        boardheaderBtn.forEach((boardheaderBtn)=>{
            boardheaderBtn.style.backgroundColor = "rgb(123,125,247)";
            boardheaderBtn.style.border = "solid 1px rgb(123,125,247)";
        })
        boardheaderFilter.style.border = "solid 1px rgb(123,125,247)";
        boardheaderFilter.style.color = "rgb(123,125,247)";
        mainheaderBackground.style.backgroundColor = "rgb(168,169,238)";
        pagebodybackground.style.backgroundColor = "rgb(192, 193, 250)";
    }else if(color=="purple"){
        boardheaderBtn.forEach((boardheaderBtn)=>{
            boardheaderBtn.style.backgroundColor = "rgb(171,127,252)";
            boardheaderBtn.style.border = "solid 1px rgb(171,127,252)";
        })
        boardheaderFilter.style.border = "solid 1px rgb(171,127,252)";
        boardheaderFilter.style.color = "rgb(171,127,252)";
        mainheaderBackground.style.backgroundColor = "rgb(199, 174, 247)";
        pagebodybackground.style.backgroundColor = "rgb(204, 195, 226)";
    }else if(color=="pink"){
        boardheaderBtn.forEach((boardheaderBtn)=>{
            boardheaderBtn.style.backgroundColor = "rgb(250,167,243)";
            boardheaderBtn.style.border = "solid 1px rgb(250,167,243)";
        })
        boardheaderFilter.style.border = "solid 1px rgb(250,167,243)";
        boardheaderFilter.style.color = "rgb(250,167,243)";
        mainheaderBackground.style.backgroundColor = "rgb(243,183,238)";
        pagebodybackground.style.backgroundColor = "rgb(248,233,247)";
    }else if(color=="gray"){
        boardheaderBtn.forEach((boardheaderBtn)=>{
            boardheaderBtn.style.backgroundColor = "rgb(184,184,184)";
            boardheaderBtn.style.border = "solid 1px rgb(184,184,184)";
        })
        boardheaderFilter.style.border = "solid 1px rgb(184,184,184)";
        boardheaderFilter.style.color = "rgb(184,184,184)";
        mainheaderBackground.style.backgroundColor = "rgb(124,124,124)";
        pagebodybackground.style.backgroundColor = "rgb(241,241,241)";
    }else if(color=="darkgray"){
        boardheaderBtn.forEach((boardheaderBtn)=>{
            boardheaderBtn.style.backgroundColor = "rgb(116,115,115)";
            boardheaderBtn.style.border = "solid 1px rgb(116,115,115)";
        })
        boardheaderFilter.style.border = "solid 1px rgb(116,115,115)";
        boardheaderFilter.style.color = "rgb(116,115,115)";
        mainheaderBackground.style.backgroundColor = "rgb(83,83,83)";
        pagebodybackground.style.backgroundColor = "rgb(119,116,116)";
    }else if(color=="black"){
        boardheaderBtn.forEach((boardheaderBtn)=>{
            boardheaderBtn.style.backgroundColor = "rgb(73,73,73)";
            boardheaderBtn.style.border = "solid 1px rgb(73,73,73)";
        })
        boardheaderFilter.style.border = "solid 1px rgb(73,73,73)";
        boardheaderFilter.style.color = "rgb(73,73,73)";
        mainheaderBackground.style.backgroundColor = "rgb(43,43,43)";
        pagebodybackground.style.backgroundColor = "rgb(12,12,12)";
    }else if(color="base"){
        boardheaderBtn.forEach((boardheaderBtn)=>{
            boardheaderBtn.style.backgroundColor = "#6553C1";
            boardheaderBtn.style.border = "#6553C1";
        })
        boardheaderFilter.style.border = "#6553C1";
        boardheaderFilter.style.color = "#6553C1";
        mainheaderBackground.style.backgroundColor = "#9F90D9";
        pagebodybackground.style.backgroundColor = "#ECE9FE";
    }
}

//보드 멤버추가
function showInvite(){
    document.querySelector(".showInvite").style.display="block";
}
function inviteBoard(){
    let target = event.target; //체크박스
    let member = target.value; //추가된 멤버의 아이디(PK)
    let memberName = target.getAttribute('data-memName'); //추가된 멤버의 이름

    if(target.checked){ //체크시
        //아작스 사용해서 DB에다가도 넣어주기
        target.parentElement.remove();
        let selectMem = document.querySelector(".Invite_selectMember"); //여기다가 선택된 멤버들 넣기
        
        let span = document.createElement("span");
        span.setAttribute("class","btn btn-light mr-1 ml-1 mt-1");
        span.innerHTML=memberName;

        selectMem.append(span);
    }
}
function closeInvite(){
    document.querySelector(".showInvite").style.display="none";
}