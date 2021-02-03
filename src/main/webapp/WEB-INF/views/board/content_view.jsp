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
			<table class="table table-boardered" style="text-align: center;">
				<thead>
					<tr>
						<th colspan="10"
							style="background-color: #eeeeee; text-align: center;">${boardVo.boardTitle}</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 10%;">작성자</td>
						<td style="width: 40%;">${boardVo.boardID}</td>
						<td style="width: 10%;">작성일</td>
						<td style="width: 40%;">${boardVo.boardDate}</td>
					</tr>
					<tr>
						<td><a href="downloadFile?fileSEQ=${file.fileSEQ}">${file.orgName}</a>
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="10" style="min-height: 300px; text-align: left;">${boardVo.boardContent}</td>
					</tr>
				</tbody>
			</table>
			<div class="row">
				<div class="col-md-10" align="left">
					<a href="/board/list" class="btn btn-primary">목록</a>
				</div>
				<div class="col-md-1" align="right" style="padding-right: 0px;">
					<c:if test="${sessionScope.memberID == boardVo.boardID}">
						<form action="/board/delete" method="post">
							<input type="hidden" name=boardSEQ value="${boardVo.boardSEQ}">
							<button onclick="return confirm('정말로 삭제하시겠습니까?')"
								class="btn btn-primary" type="submit">삭제</button>
						</form>
					</c:if>
				</div>
				<div class="col-md-1" align="right">
					<c:if test="${sessionScope.memberID == boardVo.boardID}">
						<form action="/board/modify" method="get">
							<input type="hidden" name=boardSEQ value="${boardVo.boardSEQ}">
							<button class="btn btn-primary" type="submit">수정</button>
						</form>
					</c:if>
				</div>
			</div>
			<br />
			<form action="/board/writeReply" method="post">
				<input type="hidden" value="${boardVo.boardSEQ}" name="boardSEQ">
				<b>댓글 작성</b>
				<div class="row">
					<input type="text" class="form-control" name="replyContent"
						maxlength="100"> <input type="submit"
						class="btn btn-primary pull-right" value="댓글 작성">
				</div>
			</form>

			<br />

			<div class="container">
				<div class="row">
					<table class="table table-striped" style="text-align: center;">
						<thead>
							<tr>
								<th colspan="10"
									style="background-color: #eeeeee; text-align: center;">댓글목록
								</th>
							</tr>

							<tr>
								<th
									style="width: 20%; background-color: #eeeeee; text-align: center;">작성자</th>
								<th
									style="width: 50%; background-color: #eeeeee; text-align: center;">댓글</th>
								<th
									style="width: 25%; background-color: #eeeeee; text-align: center;">작성일</th>
								<th
									style="width: 5%; background-color: #eeeeee; text-align: center;">비고</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${reply}" var="hMap">
								<tr>
									<th>${hMap.REPLYID}</th>
									<th>${hMap.REPLYCONTENT}</th>
									<td>${hMap.REPLYDATE}</td>
									<th><c:if test="${hMap.REPLYID == sessionScope.memberID}">
											<form action="/board/deleteOneReply" method="post">
												<input type="hidden" name="boardSEQ"
													value="${boardVo.boardSEQ}"> <input type="hidden"
													name="replySEQ" value="${hMap.REPLYSEQ}"> <input
													type="submit" class="btn btn-primary form-control"
													value="삭제">
											</form>
										</c:if></th>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>