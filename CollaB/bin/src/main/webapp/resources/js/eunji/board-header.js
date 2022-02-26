//=======================================================워크스페이스 이름변경=======================================================
document.getElementById("WsName").onclick=function(){
    let target = event.target;
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
                WsRename.setAttribute("placeholder","name it plz.");
                WsRename.focus();
            }else{
                document.querySelector("#WsRename").remove();
                target.innerHTML=newWSName;
                // ajax로 워크스페이스 이름변경해주기
            }
        }
    });
    target.append(WsRename);
    document.getElementById("WsRename").focus();
}

//=======================================================보드 이름변경=======================================================
document.getElementById("BorName").onclick=function(){
    let target = event.target;
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
                BorRename.setAttribute("placeholder","name it plz.");
                BorRename.focus();
            }else{
                document.querySelector("#BorRename").remove();
                target.innerHTML=newBORName;
                // ajax로 보드 이름변경해주기
            }
        }
    });
    target.append(BorRename);
    document.getElementById("BorRename").focus();
}

function enterkey(){
   
}

//=======================================================즐겨찾기 버튼 클릭 했을 때=======================================================
document.getElementById("addstar").onclick=function(){
    // 1. <button> 클릭시
    if(event.target.nodeName == "BUTTON"){ 
        let star = document.getElementById("star"); 
        
        // 1-1. 이미 즐겨찾기 추가가 되어있을때
        if(star.style.color == "yellow"){ 
            star.style.color="white";
            // addStar();
        // 1-2. 즐겨찾기 추가가 안되어있을경우
        }else{ 
            star.style.color="yellow";
            // removeStar();
        }
    // 2. <i> 클릭시
    }else{ 
        let star = event.target;

        // 2-1. 이미 즐겨찾기 추가가 되어있을때
        if(event.target.style.color == "yellow"){ 
            star.style.color="white";
            // addStar();
        // 2-2. 즐겨찾기 추가가 안되어있을경우
        }else{
            star.style.color="yellow";
            // removeStar();
        }
    }
}
//즐겨찾기 추가 ajax
function addStar(){

}
//즐겨찾기 해제 ajax
function removeStar(){

}

//=======================================================보드테마변경 함수=======================================================
//디비에 저장되어 있는 값으로 보드 그려줄때
window.onload = function(){
    //모델에다 싣고 온 값 중, 보드색상 컬럼값 조회
    //boardColorFnc(data.board_color);
    //이런식으로 함수 실행해주기
}

//사용자가 테마색상 선택 시, 선택한 값으로 보드테마 변경
function changeBoardColor(color){
    //여기서 아작스로 디비값 먼저 바꿔주고 아작스 성공하면 boardColorFnc()함수 실행해주기
    boardColorFnc(color)
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

//=======================================================보드 멤버추가=======================================================
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