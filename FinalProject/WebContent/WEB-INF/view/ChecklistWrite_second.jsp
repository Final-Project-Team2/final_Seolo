<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChecklistWrite_second.jsp</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<style type="text/css">
.text-essential {
	color: #FFA7A7;
}
</style>


</head>
<body>

	<!-- 체크리스트 작성 뷰 페이지 : 추가항목 작성 페이지! -->

	<!-- 메뉴바 영역 -->
	<div>
		<c:import url="MenuNavbar_new.jsp"></c:import>
	</div>

	<!-- 본문 영역 -->
	<div class="container">



		<div class="py-5 text-center">
			<h1 style="margin-top: 50px; font-weight: bold;">체크리스트 추가항목 작성</h1>
			<p class="lead">추가할 항목을 자유롭게 작성해주세요.</p>
		</div>

		<!-- SecondTimeInsertForm.jsp -->
		<a href="secondtimeinsertform.action" role="button" class="btn btn-secondary" 
		id="btnAdd" style="vertical-align: bottom;">시간 관련항목 입력하기</a>
		
		<!-- SecondScoreInsertForm.jsp -->
		<a href="secondscoreinsertform.action" role="button" class="btn btn-info" 
		id="btnAdd" style="vertical-align: bottom;">점수 관련항목 입력하기</a>
		
		<a href="thirdinsertform.action" role="button" class="btn btn-primary float-right" 
		id="btnAdd" style="vertical-align: bottom; ">다음으로</a>
		
		<input type="hidden" id="checkNo" name="checkNo" placeholder="체크리스트고유번호">

		<br>
		<br>

		<%-- ${fn:length(timeList)}
		${fn:length(scoreList)} --%>

		<table class="table table-striped table-condensed table-hover">
			<tr style="font-weight: bold;">
				<td>추가항목명</td>
				<td>코멘트</td>
				<td>점수 / 시간</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
			<c:choose>
				<%-- 데이터가 존재하지 않을 때 --%>
				<c:when test="${fn:length(timeList)==0 && fn:length(scoreList)==0}">
					<tr>
						<td colspan="5"><br>
							<p class="text-center">입력된 추가항목이 없습니다. 추가항목을 입력해주세요.</p>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
			<c:forEach var="list" items="${timeList }">
					<tr>
						<td>${list.timeTitle }</td>
						<td>${list.timeComments }</td>
						<td>${list.time }</td>
						<td>
							<a href="secondtimeupdateform.action?plusTimeNo=${list.plusTimeNo }"
							role="button" class="btn btn-secondary btn-xs btnUpdate" 
							name="timeUpdate${list.plusTimeNo }" id="timeUpdate${list.plusTimeNo }">수정</a>
								
						</td>
						<td>
							<a href="secondtimedelete.action?plusTimeNo=${list.plusTimeNo }"
							role="button" class="btn btn-secondary btn-xs btnDelete" 
							name="timeDelete${list.plusTimeNo }" id="timeDelete${list.plusTimeNo }">삭제</a>
						</td>
					</tr>
					</c:forEach>
					<c:forEach var="list" items="${scoreList }">
					<tr>
						<td>${list.scoreTitle }</td>
						<td>${list.scoreComments }</td>
						<td>${list.scoreNo }</td>		
						<td>
							<a href="secondscoreupdateform.action?plusScoreNo=${list.plusScoreNo}"
							role="button" class="btn btn-info btn-xs btnUpdate" 
							name="scoreUpdate${list.plusScoreNo}" id="scoreUpdate${list.plusScoreNo}">수정</a>	
						</td>
						<td>
							<a href="secondscoredelete.action?plusScoreNo=${list.plusScoreNo}"
							role="button" class="btn btn-info btn-xs btnDelete" 
							name="scoreDelete${list.plusScoreNo}" id="scoreDelete${list.plusScoreNo}">삭제</a>
						</td>
					</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</body>
</html>