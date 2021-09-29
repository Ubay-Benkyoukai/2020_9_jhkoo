<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>expensesHome page</title>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/include/header.jsp" />

<br>
<br>

 <section class="service-section bg-gray section">
    <div class="container">
        <div class="section-title text-center">
            <h3>ご利用になるサービスを選択してください。 </h3>
        </div>
        <div class="row items-container clearfix">
           
            <div class="item">
                <div class="inner-box">
                    
                    <div class="image-content text-center" onclick="location.href='${ pageContext.request.contextPath }/expenses/inputExpenses'">
                        <h5>支出内容を登録する</h5>
                    </div>
                </div>
            </div>
            
            <div class="item">
                <div class="inner-box">
                    
                    <div class="image-content text-center" onclick="location.href='${ pageContext.request.contextPath }/expenses/searchExpenses'">
						<h5>支出内容を検索する</h5>
                    </div>
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