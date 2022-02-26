function showBoards(){
    let target = event.target;
    let boards = event.target.parentElement.nextElementSibling;

    target.remove();
    boards.style.display="block";
}

function searchWorkspace(){
    let searchVal = document.querySelector("#searchWKNAME").value;
    console.log(searchVal);
    document.querySelector("#searchWKNAME").value="";
	
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

function goBoards(wkID){
	location.href="goBoards?wkid="+wkID;
}