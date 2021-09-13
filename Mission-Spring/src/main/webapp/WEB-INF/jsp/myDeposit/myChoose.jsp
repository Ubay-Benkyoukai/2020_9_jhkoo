<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choose.jsp - myDeposit </title>

</head>
<body>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" />



<section class="service-section bg-gray section">
    <div class="container">
        <div class="section-title text-center">
            <h3>入金
                <span>をする</span>
            </h3>
            <p>入金する通帳を選択してください。</p>  <!-- 입금할 통장을 선택하세요 -->
        </div>
        <div class="row items-container clearfix">
        
        
        <c:forEach items="${ depositAccountList }" var="account">
        	<div class="item">
                <div class="inner-box">
                    
                    <div class="image-content text-center" onclick="location.href='${pageContext.request.contextPath }/myDeposit/${ account.getAccountNumber() }'" >
                        <h6>${ account.getBankBookKey() }</h6>
                        <p>    口座番号 : ${ account.getAccountNumber() }<br>
                        	      残額 : ${ String.format("%,d", account.getBalance()) }￥ <br>
                                                             別称 : ${ account.getNickName() }</p>
                    </div>

                </div>
            </div>
        </c:forEach> 

           
        </div>
    </div>

</section>



<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />
</body>
</html>