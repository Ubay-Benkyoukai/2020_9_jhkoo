<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	function checkForm(){
		alert("新しい情報を保存できました。違いうちに景品をお届けします。")
		return true
	}
	
</script>

<script src="http://code.jquery.com/jquery-3.5.1.min.js" ></script>
<style>
	.error {
		color:red;
	}
</style>
<script src="${pageContext.request.contextPath }/resources/assets/js/checkData.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/table.css"> 
</head>
<body>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" />



<section class="appoinment-section section">
    <div class="container">
        <div class="row">
            

	    <div class="col-md-12 col-sm-12 col-xs-12">
        	<div class="contact-area">
		    <div class="section-title">
		        <h4>あたりまして、おめでとうございます。</h4><br>
				<h3>顧客様の会員情報を確認してください。</h3>
		    </div>
			</div>
                
                
        <form:form commandName="memberVO" class="default-form contact-form" method="post" onsubmit="return checkForm()">
        
        <div class="row">
                
			<div class="col-md-12 col-sm-12 col-xs-12">
                <div>
                    <form:input type="hidden" path="id" value="${ loginVO.getId() }" />
                    <form:input type="hidden" name="password" path="password" value="${ loginVO.getPassword() }" />
                    <form:input type="hidden" path="ageGroup" value="${ loginVO.getAgeGroup() }" />
                    <form:input type="hidden" path="gender" value="${ loginVO.getGender() }" />
                    <form:input type="hidden" path="propertyStatus" value="${ loginVO.getPropertyStatus() }" />
                    <form:input type="hidden" path="jobKey" value="${ loginVO.getJobKey() }" />
                </div>
                
                <!-- 情報チェック START -->   
				<div class="container table-wrapper">
				<h1>&nbsp;</h1>
				<p>景品の配達のために正確な情報を書いてください。</p> 
				<hr>           
					<table class="table table-hover fl-table" style="width:500px">
					    <thead>
					      <tr>
					        <th width="100">　</th>
					        <th>　</th>
					      </tr>
					    </thead>
					    
					    <tbody>
					    
					    <!-- 1. ID -->
					    <tr>
					     <td>ID</td>
					     <td>${ loginVO.getId() }</td>
						</tr>
					    <!-- 2. 名前 -->
					    <tr>
					     <td>名前</td>
					     <td>
					     <form:input type="text" path="name" placeholder="名前" value="${ loginVO.getName() }" />
	                     <form:errors path="name"  class="error" />
					     </td>
						</tr>

					    
					    <!-- 3. 電話番号 -->
					    <tr>
					     <td>電話番号</td>
					     <td>
					     <form:input type="text" path="phone" placeholder="電話番号   ex)010-0000-0000" value="${ loginVO.getPhone() }" />
	                     <form:errors path="phone"  class="error" />
	                     </td>
						</tr>
					    <!-- 4. メール -->
					    <tr>
					     <td>メール</td>
					     <td>
						 <form:input type="email" path="email" placeholder="メール   ex)xxx@domain.com" value="${ loginVO.getEmail() }"/>
                    	 <form:errors path="email"  class="error" />
						 </td>
						</tr>
					    <!-- 5. 住所 -->
					    <tr>
					     <td>住所</td>
					     <td><form:input type="text" path="address" placeholder="住所   ex)東京都中央区日本橋 " value="${ loginVO.getAddress() }"/></td>
						</tr>
					
					    </tbody>
					</table>
					<h1>&nbsp;</h1>
				</div>  
				<!-- 情報チェック END -->

            </div>
            
            <div class="col-md-12 col-sm-12 col-xs-12">         
                <div class="form-group text-center">
                    <button type="submit" class="btn-style-one">保存する</button>
                </div>
            </div>
        </div>
    </form:form>

   </div>                        
  </div>



            
        </div>                    
    </div>
</section>














<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />
</body>
</html>