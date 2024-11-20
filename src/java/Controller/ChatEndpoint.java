package Controller;

import Config.HttpSessionConfigurator;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import com.google.gson.Gson;
import javax.servlet.http.HttpSession;
import model.Message;
import model.User;

@ServerEndpoint(value = "/chat", configurator = HttpSessionConfigurator.class)
public class ChatEndpoint {
    private static Set<Session> sessions = Collections.synchronizedSet(new HashSet<>());
    private static Gson gson = new Gson();

    @OnOpen
    public void onOpen(Session session) {
        sessions.add(session);
        try {
            HttpSession httpSession = (HttpSession) session.getUserProperties().get("httpSession");
            if (httpSession != null) {
                User user = (User) httpSession.getAttribute("user");
                if (user != null) {
                    session.getUserProperties().put("user", user);
                }
            }
        } catch (Exception e) {
            System.err.println("Error setting user in WebSocket session: " + e.getMessage());
        }
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException, EncodeException {
        Message chatMessage = gson.fromJson(message, Message.class);
        User user = (User) session.getUserProperties().get("user");
        
        if (user != null) {
            chatMessage.setSender(user.getUsername());
            
            int userRole = user.getRole();
            switch (userRole) {
                case 3: // Regular user
                    // Send to admins only
                    broadcast(chatMessage, session1 -> {
                        User sessionUser = (User) session1.getUserProperties().get("user");
                        return sessionUser != null && sessionUser.getRole() == 1;
                    });
                    break;
                case 1: // Admin
                    // Send to everyone
                    broadcast(chatMessage, session1 -> true);
                    break;
                default:
                    // Handle other roles if necessary
                    break;
            }
        }
    }

    @OnClose
    public void onClose(Session session) {
        sessions.remove(session);
    }

    private void broadcast(Message message, java.util.function.Predicate<Session> filter) {
        sessions.stream()
            .filter(filter)
            .forEach(session -> {
                try {
                    session.getBasicRemote().sendText(gson.toJson(message));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            });
    }
}
