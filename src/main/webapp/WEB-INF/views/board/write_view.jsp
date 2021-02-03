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
									<li><a href="#"><b>${sessionScope.memberID }</b></a></li>
									<li><a href="/member/logout">로그아웃</a></li>
									<li><form action="/member/deleteMember" method="post">회원탈퇴</form></li>
								</c:otherwise>
							</c:choose>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<c:if test="${boardVo.boardSEQ!=null}">
				<form action="/board/update" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="boardSEQ" value="${boardVo.boardSEQ}">
					<table class="table table-striped" style="text-align: center;">
						<thead>
							<tr>
								<th colspan="2"
									style="background-color: #eeeeee; text-align: center;">게시판
									글수정</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" class="form-control"
									value="${boardVo.boardTitle}" name="boardTitle" maxlength="50"></td>
							</tr>
							<tr>
								<td><input type="file" class="form-control" name="upload"></td>
							</tr>
							<tr>
								<td><textarea class="form-control" name="boardContent"
										maxlength="2000" style="height: 350px;">${boardVo.boardContent}</textarea></td>
							</tr>
						</tbody>

					</table>
					<input type="submit" class="btn btn-primary pull-right" value="글수정">
				</form>
			</c:if>

			<c:if test="${boardVo.boardSEQ==null}">
				<form action="/board/write" method="post"
					enctype="multipart/form-data">
					<table class="table table-striped" style="text-align: center;">
						<thead>
							<tr>
								<th colspan="2"
									style="background-color: #eeeeee; text-align: center;">게시판
									글작성</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" class="form-control"
									placeholder="글 제목" name="boardTitle" maxlength="50"></td>
							</tr>
							<tr>
								<td><input type="file" class="form-control" name="upload"></td>
							</tr>
							<tr>
								<td><textarea class="form-control" placeholder="글 내용"
										name="boardContent" maxlength="2000" style="height: 350px;"></textarea></td>
							</tr>
						</tbody>

					</table>
					<input type="submit" class="btn btn-primary pull-right" value="글작성">
				</form>
			</c:if>
		</div>
	</div>
</body>
</html>