//워크스페이스 이름 변경
document.getElementById("WsName").onclick=function(){ workspaceRename() };
function workspaceRename(){
    let appendTarget = event.target.parentElement;
	let wkid = event.target.getAttribute("data-wkid");
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
		                let newName = document.createElement("h3");
		                newName.setAttribute("class","mt-4");
		                newName.setAttribute("id","WsName");
		                newName.onclick=function(){
		                    workspaceRename();
		                }
		                newName.innerHTML=newWSName;
		                document.querySelector(".workspaceNAME").append(newName);
						document.querySelector(".sidebar_wkname").textContent=newWSName;
					},
					error: function(){
						console.log("AjaxWorkspaceRename 아작스 실패");
					}
				})
                
				
            }
        }
    });
    appendTarget.append(WsRename);
    document.getElementById("WsRename").focus();
}
//워크스페이스 이미지
function changeWKIMG(newWKname){
	let name = newWKname.substring(0, 1);
	let img = document.querySelector(".wkimg");
	let img2 = document.querySelector(".wkimg-body");
	if(name == 'a' || name == 'A'){
		img.setAttribute("src","resources/img/a.jpg");
		img2.setAttribute("src","resources/img/a.jpg");
	}else if(name == 'b' || name == 'B'){
		img.setAttribute("src","resources/img/b.jpg");
		img2.setAttribute("src","resources/img/b.jpg");
	}else if(name == 'c' || name == 'C'){
		img.setAttribute("src","resources/img/c.jpg");
		img2.setAttribute("src","resources/img/c.jpg");
	}else if(name == 'd' || name == 'D'){
		img.setAttribute("src","resources/img/d.jpg");
		img2.setAttribute("src","resources/img/d.jpg");
	}else if(name == 'e' || name == 'E'){
		img.setAttribute("src","resources/img/e.jpg");
		img2.setAttribute("src","resources/img/e.jpg");
	}else if(name == 'f' || name == 'F'){
		img.setAttribute("src","resources/img/f.jpg");
		img2.setAttribute("src","resources/img/f.jpg");
	}else if(name == 'g' || name == 'G'){
		img.setAttribute("src","resources/img/g.jpg");
		img2.setAttribute("src","resources/img/g.jpg");
	}else if(name == 'h' || name == 'H'){
		img.setAttribute("src","resources/img/h.jpg");
		img2.setAttribute("src","resources/img/h.jpg");
	}else if(name == 'i' || name == 'I'){
		img.setAttribute("src","resources/img/i.jpg");
		img2.setAttribute("src","resources/img/i.jpg");
	}else if(name == 'j' || name == 'J'){
		img.setAttribute("src","resources/img/j.jpg");
		img2.setAttribute("src","resources/img/j.jpg");
	}else if(name == 'k' || name == 'K'){
		img.setAttribute("src","resources/img/k.jpg");
		img2.setAttribute("src","resources/img/k.jpg");
	}else if(name == 'l' || name == 'L'){
		img.setAttribute("src","resources/img/l.jpg");
		img2.setAttribute("src","resources/img/l.jpg");
	}else if(name == 'm' || name == 'M'){
		img.setAttribute("src","resources/img/m.jpg");
		img2.setAttribute("src","resources/img/m.jpg");
	}else if(name == 'n' || name == 'N'){
		img.setAttribute("src","resources/img/n.jpg");
		img2.setAttribute("src","resources/img/n.jpg");
	}else if(name == 'o' || name == 'O'){
		img.setAttribute("src","resources/img/o.jpg");
		img2.setAttribute("src","resources/img/o.jpg");
	}else if(name == 'p' || name == 'P'){
		img.setAttribute("src","resources/img/p.jpg");
		img2.setAttribute("src","resources/img/p.jpg");
	}else if(name == 'q' || name == 'Q'){
		img.setAttribute("src","resources/img/q.jpg");
		img2.setAttribute("src","resources/img/q.jpg");
	}else if(name == 'r' || name == 'R'){
		img.setAttribute("src","resources/img/r.jpg");
		img2.setAttribute("src","resources/img/r.jpg");
	}else if(name == 's' || name == 'S'){
		img.setAttribute("src","resources/img/s.jpg");
		img2.setAttribute("src","resources/img/s.jpg");
	}else if(name == 't' || name == 'T'){
		img.setAttribute("src","resources/img/t.jpg");
		img2.setAttribute("src","resources/img/t.jpg");
	}else if(name == 'u' || name == 'U'){
		img.setAttribute("src","resources/img/u.jpg");
		img2.setAttribute("src","resources/img/u.jpg");
	}else if(name == 'v' || name == 'V'){
		img.setAttribute("src","resources/img/v.jpg");
		img2.setAttribute("src","resources/img/v.jpg");
	}else if(name == 'w' || name == 'W'){
		img.setAttribute("src","resources/img/w.jpg");
		img2.setAttribute("src","resources/img/w.jpg");
	}else if(name == 'x' || name == 'X'){
		img.setAttribute("src","resources/img/x.jpg");
		img2.setAttribute("src","resources/img/x.jpg");
	}else if(name == 'y' || name == 'Y'){
		img.setAttribute("src","resources/img/y.jpg");
		img2.setAttribute("src","resources/img/y.jpg");
	}else if(name == 'z' || name == 'Z'){
		img.setAttribute("src","resources/img/z.jpg");
		img2.setAttribute("src","resources/img/z.jpg");
	}else if(name == '0'){
		img.setAttribute("src","resources/img/0.jpg");
		img2.setAttribute("src","resources/img/0.jpg");
	}else if(name == '1'){
		img.setAttribute("src","resources/img/1.jpg");
		img2.setAttribute("src","resources/img/1.jpg");
	}else if(name == '2'){
		img.setAttribute("src","resources/img/2.jpg");
		img2.setAttribute("src","resources/img/2.jpg");
	}else if(name == '3'){
		img.setAttribute("src","resources/img/3.jpg");
		img2.setAttribute("src","resources/img/3.jpg");
	}else if(name == '4'){
		img.setAttribute("src","resources/img/4.jpg");
		img2.setAttribute("src","resources/img/4.jpg");
	}else if(name == '5'){
		img.setAttribute("src","resources/img/5.jpg");
		img2.setAttribute("src","resources/img/5.jpg");
	}else if(name == '6'){
		img.setAttribute("src","resources/img/6.jpg");
		img2.setAttribute("src","resources/img/6.jpg");
	}else if(name == '7'){
		img.setAttribute("src","resources/img/7.jpg");
		img2.setAttribute("src","resources/img/7.jpg");
	}else if(name == '8'){
		img.setAttribute("src","resources/img/8.jpg");
		img2.setAttribute("src","resources/img/8.jpg");
	}else if(name == '9'){
		img.setAttribute("src","resources/img/9.jpg");
		img2.setAttribute("src","resources/img/9.jpg");
	}
}

//보드검색기능
function searchBoard(){
    let searchVal = searchBOARDNAME.value; //사용자 입력값
	searchBOARDNAME.value="";
	
	const boards = document.querySelectorAll(".boardDIV");
	boards.forEach((board) => {
		board.style.display = "block";
	})
	boards.forEach((board) => {
		if(board.getAttribute("data-name") != searchVal){
			board.style.display = "none";
		}
	})
}

//보드생성 질문&답변
question.onmouseover = function(){
    question.style.color = "black";
    answer.style.display = "block";
}
question.onmouseout = function(){
    question.style.color = "gray";
    answer.style.display = "none";
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

