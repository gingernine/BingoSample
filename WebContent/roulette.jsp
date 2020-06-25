<%@page language="java" contentType="text/html" pageEncoding="utf-8"
	import="java.util.List"
	import="javax.websocket.Session"
	import="java.util.Random"
	import="serverend.WSServlet"%>

<%
	boolean flag = request.getParameter("roulette") != null;

	if (flag) {
		List<Session> sessions = WSServlet.getSessions();
		Integer num = new Random().nextInt(75) + 1;
		sessions.forEach(s -> s.getAsyncRemote().sendText(num.toString()));
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Roulette</title>
	</head>
	<body>
		<form action="" method="post">
			<input type="submit" name="roulette" value="Roulette">
		</form>
	</body>
</html>