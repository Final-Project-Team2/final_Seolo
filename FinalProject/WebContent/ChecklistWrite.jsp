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
<title>ChecklistWrite.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<style type="text/css">
.text-essential {
	color: #FFA7A7;
}
</style>
</head>
<body>
	<!-- 체크리스트 작성 뷰 페이지 -->

	<!-- 메뉴바 영역 -->
<%-- 	<div>
		<c:import url="MenuNavbar_new.jsp"></c:import>
	</div>
 --%>
	<!-- 본문 영역 -->
	<div class="container">
		<div class="py-5 text-center">
			<h2 style="margin-top: 50px;">체크리스트 작성</h2>
			<p class="lead">(*) 표시가 있는 항목은 필수 입력사항입니다.</p>
			<p class="lead">도로명주소와 제목, 나의 출근시간, 비밀 코멘트는 타인에게 공개되지 않으니 자유롭게 작성해주세요.</p>
		</div>

		<!-- 폼 시작 -->
		<form class="needs-validation" novalidate="">
			<h4 class="mb-3">
				거주여부 <span class="text-essential">(*)</span>
			</h4>
			<div class="d-block my-3">
				<div class="custom-control custom-radio">
					<input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked="" required="">
					<label class="custom-control-label" for="credit">거주</label>
				</div>
				<div class="custom-control custom-radio">
					<input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required="">
					<label class="custom-control-label" for="debit">거주예정</label>
				</div>
				<div class="custom-control custom-radio">
					<input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required="">
					<label class="custom-control-label" for="paypal">비거주</label>
				</div>
			</div>

			<hr class="mb-4">

			<div class="mb-3">
				<label for="title">제목 <span class="text-essential">(*)</span></label>
				<input type="text" class="form-control" id="title">
				<div class="invalid-feedback">제목을 입력해주세요.</div>
			</div>

			<hr class="mb-4">

			<div class="row">
				<!-- 본문 우측 영역 -->
				<div class="col-md-4 order-md-2 mb-4">
					<h4 class="mb-3">지역분류</h4>
					<div class="row mb-3" style="align-items: center; display: flex; justify-content: center;">
						<ul class="col list-group col-md-4 themed-grid-col">
							<li class="list-group-item">영등포구</li>
						</ul>
						<ul class="col list-group col-md-5 themed-grid-col">
							<li class="list-group-item">영등포동1가</li>
						</ul>
					</div>

					<hr class="mb-4">
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="mb-3">주요 출근시간</span>
					</h4>
					<ul class="list-group mb-3">
						<li class="list-group-item d-flex justify-content-between lh-condensed">
							<div>
								<h6 class="my-0">2호선 강남역 까지</h6>
							</div> <span class="badge badge-secondary">15분</span>
						</li>
						<li class="list-group-item d-flex justify-content-between lh-condensed">
							<div>
								<h6 class="my-0">2호선 을지로입구역 까지</h6>
							</div> <span class="badge badge-secondary">22분</span>
						</li>
						<li class="list-group-item d-flex justify-content-between lh-condensed">
							<div>
								<h6 class="my-0">9호선 여의도역 까지</h6>
							</div> <span class="badge badge-secondary">35분</span>
						</li>
						<li class="list-group-item d-flex justify-content-between lh-condensed">
							<div>
								<h6 class="my-0">공항철도 홍대입구역 까지</h6>
							</div> <span class="badge badge-secondary">14분</span>
						</li>
						<li class="list-group-item d-flex justify-content-between lh-condensed">
							<div>
								<h6 class="my-0">1호선 가산디지털단지역 까지</h6>
							</div> <span class="badge badge-secondary">35분</span>
						</li>
						<li class="list-group-item d-flex justify-content-between lh-condensed">
							<div>
								<h6 class="my-0">8호선 잠실역 까지</h6>
							</div> <span class="badge badge-secondary">46분</span>
						</li>
					</ul>

					<hr class="mb-4">
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="mb-3">나의 출근시간</span>
					</h4>

					<div class="row">
						<div class="col-10">
							<input type="text" class="form-control" placeholder="ex) 집에서부터 회사">
						</div>
						<span class="col">까지</span>
					</div>
					<br>
					<div class="row">
						<div class="col-5">
							<input type="text" class="form-control" placeholder="ex) 50">
						</div>
						<span class="col">분</span>
					</div>

				</div>
				<!-- 본문 우측 영역 끝 -->

				<!-- 본문 좌측 영역 -->
				<div class="col-md-8 order-md-1">
					<div class="mb-3">
						<label for="roadaddr">주소 <span class="text-essential">(*)</span></label>
						<input type="text" class="form-control" id="roadaddr" disabled="disabled" placeholder="주소검색 버튼을 눌러주세요.">
						<button type="button" class="btn btn-secondary btn-sm">주소 검색</button>
						<div class="invalid-feedback">주소를 입력해주세요.</div>
					</div>

					<hr class="mb-4">
					<h4 class="mb-3">주거비</h4>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="deposit">월세 보증금</label>
							<input type="text" class="form-control" id="deposit" placeholder="ex) 1000" value="" required="">
							만원
						</div>
						<div class="col-md-6 mb-3">
							<label for="mwolse">월세</label>
							<input type="text" class="form-control" id="mwolse" placeholder="ex) 50" value="" required="">
							만원
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="mjeonse">전세 보증금</label>
							<input type="text" class="form-control" id="mjeonse" placeholder="ex) 15000 (1억 5천)" value="" required="">
							만원
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="mmaemae">매매가</label>
							<input type="text" class="form-control" id="mmaemae" placeholder="ex) 25000 (2억 5천)" value="" required="">
							만원
						</div>
					</div>

					<hr class="mb-4">
					<h4 class="mb-3">치안</h4>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="sec_score">점수</label>
							<select class="custom-select d-block w-100" id="sec_score" required="">
								<c:forEach var="i" begin="1" end="11" step="1">
									<option value="i">${(i-1)*0.5 }</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-9 mb-3">
							<textarea class="form-control" name="" id="sec_comments" rows="3" placeholder="코멘트를 입력해주세요."></textarea>
						</div>
					</div>

					<hr class="mb-4">
					<h4 class="mb-3">대중교통</h4>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="trans_score">점수</label>
							<select class="custom-select d-block w-100" id="trans_score" required="">
								<c:forEach var="i" begin="1" end="11" step="1">
									<option value="i">${(i-1)*0.5 }</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-9 mb-3">
							<textarea class="form-control" name="" id="trans_comments" rows="3" placeholder="코멘트를 입력해주세요"></textarea>
						</div>
					</div>

					<h4 class="mb-3">교통혼잡도</h4>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="honjap_score">점수</label>
							<select class="custom-select d-block w-100" id="honjap_score" required="">
								<c:forEach var="i" begin="1" end="11" step="1">
									<option value="i">${(i-1)*0.5 }</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-9 mb-3">
							<textarea class="form-control" name="" id="honjap_comments" rows="3" placeholder="코멘트를 입력해주세요"></textarea>
						</div>
					</div>

					<hr class="mb-4">
					<h4 class="mb-3">생활편의시설</h4>
					<div class="row mb-3" style="align-items: center; display: flex; justify-content: center;">
						<ul class="col list-group col-md-8 themed-grid-col">
							<li class="list-group-item">대형마트/소형마트/시장/편의점</li>
							<li class="list-group-item">세탁소/빨래방/수선집</li>
							<li class="list-group-item">동네병원/대형병원/약국</li>
							<li class="list-group-item">음식점/카페/배달</li>
							<li class="list-group-item">문화시설(영화관, 헬스장 등)</li>
							<li class="list-group-item">공원/산책로/자연환경</li>
						</ul>
						<ul class="col list-group col-md-2 themed-grid-col">
							<li class="list-group-item"><input type="radio" name="mart" value="1">유 <input type="radio" name="mart" value="2">무</li>
							<li class="list-group-item"><input type="radio" name="laundry" value="1">유 <input type="radio" name="laundry" value="2">무</li>
							<li class="list-group-item"><input type="radio" name="hospital" value="1">유 <input type="radio" name="hospital" value="2">무</li>
							<li class="list-group-item"><input type="radio" name="food" value="1">유 <input type="radio" name="food" value="2">무</li>
							<li class="list-group-item"><input type="radio" name="culture" value="1">유 <input type="radio" name="culture" value="2">무</li>
							<li class="list-group-item"><input type="radio" name="park" value="1">유 <input type="radio" name="park" value="2">무</li>
						</ul>
					</div>
					<div class="row mb-3" style="align-items: center; display: flex; justify-content: center;">
						<textarea class="form-control col list-group col-md-11 themed-grid-col" name="" id="conv_comments" rows="3" placeholder="코멘트를 입력해주세요"></textarea>
					</div>

					<hr class="mb-4">
					<h4 class="mb-3">반려동물</h4>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="pet_score">점수</label>
							<select class="custom-select d-block w-100" id="pet_score" required="">
								<c:forEach var="i" begin="1" end="11" step="1">
									<option value="i">${(i-1)*0.5 }</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-9 mb-3">
							<textarea class="form-control" name="" id="pet_comments" rows="3" placeholder="코멘트를 입력해주세요"></textarea>
						</div>
					</div>

					<!-- 추가항목 시작 -->
					<hr class="mb-4">
					<h4 class="mb-3">추가항목</h4>
					<div class="form-group row" style="align-items: center; display: flex; justify-content: center;">
						<label for="colFormLabel" class="col-sm-2 col-form-label">항목명</label>
						<div class="col-sm-7">
							<input type="email" class="form-control" id="colFormLabel" placeholder="ex) 주변 도서관 상태(점수), 고척돔까지(시간)">
						</div>
					</div>
					<div class="form-group row" style="align-items: center; display: flex; justify-content: center;">
						<label for="colFormLabel" class="col-sm-2 col-form-label">평가기준</label>
						<div class="col-sm-5">
							<select class="custom-select mr-sm-3" name="timeorScore" id="timeorscore">
								<option value="time">시간</option>
								<option value="score">점수</option>
							</select>
						</div>
						<div class="col-sm-2">
							<button type="button" class="btn btn-secondary btn-sm">항목추가</button>
						</div>
					</div>

					<hr class="mb-4">
					<div class="row">
						<h5 class="mb-3 col-sm-4">추가항목명1(점수)</h5>
						<div class="col-sm-2">
							<button type="button" class="btn btn-secondary btn-sm">항목삭제</button>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="plus_score1">점수</label>
							<select class="custom-select d-block w-100" id="plus_score1" required="">
								<c:forEach var="i" begin="1" end="11" step="1">
									<option value="i">${(i-1)*0.5 }</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-9 mb-3">
							<textarea class="form-control" name="" id="plus_comments1" rows="3" placeholder="코멘트를 입력해주세요"></textarea>
						</div>
					</div>
					<hr class="mb-4">
					<div class="row">
						<h5 class="mb-3 col-sm-4">추가항목명2(시간)</h5>
						<div class="col-sm-2">
							<button type="button" class="btn btn-secondary btn-sm">항목삭제</button>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="plus_time2">시간</label>
							<input type="text" class="form-control" id="deposit" placeholder="ex) 30">
							분
						</div>
						<div class="col-md-9 mb-3">
							<textarea class="form-control" name="" id="plus_comments2" rows="3" placeholder="코멘트를 입력해주세요"></textarea>
						</div>
					</div>
					<!-- 추가항목 끝 -->
				</div>
			</div>
			<!-- 본문 좌측 영역 끝 -->

			<hr class="mb-4">
			<h4 class="mb-3">코멘트</h4>
			<div class="col-md-12 mb-3">
				<label for="good">장점</label>
				<textarea class="form-control" name="" id="good" rows="3" placeholder="코멘트를 입력해주세요"></textarea>

				<label for="bad">단점</label>
				<textarea class="form-control" name="" id="bad" rows="3" placeholder="코멘트를 입력해주세요"></textarea>

				<label for="etc">기타</label>
				<textarea class="form-control" name="" id="etc" rows="3" placeholder="코멘트를 입력해주세요"></textarea>
			</div>

			<hr class="mb-4">
			<h4 class="mb-3">비밀 코멘트</h4>
			<div class="col-md-12 mb-3">
				<textarea class="form-control" name="" id="secret_comments" rows="3" placeholder="코멘트를 입력해주세요"></textarea>
			</div>

			<hr class="mb-4">
			<button class="btn btn-primary btn-lg btn-block" type="submit" style="margin-bottom: 50px;">작성 완료</button>
		</form>
	</div>



	<!-- footer 영역 -->
	<div></div>

</body>
</html>