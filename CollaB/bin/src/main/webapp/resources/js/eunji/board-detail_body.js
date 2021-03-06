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
                // (1) 같은 보드 내에 동일한 리스트 이름 있는지 조회하는 함수 실행
                // 매개값은 사용자가 입력한 리스트 이름, 리턴값은 사용여부
                // let using = listnameCheck(newListName);
                // 리턴값이 "YES"이면 사용가능, "NO"면 사용불가
                // if(using == "NO"){ 
                //  alert("사용불가능한 이름 => 이미 동일이름존재") 
                // }else if(using =="YES"){
                //  (2) [Ajax실행] DB에 사용자가 입력한 list이름으로 insert
                //  (2-1) 아작스 결과값은 json형식으로 사용자가 방금 추가한 리스트 object받아오기
                //  (3) [Ajax_success함수] 사용자가 입력한 이름으로 리스트 새로 그리기

                //===============수정할부분임===============
                createList(newListName);
                // createList(data) 사용자가 방금 추가한 리스트 object받아와서 createList함수에 넘기기
                
                //  (4) [Ajax_success함수] 리스트 이름 설정하는 div는 없애기
                createListDIV.remove();
                //  (5) [Ajax_success함수] 리스트추가하는 div다시 보이게하기
                addList.style.display="block";
                // }
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
//====================매개값은 사용자가 입력한 리스트 object====================
function createList(listName){
//function createList(obj){ //사용자가 방금 만든 리스트 object가 매개값
    let target = document.querySelector("#boardDetailBODY"); //여기다가 새 리스트 붙여주기
    
    let one = document.createElement("div");
    one.setAttribute("class","col-12 col-sm-6 col-lg-2");

    //===============수정할부분임===============
    // [잊지마!] 리스트랑 카드랑 id가 같을 수도 있으니까 
    // 엘리먼트에 리스트 또는 카드 id부여할때 
    // list+data.listID 또는 card+data.cardID 이렇게 부여하자-!
    one.setAttribute("id","list_1");
    //one.setAttribute("id","list"+obj.listId);

    let two = document.createElement("div");
    two.setAttribute("class","card");
    let three_a = document.createElement("div");
    three_a.setAttribute("class","first card-header d-flex justify-content-between");
    let three_a_a = document.createElement("h4");
    three_a_a.setAttribute("class","listName");

    //===============수정할부분임===============
    three_a_a.innerHTML=listName;
    //three_a_a.innerHTML=obj.listName;
    
    //===============수정할부분임===============
    // <h4>리스트 이름</h4> : 이름수정하는 onclick 이벤트 걸기
    three_a_a.addEventListener("click",function(){
        renameList();
        //renameList(obj.listId); //매개값으로 리스트 아이디 보내기
    })

    let three_a_b = document.createElement("i");
    three_a_b.setAttribute("class","fa fa-times col-rg")
    three_a_b.setAttribute("aria-hidden","true");
    three_a_b.style.cursor="pointer";
    three_a_b.addEventListener("click",function(){
        //  리스트 삭제버튼
        document.querySelector("#list_1").remove();
        //  아작스로 리스트 삭제하기
        // document.querySelector("list"+data.listId).remove();
        // 리스트랑 카드랑 id가 같을 수도 있으니까 엘리먼트에
        // 리스트 또는 카드 id부여할때 list+data.listID 또는 
        // card+data.cardID 이렇게 부여하자-!
    })

    let three_b = document.createElement("div");
    three_b.setAttribute("class","cardArea");
    let three_b_a = document.createElement("div");
    three_b_a.setAttribute("class","last card-header");
    let three_b_a_a = document.createElement("div");
    three_b_a_a.setAttribute("class","addCardBtn");
    let three_b_h4 = document.createElement("h4");
    three_b_h4.setAttribute("class","fas fa-plus");

    //===============수정할부분임===============
    // <h4> + Add Card </h4> : 카드추가하는 onclick 이벤트 걸기
    three_b_h4.addEventListener("click",function(){
        nameCard();
        //nameCard(obj.listId); //매개값으로 리스트 아이디 보내기
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
function renameList(){
//===============수정할 부분임===============
//function renameList(listId){
    let target = event.target;
    let targetParent = event.target.parentElement; //여기다 input 붙이기

    //우선 원래 리스트 이름 지워주고
    target.innerHTML = ""; 

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
                // (1) 같은 보드 내에 동일한 리스트 이름 있는지 조회하는 함수 실행
                // 매개값은 사용자가 입력한 리스트 이름, 리턴값은 사용여부
                // let using = listnameCheck(listName);
                // 리턴값이 "YES"이면 사용가능, "NO"면 사용불가
                // if(using == "NO"){ 
                //  alert("사용불가능한 이름 => 이미 동일이름존재") 
                // }else if(using =="YES"){
                //  (2) [Ajax실행] DB에 사용자가 입력한 list이름으로 update
                //  (3) [Ajax_suceess함수] 새로운 리스트 이름 입력할 input태그 삭제
                document.querySelector("#newListName").remove();
                //  (4) 사용자가 입력한 새로운 리스트 이름 화면에 그려주기
                target.innerHTML=listName;
                // }
            }
        }
    });
    targetParent.append(newListName);
    newListName.focus();

}

//====================[Ajax]같은 보드 내에 동일한 리스트 이름 있는지 조회====================
function listnameCheck(newListName){
    // let result = "";
    // $.ajax({
    //     url : "",
    //     data : {
    //         newListName : newListName
    //     },
    //     dataType : "text", //동일이름 있으면 N, 없으면 Y
    //     method : "POST",
    //     suceess : function(data){
    //         if(data == "Y"){
    //             result = "YES";
    //         }else if(data == "N"){
    //             result = "NO";
    //         }
    //     },
    //     error : function(){
    //         alert("동일리스트이름체크 : 아작스실패");
    //     }
    // })
    // return result; 
}

//====================add card클릭시 실행될 함수(카드이름지정input그리기)====================
//====================매개값으로 리스트 아이디 받기====================
function nameCard(){
//function nameCard(listName){
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
                //같은 리스트 내에 동일한 카드 이름 있는지 조회
                //let using = cardNameCheck(newCard);
                //using이 "NO"면 해당 리스트에 같은 이름의 카드 있다고 생성불가 알림
                //using이 "YES"면
                //Ajax실행 => DB에 해당 카드 insert하기
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

//====================[Ajax]같은 리스트 내에 동일한 카드 이름있는지 조회====================
function cardNameCheck(cardName){
    
}