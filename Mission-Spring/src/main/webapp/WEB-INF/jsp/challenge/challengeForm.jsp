<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/header.jsp" />



<section class="appoinment-section section">
    <div class="container">
        <div class="row">
            

	    <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="contact-area">
                
	    <div class="section-title">
	        <h3>挑戦金額
	            <span>を設定してください。</span>
	        </h3>
	    </div>


<form class="default-form contact-form" method="post"
          action="${ pageContext.request.contextPath }/challengeProcess">

		<c:if test='${ challengeName.substring(0,2).equals("食費") }' >
			<input type="hidden" name="challengeType" value="3" />		
		</c:if>
		<c:if test='${ challengeName.substring(0,2).equals("カフェ") }' >
			<input type="hidden" name="challengeType" value="4" />		
		</c:if>
		<c:if test='${ challengeName.substring(0,3).equals("コンビニ") }' >
			<input type="hidden" name="challengeType" value="5" />		
		</c:if><c:if test='${ challengeName.substring(0,1).equals("酒") }' >
			<input type="hidden" name="challengeType" value="6" />		
		</c:if>
		<c:if test='${ challengeName.substring(0,2).equals("ショッピング") }' >
			<input type="hidden" name="challengeType" value="7" />		
		</c:if>
		<c:if test='${ challengeName.substring(0,3).equals("美容") }' >
			<input type="hidden" name="challengeType" value="9" />		
		</c:if>	

	    
        <div class="row">
            
         
            <div class="col-md-12 col-sm-12 col-xs-12">
            	<div class="form-group">
            		<input type="hidden" name="challengeName" value="${ challengeName }" />
                    <input type="text" name="targetAmount" class="form-control" placeholder="挑戦する金額を入力してください。"/><span></span>
                </div>
            </div>

            <div class="col-md-12 col-sm-12 col-xs-12">         
                <div class="form-group text-center">
                    <button type="submit" class="btn-style-one">挑戦の始まり</button>
                </div>
            </div>
        </div>
    </form>




   </div>                        
  </div>
            
      <div class="col-md-6 col-sm-12 col-xs-12">
        <div class="accordion-section">
		    <div class="section-title">
		        <h3>注意事項</h3>
		        <br>
		        <br>
		        <br>
		        <h4>先月 ${ challengeName.substring(0, challengeName.length()-3) } 総消費額は<br>
		           <span style="color:red">${ String.format("%,d",lastMonthSumByCatesgory) }</span>￥です。<br>
		           <br>該当カテゴリーの先月の支出額を確認して<br> 慎重に決めてください！
		        </h4>
		    </div>
		</div>
      </div>      
            
            
   </div>                    
</div>
</section>

<br>
<br>
<br>
<br>
<br>
	
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" /> 
	<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />
</body>
</html>