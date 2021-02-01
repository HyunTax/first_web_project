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
					<li><a href="/home">메인</a>
					<li class="active"><a href="/board/list">게시판</a>
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
									<li><a href="#"><b>${sessionScope.memberID}</b></a></li>
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
			<table class="table table-striped" style="text-align: center;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${boardList}" var="boardVo">
						<tr>
							<td>${boardVo.boardSEQ}</td>
							<td><a
								href="/board/content_view?boardSEQ=${boardVo.boardSEQ}">${boardVo.boardTitle}</a></td>
							<td>${boardVo.boardID}</td>
							<td>${boardVo.boardDate}</td>
							<td>${boardVo.boardHit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<a href="/board/write_view" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	<c:if test="${message =='error'}">
		<script type="text/javascript">
			alert('회원이 아닙니다.')
			location.href = "/member/login_view"
		</script>
	</c:if>
</body>
</html>