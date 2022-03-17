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




<!--Service Section-->
<section class="service-section bg-gray section">
    <div class="container">
        <div class="section-title text-center">
            <h3>預金/積金
                <span>商品加入</span>
            </h3>
            <p>開設する商品の種類を選択してください。</p>
        </div>
        <div class="row items-container clearfix">
           
            <div class="item">
                <div class="inner-box">
                    
                    <div class="image-content text-center" onclick="location.href='${ pageContext.request.contextPath }/product/depositFreeChoose'">
                        <span>Checking account</span>
                        
                            <h6>入出金自由預金</h6>
                        
                        <p>入出金自由預金は代表的な要求払い預金で、加入対象、預け入れ金額、預け入れ期間、預け入れ回数などに何の制限もなく自由に取り引きすることができる商品です。</p>
                    </div>
                </div>
            </div>
            
            <div class="item">
                <div class="inner-box">
                    
                    <div class="image-content text-center" onclick="location.href='${ pageContext.request.contextPath }/product/savingsChoose'">
                        <span>InstallMent saving</span>
                       
                            <h6>定期積み金</h6>
                        
                        <p>定期積金は毎月一定金額を定期的に納入し、満期日に元利金を支給してもらう商品で、はした金を貯めてまとまった金を用意するのに最も普遍的な長期貯蓄商品です。</p>
                    </div>
                </div>
            </div>
            
           
        </div>
    </div>
</section>
<!--End Service Section--> 



<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />

</body>
</html>