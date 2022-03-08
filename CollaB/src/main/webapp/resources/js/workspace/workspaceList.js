//해당 워크스페이스의 보드목록 출력
function showBoards(){
    let target = event.target;
    let boards = event.target.parentElement.nextElementSibling;

    target.remove();
    boards.style.display="block";
}

//워크스페이스 검색
function searchWorkspace(){
    let searchVal = document.querySelector("#searchWKNAME").value; //검색값
    console.log(searchVal);
    
    if(searchVal == ""){
    	document.querySelector("#searchWKNAME").focus();
    	document.querySelector("#searchWKNAME").style.border = "1px solid red";
    	document.querySelector("#searchWKNAME").placeholder = "required";
    }else{
    	const workspaces = document.querySelectorAll(".workspace");
		workspaces.forEach((workspace) => {
			workspace.style.display = "block";
		})
		workspaces.forEach((workspace) => {
			if(workspace.getAttribute("data-name") != searchVal){
				workspace.style.display = "none";
			}
		})
    }
}

//워크스페이스 탈퇴, 해당 워크스페이스의 보드에서도 탈퇴되도록
//만약 최후의 1인이면 워크스페이스 아예 삭제되게하기 -완
function workspaceJoinDelete(wkID){
	let answer = confirm("Do you want to leave the selected workspace?");
	if(answer){
		$.ajax({
			url : "AjaxWorkspaceJoinDelete",
			type : "POST",
			data : {
				wkid : wkID
			},
			dataType : "text",
			success : function(data){
				console.log("워크스페이스 탈퇴 성공?"+data);
				window.location.reload();
			},
			error : function(){
				console.log("AjaxWorkspaceJoinDelete 실패");
			}
		})
	}
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
    bdmodal('create_board');
}

//보드 만드는 모달 
function bdmodal(id) { 
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
    let boardThema = document.querySelector("#modal-board-background").value; //보드테마
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
	    		boardThema : boardThema,
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

//워크스페이스 삭제 모달창 띄우기
function deleteWorkspace(id){
	var zIndex = 9999;
    var modal = document.getElementById(id);
    
    $("#deleteTargetWorkspace").empty();
   	if($("#wkdelAgree").prop("checked")){
   		$("#wkdelAgree").prop("checked", false);
   	}
	document.querySelector(".divisionLine").style.display="none";	
	document.querySelector(".warningAlert").style.display="none";
	const workspaces = document.querySelectorAll(".wkbtn");
	workspaces.forEach((work)=>{
		work.style.display="block";
	})

    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    modal.querySelector('.del_workspace_close_btn').onclick=function(){ closeDelWorkspace() };
    // 삭제 버튼 처리
    modal.querySelector("#proceedWorkspaceDelete").onclick=function(){
    	//동의하는 체크박스 체크시에만 삭제가능하도록
    	if($("#wkdelAgree").prop("checked")){
    		const targetList = document.querySelectorAll(".delTarget");
    		const wkIds = new Array(); //삭제할 워크스페이스 아이디
			for(let i = 0; i<targetList.length; i++){
				wkIds[i] = targetList[i].getAttribute("data-wkid");
			}
			for(let wkId of wkIds){
	    		$.ajax({
	    			url : "AjaxWorkspaceDelete",
	    			type : "POST",
	    			data : {
	    				workspace_id : wkId
	    			},
	    			dataType : "text",
	    			success : function(data){
	    				console.log(wkId+"번 워크스페이스 삭제 성공?"+data);
	    				if(data == "YES"){
	    					closeDelWorkspace();
	    					window.location.reload();
	    				}
	    			},
	    			error : function(){
	    				console.log("AjaxWorkspaceDelete 실패");
	    			}
	    		})
			}
    	}else{
			alert("PLEASE CHECK IF YOU AGREE.");
    	}
    }
    
    function closeDelWorkspace(){
		bg.remove();
        modal.style.display = 'none';
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

//삭제할 워크스페이스 추가되도록
function del_SelectedWorkspace(wkid,wkname){
	document.querySelector(".wk"+wkid).style.display = "none";
	document.querySelector(".divisionLine").style.display = "block";
	document.querySelector(".warningAlert").style.display = "block";
	
	let btn = document.createElement("button");
	btn.setAttribute("class","delTarget btn btn-light mt-2 mb-2 ml-2");
	btn.setAttribute("data-wkid",wkid);
	btn.setAttribute("id","workspaceDelTarget"+wkid);
	btn.style.width="95%";
	btn.innerHTML = wkname;
	btn.onclick = function(){
		document.querySelector(".wk"+wkid).style.display = "block";
		event.target.remove();
		if(document.querySelector("#deleteTargetWorkspace .delTarget") == null){
			document.querySelector(".divisionLine").style.display = "none";
			document.querySelector(".warningAlert").style.display = "none";
		}
	}
	deleteTargetWorkspace.append(btn);
}