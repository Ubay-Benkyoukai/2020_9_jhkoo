<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/header.jsp" />

	<br>
	<br>

	<section class="appoinment-section section">
		<div class="container">
			<div class="row">


				<div class="col-md-6 col-sm-12 col-xs-12">
					<div class="contact-area">

						<div class="section-title">
							<h3>支出内容を入力してください</h3>
						</div>



						<form:form commandName="expensesVO"
							class="default-form contact-form" method="post" name="lform">

							<div class="row">
								<div class="col-md-6 col-sm-12 col-xs-12">
									<div class="form-group">
										<form:input type="date" path="expenses_date" placeholder="支出日  ex)2021-09-28" />
									</div>

									<div class="col-md-6 col-sm-12 col-xs-12">
										<div class="form-group">
											<form:select path="expenses_category_key">
												<option value="">選択してください。</option>
												<option value="食費">食費</option>
												<option value="日用品費">日用品費</option>
												<option value="交際・娯楽費">交際・娯楽費</option>
												<option value="住居費">住居費</option>
												<option value="水道光熱費">水道光熱費</option>
												<option value="通信費">通信費</option>
												<option value="保険料">保険料</option>
												<option value="教育費">教育費</option>
												<option value="その他">その他</option>
											</form:select>
										</div>
									</div>
								</div>
								
								<div class="form-group">
                    <form:input type="text" path="expenses_content" placeholder="支出内容   ex)シャンプー " />
                
                </div>

								<div class="col-md-6 col-sm-12 col-xs-12">
									<div class="form-group">
										<form:input type="number" path="expenses_price" placeholder="金額" />
									</div>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<br>
	<br>

	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
	<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />
</body>
</html>