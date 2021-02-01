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
<title>로그인</title>
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
					<li><a href="/board/list">게시판</a>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">로그인<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li class="active"><a href="/member/login_view">로그인</a></li>
							<li><a href="/member/join_view">회원가입</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4"></div>
		<div class="jumbotron" style="padding-top: 20px;">
			<form method="post" action="/member/login">
				<h3 style="text-align: center;">로그인</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디"
						name="userID" maxlength="20">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호"
						name="userPassword" maxlength="20">
				</div>
				<input type="submit" class="btn btn-primary form-control"
					value="로그인">
				<div>
					<a href="/member/join_view" class="btn btn-primary form-control">회원가입</a>
				</div>
			</form>
		</div>
	</div>
	<c:if test="${message =='error'}">
		<script type="text/javascript">
			alert('아이디가 존재하지 않습니다.')
			location.href = "/member/login_view"
		</script>
	</c:if>
	<c:if test="${noMember =='noMember'}">
		<script type="text/javascript">
			alert('회원이 아닙니다.')
			location.href = "/member/login_view"
		</script>
	</c:if>
</body>
</html>