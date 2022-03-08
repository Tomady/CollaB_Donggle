//워크프페이스 프로필이미지
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
						document.querySelector("#workspaceName").textContent=newWSName;
						document.querySelector("#sidebar_workspace"+wkid).innerHTML="&nbsp;&nbsp;"+newWSName;
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

//보드검색기능
function searchBoard(){
    let searchVal = searchBOARDNAME.value; //사용자 입력값
	searchBOARDNAME.value="";
	
	if(searchVal == ""){
		searchBOARDNAME.focus();
		searchBOARDNAME.style.border = "1px solid red";
		searchBOARDNAME.placeholder = "required";
	}else {
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

//Element 에 style 한번에 오브젝트로 설정하는 함수 추가 
Element.prototype.setStyle = function(styles) {
    for (var k in styles) this.style[k] = styles[k];
    return this;
};

//워크스페이스 만드는 모달 띄우기 
function create_workspaceModal(){
    wkModal('create_wk');
}

//워크스페이스 만드는 모달 
function wkModal(id){
    document.getElementById('modal-workspace-title').value = "";

    var zIndex = 9999;
    var modal = document.getElementById(id);

    // 모달 div 뒤 레이어
    var bg = document.createElement('div');
    bg.setAttribute("id","modal-back");
    bg.setStyle({
        position: 'fixed',
        zIndex: zIndex,
        left: '0px',
        top: '0px',
        width: '100%',
        height: '100%',
        overflow: 'auto',
        // 레이어 색갈은 여기서 바꾸기
        backgroundColor: 'rgba(0,0,0,0.4)'
    });
    document.body.append(bg);

    modal.setStyle({
        position: 'fixed',
        display: 'block',
        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

        // 시꺼먼 레이어 보다 한칸 위에 보이기
        zIndex: zIndex + 1,

        // div center 정렬
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        msTransform: 'translate(-50%, -50%)',
        webkitTransform: 'translate(-50%, -50%)'
    });
}

//워크스페이스생성 모달 속 CREATE버튼 처리 
function createWK(){
    let wkspaceName = document.querySelector("#modal-workspace-title").value;
	if(wkspaceName == ""){
		document.querySelector("#modal-workspace-title").focus();
		document.querySelector("#modal-workspace-title").style.border = "1px solid red";
		document.querySelector("#modal-workspace-title").placeholder = "required";
	}else{
		$.ajax({
			url : "AjaxCreateWorkspace",
			data : {
				wkspaceName : wkspaceName
			},
			type : "POST",
			dataType : "text",
			success : function(data){
				if(data == "NO"){
					console.log("워크스페이스 생성 실패");
				}else{
					console.log("워크스페이스 생성 성공");
					closeWKModal();
					location.href="Boards?wkid="+Number(data);
				}
			},
			error : function(){
				console.log("AjaxCreateWorkspace 아작스 실패");
			}
		})
	}	
}

//워크스페이스 모달 닫기버튼처리 
function closeWKModal(){
    document.querySelector("#modal-back").remove();
    document.querySelector("#create_wk").style.display="none";
}

//보드 만드는 모달 띄우기 
function create_boardModal(){
    modal('create_board');
}

//보드 만드는 모달 
function modal(id) { 
    document.getElementById('modal-board-background').value = "";
    document.getElementById('modal-board-title').value = "";

    var zIndex = 9999;
    var modal = document.getElementById(id);

    //boardBackground color
    modal.querySelector("#bkcolor").onclick=function(){
        let background = document.querySelector("#modal-board-background");
        if(event.target.nodeName == "SPAN"){
            let color = String(event.target.id);
            background.value = color;
            console.log(color);
        }
    }

    // 모달 div 뒤 레이어
    var bg = document.createElement('div');
    bg.setAttribute("id","modal-back");
    bg.setStyle({
        position: 'fixed',
        zIndex: zIndex,
        left: '0px',
        top: '0px',
        width: '100%',
        height: '100%',
        overflow: 'auto',
        // 레이어 색갈은 여기서 바꾸기
        backgroundColor: 'rgba(0,0,0,0.4)'
    });
    document.body.append(bg);

    modal.setStyle({
        position: 'fixed',
        display: 'block',
        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

        // 시꺼먼 레이어 보다 한칸 위에 보이기
        zIndex: zIndex + 1,

        // div center 정렬
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        msTransform: 'translate(-50%, -50%)',
        webkitTransform: 'translate(-50%, -50%)'
    });
}

//보드생성 모달 속 CREATE버튼 처리 
function createBoard(){
    let background = document.querySelector("#modal-board-background").value; //보드테마
	let boardName = document.querySelector("#modal-board-title").value; //생성할 보드이름
    let workspaceID = document.querySelector("#select-workspace").value; //이동할 boards페이지의 워크스페이스ID

	if(boardName == ""){
		document.querySelector("#modal-board-title").focus();
		document.querySelector("#modal-board-title").style.border = "1px solid red";
		document.querySelector("#modal-board-title").placeholder = "required";
	}else{
	    //사용자가 선택한 컬러,제목,워크스페이스에 보드 만들어준 후
	    //해당 보드의 상세페이지로 이동하기
	    $.ajax({
	    	url : "AjaxCreateNewBoard",
	    	type : "POST",
	    	data : {
	    		boardThema : background,
	    		boardName : boardName,
	    		workspaceID : workspaceID
	    	},
	    	dataType : "json",
	    	success : function(data){
	    		closeModal();
	    		location.href="boardDetail?boardID="+data.board_id;
	    	},
	    	error : function(){
	    		console.log("AjaxCreateNewBoard 실패");
	    	}
	    })
    }
}

//보드생성 모달 속 닫기 버튼 처리 
function closeModal(){
    document.querySelector("#modal-back").remove();
    document.querySelector("#create_board").style.display="none";
}

