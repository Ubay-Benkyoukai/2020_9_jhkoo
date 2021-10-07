<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
<script>
	// 도전 신청하러~ 挑戦の申し込み
	function goChallenge(param){
		location.href="${pageContext.request.contextPath }/challenge/" + param
	}

</script>

</head>
<body>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" /> 
	
<section class="team-section section">
    <div class="container">
    
        <div class="row">
            <div class="col-md-12">
            
                <div class="section-title text-center">
                    <h3>
                        <span> 選択してください。 </span>
                    </h3>
                </div>
                
                <!-- Nav tabs -->
                <div class="tabs">
                    <ul class="nav nav-tabs" role="tablist">
                        
                        <li role="presentation">
                            <a href="#eventContents" data-toggle="tab">イベント内容</a>
                        </li>
                         
                        <li role="presentation">
                            <a href="#goodsContents" data-toggle="tab">景品登録</a>
                        </li>
                        
                        <li role="presentation">
                            <a href="#goodsModify" data-toggle="tab">景品修正</a>
                        </li>
                        
                    </ul>
                </div>
                <div class="tab-content">
                    
                    <!--Start single tab content-->
                    <div class="team-members tab-pane fade in row" id="eventContents">

					<section class="service-section bg-gray section">
					<div class="container">
					<div class="section-title text-center">

						<jsp:include page="/WEB-INF/jsp/event/modifyEvent.jsp" /> 
							
					</div>
					</div>
					</section> 

                    </div>
                    <!--End single tab content-->
                    
                    <!--Start single tab content-->
                    <div class="tab-pane fade in row" id="goodsContents">
                        
						<section class="service-section bg-gray section">
						    <div class="container">
						        <div class="section-title text-center">
						            <jsp:include page="/WEB-INF/jsp/event/goodsInsert.jsp" /> 
						        </div>
						    </div>
						</section>                        

                   </div>
                   <!--End single tab content-->
                   
                   <!--Start single tab content-->
                    <div class="tab-pane fade in row" id="goodsModify">
                        
						<section class="service-section bg-gray section">
						    <div class="container">
						        <div class="section-title text-center">
						            <jsp:include page="/WEB-INF/jsp/event/goodsModify.jsp" /> 
						        </div>
						    </div>
						</section>                        

                   </div>
                   <!--End single tab content-->
                    
                </div>
            </div>
        </div>
    </div>
</section>	
	
 	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" /> 
	<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" /> 
</body>
</html>