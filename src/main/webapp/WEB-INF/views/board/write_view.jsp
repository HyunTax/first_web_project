<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<body>
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