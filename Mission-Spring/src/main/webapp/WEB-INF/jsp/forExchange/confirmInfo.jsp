<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>confirmInfo page</title>


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
                
    <form name="contact_form" class="default-form contact-form" 
    	  action="${ pageContext.request.contextPath }/" method="post"
    	  onsubmit="return checkForm()">
    		
        <div class="row">

            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="form-group text-center">
                	<input type="text" name="enterAmount" placeholder="">
                </div>
            </div>

            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="form-group text-center">
                    <button type="submit" class="btn-style-one">次へ</button>
                </div>
            </div>
            
        </div>
    </form>
	<div align="center" style="float:right;">
	 <button type="submit" class="btn-style-one" 
	   onclick="location.href='${ pageContext.request.contextPath }/forExchange/enterAmount '">戻る</button>
  	</div>

</div>                        
            </div>
        </div>                    
    </div>
</section>
<br>
<br>
<br>
    	  

<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />



</body>
</html>
