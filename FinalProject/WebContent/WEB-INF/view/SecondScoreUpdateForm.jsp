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
<title>SecondScoreUpdateForm.jsp</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<style type="text/css">
.text-essential {
	color: #FFA7A7;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$("#next").click(function()
		{
			// alert("확인");
			
			if($("#title").val()=="" || $("#time").val()=="")
			{
				alert("제목과 점수는 필수 입력사항입니다.");
				return;
			}
			
			$("#plusScore").submit();
			
		});
		
	});

</script>
</head>
<body>
	<!-- 점수 추가항목 작성 페이지! -->

	<!-- 메뉴바 영역 -->
	<div>
		<c:import url="MenuNavbar_new.jsp"></c:import>
	</div>

	<!-- 본문 영역 -->
	<div class="container">

		<div class="py-5 text-center">
			<h2 style="margin-top: 50px;" style="font-weight: bold;">체크리스트 추가항목 수정</h2>
		</div>


		<!-- 폼 시작 -->
		<form class="needs-validation" name="plusScore" id="plusScore" action="secondscoreinsert.action">
			<div class="container">
				<div class="mb-3">
					<label for="scoreTitle" style="font-weight: bold;">추가항목 제목</label> 
					<input type="text" class="form-control" id="scoreTitle" name="scoreTitle" 
					 value="${score.scoreTitle }">
				</div>
				<div class="mb-3">
					<label for="scoreComments" style="font-weight: bold;">코멘트</label> 
					<input type="text" class="form-control" id="scoreComments" name="scoreComments" 
					 value=${score.scoreComments }>
				</div>
				<div class="mb-3">
					<label for="scoreNo" style="font-weight: bold;">점수</label> 
					<select class="custom-select d-block w-100" id="scoreNo" name="scoreNo">
						<c:forEach var="sc" items="${scores }">
							<option value="${sc.scoreNo }">${sc.scoreName }</option>
						</c:forEach>
					</select>
				</div>
				<br>
				<!-- 확인끝나면 다시 hidden으로 변경하기 -->
				<input type="hidden" id="plusScoreNo" name="plusScoreNo" value="${plusScoreNo }" placeholder="점수추가항목고유번호">
				
				<button class="btn btn-secondary btn-lg btn-block" type="button"
				id="next" name="next" style="margin-bottom: 50px;">수정 완료</button>

			</div>
		</form>
	</div>


</body>
</html>