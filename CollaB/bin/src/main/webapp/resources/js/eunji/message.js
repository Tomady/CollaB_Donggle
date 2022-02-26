//msg_inbox , msg_starred, msg_sent 페이지

//=======================================================delete 버튼 클릭시=======================================================
document.getElementById("msgDelete").onclick=function(){
    const checked = document.querySelectorAll("input[name='onemsg']:checked");
    
    checked.forEach((checked) => {
        checked.parentElement.parentElement.remove();
        const checkboxes = document.querySelectorAll("input[name='onemsg']");
        //만약 전부 다 삭제했으면 allcheck박스 체크해제해주기
        if(checkboxes.length==0){
            document.querySelector("input[name='allcheck']").checked = false;
        }
    })
}

//=======================================================체크박스 함수=======================================================
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
        checkbox.checked = selectAll.checked
    })
}

//=======================================================즐겨찾기 추가/해제 함수=======================================================
function star(){

}

//=======================================================메시지 조회 모달창 띄우기=======================================================
function selectMSG(){
//  function selectMSG(msgID){ 이걸로 바꿔주기
//  받은 메시지 아이디값으로 해당 메시지 조회해온 후,
//  그 데이터 내용을 모달에 넣어서 모달생성해주기

    var zIndex = 9999;
    var modal = document.getElementById("select_msg");

    //데이터 내용 모달에 넣기
    modal.querySelector("#msgTitle").innerHTML = "data.msgtitle";
    modal.querySelector("#msgFrom").innerHTML = "data.msgfrom";
    modal.querySelector("#msgDate").innerHTML = "data.msgDate 에 보냄";
    modal.querySelector("#msgContents").innerHTML = "data.msgContents";

    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    modal.querySelector('.modal_close_btn').onclick=function(){ closeModal() };


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

//=======================================================Element 에 style 한번에 오브젝트로 설정하는 함수 추가=======================================================
Element.prototype.setStyle = function(styles) {
    for (var k in styles) this.style[k] = styles[k];
    return this;
};


