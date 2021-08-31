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


<!--team section-->
<section class="team-section section">
    <div class="container">
        <div class="section-title text-center">
            <h3>積み立て商品を選択してください。</h3>
            <p>積み立て商品を選択してください。</p>
        </div>
        <div class="row">
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="team-member">
                    <img src="${pageContext.request.contextPath }/resources/assets/images/1.png" alt="doctor" class="img-responsive">
                    <div class="contents text-center">
                        <h4>ハナワンキュウ積金</h4>
                        <p>手軽に優遇金利を提供するスマートフォンの積み金</p>
                        <a href="${pageContext.request.contextPath }/product/savingsExplain1" class="btn btn-main">概説</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="team-member">
                    <img src="${pageContext.request.contextPath }/resources/assets/images/2.png" alt="doctor" class="img-responsive">
                    <div class="contents text-center">
                        <h4>マイホームを購入する積金</h4>
                        <p>マイホームの夢をハナ銀行が応援します</p>
                        <a href="${pageContext.request.contextPath }/product/savingsExplain2" class="btn btn-main">概説</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="team-member">
                    <img src="${pageContext.request.contextPath }/resources/assets/images/3.png" alt="doctor" class="img-responsive">
                    <div class="contents text-center">
                        <h4>夢ハナ積金</h4>
                        <p>宝物のような我が子のための積金</p>
                        <a href="${pageContext.request.contextPath }/product/savingsExplain3" class="btn btn-main">概説</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--End team section-->








<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />

</body>
</html>