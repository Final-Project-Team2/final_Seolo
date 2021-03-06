<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<title>WriteNotice.jsp</title>
<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>

</head>

<body>
	<!-- 메뉴 영역 -->
	<div>
		<c:import url="MenuNavbar_admin.jsp"></c:import>
	</div>

	<!-- 콘텐츠 영역 -->
	<br>
	<br>
	<article>
	
		<div class="container" role="main">
			<h2>공지사항 작성</h2>
			<br>
			
			<form name="form" id="form" role="form" method="post" action="noticeinsert.action">
				<div class="mb-3">
					<label for="title">제목</label> <input type="text"
						class="form-control" name="title" id="title"
						placeholder="제목을 입력하세요">
				</div>

				<div class="mb-3">
					<label for="reg_id">분류</label> 
					<select class="form-control" name="nos_no" id="nos_no">
						<option value="-1">========</option>
						<option value="1">공지사항</option>
						<option value="2">점검알림</option>
					</select>
				</div>

				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="13" name="content" id="content"
						placeholder="내용을 입력하세요"></textarea>
				</div>
			
			<br>
			<div align="right">
				<!-- <button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button> -->
				<!-- button이 폼 안에 들어가있어야 내용 보내기 가능! -->
				<button type="submit" class="btn btn-primary" >등록하기</button>
				<button type="button" class="btn btn-secondary" onclick="location.href='noticelist.action'">취소하기</button>
			</div>
			</form>
		</div>

	</article>

</body>
</html>
