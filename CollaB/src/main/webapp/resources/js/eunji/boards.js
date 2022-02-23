//=======================================================워크스페이스 이름 변경=======================================================
document.getElementById("WsName").onclick=function(){ workspaceRename() };

function workspaceRename(){
    let appendTarget = event.target.parentElement;
    event.target.remove();
    // let target = event.target;
    // target.innerHTML="";
    let WsRename = document.createElement("input");
    WsRename.style.width="260px";
    WsRename.style.height="50px";
    WsRename.style.textAlign="center";
    WsRename.style.position="relative";
    WsRename.style.top="13px";
    WsRename.setAttribute("type","text");
    WsRename.setAttribute("id","WsRename");
    WsRename.setAttribute("name","WsRename");
    WsRename.addEventListener("keyup",function(){
        if (window.event.keyCode == 13) {
            // 엔터키가 눌렸을 때
            let newWSName = document.querySelector("#WsRename").value;
            if(newWSName == ""){
                WsRename.style.border="2px solid red";
                WsRename.setAttribute("placeholder","Please name it.");
                WsRename.focus();
            }else{
                document.querySelector("#WsRename").remove();
                let newName = document.createElement("h3");
                newName.setAttribute("class","mt-4");
                newName.setAttribute("id","WsName");
                newName.onclick=function(){
                    workspaceRename();
                }
                newName.innerHTML=newWSName;
                document.querySelector(".workspaceNAME").append(newName);
                //target.innerHTML=newWSName;
                // ajax로 워크스페이스 이름변경해주기
            }
        }
    });
    appendTarget.append(WsRename);
    document.getElementById("WsRename").focus();
}

//==============================보드검색기능=======================
function searchBoard(){
    let board = searchBOARDNAME.value; //사용자 입력값
    //해당 워크스페이스에 입력값과 동일한 문자열 가진 보드 조회,
    //리스트 뿌려주기. LIKE문 써서 가져오면 될듯.
}

//=======================================================보드생성 질문&답변=======================================================
question.onmouseover = function(){
    question.style.color = "black";
    answer.style.display = "block";
}
question.onmouseout = function(){
    question.style.color = "gray";
    answer.style.display = "none";
}

//=======================================================보드 rename=======================================================
function boardRename(){
    let target = event.target;
    target.innerHTML = "";

    let input = document.createElement("input");
    input.style.width = "200px";
    input.style.height = "20px";
    input.setAttribute("type","text");
    input.setAttribute("id","boardNewName");
    input.setAttribute("name","boardNewName");
    input.addEventListener("keyup",function(){
        if (window.event.keyCode == 13) {
            // 엔터키가 눌렸을 때
            let newBName = document.querySelector("#boardNewName").value;
            if(newBName == ""){
                input.style.border="2px solid red";
                input.setAttribute("placeholder","Please name it.");
                input.focus();
            }else{
                document.querySelector("#boardNewName").remove();
                target.innerHTML=newBName;
                // ajax로 보드 이름변경해주기
            }
        }
    });
    target.append(input);
    document.getElementById("boardNewName").focus();
}

//=======================================================보드 삭제=======================================================
function boardDelete(){
    let target = event.target.parentElement.parentElement.parentElement;
    target.remove();
    //ajax로 db에 해당보드삭제해주기
}

//=======================================================보드생성모달창 속 create 버튼 처리=======================================================
function createBoard(){
    let background = document.getElementById("modal-board-background").value; //배경색
    let boardName = document.getElementById("modal-board-title").value; //보드이름
    let workspace = document.getElementById("select-workspace").value; //워크스페이스
    
    if(boardName==""){
        document.getElementById("modal-board-title").style.border="1px solid red";
        document.getElementById("modal-board-title").setAttribute("placeholder","Please name it.");
        document.getElementById("modal-board-title").focus();
    }else{
        //ajax태워서 db에 new board insert하고 성공한 후에 밑에 코드로 보드그리기
        let boardList = document.getElementById("boardlist");

        let firstDIV = document.createElement("div");
        firstDIV.setAttribute("class","col-12 col-md-6 col-lg-3");
        let secDIV = document.createElement("div");
        secDIV.setAttribute("class","card board");
        let thrDIV = document.createElement("div");
        thrDIV.setAttribute("class","row col-rg mr-2 mt-1 d-flex justify-content-between");
        thrDIV.style.textAlign="right";
        thrDIV.style.display="table-cell";
        let span = document.createElement("span");
        span.setAttribute("class","ml-4");
        span.style.fontWeight="bold";
        span.onclick=function(){ boardRename() };
        span.innerHTML = boardName; //보드이름
        let i = document.createElement("i");
        i.setAttribute("class","fa fa-times");
        i.setAttribute("aria-hidden","true");
        i.onclick=function(){ boardDelete() };
        let fourDIV = document.createElement("div");
        fourDIV.setAttribute("class","row card-header");
        //보드색깔지정
        if(background==""){ 
            secDIV.style.backgroundColor="rgb(245, 245, 245)";
            fourDIV.style.backgroundColor="rgb(245, 245, 245)";
        }else if(background=="red"){
            secDIV.style.backgroundColor="rgb(247, 123, 123)";
            fourDIV.style.backgroundColor="rgb(247, 123, 123)";
            span.style.color="white";
            i.style.color="white";
        }else if(background=="orange"){
            secDIV.style.backgroundColor="rgb(252, 187, 127)";
            fourDIV.style.backgroundColor="rgb(252, 187, 127)";
            span.style.color="white";
            i.style.color="white";
        }else if(background=="yellow"){
            secDIV.style.backgroundColor="rgb(255, 245, 157)";
            fourDIV.style.backgroundColor="rgb(255, 245, 157)";
            span.style.color="rgb(247, 123, 123)";
            i.style.color="rgb(247, 123, 123)";
        }else if(background=="green"){
            secDIV.style.backgroundColor="rgb(86, 161, 111)";
            fourDIV.style.backgroundColor="rgb(86, 161, 111)";
            span.style.color="white";
            i.style.color="white";
        }else if(background=="skyblue"){
            secDIV.style.backgroundColor="rgb(123, 243, 247)";
            fourDIV.style.backgroundColor="rgb(123, 243, 247)";
            span.style.color="white";
            i.style.color="white";
        }else if(background=="blue"){
            secDIV.style.backgroundColor="rgb(121, 162, 250)";
            fourDIV.style.backgroundColor="rgb(121, 162, 250)";
            span.style.color="rgb(123, 243, 247)";
            i.style.color="rgb(123, 243, 247)";
        }else if(background=="darkblue"){
            secDIV.style.backgroundColor="rgb(123, 125, 247)";
            fourDIV.style.backgroundColor="rgb(123, 125, 247)";
            span.style.color="rgb(255, 245, 157)";
            i.style.color="rgb(255, 245, 157)";
        }else if(background=="purple"){
            secDIV.style.backgroundColor="rgb(171, 127, 252)";
            fourDIV.style.backgroundColor="rgb(171, 127, 252)";
            span.style.color="rgb(250, 167, 243)";
            i.style.color="rgb(250, 167, 243)";
        }else if(background=="pink"){
            secDIV.style.backgroundColor="rgb(250, 167, 243)";
            fourDIV.style.backgroundColor="rgb(250, 167, 243)";
            span.style.color="rgb(171, 127, 252)";
            i.style.color="rgb(171, 127, 252)";
        }else if(background=="gray"){
            secDIV.style.backgroundColor="rgb(184, 184, 184)";
            fourDIV.style.backgroundColor="rgb(184, 184, 184)";
            span.style.color="rgb(247, 123, 123)";
            i.style.color="rgb(247, 123, 123)";
        }else if(background=="darkgray"){
            secDIV.style.backgroundColor="rgb(116, 115, 115)";
            fourDIV.style.backgroundColor="rgb(116, 115, 115)";
            span.style.color="rgb(252, 187, 127)";
            i.style.color="rgb(252, 187, 127)";
        }else if(background=="black"){
            secDIV.style.backgroundColor="rgb(12, 12, 12)";
            fourDIV.style.backgroundColor="rgb(12, 12, 12)";
            span.style.color="white";
            i.style.color="white";
        }

        thrDIV.append(span);
        thrDIV.append(i);
        secDIV.append(thrDIV);
        secDIV.append(fourDIV);
        firstDIV.append(secDIV);

        boardList.append(firstDIV);

        closeModal();
    }
};

//=======================================================Element 에 style 한번에 오브젝트로 설정하는 함수 추가=======================================================
Element.prototype.setStyle = function(styles) {
    for (var k in styles) this.style[k] = styles[k];
    return this;
};

