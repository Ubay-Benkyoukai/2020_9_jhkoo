<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function joinNewCard() {
		location.href = "${ pageContext.request.contextPath}/card/joinCard/" + "0";
	}
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/jsp/include/header.jsp" />


	<!-- Contact Section -->



	<section class="appoinment-section section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="accordion-section">
						<div class="section-title">
							<h3>「HANA-zero」カード</h3>
						</div>



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
											1.毎日0.5%キャッシュバック<br> 
											2.シンプルでオシャレなデザイン<br> 
											3.年会費なしのカード<br>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingTwo">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse"
												data-parent="#accordion" href="#collapseTwo"
												aria-expanded="false" aria-controls="collapseTwo">
												「HANA-zero」カード特徴情報 </a>
										</h4>
									</div>
									<div id="collapseTwo" class="panel-collapse collapse"
										role="tabpanel" aria-labelledby="headingTwo">
										<div class="panel-body">
											登録対象:ハナ銀行の入出金口座を持っている個人<br>
											カードの種類:キャッシュカード<br>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="form-group text-center">
								<button onclick="joinNewCard()" class="btn-style-one">加入する</button>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Contact Section -->


	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
	<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />

</body>
</html>