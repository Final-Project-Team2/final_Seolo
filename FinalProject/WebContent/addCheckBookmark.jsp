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
<title>AddCheckBookmark.jsp</title>

<!-- 통일하기로 한 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" 
integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		// alert("확인");
		
		// 북마크 완료 버튼 클릭시 제목 입력 확인
		$("#done").click(function check()	
		{
			// alert($("#title").val());
			
			if($("#title").val()=="")
			{
				alert("제목은 필수입력사항입니다.");
				$("#title").focus();
				return false;
			}
			
			alert("북마크가 완료되었습니다. 나의 체크리스트에서 확인해보세요.");
			location.href="mychecklistform.action";
			
		});
		
		// 스티커추가하기 버튼 클릭
		$("#checkFirst").click(function check()
		{
			// alert("확인");
			
			// 북마크 제목 입력했는지 확인
			if($("#title").val()=="")
			{
				alert("제목을 먼저 작성해주세요.");
				$("#title").focus();
				return false;
			}
			
			// 스티커 입력했는지 확인   
			if($("#newSticker").val()=="")
			{
				alert("스티커를 작성해주세요.");
				$("#newSticker").focus();
				return false;
			}
			
		});
		
		// 추가로 확인해야 할 것
		// 기존스티커 선택시 북마크 제목 입력했는지 확인해야되는데..
		// 일단 제목이 null허용되니까 스킵
		/*
		$("#existing").click(function()
		{
			// alert("기존 스티커 선택");
			
			// 북마크 제목 입력했는지 확인
			if($("#title").val()=="")
			{
				alert("제목을 먼저 작성해주세요.");
				$("#title").focus();
				return false;
			}
			
		});
		*/
		
	});
</script>
</head>
<body>
<%-- 이거 web-inf 안에 넣은 후에 주석 해제
<div>
	<c:import url="MenuNavbar_new.jsp"></c:import>
</div>
 --%>
<br><br><br><br><br>

<main role="main" class="container">
  
	<div class="card mb-4 shadow-sm">
		<div class="card-header">
			<h2 class="my-0 font-weight-bold" style="text-align: center;">이 체크리스트를 북마크하시겠습니까?</h2><br>
			<p class="lead" style="text-align: center;">'나의 체크리스트'에서 같은 스티커를 붙여둔 리스트를 모아서 확인할 수 있습니다.</p>
		</div>
      
       
        <div class="card-body">
        
        	<h3 class="card-title">북마크 제목</h3>
        	<div class="input-group mb-3">
				  <input type="text" class="form-control" name="title1" id="title1"
				   placeholder="15자 이내로 가장 먼저 작성해주세요." maxlength="15">
			</div><br>
        
        	<h3 class="card-title">기존의 스티커에서 선택하기</h3>
        	<p class="card-text" >
			<c:forEach var="li" items="${list }">
				<a id="sticker${li.stickerNo }" role="button" class="btn btn-link"
				href="addCheckSticker.action?stickerNo=${li.stickerNo }&checkNo=${checkNo }">#${li.content }</a>
				<!-- <button id="existing" class="btn btn-link" >#${li.content }</button> -->
			</c:forEach>        		
        	</p>
        	
        	
        	<h3 class="card-title">스티커 새로 작성하기</h3>
		        <form id="addNewSticker" action="addNewSticker.action" method="get" onsubmit="return check()"> 
		        
			    	<!-- 북마크시 체크리스트 고유번호 넘겨줘야 함 -->
					<input type="hidden" name="checkNo" id="checkNo" value="${checkNo }">
		        	<div class="input-group mb-3">
						  <input type="text" class="form-control" name="newSticker" id="newSticker"
						   placeholder="15자 이내로 작성해주세요." maxlength="15">
						  <div class="input-group-append">
						    <button class="btn btn-outline-secondary" type="submit" id="checkFirst">추가하기</button>
						  </div>
					</div>
				</form>
        	<br>
        	
        	<h3 class="card-title">추가된 스티커 목록</h3>
        	<div class="input-group mb-3">
			  <div class="input-group-append">
				  <c:forEach var="st" items="${sticker }">
					<a id="stkcer${st.stickerNo }" href="removesticker.action?stickerNo=${st.stickerNo }"
					role="button" class="btn btn-link">#${st.content }</a>
				  </c:forEach> 
			 </div>
			</div>
        	<br>
        
			<div class="text-center mb-4">
		    	<button class="btn btn-lg btn-primary" id="done" 
		    	onclick="return check()">북마크 완료</button>
	    	</div>
	    	
	    	
     	</div>
	</div>
</main>

</body>
</html>