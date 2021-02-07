<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<body>
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