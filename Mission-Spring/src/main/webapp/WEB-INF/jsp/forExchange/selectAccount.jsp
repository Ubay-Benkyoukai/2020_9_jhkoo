<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>selectAccount page</title>


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
                <div class="section-title">
	        		<h3>取引口座を選択してください</h3>
	    		</div>
	                
	  <div class="container table-wrapper">
	  
	  <table class="table table-hover fl-table">
	    <thead>
	      <tr>
	        <th>通帳名</th>
	        <th>内容</th>
	        <th>主取引口座</th>
	        <th>残額</th>
	        <th>詳細の内訳</th>
	      </tr>
	    </thead>
	    <tbody>
	    
	     <c:forEach items="${ depositAccountList }" var="account">
	      <tr>
	       <td>
	        <a href="javascript:doDepositManage('${ account.getAccountNumber() }')">
	        	${ account.getBankBookKey() }
	        </a>
	       </td>
	       
	       <td>${ account.getNickName() }</td>
	       
	       <c:if test="${ account.getMainAccount() == 'Y'}">
	       	<td><span style="color:blue;">主取引口座</span></td>
	       </c:if>
	       <c:if test="${ account.getMainAccount() == 'N'}">
	       	<td><span>&nbsp;</span></td>
	       </c:if>
	
	       <td>${ String.format("%,d", account.getBalance()) }￥</td>
	       
	       <td>
	       	<input type="button" value="この口座選択" class="btn-style-one" onclick="location.href='${ pageContext.request.contextPath }/forExchange/enterAmount '">
	       </td>
	       
	       </tr>
	     </c:forEach>
	
	    </tbody>
	  </table>
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
