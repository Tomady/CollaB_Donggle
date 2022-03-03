<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
<title></title>

<!-- General CSS Files -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
<!-- Template CSS -->
<link rel="stylesheet" href='<c:url value="/resources/assets/css/style.css"></c:url>'>
<link rel="stylesheet" href='<c:url value="/resources/assets/css/components.css"></c:url>'>

</head>

<body>
	<table>
		<tr>
			<td><tiles:insertAttribute name="header" /></td>
		</tr>
		<tr>
			<td><tiles:insertAttribute name="menu" /></td>
			<td style="width:100%"><tiles:insertAttribute name="body" /></td>
		</tr>
	</table>
	
  <!-- General JS Scripts -->
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src='<c:url value="/resources/assets/js/stisla.js"></c:url>'></script>

  <!-- Template JS File -->
  <script src='<c:url value="/resources/assets/js/scripts.js"></c:url>'></script>
  <script src='<c:url value="/resources/assets/js/custom.js"></c:url>'></script>

  <!--은지코드-->
  <script src='<c:url value="/resources/js/board/main_layout.js"></c:url>'></script>
</body>
</html>