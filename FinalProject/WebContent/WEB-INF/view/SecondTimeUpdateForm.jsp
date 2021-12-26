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
<title>SecondTimeUpdateForm.jsp</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<style type="text/css">
	.text-essential 
	{
		color: #FFA7A7;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	
	$(document).ready(function()
	{
		/* 유효성 검사 */
		$("#next").click(function()
		{
			// alert("확인");
			
			if($("#title").val()=="" || $("#time").val()=="")
			{
				alert("제목과 시간은 필수 입력사항입니다.");
				return;
			}
			
			// alert(typeof $("#time").val()); String
			if(parseInt($("#time").val())>999 || parseInt($("#time").val())<0)
			{
				alert("시간은 0 ~ 999분 범위 내에서 작성해주세요.");
				return;
			}
			
			$("#plusTime").submit();
			
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
		<form class="needs-validation" name="plusTime" id="plusTime" action="secondtimeinsert.action">

			<div class="container">
				<div class="mb-3">
					<label for="timeTitle" style="font-weight: bold;">추가항목 제목</label> 
					<input type="text" class="form-control" id="timeTitle" name="timeTitle"
					 value="${time.timeTitle}">
				</div>
				<div class="mb-3">
					<label for="timeComments" style="font-weight: bold;">코멘트</label> 
					<input type="text" class="form-control" id="timeComments" name="timeComments" 
					 value="${time.timeComments}">
				</div>
				<div class="mb-3">
					<label for="time" style="font-weight: bold;">시간(분)</label> 
					<input type="text" class="form-control" id="time" name="time" 
					value="${time.time }"
					 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				</div>
				<br>
				<input type="hidden" id="plusTimeNo" name="plusTimeNo" value="${plusTimeNo}" placeholder="시간추가항목고유번호">
				
			<!-- 완료버튼 클릭시 인서트되고 ChecklistWrite_second.jsp 로 리다이렉트 되어 항목 추가된 것 확인 가능 -->
			<button class="btn btn-secondary btn-lg btn-block" type="button"
			 id="next" name="next" style="margin-bottom: 50px;">수정 완료</button>
			
			</div>
		</form>
	</div>


</body>
</html>