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
<title>ChecklistWrite_first.jsp</title>
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
<script type="text/javascript" 
src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8debbf5b35bae9b060adac364d027afd&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>

	// 주소 검색
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                var bcode = '';

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddr").value = addr;
                document.getElementById("roadAddr1").value = addr;
               	document.getElementById("bcode").value = data.bcode;
            }
        }).open();
    }
	
	// 지도 출력
	function searchMap()
    {
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };  
    
        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption); 
    
        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();
       
        var address = $("#roadAddr").val();
        
        // 주소로 좌표를 검색합니다
        geocoder.addressSearch(address, function(result, status) {
    
            // 정상적으로 검색이 완료됐으면 
             if (status === kakao.maps.services.Status.OK) {
    
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    
                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });
             
                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            } 
        });    
    }

    
    // 제이쿼리
    $(document).ready(function()
   {
      
      $("#check").click(function()
      {
         // alert("확인");
         
         var bcode = $("#bcode").val();
         
         // alert(bcode);
         
         $.post("ajax.action"
              , {bcode:bcode}
              , function(result)
              {
               $("#result").html(result)
              }); 
         
         // alert($("#address").val());
         
         searchMap();
         
      }); 
      
   });
</script>

<script type="text/javascript">


	$(document).ready(function()
	{
		$("#next").click(function()
		{
			// alert("확인");
			// 필수 입력 사항이 비어있을 경우
			if($("#title").val()=="" || $("#bcode").val()=="")
			{
				alert("필수 입력사항을 작성해주세요");
				$("#title").focus();
				return;
			}
			
			// 각 항목들이 코멘트만 입력되어 있을 때 점수도 입력하도록
			if($("#deposit").val() != "")
			{
				if ($("#mWolse").val()=="")
				{
					alert("월세 보증금과 월세 둘 다 입력해주세요.");
					$("#mWolse").focus();
					return;
				}
			}
			
			if($("#mWolse").val()!="")
			{
				if($("#deposit").val()=="")
				{
					alert("월세 보증금과 월세 둘 다 입력해주세요.");
					$("#deposit").focus();
					return;
				}
			}
			
			if ($("textarea#security_co").val() != "")
			{
				// alert("확인");
				
				// $("#셀렉트ID option:eq(1)").attr("selected", "selected");
				// $("#셀렉트박스ID option:selected").val();

				if($("#security_scoreNo option:selected").val()=="-1")
				{
					alert("치안 항목의 점수를 선택해주세요.");
					$("#security_scoreNo").focus();
					return;
				}
			}
			
			if ($("textarea#transport_co").val() != "")
			{
				if($("#transport_scoreNo option:selected").val()=="-1")
				{
					alert("대중교통 항목의 점수를 선택해주세요.");
					$("#transport_scoreNo").focus();
					return;
				}
			}
			
			if ($("textarea#honjap_co").val() != "")
			{
				if($("#honjap_scoreNo option:selected").val()=="-1")
				{
					alert("교통혼잡도 항목의 점수를 선택해주세요.");
					$("#honjap_scoreNo").focus();
					return;
				}
			}
			
			if ($("textarea#pet_co").val() != "")
			{
				if($("#pet_scoreNo option:selected").val()=="-1")
				{
					alert("반려동물 항목의 점수를 선택해주세요.");
					$("#pet_scoreNo").focus();
					return;
				}
			}
			
			
			
		 // 생활편의시설 모두 선택하도록 하기
         
         // 1. 전부 체크했을 경우 → submit 가능
         // 2. 하나도 체크하지 않았을 경우 → submit 가능
         // 3. 몇개만 체크했을 경우 → submit 막기
         
         if ($('input:radio[name=mart]').is(':checked') && $('input:radio[name=laundry]').is(':checked')
               && $('input:radio[name=hospital]').is(':checked') && $('input:radio[name=food]').is(':checked')
               && $('input:radio[name=culture]').is(':checked') && $('input:radio[name=park]').is(':checked'))
         {
            // alert("통과");   // 아무것도 없어도 제출 가능... 
         }
         else if (!$('input:radio[name=mart]').is(':checked') && !$('input:radio[name=laundry]').is(':checked')
               && !$('input:radio[name=hospital]').is(':checked') && !$('input:radio[name=food]').is(':checked')
               && !$('input:radio[name=culture]').is(':checked') && !$('input:radio[name=park]').is(':checked')) 
         {
            // alert("ㅇㅋ");   // 아무것도 없어도  제출 가능... 
         }
         else
         {
            alert("생활편의시설은 6가지 항목을 전부 체크해주셔야 합니다");
            return;
         }
         
         
         if ($("textarea#conv_co").val() != "")
         {
            if ( !($('input:radio[name=mart]').is(':checked') && $('input:radio[name=laundry]').is(':checked')
                  && $('input:radio[name=hospital]').is(':checked') && $('input:radio[name=food]').is(':checked')
                  && $('input:radio[name=culture]').is(':checked') && $('input:radio[name=park]').is(':checked')) )
            {
               alert("생활편의시설 코멘트를 작성하시려면 항목의 유무를 모두 선택해주세요.");
               $("#mart1").focus();
               return;
            }
            
         }			
			
			
		// 이렇게 세 개를 같이 할 수밖에 없었음.. 장점, 단점, 기타 모두 입력해야 함
		if($("textarea#good").val()!="" || $("textarea#bad").val()!="" || $("textarea#etc").val()!="")
		{
			if($("textarea#good").val()=="" || $("textarea#bad").val()=="" || $("textarea#etc").val()=="")
			{
				alert("코멘트의 세 항목을 모두 입력해주세요");
				$("textarea#good").focus();
				return;
			}
			
		}
		
		$("#checkFirst").submit();
			
			
		});
		
	});

</script>


</head>
<body>
	<!-- 체크리스트 작성 뷰 페이지 -->

	<!-- 메뉴바 영역 -->
	<div>
		<c:import url="MenuNavbar_new.jsp"></c:import>
	</div>

	<!-- 본문 영역 -->
	<div class="container">
		<div class="py-5 text-center">
			<h1 style="margin-top: 50px; font-weight: bold;">체크리스트 작성</h1>
			<br>
			<p class="lead"><span class="text-essential">(*)</span> 표시가 있는 항목은 필수 입력사항입니다.</p>
			<p class="lead">도로명주소와 제목, 나의 출근시간, 비밀 코멘트는 타인에게 공개되지 않으니 자유롭게
				작성해주세요.</p>
			
		</div>

		<!-- 폼 시작 -->
		<form class="needs-validation" action="checkfirstinsert.action" method="post" id="checkFirst">
			<h4 class="mb-3">
				거주여부 <span class="text-essential">(*)</span>
			</h4>
			<div class="d-block my-3">
				<div class="custom-control custom-radio">
					<input id="resNo1" name="resNo" type="radio" value=1
						class="custom-control-input" checked="checked"> 
						<label class="custom-control-label" for="resNo1">거주</label>
				</div>
				<div class="custom-control custom-radio">
					<input id="resNo2" name="resNo" type="radio" value=2
						class="custom-control-input" > <label
						class="custom-control-label" for="resNo2">거주예정</label>
				</div>
				<div class="custom-control custom-radio">
					<input id="resNo3" name="resNo" type="radio" value=3
						class="custom-control-input" > <label
						class="custom-control-label" for="resNo3">비거주</label>
				</div>
			</div>

			<hr class="mb-4">

			<div class="mb-3">
				<label for="title"><h4 class="mb-3">제목<span class="text-essential">(*)</span></h4></label>
				<input type="text" class="form-control" id="title" name="title"
				 maxlength="25" placeholder=" 최대 25자까지 입력 가능" required="required">
			</div>

			<hr class="mb-4">

			<div class="row">
				<!-- 본문 우측 영역 -->
				<div class="col-md-4 order-md-2 mb-4">
					
					<h4 class="mb-3">지역분류</h4>
					<div class="row mb-3" style="justify-content: center;"  >
						<div id="result">
							<!-- ajax 뷰 자리 -->
						</div>
					</div>
					
					<hr class="mb-4">
					
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="mb-3">주소 위치확인</span>
					</h4>
					<!-- 지도 출력 -->
					<div id="map" style="width:100%;height:500px;"></div>
					

				</div><!-- 본문 우측 영역 끝 -->




				<!-- 본문 좌측 영역 -->
				<div class="col-md-8 order-md-1">
					<div class="mb-3">
						 
						<h4 class="mb-3">주소<span class="text-essential">(*)</span></h4>
						
						<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" 
						class="btn btn-secondary btn-sm"><br><br>
						<input type="text" id="postcode" placeholder="우편번호" class="form-control" disabled="disabled" required="required">
						<input type="text" id="roadAddr" name="roadAddr" placeholder="주소" class="form-control" disabled="disabled" required="required"><br>
						
						<!-- 동 코드 확인 후 ajax 처리되는 버튼 -->
						<input type="button" id="check" value="위치확인" class="btn btn-secondary btn-sm">
						&nbsp; 버튼을 클릭해주세요. <span class="text-essential">(*)</span><br><br>
						
						<input type="hidden" id="bcode" name="bcode" placeholder="동고유번호">
						<input type="hidden" id="roadAddr1" name="roadAddr1" placeholder="주소">
						
					</div>


					<hr class="mb-4">
					<h4 class="mb-3">주거비</h4>
					<h6 class="mb-3">(단위: 만원)</h6>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="deposit" style="font-weight: bold;">월세 보증금</label> 
							<input type="text" class="form-control" id="deposit" name="deposit"
							placeholder="ex) 1000">
						</div>
						<div class="col-md-6 mb-3">
							<label for="mWolse" style="font-weight: bold;">월세</label> 
							<input type="text" class="form-control" id="mWolse" name="mWolse"
							placeholder="ex) 50">
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="mJeonse" style="font-weight: bold;">전세 보증금</label> 
							<input type="text" class="form-control" id="mJeonse" name="mJeonse"
							 placeholder="ex) 1억 5천 → 15000 으로 작성해주세요.">
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="mMaemae" style="font-weight: bold;">매매가</label> 
							<input type="text" class="form-control" id="mMaemae" name="mMaemae"
							 placeholder="ex) 2억 5천 → 25000으로 작성해주세요.">
						</div>
					</div>

					<hr class="mb-4">
					<h4 class="mb-3">치안</h4>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="sec_score" style="font-weight: bold;">점수</label> <select
								class="custom-select d-block w-100" id="security_scoreNo" name="security_scoreNo" required="">
								<option value="-1"> -- 선택 --</option>
								<c:forEach var="score" items="${scores }">
							 		<option value="${score.scoreNo }">${score.scoreName }</option>
							 	</c:forEach>
							</select>
						</div>
						<div class="col-md-9 mb-3">
							<textarea class="form-control" name="security_co" id="security_co"
							 rows="3" placeholder="코멘트를 입력해주세요." maxlength="150"></textarea>
						</div>
					</div>

					<hr class="mb-4">
					<h4 class="mb-3">대중교통</h4>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="trans_score" style="font-weight: bold;">점수</label> <select
								class="custom-select d-block w-100" id="transport_scoreNo" name="transport_scoreNo" required="">
								<option value="-1"> -- 선택 --</option>
								<c:forEach var="score" items="${scores }">
							 		<option value="${score.scoreNo }">${score.scoreName }</option>
							 	</c:forEach>
							</select>
						</div>
						<div class="col-md-9 mb-3">
							<textarea class="form-control" name="transport_co" id="transport_co"
								rows="3" placeholder="코멘트를 입력해주세요" maxlength="150"></textarea>
						</div>
					</div>

					<h4 class="mb-3">교통혼잡도</h4>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="honjap_score" style="font-weight: bold;">점수</label> <select
								class="custom-select d-block w-100" id="honjap_scoreNo" name="honjap_scoreNo" required="">
								<option value="-1"> -- 선택 --</option>
								<c:forEach var="score" items="${scores }">
							 		<option value="${score.scoreNo }">${score.scoreName }</option>
							 	</c:forEach>
							</select>
						</div>
						<div class="col-md-9 mb-3">
							<textarea class="form-control" name="honjap_co" id="honjap_co"
								rows="3" placeholder="코멘트를 입력해주세요" maxlength="150"></textarea>
						</div>
					</div>

					<hr class="mb-4">
					<h4 class="mb-3">생활편의시설</h4>
					<div class="row mb-3 input-group" style="align-items: center; display: flex; justify-content: center;">
					
					
						<ul class="col list-group col-md-8 themed-grid-col">
							<li class="list-group-item" style="height: 43pt; font-weight: bold;">대형마트/소형마트/시장/편의점</li>
							<li class="list-group-item" style="height: 43pt; font-weight: bold;">세탁소/빨래방/수선집</li>
							<li class="list-group-item" style="height: 43pt; font-weight: bold;">동네병원/대형병원/약국</li>
							<li class="list-group-item" style="height: 43pt; font-weight: bold;">음식점/카페/배달</li>
							<li class="list-group-item" style="height: 43pt; font-weight: bold;">문화시설(영화관, 헬스장 등)</li>
							<li class="list-group-item" style="height: 43pt; font-weight: bold;">공원/산책로/자연환경</li>
						</ul>
						<ul class="col list-group col-md-2 themed-grid-col">
							<li class="list-group-item"><input type="radio" name="mart" id="mart1" value="0"><label for="mart1">유</label> 
														<input type="radio" name="mart" id="mart2" value="1"><label for="mart2">무</label></li>
							<li class="list-group-item"><input type="radio" name="laundry" id="laundry1" value="0"><label for="laundry1">유</label> 
														<input type="radio" name="laundry" id="laundry2" value="1"><label for="laundry2">무</label></li>
							<li class="list-group-item"><input type="radio" name="hospital" id="hospital1" value="0"><label for="hospital1">유</label> 
														<input type="radio" name="hospital" id="hospital2" value="1"><label for="hospital2">무</label></li>
							<li class="list-group-item"><input type="radio" name="food" id="food1" value="0"><label for="food1">유</label>
														<input type="radio" name="food" id="food2" value="1"><label for="food2">무</label></li>
							<li class="list-group-item"><input type="radio" name="culture" id="culture1" value="0"><label for="culture1">유</label>
														<input type="radio" name="culture" id="culture2" value="1"><label for="culture2">무</label></li>
							<li class="list-group-item"><input type="radio" name="park" id="park1" value="0"><label for="park1">유</label>
														<input type="radio" name="park" id="park2" value="1"><label for="park2">무</label></li>
						</ul>
					
					
					</div>  
					
					<div class="row mb-3" style="align-items: center; display: flex; justify-content: center;">
						<textarea class="form-control col list-group col-md-11 themed-grid-col" name="conv_co" id="conv_co"
								rows="3" placeholder="코멘트를 입력해주세요" maxlength="150"></textarea>
					</div>

					<hr class="mb-4">
					<h4 class="mb-3">반려동물</h4>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="pet_score" style="font-weight: bold;">점수</label> <select
								class="custom-select d-block w-100" id="pet_scoreNo" name="pet_scoreNo" required="">
								<option value="-1"> -- 선택 --</option>
								<c:forEach var="score" items="${scores }">
							 		<option value="${score.scoreNo }">${score.scoreName }</option>
							 	</c:forEach>
							</select>
						</div>
						<div class="col-md-9 mb-3">
							<textarea class="form-control" name="pet_co" id="pet_co" 
							rows="3" placeholder="코멘트를 입력해주세요" maxlength="150"></textarea>
						</div>
					</div>
				</div>
			</div><!-- 본문 좌측 영역 끝 -->

			<hr class="mb-4">
			<h4 class="mb-3">코멘트</h4>
			<div class="col-md-12 mb-3">
				<label for="good" style="font-weight: bold;">장점</label>
				<textarea class="form-control" name="good" id="good" rows="3"
					placeholder="코멘트를 입력해주세요" maxlength="150"></textarea>

				<label for="bad" style="font-weight: bold;">단점</label>
				<textarea class="form-control" name="bad" id="bad" rows="3"
					placeholder="코멘트를 입력해주세요" maxlength="150"></textarea>

				<label for="etc" style="font-weight: bold;">기타</label>
				<textarea class="form-control" name="etc" id="etc" rows="3"
					placeholder="코멘트를 입력해주세요" maxlength="150"></textarea>
			</div>

			<hr class="mb-4">
			<h4 class="mb-3">비밀 코멘트</h4>
			<div class="col-md-12 mb-3">
				<textarea class="form-control" name="secret_co" id="secret_co" rows="3"
					placeholder="코멘트를 입력해주세요" maxlength="150"></textarea>
			</div>

			<hr class="mb-4">
			<!-- 필수 입력사항들이 빈칸이 아닌지 확인하기 -->
			<button class="btn btn-primary btn-lg btn-block" type="button" id="next" style="margin-bottom: 50px;">다음 페이지</button>
			
			<!-- 이 버튼이 클릭되면
			 	 1. 인서트 컨트롤러가 인서트 시켜주기 + 체크 고유번호 가져다가 넘겨주기
			 	 2. 인서트 컨트롤러가 추가항목 입력 폼 주소 요청하기
			 	 3. 추가항목 입력폼 컨트롤러가 입력폼 불러주기
			 	 4. 추가항목 입력 폼에서 입력 / 수정 / 삭제 가능 - 시간, 점수로 구분해서 -->
			
			
			
		</form>
	</div>



	<!-- footer 영역 -->
	<div>
	</div>

</body>
</html>