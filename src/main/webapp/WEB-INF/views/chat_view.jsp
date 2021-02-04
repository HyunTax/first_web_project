<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/css/bootstrap.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<title>HyunTax</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar=header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expended="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/home">HyunTax</a>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/home">메인</a>
					<li><a href="/board/list">게시판</a>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<c:choose>
								<c:when test="${sessionScope.memberID == null}">
									<li><a href="/member/login_view">로그인</a></li>
									<li><a href="/member/join_view">회원가입</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="#"><b>${sessionScope.memberID }</b></a></li>
									<li><a href="/member/logout">로그아웃</a></li>
									<li><a href="/member/deleteMember">회원탈퇴</a></li>
								</c:otherwise>
							</c:choose>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<input type="hidden" id="chatID" value="${sessionScope.memberID}">
			<input type="button" class="btn btn-primary form-control" id="start" value="채팅 시작">
			<div id="chatroom" class="jumbotron"></div>
			<input type="text" id="message" placeholder="메세지를 입력하세요"
				class="form-control"> 
			<input type="button" class="btn btn-primary" id="send" value="전송">
			<script>
				var webSocket;
				var chatID;
				document.getElementById("start").addEventListener("click", function() {
					chatID = document.getElementById("chatID").value;
					connect();												
				})
				document.getElementById("send").addEventListener("click",function() {
					send();
				})
				document.getElememtById("close").addEventListener("click",function(){
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