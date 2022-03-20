<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
</head>
<body>
	<jsp:forward page="/index.do"></jsp:forward>
	INDEX
	<button onclick="location.href='WorkspaceList'">eunji</button>
	<button onclick="location.href='message_inbox'">MSG</button>
	<button onclick="location.href='index.do'">index</button>

</body>
</html>
