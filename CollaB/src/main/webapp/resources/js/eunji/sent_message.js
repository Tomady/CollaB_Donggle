//검색버튼
document.querySelector("#sentSearch").onclick = function(){
	let jogun = document.querySelector("#sent_search_jogun").value; //검색조건
	let searchVal = document.querySelector("#sentSearchVal").value; //검색값
	console.log("ff");
	if(searchVal == ""){ //검색값이 없을때
		alert("Please enter what you want to search for.");
		document.querySelector("#sentSearchVal").focus();
	}else{
		if(jogun == "to"){
			$.ajax({
				url : "AjaxSentSearch_to",
				type : "POST",
				data : {
					searchVal : searchVal
				},
				dataType : "json",
				success : function(datas){
					//검색창 지워주고
					document.querySelector("#sentSearchVal").value = "";
					//테이블 바디에 있는 내용 다 지워주고
					let msgBODY = document.getElementById("msgBODY");
					msgBODY.textContent="";
					//결과값으로 tr그려주기
					for(let data of datas){
						let tr = document.createElement("tr");
						tr.setAttribute("class","oneSentMsgRow");
						let th = document.createElement("th");
						th.setAttribute("scope","row");
						let input = document.createElement("input");
						input.setAttribute("id",data.sent_id);
						input.setAttribute("type","checkbox");
						input.setAttribute("class","onemsg");
						input.setAttribute("name","onemsg");
						input.onclick = function(){ checkSelect(); }
						
						let to = document.createElement("td");
						to.onclick = function(){
							selectMSG(data.sent_id);
						}
						to.innerHTML = data.sent_to;
						let title = document.createElement("td");
						title.onclick = function(){
							selectMSG(data.sent_id);
						}
						title.innerHTML = data.sent_title;
						let contents = document.createElement("td");
						contents.style.textAlign="left";
						contents.onclick = function(){
							selectMSG(data.sent_id);
						}
						contents.innerHTML = data.sent_contents;
						let date = document.createElement("td");
						date.onclick = function(){
							selectMSG(data.sent_id);
						}
						date.innerHTML = data.sent_date;						
					
						th.append(input);
						tr.append(th);
						tr.append(to);
						tr.append(title);
						tr.append(contents);
						tr.append(date);
						
						msgBODY.append(tr);
					}
				},
				error : function(){
					console.log("AjaxSentSearch_to 실패")
				}
			})
		}else if(jogun == "title"){
			$.ajax({
				url : "AjaxSentSearch_title",
				type : "POST",
				data : {
					searchVal : searchVal
				},
				dataType : "json",
				success : function(datas){
					//검색창 지워주고
					document.querySelector("#sentSearchVal").value = "";
					//테이블 바디에 있는 내용 다 지워주고
					let msgBODY = document.getElementById("msgBODY");
					msgBODY.textContent="";
					//결과값으로 tr그려주기
					for(let data of datas){
						let tr = document.createElement("tr");
						tr.setAttribute("class","oneSentMsgRow");
						let th = document.createElement("th");
						th.setAttribute("scope","row");
						let input = document.createElement("input");
						input.setAttribute("id",data.sent_id);
						input.setAttribute("type","checkbox");
						input.setAttribute("class","onemsg");
						input.setAttribute("name","onemsg");
						input.onclick = function(){ checkSelect(); }
						
						let to = document.createElement("td");
						to.onclick = function(){
							selectMSG(data.sent_id);
						}
						to.innerHTML = data.sent_to;
						let title = document.createElement("td");
						title.onclick = function(){
							selectMSG(data.sent_id);
						}
						title.innerHTML = data.sent_title;
						let contents = document.createElement("td");
						contents.style.textAlign="left";
						contents.onclick = function(){
							selectMSG(data.sent_id);
						}
						contents.innerHTML = data.sent_contents;
						let date = document.createElement("td");
						date.onclick = function(){
							selectMSG(data.sent_id);
						}
						date.innerHTML = data.sent_date;						
					
						th.append(input);
						tr.append(th);
						tr.append(to);
						tr.append(title);
						tr.append(contents);
						tr.append(date);
						
						msgBODY.append(tr);
					}
				},
				error : function(){
					console.log("AjaxSentSearch_title 실패");
				}
			})
		}
	}
}


//메시지 보내기 모달창 속 워크스페이스 클릭시 해당 워크스페이스 조인멤버출력
function show_joinMembers(wkid){
	let members = document.querySelector("#members"); //여기다 멤버들 option으로 붙여주기
	members.innerHTML = "";
	
	$.ajax({
		url : "AjaxWorkspaceJoinMembers",
		type : "POST",
		data : {
			workspaceID : wkid
		},
		dataType : "json",
		success : function(datas){
			for(let data of datas){
				let option = document.createElement("option");
				option.innerHTML = data.name+"("+data.id+")";
				
				members.append(option);
			}
		},
		error : function(){
			console.log("AjaxWorkspaceJoinMembers 실패");
		}
	})
}

//메시지 보내기 모달창 함수
function newMsgSend(id){
	//모달 속 내용 지워주기
	document.querySelector("#modal-msg-dear").value = "";
	document.querySelector("#modal-msg-title").value = "";
	document.querySelector("#letterContents").value = "";
	
    var zIndex = 9999;
    var modal = document.getElementById(id);

    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    modal.querySelector('.modal_close_btn').onclick=function(){ closeModal() };

    // 보내기 버튼 처리, 모달끄고 Sent페이지로 이동
    document.querySelector("#sendMsg").onclick=function(){
        let dear = document.querySelector("#modal-msg-dear").value;
        let title = document.querySelector("#modal-msg-title").value;
        let contents = document.querySelector("#letterContents").value;

        if(dear == ""){
            document.querySelector("#modal-msg-dear").focus();
            document.querySelector("#modal-msg-dear").style.border="2px solid red";
            document.querySelector("#modal-msg-dear").placeholder="Required";
        }else if(title == ""){
            document.querySelector("#modal-msg-title").focus();
            document.querySelector("#modal-msg-title").style.border="2px solid red";
            document.querySelector("#modal-msg-title").placeholder="Required";
        }else if(contents == ""){
            document.querySelector("#letterContents").focus();
            document.querySelector("#letterContents").style.border="2px solid red";
            document.querySelector("#letterContents").placeholder="Required";
        }else{
            $.ajax({
            	url : "AjaxSendMessage",
            	type : "POST",
            	data : {
            		dear : dear,
            		title : title,
            		contents : contents
            	},
            	dataType : "text",
            	success : function(data){
            		console.log("메시지보내기성공?"+data);
            		closeModal();
            		location.href="message_sent";
            	},
            	error : function(){
            		console.log("AjaxSendMessage 실패");
            	}
            })
            
        }
    }

    // 메일쓰기 모달창에서 워크스페이스 선택-멤버선택시, 선택한 멤버 바로 input태그에 넣기
    document.querySelector("#members").onclick=function(){
        document.querySelector("#modal-msg-dear").value = String(event.target.value);
    }

    function closeModal(){
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

// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
Element.prototype.setStyle = function(styles) {
    for (var k in styles) this.style[k] = styles[k];
    return this;
};

//delete 버튼 클릭시
document.getElementById("sentMsgDelete").onclick=function(){
	//체크된 input태그들을 checked배열에다 담기
    const checked = document.querySelectorAll("input[name='onemsg']:checked");
    if(checked.length == 0){
    	alert("삭제할 메시지를 선택해주세요.");
    }
    //체크된 메시지들의 메시지아이디(PK)값을 msgIds배열에다 담기
    const msgIds = new Array();
    for(var i=0; i < checked.length; i++){
    	msgIds[i] = checked[i].getAttribute("id");
    }
    
    $.ajax({
    	url : "AjaxSentMsgDelete",
    	type : "POST",
    	data : {
    		sentMsgID : msgIds
    	},
    	traditional : true,
    	dataType : "text",
    	success : function(data){
    		if(data == "YES"){
    			console.log("메시지삭제성공?"+data);
    			//화면에서도 메시지 없애주기
				checked.forEach((checked) => {
			        checked.parentElement.parentElement.remove();
			        const checkboxes = document.querySelectorAll("input[name='onemsg']");
			        //만약 전부 다 삭제했으면 allcheck박스 체크해제해주기
			        if(checkboxes.length==0){
			            document.querySelector("input[name='allcheck']").checked = false;
			        }
			    })
    		}else if(data == "NO"){
    			console.log("메시지삭제성공?"+data);
    		}
    	},
    	error : function(){
    		console.log("sent메시지삭제이벤트 | AjaxSentMsgDelete 실패");
    	}
    })
 }

//체크박스 함수
function checkSelect(){
    const checkboxes = document.querySelectorAll("input[name='onemsg']");
    const checked = document.querySelectorAll("input[name='onemsg']:checked");
    const selectAll = document.querySelector("input[name='allcheck']");
    
    if(checkboxes.length === checked.length){
        selectAll.checked = true;
    }else {
        selectAll.checked = false;
    }
}

function selectAll(selectAll){
    const checkboxes = document.getElementsByName('onemsg');
    checkboxes.forEach((checkbox) => {
        //selectAll.checked = true
        checkbox.checked = selectAll.checked;
    })
}
 
//메시지조회 모달창 속 delete버튼 이벤트
function deleteSentMsg(msgIds){
	    $.ajax({
	    	url : "AjaxSentMsgDelete",
	    	type : "POST",
	    	data : {
	    		sentMsgID : msgIds
	    	},
	    	traditional : true,
	    	dataType : "text",
	    	success : function(data){
	    		if(data == "YES"){
	    			console.log("메시지삭제성공?"+data);
	    		}else if(data == "NO"){
	    			console.log("메시지삭제성공?"+data);
	    		}
	    	},
	    	error : function(){
	    		console.log("inbox메시지삭제이벤트 | AjaxInboxMsgDelete 실패");
	    	}
	    })
}

//메시지 조회 모달창 띄우기
function selectMSG(msgID){
console.log(msgID);
	$.ajax({
		url : "AjaxSelectSentMsg",
		type : "POST",
		data : {
			msgID : msgID
		},
		dataType : "json",
		success : function(data){
			var zIndex = 9999;
		    var modal = document.getElementById("select_msg");
		    let timestamp = data.sent_date;
		    var date = new Date(timestamp);
		    let year = date.getFullYear();
		    let month = date.getMonth()+1;
		    let day = date.getDate();
		    let writeDate = year+"-"+month+"-"+day;
		
		    //데이터 내용 모달에 넣기
		    modal.querySelector("#msgTitle").innerHTML = data.sent_title;
		    modal.querySelector("#msgTo").innerHTML = data.sent_to;
		    modal.querySelector("#msgDate").innerHTML = writeDate+" 에 보냄";
		    modal.querySelector("#msgContents").innerHTML = data.sent_contents;
	
			// 삭제 버튼 처리
			const msgIds = new Array();
			msgIds[0] = data.sent_id;
			modal.querySelector(".delete").onclick=function(){ 
				deleteSentMsg(msgIds); //아작스로 디비값 지워주고 
				closeModal(); //모달창끄기
				window.location.reload(); //새로고침
			}
		    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
		    modal.querySelector('.modal_close_btn').onclick=function(){ 
		    	closeModal(); 
		    	window.location.reload() //새로고침
		    };
		
		    function closeModal(){
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
		},
		error : function(){
			console.log("AjaxSelectSentMsg 메시지조회 실패");
		}
	})

    
}

//Element 에 style 한번에 오브젝트로 설정하는 함수 추가
Element.prototype.setStyle = function(styles) {
    for (var k in styles) this.style[k] = styles[k];
    return this;
};


