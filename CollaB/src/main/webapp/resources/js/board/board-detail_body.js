//====================리스트생성DIV -> +ADD List 클릭 -> list 이름설정 DIV//====================
// [설명] Add list 클릭시 이름지정할 수 있는 input박스 생성해주고, 
//         입력한 값을 createList함수로 보내기
document.querySelector(".addListBtn").onclick=function(){
    //리스트 추가해주는 div 안보이게끔 만들어주기
    addList.style.display="none";
    let target = document.querySelector("#boardDetailBODY");
    //리스트 이름 설정하는 div만들어주기
    let one = document.createElement("div");
    one.setAttribute("class","col-12 col-sm-6 col-lg-2");
    one.setAttribute("id","createListDIV")
    let two = document.createElement("div");
    two.setAttribute("class","card");
    let three = document.createElement("div");
    three.setAttribute("class","card-header");
    let three_a = document.createElement("input");
    three_a.style.width="100%";
    three_a.style.height="80%";
    three_a.setAttribute("class","form-control newListName");
    three_a.setAttribute("type","text");
    //리스트 이름 지정 이벤트
    three_a.addEventListener("keyup",function(){
        //엔터키 눌렸을때
        if(window.event.keyCode == 13){
            //사용자가 입력한 리스트이름
            let newListName = document.querySelector(".newListName").value;
            //값이 없으면
            if(newListName == ""){
                document.querySelector(".newListName").style.border="2px solid red";
                document.querySelector(".newListName").setAttribute("placeholder","Please name it.");
                document.querySelector(".newListName").focus();
            //값이 있으면
            }else{
				let boardID = document.querySelector(".addListBtn").getAttribute("data-boardID");
				$.ajax({
					url : "AjaxCreateList",
					type : "POST",
					data : {
						listTitle : newListName,
						boardID : boardID
					},
					dataType : "json",
					success : function(data){
						console.log("방금 생성한 리스트",data);
						createList(data);
						createListDIV.remove(); //리스트 이름 설정하는 div없애기
						addList.style.display="block"; //리스트 추가하는 div 다시 보이게하기
					},
					error : function(){
						console.log("AjaxCreateList 실패");
					}
				})
            }
        }
    })
    three.append(three_a);
    two.append(three);
    one.append(two);

    target.prepend(one);
    document.querySelector(".newListName").focus();
}

//====================입력한 이름으로 리스트 그려주는 함수====================
//사용자가 방금 만든 리스트 object가 매개값
function createList(obj){
    let target = document.querySelector("#boardDetailBODY"); //여기다가 새 리스트 붙여주기
    
    let one = document.createElement("div");
    one.setAttribute("class","col-12 col-sm-6 col-lg-2 listDIV");
    one.setAttribute("data-listID",obj.list_id); //제일 바깥 DIV에다 list_id속성 부여
	one.setAttribute("id","list"+obj.list_id); //제일 바깥 DIV의 id는 list(id)로 부여

    let two = document.createElement("div");
    two.setAttribute("class","card");
    let three_a = document.createElement("div");
    three_a.setAttribute("class","first card-header d-flex justify-content-between");
    let three_a_a = document.createElement("h4");
    three_a_a.setAttribute("class","listName");
    three_a_a.innerHTML=obj.list_title;	  //리스트 이름
    three_a_a.addEventListener("click",function(){ //리스트 이름 수정 클릭이벤트. renameList함수 매개값으로 list_id전달
        renameList(obj.list_id);
    })

    let three_a_b = document.createElement("i");
    three_a_b.setAttribute("class","fa fa-times col-rg")
    three_a_b.setAttribute("aria-hidden","true");
    three_a_b.style.cursor="pointer";
    three_a_b.addEventListener("click",function(){ //리스트 삭제 클릭이벤트. deleteList함수 매개값으로 list_id전달
		deleteList(obj.list_id);
    })

    let three_b = document.createElement("div");
    three_b.setAttribute("class","cardArea");
    let three_b_a = document.createElement("div");
    three_b_a.setAttribute("class","last card-header");
    let three_b_a_a = document.createElement("div");
    three_b_a_a.setAttribute("class","addCardBtn");
    let three_b_h4 = document.createElement("h4");
    three_b_h4.setAttribute("class","fas fa-plus");
    three_b_h4.addEventListener("click",function(){ //카드추가하는 onclick 이벤트 걸기. 매개값으로 list_id전달
        nameCard(obj.list_id); 
    });

    //만들어둔 요소들 조립해서 붙이기
    three_a.append(three_a_a);
    three_a.append(three_a_b);

    three_b_h4.innerHTML="&nbsp;&nbsp;Add Card";
    three_b_h4.style.cursor="pointer";
    three_b_a_a.append(three_b_h4);
    three_b_a.append(three_b_a_a);
    three_b.append(three_b_a);
    two.append(three_a);
    two.append(three_b);
    one.append(two);

    target.prepend(one);
}

//====================리스트 이름 수정하는 함수 ====================
//====================매개값으로 리스트 아이디 받기====================
function renameList(listId){
    let targetParent = event.target.parentElement; //여기다 input 붙이기

    //우선 원래 리스트 이름이랑 리스트삭제버튼 지워주고
	targetParent.innerHTML = "";

    //새로운 리스트 이름 입력할 input태그 만들어서 엔터키 이벤트 걸어주기(빈 값 못 넣게)
    let newListName = document.createElement("input");
    newListName.style.width="100%";
    newListName.style.height="90%";
    newListName.style.textAlign="center";
    newListName.setAttribute("type","text");
    newListName.setAttribute("id","newListName");
    newListName.setAttribute("class","form-control");
    newListName.setAttribute("name","newListName");
    newListName.addEventListener("keyup",function(){
        // 엔터키가 눌렸을 때
        if (window.event.keyCode == 13) {
            //사용자가 입력한 새로운 리스트 이름
            let listName = document.querySelector("#newListName").value;
            //만약 빈 값이면
            if(listName == ""){
                newListName.style.border="2px solid red";
                newListName.setAttribute("placeholder","Please name it.");
                newListName.focus();
            //값이 있다면
            }else{
            	$.ajax({
            		url : "AjaxRenameList",
            		type : "POST",
            		data : {
            			listId : listId,
            			listName : listName
            		},
            		dataType : "text",
            		success : function(data){
            			console.log("리스트이름수정성공?"+data);
            			if(data == "YES"){
	            			document.querySelector("#newListName").remove(); //새로운 리스트 이름 입력했던 input태그 삭제
							let h4 = document.createElement("h4");
							h4.setAttribute("class","listName");
							h4.innerHTML = listName;
							h4.onclick = function(){
								renameList(listId);
							}
							let i = document.createElement("i");
							i.setAttribute("class","fa fa-times col-rg");
							i.setAttribute("aria-hidden","true");
							i.style.cursor = "pointer";
							
							targetParent.append(h4);
							targetParent.append(i);
            			}
            		},
            		error : function(){
            			console.log("AjaxRenameList");
            		}
            	})
            }
        }
    });
    targetParent.append(newListName);
    newListName.focus();

}

//====================리스트 삭제 함수====================
//====================매개값으로 리스트 아이디 받기====================
function deleteList(listId){
	
}

//====================add card클릭시 실행될 함수(카드이름지정input그리기)====================
//====================매개값으로 리스트 아이디 받기====================
function nameCard(listId){
    let target = event.target.closest(".cardArea"); //여기 뒤에다 input붙이기

    //새로운 카드 이름 입력할 input박스 생성
    let div = document.createElement("div");
    div.setAttribute("id","inputDIV");
    div.setAttribute("class","card-header");
    let newCard = document.createElement("input");
    newCard.setAttribute("type","text");
    newCard.setAttribute("class","form-control mb-2");
    newCard.setAttribute("id","newCardName");
    newCard.style.width="100%";
    newCard.style.height="90%";
    newCard.style.textAlign="center";
    newCard.addEventListener("keyup",function(){
        // 엔터키가 눌렸을 때
        if (window.event.keyCode == 13) {
            //사용자가 입력한 새로운 카드 이름
            let newCardName = document.querySelector("#newCardName").value;
            //빈 값이면
            if(newCardName == ""){
                newCard.style.border="2px solid red";
                newCard.setAttribute("placeholder","Please name it.");
                newCard.focus();
            //값이 있으면
            }else{
                //Ajax실행 => DB에 해당 카드 insert하기
                $.ajax({
                	url : "AjaxAddCard",
                	type : "POST",
                	data : {
                		newCardName : newCardName,
                		listId : listId
                	},
                	dataType : "json",
                	success : function(data){
                		console.log(data);
                	},
                	error : function(){
                		console.log("AjaxAddCard 실패");
                	}
                }) 
                //Ajax성공시,
                //해당 리스트에 카드 추가(매개값은 방금생성한카드obj)
                createCard(newCardName);
                //createCard(data);
                document.querySelector("#inputDIV").remove(); //카드이름입력하는 input삭제
            }
        }
    })
    div.append(newCard);
    target.prepend(div);
    newCard.focus();
}

//카드생성함수(매개값으로 생성한 카드 object받기)
function createCard(cardname){
//function createCard(obj)
    let target = event.target.parentElement.parentElement; // =(.cardArea)이녀석뒤에 카드 붙이기

    let firstDIV = document.createElement("div");
    firstDIV.setAttribute("class","card card-light ml-2 mr-2");
    firstDIV.style.cursor="pointer";

    //===============수정할부분임===============
//    firstDIV.setAttribute("id","card"+obj.cardId);

    let secDIV = document.createElement("div");
    secDIV.setAttribute("class","card-header d-flex justify-content-between");
    let span = document.createElement("span");
    span.setAttribute("class","cardName");
    span.innerHTML=cardname;
    let i = document.createElement("i");
    i.setAttribute("class","fa fa-times col-rg");
    i.setAttribute("aria-hidden","true");
    i.addEventListener("click",function(){
        //카드삭제함수
        event.target.parentElement.parentElement.remove();
    })
    
    let fourDIV = document.createElement("div");
    fourDIV.setAttribute("class","ml-2 text-right card-owner")
    let thrDIV = document.createElement("div");
    thrDIV.setAttribute("class","ml-3 card-option");
    let check = document.createElement("i");
    check.setAttribute("class","fa fa-check-square check");
    check.style.color="rgb(59, 59, 59)";
    let dates = document.createElement("i");
    dates.setAttribute("class","fa fa-calendar ml-2 dates");
    dates.style.color="rgb(59, 59, 59)";
    let files = document.createElement("i");
    files.setAttribute("class","fa fa-paperclip ml-2 files");
    files.style.color="rgb(59, 59, 59)";

    //만든거 조립해서 붙여주기
    secDIV.append(span);
    secDIV.append(i);
    thrDIV.append(check);
    thrDIV.append(dates);
    thrDIV.append(files);
    firstDIV.append(secDIV);
    firstDIV.append(fourDIV);
    firstDIV.append(thrDIV);

    target.prepend(firstDIV);
}
