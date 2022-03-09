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
                      <a href="goIssueInsert.do" class="btn btn-icon icon-left btn-primary"
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
                            <td id="gogo" onclick="location.href='issueDetail.do?issueId=${issue.issueId}'">${issue.issueTitle }</td>
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