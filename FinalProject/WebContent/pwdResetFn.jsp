<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>pwdResetFn.jsp</title>

<link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/starter-template/">

<!-- Bootstrap core CSS -->
<link href="<%=cp%>/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>

<!-- Custom styles for this template -->
<link href="<%=cp%>/css/starter-template.css" rel="stylesheet">
</head>
<body>
	<!-- 메뉴바 영역 -->
	<div>
		<c:import url="/nav.action"></c:import>
	</div>
	
	<!-- 본문 영역 -->
	<div class="container">
		<div class="starter-template">
			<h3>비밀번호 변경 완료</h3>
			<hr class="mb-4">
			
			<div class="card">
				<div class="card-body">
					<p>비밀번호 변경이 완료되었습니다.</p>
					<p>변경한 비밀번호로 로그인 해 주세요.</p>
					<p>
				    	<a href="loginform.action" class="btn btn-primary my-2">로그인하기</a>
				    	<a href="main.action" class="btn btn-secondary my-2">메인으로</a>
				    </p>
				</div>
			</div>			
		</div>
	</div>
	
</body>
</html>