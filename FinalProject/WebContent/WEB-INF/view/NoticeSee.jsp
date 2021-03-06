<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
   request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	pageContext.setAttribute("replaceChar", "\n");
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoticeSee.jsp</title>
<!-- 공지사항 게시글 클릭시 보이는 상세 페이지 -->

<!-- 통일하기로 한 부트스트랩 -->
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
   integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
   crossorigin="anonymous">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
   crossorigin="anonymous"></script>


<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		// 수정 버튼 클릭
		$(".btn-primary").click(function()
		{
			// 테스트
			//alert("수정 버튼 클릭");
			
			$(location).attr("href", "noticeupdateform.action?no_no=" + $(this).val());
			
		});
		
		// 삭제 버튼 클릭
		$(".btn-danger").click(function()
		{
			// 테스트
			//alert("삭제 버튼 클릭");
			
			if (confirm("해당 게시물을 정말 삭제하시겠습니까?"))
			{
				$(location).attr("href", "noticedelete.action?no_no=" + $(this).val());
			}
		});
	});


</script>



</head>
<body>

   <!-- 내비바 -->
   <div>
   		<c:choose>
			<c:when test="${!empty adminLogin }">
				<c:import url="MenuNavbar_admin.jsp"></c:import>
			</c:when>
			<c:otherwise>
				<c:import url="/nav.action"></c:import>
			</c:otherwise>
   		</c:choose>
   </div>

   <br>
   <br>
   <br>
   <br>
   <br>
<!-- 실험 -->
   <div class="container">
      <!-- 게시판 메인 -->
      <div class="page-header">
         <h1 class="page-heading">공지사항</h1>

         <hr>
         <br>
         <table class="table table-striped table-bordered">
            <tr>
               <th>번호</th>
               <!-- <td>{{ article.pk }}</td> -->
               <td>${view.no_no }</td>
               <!-- <td>1</td> -->
            </tr>
            <tr>
               <th>제목</th>
               <!-- <td>{{ article.title }}</td> -->
               <!-- <td style="font-size: 20px;">시스템 점검 안내 [21.12.30 09시 ~ 23시]</td> -->
               <td style="font-size: 20px;">${view.title }</td>
            </tr>

            <tr>
               <th>작성자</th>
               <td>관리자</td>
               <!-- 로그인 세션 확인용 -->
               <%-- <td>${view.ad_id }</td> --%>
            </tr>
            <tr>
               <th>작성일시</th>
               <td>${view.nodate }</td>
            </tr>
            <tr>
               <th height="350px;">내용</th>
               <%-- <td>${view.content }</td> --%>
               <td>${fn:replace(view.content, replaceChar, "<br/>") }</td>
               <!-- <td><br>
               <br> 점검 일시 : 2021.12.30 (일) 09:00 ~ 23:00 (14시간 예정) <br>
               <br> ○ 점검 대상 : 서로 홈페이지 <br>
               <br> ○ 점검 방법 : 운영서버 점검 <br>
               <br>
                  <p style="color: red;">※ 점검시간은 상황에 따라 단축될 수 있습니다.</p> <br>
               <br></td> -->
            </tr>
         </table>

         <!-- <div
            class="xans-element- xans-board xans-board-movement-1002 xans-board-movement xans-board-1002 ">
            <ul>
               <li class="prev "><strong>이전글 ∧&emsp;</strong><a
                  href="/article/공지사항/1/106287001/">체크리스트 공지사항 </a></li>
               
               <li class="next "><strong>다음글 ∨&emsp;</strong><a
                  href="/article/공지사항/1/106181742/" >개인정보 처리방침 변경안내 (2021년 12월
                     20일 시행)</a></li>
            
            </ul>
         <hr>   
         </div> -->
         

         <!-- 글쓰기 버튼 -->
         <div class="d-flex justify-content-end">
            <!-- 이 글쓰기 버튼은 관리자에게만 나타나는 버튼! -->
            <%-- <button type="submit" class="btn btn-primary" value="${view.no_no }">수정하기</button>
            &nbsp;
            <button type="submit" class="btn btn-primary" value="${view.no_no }">삭제하기</button>
            &nbsp; --%>
            <c:if test="${!empty adminLogin}">
            	<button type="submit" class="btn btn-primary" value="${view.no_no }">수정하기</button>
	            &nbsp;
	            <button type="submit" class="btn btn-danger" value="${view.no_no }">삭제하기</button>
	            &nbsp;
            </c:if>
            <button type="button" class="btn btn-secondary" onclick="location.href='noticelist.action'">목록으로</button>
         </div>
         <br> <br>


      </div>
   </div>

</body>
</html>