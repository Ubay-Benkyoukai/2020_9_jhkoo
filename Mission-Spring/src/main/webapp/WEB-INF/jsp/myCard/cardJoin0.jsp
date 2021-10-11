<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Card0 register</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>

	<jsp:include page="/WEB-INF/jsp/include/header.jsp" />

	<section class="appoinment-section section">
		<div class="container">
			<div class="row">


				<div class="col-md-6 col-sm-12 col-xs-12">
					<div class="contact-area">


						<!-- form 태그 --> <!-- 39Line 비활성화로 값 고정하는거 알아보기 -->
						<form:form commandName="CardVO" method="post">
							<div class="row">
								<div class="section-title">
									<h3>${ depositAccount.getBankBookKey() }</h3>
									<p>&nbsp;&nbsp;&nbsp;ハナ銀行口座 ${ depositAccount.getAccountNumber() }</p>
								</div>

								<div class="col-md-12 col-sm-12 col-xs-12">
									<!-- 계좌번호와, 타입(카드종류)는 입력받지 않으므로 hidden으로 넘김 -->
									<form:hidden path="accountNumber"
										value="${cardVO.getAccountNumber()  }" />
									<form:hidden path="bankCardKey"
									value="${cardVO.getBankCardKey(Card0) } }" />
								</div>
							</div>
						</div>
					</div>
					</form:form>

					<div class="accordion-holder">
						<div class="panel-group" id="accordion" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<h4 class="panel-title">
										<a role="button" data-toggle="collapse"
											data-parent="#accordion" href="#collapseOne"
											aria-expanded="true" aria-controls="collapseOne">
											「HANA-zero」カード特徴 </a>
									</h4>
								</div>
								<div id="collapseOne" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										1. 毎日使用した金額の1%CashBack <br> 2. Global VISA Card<br>

									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingTwo">
									<h4 class="panel-title">
										<a class="collapsed" role="button" data-toggle="collapse"
											data-parent="#accordion" href="#collapseTwo"
											aria-expanded="false" aria-controls="collapseTwo">
											「HANA-zero」カード情報 </a>
									</h4>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="headingTwo">
									<div class="panel-body">1. 하루 카드사용액 최소 5000￥이상 사용시 1% 익일
										캐시백 2. 비자카드로 신청해도 따로 추가요금은 발생하지 않음 3. 월 캐시백 한도는 3만원까지만 제공됨</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingTwo">
									<h4 class="panel-title">
										<a class="collapsed" role="button" data-toggle="collapse"
											data-parent="#accordion" href="#collapseTwo"
											aria-expanded="false" aria-controls="collapseTwo"> 転換可否 </a>
									</h4>
								</div>

							</div>
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingThree">
									<h4 class="panel-title">
										<a class="collapsed" role="button" data-toggle="collapse"
											data-parent="#accordion" href="#collapseThree"
											aria-expanded="false" aria-controls="collapseThree"> 留意事項
										</a>
									</h4>
								</div>
								<div id="collapseThree" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="headingThree">
									<div class="panel-body">캐시백 지급은 전월 카드 사용액이 100000￥이하인
										경우에는 캐시백 월 한도 900￥까지만 지급 단, 카드 발급후 첫 사용달에는 한도최대까지 적용</div>
								</div>
							</div>



						</div>
					</div>

				</div>
				
			</div>
	</section>

</body>


















</html>