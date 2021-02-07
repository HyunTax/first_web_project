<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<body>
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
							<th><a
								href="/board/content_view?boardSEQ=${boardVo.boardSEQ}">${boardVo.boardTitle}</a></th>
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