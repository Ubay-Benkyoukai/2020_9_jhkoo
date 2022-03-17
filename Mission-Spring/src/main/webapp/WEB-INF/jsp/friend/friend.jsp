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
            <h3>友達
                <span>と挑戦を共有する </span>
            </h3>
            <p style="color:red">友達と自分の挑戦を共有してください。 目標は共有するほど成功確率が高くなります！ </p>
        </div>
        <div class="row items-container clearfix">
           
            <div class="item">
                <div class="inner-box">
                    
                    <div class="image-content text-center" onclick="location.href='${ pageContext.request.contextPath }/friend/sendRequest'">
                        <h6>要請を送る</h6>
                        <p>挑戦を共有したい友達に <br> 要請を送ってください。</p>
                    </div>
                </div>
            </div>
            
            <div class="item">
                <div class="inner-box">
                    
                    <div class="image-content text-center" onclick="location.href='${ pageContext.request.contextPath }/friend/requestManage'">
						<h6>要請管理</h6>
                        <p>自分が送った要請と受けた要請を <br> 管理してください。</p>
                    </div>
                </div>
            </div>
            
            <div class="item">
                <div class="inner-box">
                    
                    <div class="image-content text-center" onclick="location.href='${ pageContext.request.contextPath }/friend/compare'">
						<h6>共有された挑戦を見る</h6>
                        <p>友達が挑戦に成功するように<br> モニタリングしてください。</p>
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