<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp"%>
<body>
	<div class="container">
		<div class="row">
			<input type="hidden" id="chatID" value="${sessionScope.memberID}">
			<input type="button" class="btn btn-primary form-control" id="start"
				value="채팅 시작">
			<div id="chatroom" class="jumbotron"></div>
			<input type="text" id="message" placeholder="메세지를 입력하세요"
				class="form-control"> <input type="button"
				class="btn btn-primary" id="send" value="전송">
			<script>
				var webSocket;
				var chatID;
				document.getElementById("start").addEventListener("click",
						function() {
							chatID = document.getElementById("chatID").value;
							connect();
						})
				document.getElementById("send").addEventListener("click",
						function() {
							send();
						})
				document.getElememtById("close").addEventListener("click",
						function() {
							disconnect();
						})
				function connect() {
					webSocket = new WebSocket("ws://localhost:8181/chat");
					webSocket.onopen = onOpen;
					webSocket.onmessage = onMessage;
					webScoket.onclose = onClose;
				}
				function disconnect() {
					websocket.send(chatID + "님이 퇴장하셨습니다");
					websocket.close();
				}
				function send() {
					msg = document.getElementById("message").value;
					webSocket.send(chatID + " : " + msg);
					document.getElementById("message").value = "";
				}
				function onOpen() {
					webSocket.send(chatID + "님이 입장하셨습니다.");
				}
				function onMessage(e) {
					data = e.data;
					chatroom = document.getElementById("chatroom");
					chatroom.innerHTML = chatroom.innerHTML + "<br>" + data;
				}
				function onClose() {
				}
			</script>
		</div>
	</div>
</body>
</html>