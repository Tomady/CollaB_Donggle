//=======================================================메시지 보내기 모달창 함수=======================================================
function modal(id){
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
             //모달 끄고 sent페이지로 이동
        }
    }

    // 메일쓰기 모달창에서 워크스페이스 하나 클릭시, 해당 워크스페이스 멤버 옵션으로 뿌리기
    document.querySelector("#workspaces").onclick=function(){
        console.log(event.target);
    }

    // 메일쓰기 모달창에서 워크스페이스 선택-멤버선택시, 선택한 멤버 바로 input태그에 넣기
    document.querySelector("#members").onclick=function(){
        console.log(event.target.value);
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

document.getElementById('newMsgMenu').addEventListener('click', function() {
    // 모달창 띄우기
    modal('my_modal');
});
