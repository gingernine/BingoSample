package serverend;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.fasterxml.jackson.databind.ObjectMapper;

@ServerEndpoint(value = "/wsservlet")
public class WSServlet {

	private static List<Session> sessions = new CopyOnWriteArrayList<>();

	@OnOpen
	public void onOpen(Session session) {
		sessions.add(session);
	}

	@OnMessage
	public void onMessage(String message) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			GetMessage gm = mapper.readValue(message, GetMessage.class);
			System.out.println(gm.name + ", " + gm.values);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static List<Session> getSessions() {
		return sessions;
	}
}