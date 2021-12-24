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
<title>Main_admin.jsp</title>
</head>
<body>

	<!-- 메뉴 영역 -->
	<div>
		<c:import url="MenuNavbar_admin.jsp"></c:import>
	</div>

	<!-- 콘텐츠 영역 -->
<br><br>

<main role="main">

  <!-- Main jumbotron for a primary marketing message or call to action -->
  <div class="jumbotron">
    <div class="container">
      <h1 class="display-5">관리자님, 안녕하세요!</h1>
      <p>관리자 전용 화면입니다.</p>
      <!-- <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more »</a></p> -->
    </div>
  </div>

  <br><br>
  <div class="container">
    <!-- Example row of columns -->
    <div class="row">
    <div class="col-md-4">
        <h2>공지사항</h2><br>
        <p><a class="btn btn-primary" href="<%=cp%>/NoticeList.jsp" role="button">조회하기 »</a></p>
      </div>
      <div class="col-md-4">
        <h2>서비스 소개</h2><br>
        <p><a class="btn btn-primary" href="introduction.action" role="button">조회하기 »</a></p>
      </div>
      <div class="col-md-4">
        <h2>자주 묻는 질문</h2><br>
        <p><a class="btn btn-primary" href="<%=cp%>/FaqListNode.jsp" role="button">조회하기 »</a></p>
      </div>
    </div>

    <hr><br>

	<div class="row">
      <div class="col-md-4">
        <h2>회원 리스트</h2><br>
        <p><a class="btn btn-secondary" href="<%=cp%>/AccountList.jsp" role="button">조회하기 »</a></p>
      </div>
      <div class="col-md-4">
        <h2>탈퇴회원 리스트</h2><br>
        <p><a class="btn btn-secondary" href="<%=cp%>/WithdrawalAccountList.jsp" role="button">조회하기 »</a></p>
      </div>
      <div class="col-md-4">
        <h2>신고처리</h2><br>
        <p><a class="btn btn-secondary" href="<%=cp%>/ReportCheck.jsp" role="button">조회하기 »</a></p>
      </div>
    </div>
	<br><br>
  </div> <!-- /container -->

</main>


</body>
</html>