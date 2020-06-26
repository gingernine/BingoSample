<%@page language="java" contentType="text/html" pageEncoding="utf-8"
	import="java.util.List"
	import="javax.websocket.Session"
	import="java.util.Random"
	import="serverend.WSServlet"
	import="serverend.SendMessage"
	import="com.fasterxml.jackson.databind.ObjectMapper"
	import="com.fasterxml.jackson.databind.SerializationFeature"
	import="java.io.IOException"%>

<%
	boolean flag = request.getParameter("roulette") != null;

	if (flag) {
		List<Session> sessions = WSServlet.getSessions();
		Integer num = new Random().nextInt(75) + 1;
		SendMessage sm = new SendMessage();
		sm.num = num;
		sm.message = "message";
		ObjectMapper mapper = new ObjectMapper();
		try {
			String script = mapper.writeValueAsString(sm);
			sessions.forEach(s -> s.getAsyncRemote().sendText(script));
		} catch (IOException e) {
			e.printStackTrace();
		}
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