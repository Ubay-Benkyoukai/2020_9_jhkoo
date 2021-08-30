<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>

	Kakao.init('8bc9b77c19ddac3da1ce99aed34ab243'); // 카카오 로그인 버튼을 생성합니다.　カカオログインボタンを生成します。
    function sendTo() {

         Kakao.Link.sendCustom({
             templateId: 37243,
             //url: /hanati/participant/invite/${param}      //param은 안심계좌번호
             templateArgs: {
                    name : '${loginVO.name}',
                    content : 'HANA'
             },   callback: function(){
                  alert("招待メッセージが送信されました。");
                  
               }
           })
       }
</script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" />


<!-- Contact Section -->
<section class="blog-section section style-three pb-0">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="contact-area style-two">
                    <div class="section-title">
                        <h3>友達に <span>挑戦 <br> 共有を要請してください。</span></h3>
                    </div>
                    <form:form commandName="friendVO" method="post" class="default-form contact-form">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                            	<div class="form-group">
                            		<form:hidden path="id" value="${ loginVO.id }" />
                                    <h4>送る人 : ${ loginVO.id }</h4>
                                </div>
                                                           
                            </div>
                            
                            <div class="col-md-12 col-sm-12 col-xs-12">
                            	<div class="form-group">
                            		<form:input path="friendId" placeholder="友達IDを入力してください。"/>
                            	</div>
                            </div>
                            
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <form:textarea path="content" placeholder="友達に送る一言" />
                                </div>
                                <div class="form-group text-center">
                                    <button type="submit" class="btn-style-one" onclick="sendTo()">要請を送る</button>
                                    
                                </div>                            
                            </div>
                        </div>
                    </form:form>
                </div>                               
            </div>
            
            <div class="col-md-6 col-sm-12 col-xs-12">
            <br><br><br><br>
            	<img src="${pageContext.request.contextPath }/resources/assets/images/친구.jpg" class="img-responsive" alt="team">
            </div>
            
            
        </div>                    
    </div>
</section>
<!-- End Contact Section --> 


<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />


</body>
</html>