<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function doDelete(){
		location.href = "${ pageContext.request.contextPath }/deleteDepositAccount/${ depositAccount.getAccountNumber()}/${depositAccount.getBalance()}";
	}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" />



<section class="service-section bg-gray section">
<div class="container" align="center">
  
        <div class="section-title text-center">
		    <h3>口座
		        <span>詳細情報</span>
		     </h3>
            <p style="color:red"></p>
        </div>
  
     
 <form action="${ pageContext.request.contextPath }/depositManageChange" method="post">
  <input type="hidden" name="accountNumber" value="${depositAccount.getAccountNumber()}">
  <table class="table table-hover" style="width:50%;">
    <thead>
      
      <tr>
        <th>通帳名</th>
        <th>${ depositAccount.getBankBookKey()}</th>
      </tr>
    </thead>
    <tbody>
    	<tr>
    		<td>口座番号</td>
    		<td>${ depositAccount.getAccountNumber()}</td>
    	</tr>
    	<tr>
    		<td>開設日時</td>
    		<td>${ depositAccount.getRegDate()}</td>
    	</tr>
    	<tr>
    		<td>保有残高</td>
    		<td>${ String.format("%,d", depositAccount.getBalance()) }￥</td>
    	</tr>
    	<tr>
    		<td>状態</td>
    		
    		<c:if test="${ depositAccount.getMainAccount() == 'Y'}">
	    		<td>
	       			<span style="color:blue;">現在メイン口座です。</span>
	    			<input type="radio" name="mainAccount" value="Y" checked="checked" /> メイン口座
					<input type="radio" name="mainAccount" value="N" /> サブ口座
	       		</td>
       		</c:if>
       		<c:if test="${ depositAccount.getMainAccount() == 'N'}">
	       		<td>
	       			<span style="color:green;">現在サブ口座です。</span>
	    			<input type="radio" name="mainAccount" value="Y" /> メイン口座
					<input type="radio" name="mainAccount" value="N" checked="checked" /> サブ口座
	       		</td>
       		</c:if>
       		
    	</tr>
    	<tr>
    		<td>別称</td>
    		<td>
    			<input name="nickName" placeholder="${ depositAccount.getNickName()}">
    		</td>
    	</tr>
    </tbody>
  </table>
  
  <button type="submit" class="btn-style-one">修整</button>
  
  <input type="button" value="脱退" class="btn-style-one" data-toggle="modal" data-target="#deleteModal">
</form>         
</div>
</section>




<!-- 탈퇴 modal ---------------------------------------------------------------------------------------->
<div class="modal fade" id="deleteModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">${ depositAccount.getBankBookKey() }を使うのをやめますか?</h4>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
         	 保有残高はメイン口座に自動振替されます。
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn-style-one" data-dismiss="modal">キャンセル</button>
          <button type="button" class="btn-style-one" onclick="doDelete()">確認</button>
        </div>
        
      </div>
    </div>
  </div>



<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />
</body>
</html>