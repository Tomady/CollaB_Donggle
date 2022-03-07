//보드테마적용
function boardColorFnc(color){
    let mainheaderBackground = document.querySelector(".mainheaderBackground");
    let pagebodybackground = document.querySelector(".pagebodybackground");

    //아작스로 디비값 먼저 바꿔주고 아작스 성공하면 실행하기
    if(color=="red"){
        mainheaderBackground.style.backgroundColor = "rgb(252,205,205)";
        pagebodybackground.style.backgroundColor = "rgb(252, 162, 162)";
    }else if(color=="orange"){
        mainheaderBackground.style.backgroundColor = "rgb(255, 205, 158)";
        pagebodybackground.style.backgroundColor = "rgb(247,217,189)";
    }else if(color=="yellow"){
        mainheaderBackground.style.backgroundColor = "rgb(255,242,130)";
        pagebodybackground.style.backgroundColor = "rgb(248,244,204)";
    }else if(color=="green"){
        mainheaderBackground.style.backgroundColor = "rgb(164,230,186)";
        pagebodybackground.style.backgroundColor = "rgb(218,247,228)";
    }else if(color=="skyblue"){
        mainheaderBackground.style.backgroundColor = "rgb(68, 209, 228)";
        pagebodybackground.style.backgroundColor = "rgb(203, 248, 250)";
    }else if(color=="blue"){
        mainheaderBackground.style.backgroundColor = "rgb(168, 195, 252)";
        pagebodybackground.style.backgroundColor = "rgb(209, 231, 241)";
    }else if(color=="darkblue"){
        mainheaderBackground.style.backgroundColor = "rgb(168,169,238)";
        pagebodybackground.style.backgroundColor = "rgb(192, 193, 250)";
    }else if(color=="purple"){
        mainheaderBackground.style.backgroundColor = "rgb(199, 174, 247)";
        pagebodybackground.style.backgroundColor = "rgb(204, 195, 226)";
    }else if(color=="pink"){
        mainheaderBackground.style.backgroundColor = "rgb(243,183,238)";
        pagebodybackground.style.backgroundColor = "rgb(248,233,247)";
    }else if(color=="gray"){
        mainheaderBackground.style.backgroundColor = "rgb(124,124,124)";
        pagebodybackground.style.backgroundColor = "rgb(241,241,241)";
    }else if(color=="darkgray"){
        mainheaderBackground.style.backgroundColor = "rgb(83,83,83)";
        pagebodybackground.style.backgroundColor = "rgb(119,116,116)";
    }else if(color=="black"){
        mainheaderBackground.style.backgroundColor = "rgb(43,43,43)";
        pagebodybackground.style.backgroundColor = "rgb(12,12,12)";
    }else if(color="base"){
        mainheaderBackground.style.backgroundColor = "#9F90D9";
        pagebodybackground.style.backgroundColor = "#ECE9FE";
    }
}

//카드라벨선택
//클릭한 값으로 input에다 넣어주기
function selectLabel(color){
	document.querySelector(".selectedLabel").value="";
	document.querySelector(".selectedLabel").value=color;
}

//선택한라벨 저장, DB랑 화면수정
function cardLabelSelect(cardId){
	let label = document.querySelector(".selectedLabel").value;
	if(label == "None"){
		label = "light";
	}else if(label == "Red"){
		label = "danger";
	}else if(label == "Orange"){
		label = "warning";
	}else if(label == "Green"){
		label = "success";
	}else if(label == "SkyBlue"){
		label = "info";
	}else if(label == "Blue"){
		label = "primary";
	}else if(label == "Gray"){
		label = "secondary";
	}else if(label == "Black"){
		label = "dark";
	}
	
	$.ajax({
		url : "AjaxCardLabelUpdate",
		type : "POST",
		data : {
			card_id : cardId,
			card_label : label
		},
		dataType : "json",
		success : function(data){
			console.log(data);
			//방금 수정한 카드 가져와서 화면에 수정하여 그려주기
			document.querySelector("#card"+data.card_id).setAttribute("class","cards card card-"+data.card_label+" ml-2 mr-2");
			$('.test123').addClass('test1234');
      		setTimeout(function() {
        		$('.test123').removeClass('test1234');
       		}, 200)
		},
		error : function(){
			console.log("AjaxCardLabelUpdate 카드라벨변경 실패");
		}
	})
}

//카드관리자추가 모달창띄우기
function cardMemberSet(id){
	//해당 카드 아이디
	let cardId = document.querySelector("#selectedCard").getAttribute("data-cardId");
	
	//모달창 켰을때마다 해당 카드의 매니저가 나오도록
	let manager = selectedCard.getAttribute("data-cardManager");
	cardManager.innerHTML = "";
	cardManager.innerHTML = manager;
	
	var zIndex = 9999;
    var modal = document.getElementById(id);
	
    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    modal.querySelector('.add_Member_close_btn').onclick=function(){ closeAddMember() };
	
	//카드 관리자 추가
	modal.querySelector("#managerSaveBtn").onclick=function(){
		//선택된 관리자아이디
		let managerId = cardManager.getAttribute("data-memid");
		$.ajax({
			url : "AjaxCardManagerSet",
			type : "POST",
			data : {
				manager : managerId,
				card_id : cardId
			},
			dataType : "text",
			success : function(data){
				console.log("카드관리자추가성공?"+data);
				if(data == "YES"){
					closeAddMember();
					window.location.reload();
				}
			},
			error : function(){
				console.log("AjaxCardManagerSet 카드관리자지정 실패")
			}
		})
	}
	
	//카드 관리자 삭제
	modal.querySelector("#cardManager").onclick=function(){
		event.target.innerHTML = "";
	}
	
	function closeAddMember(){
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

//카드관리자추가 모달창-멤버한명선택
function managerSelect(memberId){
	let selectedMem = event.target.innerHTML;
	cardManager.innerHTML = "";
	cardManager.innerHTML = selectedMem;
	cardManager.setAttribute("data-memid",memberId);
}

//카드일정잡기모달 띄우기
function cardDatesSet(id){
	//모달 속 내용 지워주기
	document.querySelector("#cardStartDate").value="";
	document.querySelector("#cardStartDate").removeAttribute("max");
	document.querySelector("#cardEndDate").value="";
	document.querySelector("#cardEndDate").removeAttribute("min");
	
	var zIndex = 9999;
    var modal = document.getElementById(id);

    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    modal.querySelector('.add_Dates_close_btn').onclick=function(){ closeAddDates() };
	
	// 저장 버튼 처리
	let cardId = document.querySelector("#selectedCard").getAttribute("data-cardId");
	modal.querySelector('#datesSaveBtn').onclick=function(){
		let startDate = document.querySelector("#cardStartDate").value;
		let endDate = document.querySelector("#cardEndDate").value;
	
		if(startDate == ""){
			document.querySelector("#cardStartDate").focus();
		}else if(endDate == ""){
			document.querySelector("#cardEndDate").focus();
		}else{
			$.ajax({
				url : "AjaxAddCardDates",
				type : "POST",
				data : {
					card_id : cardId,
					card_start_date : startDate,
					card_end_date : endDate
				},
				dataType : "text",
				success : function(data){
					bg.remove();
       				modal.style.display = 'none';
					if(data == "YES"){
						if(document.querySelector("#cardDates")){ //기존에 일정이 있었다면
							cardDatesSpan.innerHTML=startDate+" - "+endDate;
						}else{  //카드일정을 처음 등록하는거라면
							let dateDIV = document.createElement("div");
							dateDIV.setAttribute("class","card-header");
							dateDIV.setAttribute("id","cardDates");
							let h4 = document.createElement("h4");
							h4.innerHTML = "Dates";
							h4.onclick = function(){
								cardDatesSet(cardid);
							}
							let days = document.createElement("div");
							let span = document.createElement("span");
							span.setAttribute("id","cardDatesSpan");
							span.style.backgroundColor="rgb(235,251,252)";
							span.style.borderRadius="3px";
							span.style.fontSize="15px";
							span.innerHTML=startDate+" - "+endDate;
							
							let deleteBtn = document.createElement("div");
							deleteBtn.setAttribute("class","fa fa-times ml-3 mb-1");
							deleteBtn.style.cursor = "pointer";
							deleteBtn.onclick=function(){
								deleteDates(cardid);
							}	
							days.append(span);
							dateDIV.append(h4);
							dateDIV.append(days);
							dateDIV.append(deleteBtn);
							datesAppendTarget.append(dateDIV);
						}
					}
				}
			})
		}
	}
	
	function closeAddDates(){
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

//Element 에 style 한번에 오브젝트로 설정하는 함수 추가
Element.prototype.setStyle = function(styles) {
    for (var k in styles) this.style[k] = styles[k];
    return this;
};

//start date에 맞게 end date제한하기
function endDateLimit(){
	let startDate = document.querySelector("#cardStartDate").value;
	if(startDate != ""){ //시작일이 이미 있으면
		document.querySelector("#cardEndDate").setAttribute("min",startDate);
	}
}

//end date에 맞게 start date제한하기
function startDateLimit(){
	let endDate = document.querySelector("#cardEndDate").value;	
	if(endDate != ""){
		document.querySelector("#cardStartDate").setAttribute("max",endDate);
	}
}

//카드일정삭제
function deleteDates(cardid){
	$.ajax({
		url : "AjaxDeleteDates",
		type : "POST",
		data : {
			card_id : cardid
		},
		dataType : "text",
		success : function(data){
			console.log("일정삭제성공?"+data);
			if(data == "YES"){
				cardDates.remove();
			}
		},
		error : function(){
			console.log("AjaxDeleteDates 실패")
		}
	}) 
}

//카드체크리스트추가 모달 띄우기
function cardCheckListSet(id,cardid){
	//이미 입력된 내용 있으면 지워주고
	document.querySelector("#checklist_title").value="";
	
	var zIndex = 9999;
    var modal = document.getElementById(id);

	// 저장 버튼 처리
	modal.querySelector("#checkAddBtn").onclick=function(){
		let title = document.querySelector("#checklist_title").value;
		
		if(title == ""){
			document.querySelector("#checklist_title").style.border="1px solid red";
			document.querySelector("#checklist_title").focus();
			document.querySelector("#checklist_title").placeholder="required";
		}else{
			$.ajax({
				url : "AjaxAddCheckList",
				type : "POST",
				data : {
					card_id : cardid,
					checklist_title : title
				},
				dataType : "json",
				success : function(data){
					let card = document.createElement("div");
					card.setAttribute("class","card ckDIV");
					let cardBody = document.createElement("div");
					cardBody.setAttribute("class","card-body");
					cardBody.setAttribute("id","checkbody"+data.checklist_id);
					let title = document.createElement("div");
					title.setAttribute("class","d-flex justify-content-between");
					title.innerHTML = data.checklist_title;
					let deleteBtn = document.createElement("button");
					deleteBtn.setAttribute("class","btn ml-2 fa fa-times col-rg");
					deleteBtn.style.cursor="pointer";
					deleteBtn.onclick = function(){
						//체크리스트 삭제 클릭이벤트 달아주기
					}
					let chart = document.createElement("div");
					chart.setAttribute("class","progress mb-2");
					let span = document.createElement("span");
					span.setAttribute("class","checkChart");
					let button = document.createElement("button");
					button.setAttribute("class","btn btn-secondary fa fa-plus ml-4 mb-5");
					button.style.width="15%";
					button.style.cursor="pointer";
					button.innerHTML = " item";
					button.onclick=function(){
						//add item버튼 클릭이벤트 달아주기
						let itemInput = document.createElement("input");
						itemInput.setAttribute("class","mb-2 mt-2");
						itemInput.setAttribute("id","new_item");
						itemInput.setAttribute("type","text");
						itemInput.style.width="100%";
						itemInput.addEventListener("keyup",function(){
							if(window.event.keyCode == 13){
								//엔터키가 눌렸을때
								let newitem = document.querySelector("#new_item").value;
								if(newitem == ""){
									document.querySelector("#new_item").style.border="2px solid red";
									document.querySelector("#new_item").setAttribute("placeholder","required");
									document.querySelector("#new_item").focus();
								}else{
									$.ajax({
										url : "AjaxAddCheckListItem",
										type : "POST",
										data : {
											checklist_id : data.checklist_id,
											item_title : newitem
										},
										dataType : "json",
										success : function(data){
											//input박스 지워주고 체크로 만들기
											
										},
										error : function(){
											console.log("AjaxAddCheckListItem 실패");
										}
									})
								}
							}
						})				
						document.querySelector("#checkbody"+data.checklist_id).append(itemInput);
						event.target.remove();
					}
					
					title.append(deleteBtn);
					chart.append(span);
					cardBody.append(title);
					cardBody.append(chart);
					card.append(cardBody);
					card.append(button);
					checklistAppendTarget.prepend(card);
					
					closeAddCheck();
				},
				error : function(){
					console.log("AjaxAddCheckList 실패");
				}
			})
		}
	}

    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    modal.querySelector('.add_Check_close_btn').onclick=function(){ closeAddCheck() };
	function closeAddCheck(){
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

//리스트이름수정
function renameList(listid){
	let appendTarget = document.querySelector(".listnameAppendTarget"); //input박스 붙여줄 곳
	document.querySelector(".listName"+listid).remove();
	
	let input = document.createElement("input");
	input.setAttribute("id","NewListName")
	input.setAttribute("type","text");
	input.setAttribute("class","form-control mb-2 mt-5");
	input.style.width="100%";
	input.style.height="90%";
	input.style.textAlign="center";
	input.addEventListener("keyup",function(){
		//엔터키가 눌렸을때
		if(window.event.keyCode == 13){
			//사용자가 입력한 새로운 리스트 이름
			let newListname = document.querySelector("#NewListName").value;
			//빈 값이면
			if(newListname == ""){
				input.style.border="2px solid red;"
				input.setAttribute("placeholder","Please name it.");
				input.focus();
			}else{ //값이 있으면
				//Ajax실행 => DB에 해당 리스트이름 update하기
				$.ajax({
					url : "AjaxRenameList",
					type : "POST",
					data : {
						listId : listid,
						listName : newListname
					},
					dataType : "text",
					success : function(data){
						if(data == "YES"){
							document.querySelector("#NewListName").remove();
							let h4 = document.createElement("h4");
							h4.setAttribute("class","listName"+listid+" mt-5 mb-4 ml-4");
							h4.onclick=function(){renameList(listid)}
							h4.innerHTML=newListname;
							
							appendTarget.prepend(h4);
						}else if(data == "NO"){
							console.log("리스트이름수정실패");
						}
					},
					error : function(){
						console.log("AjaxRenameList 실패");
					}
				})	
			}
		}
	})
	appendTarget.prepend(input);
	input.focus();
}

//카드내용수정하기버튼
function contentsEdit(){
	document.querySelector(".cardContents").removeAttribute("readonly");
	document.querySelector(".cardContents").focus();
}
//카드내용저장하기버튼
function contentsSave(cardid){
	let contents = document.querySelector(".cardContents").value;
	$.ajax({
		url : "AjaxCardContentsSave",
		type : "POST",
		data : {
			card_id : cardid,
			card_contents : contents
		},
		dataType : "text",
		success : function(data){
			if(data == "YES"){
				console.log(data);
				//화면에 변경된 내용 저장해주고 textarea는 다시 readonly로 바꿔주기
				document.querySelector(".cardContents").setAttribute("readonly","readonly");
				$(".saveDone").addClass("saveDone123");
				setTimeout(function(){
					$(".saveDone").removeClass("saveDone123");},1000)
			}else if(data == "NO"){
				console.log("카드내용변경 실패");
			}
		},
		error : function(){
			console.log("AjaxCardContentsSave 카드내용변경실패");
		}
	})
}

//카드이름수정하기
function renameCard(cardId){
	let appendTarget = document.querySelector("#cardTitleAppendTarget");
	document.querySelector("#card_Title").remove();
	
	let input = document.createElement("input");
	input.setAttribute("id","NewCardName")
	input.setAttribute("type","text");
	input.setAttribute("class","form-control mb-3 mt-5");
	input.style.width="90%";
	input.style.height="90%";
	input.style.textAlign="center";
	input.addEventListener("keyup",function(){
		//엔터키가 눌렸을때
		if(window.event.keyCode == 13){
			//사용자가 입력한 새로운 리스트 이름
			let newCardname = document.querySelector("#NewCardName").value;
			//빈 값이면
			if(newCardname == ""){
				input.style.border="2px solid red;"
				input.setAttribute("placeholder","Please name it.");
				input.focus();
			}else{ //값이 있으면
				//Ajax실행 => DB에 해당 카드이름 update하기
				$.ajax({
					url : "AjaxRenameCard",
					type : "POST",
					data : {
						card_id : cardId,
						card_title : newCardname
					},
					dataType : "text",
					success : function(data){
						if(data == "YES"){
							document.querySelector("#NewCardName").remove();
							let h4 = document.createElement("h4");
							h4.setAttribute("id","card_Title");
							h4.setAttribute("class","cardName mt-5 mb-4");
							h4.onclick=function(){renameCard(cardId)}
							h4.innerHTML=newCardname;
							
							appendTarget.prepend(h4);
						}else if(data == "NO"){
							console.log("리스트이름수정실패");
						}
					},
					error : function(){
						console.log("AjaxRenameCard 실패");
					}
				})	
			}
		}
	})
	appendTarget.prepend(input);
	input.focus();
}

//체크리스트 전체 삭제
function checklistDelete(checklistId){
	let delTarget = document.querySelector(".ckDIV"+checklistId); //삭제할 타겟
	
	$.ajax({
		url : "AjaxDeleteCheckList",
		type : "POST",
		data : {
			checklist_id : checklistId
		},
		dataType : "text",
		success : function(data){
			console.log("체크리스트 삭제 성공?"+data);
			if(data == "YES"){
				delTarget.remove();
			}
		},
		error : function(){
			console.log("AjaxDeleteCheckList 실패");
		}
	})
}

//체크리스트 아이템삭제
function checkItem(ckid,itemid){
	let checked = "";
	if ( $(event.target).prop('checked') ) { 
		//체크함
		checked = "Y";
	} else {  
		//체크해제함
		checked = "N";
	}
	
	$.ajax({
		url : "AjaxCheckListItemStatusUpdate",
		type : "POST",
		data : {
			item_id : itemid,
			item_status : checked
		},
		dataType : "text",
		success : function(data){
			console.log("아이템상태변경성공?"+data);
			if(data == "YES"){
				const items = $(".checkitem"+ckid); //총 아이템
				let itemCnt = $(items).length;  //총 아이템 수
				let checkedCnt = 0; //체크된 아이템 수 
				
				for(let item of items){
					if($(item).prop('checked')){
						checkedCnt += 1;
					}
				}
				let wid = Math.ceil(checkedCnt/itemCnt*100);
				document.querySelector(".checkChart"+ckid).innerHTML = "&nbsp;&nbsp;&nbsp;"+wid+"%";
				document.querySelector(".checkChart"+ckid).style.width=wid+"%";
			}
		},
		error : function(){
			console.log("AjaxCheckListItemStatusUpdate 아이템상태변경 실패");
		}
	})
}

