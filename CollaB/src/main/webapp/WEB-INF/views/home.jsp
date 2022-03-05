<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<jsp:forward page="/index.do"></jsp:forward>
	INDEX
	<button onclick="location.href='WorkspaceList'">eunji</button>
	<button onclick="location.href='message_inbox'">MSG</button>
	<button onclick="location.href='index.do'">index</button>
	<button onclick="location.href='memberPage.do'">memberPage</button>
</body>
</html>
