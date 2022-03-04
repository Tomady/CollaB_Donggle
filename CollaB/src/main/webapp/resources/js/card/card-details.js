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

//카드일정잡기모달 띄우기
function cardDatesSet(id){
	document.querySelector("#cardStartDate").value="";
	document.querySelector("#cardStartDate").removeAttribute("max");
	document.querySelector("#cardEndDate").value="";
	document.querySelector("#cardEndDate").removeAttribute("min");
	
	var zIndex = 9999;
    var modal = document.getElementById(id);

    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    modal.querySelector('.add_Dates_close_btn').addEventListener('click', closeAddDates());

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

//일정추가모달창 닫기
function closeAddDates(){
	document.querySelector("#add_Dates").style.display = "none";
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

//카드일정저장
function cardDateSave(cardid){
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
				card_id : cardid,
				card_start_date : startDate,
				card_end_date : endDate
			},
			dataType : "text",
			success : function(data){
				closeAddDates();
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
