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



<section class="team-section section">
    <div class="container">
        <div class="section-title text-center">
            <h3>開設する商品をお選んでください!</h3> <!-- 입출금이 자유로운 예금 상품을 선택해주세요 -->
            <p>自由な入出金の預金商品を選択してください。</p>
        </div>
        <div class="row">
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="team-member">
                    <img src="${pageContext.request.contextPath }/resources/assets/images/1.png" alt="doctor" class="img-responsive">
                    <div class="contents text-center">
                        <h4>ヤングハナプラス通帳</h4>
                        <p>若いあなた、あなたのためのMust Have通帳</p>
                        <a href="${pageContext.request.contextPath }/product/depositFreeExplain2" class="btn btn-main">개설하기</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="team-member">
                    <img src="${pageContext.request.contextPath }/resources/assets/images/2.png" alt="doctor" class="img-responsive">
                    <div class="contents text-center">
                        <h4>ハナプラス通帳</h4>
                        <p>優遇金利を受け取り、手数料は無制限に免除される通帳</p>
                        <a href="${pageContext.request.contextPath }/product/depositFreeExplain1" class="btn btn-main">개설하기</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="team-member">
                    <img src="${pageContext.request.contextPath }/resources/assets/images/3.png" alt="doctor" class="img-responsive">
                    <div class="contents text-center">
                        <h4>主力ハナ通帳</h4>
                        <p>手数料免除サービスが提供される生活費通帳</p>
                        <a href="${pageContext.request.contextPath }/product/depositFreeExplain3" class="btn btn-main">개설하기</a>
                    </div>
                </div>
            </div>
            
            
             
            
        </div>
    </div>
</section>









<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />

</body>
</html>