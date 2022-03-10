<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이슈게시판</title>
<style>
	#gogo{
		cursor: pointer;
	}
</style>
</head>
<body style="background-color: #ECE9FE;">
  <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <div style="margin: 0 auto">
              <figure class="avatar mr-2 avatar-xl" data-initial="W" style="background-color:#6553C1"></figure>
              <h1>Workspace Name</h1>
            </div>
          </div>
          <div class="section-body">



            <div class="row mt-4">
              <div class="col-12">
                <div class="card">

                  <div class="card-body">
                    <div class="float-left">
                      <a href="goIssueInsert.do?workspace_id=${workspace.workspace_id}" class="btn btn-icon icon-left btn-primary"
                        style="background-color:#6553C1; box-shadow: 0 2px 6px #ECE9FE;"><i class="far fa-edit"></i>
                        이슈등록</a>
                    </div>


                    <div class="clearfix mb-3"></div>

                    <div class="table-responsive" style="text-align: center;">
                   
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <th>글번호</th>
                            <th>상태</th>
                            <th>글제목</th>
                            <th>카테고리</th>
                            <th>진척도</th>
                          </tr>
                        </thead>
                        <tbody>
                         <c:forEach items="${issues }" var="issue">
                          <tr>
                            <td>${issue.issueId }</td>
                            <td>
                              <div class="badge badge-success">${issue.issueStatus }</div>
                            </td>
                            <td id="gogo" onclick="location.href='issueDetail.do?issueId=${issue.issueId}&workspace_id=${workspace.workspace_id}'">${issue.issueTitle }</td>
                            <td>${issue.issueCategory }</td>
                            <td>
                              <div class="progress mb-3">
                                <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0"
                                  aria-valuemax="100" style="background-color:#6553C1"></div>
                              </div>
                            </td>
                          </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                      
                    </div>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
      
      
<!-- 페이징 처리 -->
      <style>
    .off-screen {
      display: none;
    }

    #pagebtn {
      width: 500px;
      text-align: center;
      margin: 0 auto;
    }

    #pagebtn a {
      margin-top: 30px;
      display: inline-block;
      padding: 6px 12px; 
      margin-right: 10px;
      border-radius: 3px;
      border: none;

      
      font-family: Tahoma;
      background: #f9fafe;
      color: #000;
      text-decoration: none;
    }
    #pagebtn a:hover{
      background-color: #6553C1;
    }

    #pagebtn a.active {
      background: #6553C1;   
      color: #fff;
    }

  </style>
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script>
    var pagenumber = 5
    var pageCount = 3
    var currentPage = 1;

    var tableEl = $('.table-responsive');
    var tr = tableEl.find('tbody tr');
    var trtotal = tr.length;

    function page(pagenumber, pageCount, currentPage) {

      if (trtotal == 0) return;
      var pagetotal = Math.ceil(trtotal / pagenumber);
      var pageGroup = Math.ceil(currentPage / pageCount);
      var last = pageGroup * pageCount;
      if (last > pagetotal) {
        last = pagetotal;
      }
      var first;
      if (last % pageCount == 0) {
        first = last - (pageCount - 1);
      } else {
        first = last + 1 - last % pageCount
      }
      var next = last + 1;
      var prev = first - 1;
      $('#pagebtn').remove();
      tableEl.after('<div id="pagebtn">');
      if (prev > 0) {
        $('<a href="#"></a>')
          .attr('data', 'prev')
          .html("<")
          .appendTo('#pagebtn');
      }

      for (let i = first; i <= last; i++) {
        $('<a href="#"></a>')
          .attr('data', i)
          .html(i)
          .appendTo('#pagebtn');
      }
      if (last < pagetotal) {
        $('<a href="#"></a>')
          .attr('data', 'next')
          .html(">")
          .appendTo('#pagebtn');
      }
      var paginglink = $('#pagebtn a');
      paginglink.removeClass('active');
      $("[data=" + currentPage + "]").addClass("active")
      var startval = (currentPage - 1) * pagenumber;
      var endval = startval + pagenumber;

      tr.css('opacity', '0.0')
        .addClass('off-screen')
        .slice(startval, endval)
        .removeClass('off-screen')
        .animate({
          opacity: 1
        }, 500);



      paginglink.on('click', function (e) {
        e.preventDefault();
        var thisval = $(this);
        var data = thisval.attr("data");
        var selectedPage = thisval.text();
        if (data == "next") selectedPage = next;
        if (data == "prev") selectedPage = prev;



        page(pagenumber, pageCount, selectedPage);

      });



    }
    page(pagenumber, pageCount, currentPage);
    
    $(function() {
		let name = "${workspace.workspace_title}";
		changeWKIMG(name);
	})
	
    //워크프페이스 프로필이미지
	function changeWKIMG(newWKname) {
		let name = newWKname.substring(0, 1);
		let img = document.querySelector(".wkimg");
		let img2 = document.querySelector(".wkimg-body");
		if (name == 'a' || name == 'A') {
			img.setAttribute("src", "resources/img/a.jpg");
			img2.setAttribute("src", "resources/img/a.jpg");
		} else if (name == 'b' || name == 'B') {
			img.setAttribute("src", "resources/img/b.jpg");
			img2.setAttribute("src", "resources/img/b.jpg");
		} else if (name == 'c' || name == 'C') {
			img.setAttribute("src", "resources/img/c.jpg");
			img2.setAttribute("src", "resources/img/c.jpg");
		} else if (name == 'd' || name == 'D') {
			img.setAttribute("src", "resources/img/d.jpg");
			img2.setAttribute("src", "resources/img/d.jpg");
		} else if (name == 'e' || name == 'E') {
			img.setAttribute("src", "resources/img/e.jpg");
			img2.setAttribute("src", "resources/img/e.jpg");
		} else if (name == 'f' || name == 'F') {
			img.setAttribute("src", "resources/img/f.jpg");
			img2.setAttribute("src", "resources/img/f.jpg");
		} else if (name == 'g' || name == 'G') {
			img.setAttribute("src", "resources/img/g.jpg");
			img2.setAttribute("src", "resources/img/g.jpg");
		} else if (name == 'h' || name == 'H') {
			img.setAttribute("src", "resources/img/h.jpg");
			img2.setAttribute("src", "resources/img/h.jpg");
		} else if (name == 'i' || name == 'I') {
			img.setAttribute("src", "resources/img/i.jpg");
			img2.setAttribute("src", "resources/img/i.jpg");
		} else if (name == 'j' || name == 'J') {
			img.setAttribute("src", "resources/img/j.jpg");
			img2.setAttribute("src", "resources/img/j.jpg");
		} else if (name == 'k' || name == 'K') {
			img.setAttribute("src", "resources/img/k.jpg");
			img2.setAttribute("src", "resources/img/k.jpg");
		} else if (name == 'l' || name == 'L') {
			img.setAttribute("src", "resources/img/l.jpg");
			img2.setAttribute("src", "resources/img/l.jpg");
		} else if (name == 'm' || name == 'M') {
			img.setAttribute("src", "resources/img/m.jpg");
			img2.setAttribute("src", "resources/img/m.jpg");
		} else if (name == 'n' || name == 'N') {
			img.setAttribute("src", "resources/img/n.jpg");
			img2.setAttribute("src", "resources/img/n.jpg");
		} else if (name == 'o' || name == 'O') {
			img.setAttribute("src", "resources/img/o.jpg");
			img2.setAttribute("src", "resources/img/o.jpg");
		} else if (name == 'p' || name == 'P') {
			img.setAttribute("src", "resources/img/p.jpg");
			img2.setAttribute("src", "resources/img/p.jpg");
		} else if (name == 'q' || name == 'Q') {
			img.setAttribute("src", "resources/img/q.jpg");
			img2.setAttribute("src", "resources/img/q.jpg");
		} else if (name == 'r' || name == 'R') {
			img.setAttribute("src", "resources/img/r.jpg");
			img2.setAttribute("src", "resources/img/r.jpg");
		} else if (name == 's' || name == 'S') {
			img.setAttribute("src", "resources/img/s.jpg");
			img2.setAttribute("src", "resources/img/s.jpg");
		} else if (name == 't' || name == 'T') {
			img.setAttribute("src", "resources/img/t.jpg");
			img2.setAttribute("src", "resources/img/t.jpg");
		} else if (name == 'u' || name == 'U') {
			img.setAttribute("src", "resources/img/u.jpg");
			img2.setAttribute("src", "resources/img/u.jpg");
		} else if (name == 'v' || name == 'V') {
			img.setAttribute("src", "resources/img/v.jpg");
			img2.setAttribute("src", "resources/img/v.jpg");
		} else if (name == 'w' || name == 'W') {
			img.setAttribute("src", "resources/img/w.jpg");
			img2.setAttribute("src", "resources/img/w.jpg");
		} else if (name == 'x' || name == 'X') {
			img.setAttribute("src", "resources/img/x.jpg");
			img2.setAttribute("src", "resources/img/x.jpg");
		} else if (name == 'y' || name == 'Y') {
			img.setAttribute("src", "resources/img/y.jpg");
			img2.setAttribute("src", "resources/img/y.jpg");
		} else if (name == 'z' || name == 'Z') {
			img.setAttribute("src", "resources/img/z.jpg");
			img2.setAttribute("src", "resources/img/z.jpg");
		} else if (name == '0') {
			img.setAttribute("src", "resources/img/0.jpg");
			img2.setAttribute("src", "resources/img/0.jpg");
		} else if (name == '1') {
			img.setAttribute("src", "resources/img/1.jpg");
			img2.setAttribute("src", "resources/img/1.jpg");
		} else if (name == '2') {
			img.setAttribute("src", "resources/img/2.jpg");
			img2.setAttribute("src", "resources/img/2.jpg");
		} else if (name == '3') {
			img.setAttribute("src", "resources/img/3.jpg");
			img2.setAttribute("src", "resources/img/3.jpg");
		} else if (name == '4') {
			img.setAttribute("src", "resources/img/4.jpg");
			img2.setAttribute("src", "resources/img/4.jpg");
		} else if (name == '5') {
			img.setAttribute("src", "resources/img/5.jpg");
			img2.setAttribute("src", "resources/img/5.jpg");
		} else if (name == '6') {
			img.setAttribute("src", "resources/img/6.jpg");
			img2.setAttribute("src", "resources/img/6.jpg");
		} else if (name == '7') {
			img.setAttribute("src", "resources/img/7.jpg");
			img2.setAttribute("src", "resources/img/7.jpg");
		} else if (name == '8') {
			img.setAttribute("src", "resources/img/8.jpg");
			img2.setAttribute("src", "resources/img/8.jpg");
		} else if (name == '9') {
			img.setAttribute("src", "resources/img/9.jpg");
			img2.setAttribute("src", "resources/img/9.jpg");
		}else{
			img.setAttribute("src","resources/img/workspace_default_profile.png");
			img2.setAttribute("src","resources/img/workspace_default_profile.png");
		}
	}

  //status 배지 색상 변경
    $(document).ready(function(){
    	const badge = document.getElementsByClassName('badge badge-success');
    	
    	for(let i = 0; i < badge.length; i++){
    		if(badge[i].innerText === 'TO DO'){
    			badge[i].setAttribute('class', 'badge badge-danger');
    		}
    	}
		
	}); 
  </script>
</body>
</html>