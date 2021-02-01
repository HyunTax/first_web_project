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
</body>
</html>