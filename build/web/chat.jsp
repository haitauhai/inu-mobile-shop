<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chat</title>
        <style>
            #chat-container {
                width: 80%;
                margin: 0 auto;
                padding: 20px;
            }
            #chat-messages {
                height: 400px;
                border: 1px solid #ccc;
                overflow-y: auto;
                margin-bottom: 10px;
                padding: 10px;
            }
            #chat-form {
                display: flex;
            }
            #chat-input {
                flex-grow: 1;
                margin-right: 10px;
            }
        </style>
    </head>
    <body>
        <div id="chat-container">
            <h2>Chat</h2>
            <div id="chat-messages"></div>
            <form id="chat-form">
                <input type="text" id="chat-input" placeholder="Type a message...">
                <button type="submit">Send</button>
            </form>
        </div>

        <script>
            const chatMessages = document.getElementById('chat-messages');
            const chatForm = document.getElementById('chat-form');
            const chatInput = document.getElementById('chat-input');
            let websocket;

            // Establish WebSocket connection
            function connect() {
                websocket = new WebSocket("ws://" + window.location.host + "${pageContext.request.contextPath}/chat");

                websocket.onopen = function (evt) {
                    console.log("Connected to WebSocket");
                };

                websocket.onmessage = function (evt) {
                    console.log("Message received: " + evt.data);
                    const message = JSON.parse(evt.data);
                    appendMessage(message.sender, message.content);
                };

                websocket.onerror = function (evt) {
                    console.error("WebSocket error: ", evt);
                };
            }

            // Send message
            chatForm.addEventListener('submit', function (e) {
                e.preventDefault();
                const message = chatInput.value.trim();
                if (message && websocket.readyState === WebSocket.OPEN) {
                    websocket.send(JSON.stringify({content: message}));
                    chatInput.value = '';
                }
            });

            // Append message to chat
            function appendMessage(sender, content) {
                const messageElement = document.createElement('div');
                messageElement.textContent = `${sender}: ${content}`;
                        chatMessages.appendChild(messageElement);
                        chatMessages.scrollTop = chatMessages.scrollHeight;
                    }

                    // Connect when the page loads
                    window.addEventListener('load', connect);
        </script>

    </body>
</html>
