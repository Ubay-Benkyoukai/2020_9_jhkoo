<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function doAutoTransfer(sform){
		location.href = "${ pageContext.request.contextPath }/autoTransferConfirm/${ savingsAccount.getAccountNumber()}" ;
	}
	
	function deleteAutoTransfer(param){
		location.href = "${ pageContext.request.contextPath }/autoTransferDelete/${ savingsAccount.getAccountNumber()}" ;
	}
	
</script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" />




<div class="container" align="center">

<br><br><br><br>
  
<div class="section-title">
    <h3>積金
        <span>詳細情報です。</span>
     </h3>
</div> 
  
<br><br>    
 <form action="${ pageContext.request.contextPath }/savingsManageChange" method="post">
  <input type="hidden" name="accountNumber" value="${savingsAccount.getAccountNumber()}">
  <table class="table table-hover" style="width:50%;">
    <thead>
      
      <tr>
        <th>積金 商品名</th>
        <th>${ savingsAccount.getBankBookKey()}</th>
      </tr>
    </thead>
    <tbody>
    	<tr>
    		<td>口座番号</td>
    		<td>${ savingsAccount.getAccountNumber()}</td>
    	</tr>
    	<tr>
    		<td>満期日</td>
    		<td>${ savingsAccount.getSavingDate()}</td>
    	</tr>
    	
    	<tr>
    		<td>保有残額</td>
    		<td>${ String.format("%,d", savingsAccount.getBalance()) }원</td>
    	</tr>
    	<tr>
    		<td>金利</td>
    		<td>${savingsAccount.getRate()}</td>
    	</tr>
    	<tr>
    		<td>別称</td>
    		<td><input name="nickName" placeholder="${ savingsAccount.getNickName()}"></td>
    	</tr>
    	<tr>
    		<td>入金日付</td>
    		<td>
	    		<select name="savingDay">
				    <option selected>現入金日 : 毎月 &nbsp; ${ savingsAccount.getSavingDay()}日 </option>
				    <option value=1>毎月1日</option>
				    <option value=15>毎月15日</option>
				    <option value=28>毎月28日</option>
				</select>
			</td>
    	</tr>
    	
    	<tr>
    		<td>出金口座</td>
    		<td>
    			<select name="autoSaving">
    				<option selected>現在 出金口座 : ${ savingsAccount.getAutoSaving() }</option>
    				<c:forEach items="${ depositAccountNumList }" var="accountNumber">
    					<option value="${accountNumber}">${accountNumber}</option>
    				</c:forEach>
    			</select>
    		</td>
    	</tr>
    	
    	<tr>
    		<td>自動 振り込み </td>
    		<c:if test="${ savingsAccount.getAutoSavingBool() == 'N' }">
    			<td>未使用</td>
    		</c:if>
    		<c:if test="${ savingsAccount.getAutoSavingBool() == 'Y' }">
    			<td>使用中</td>
    		</c:if>
    	</tr>
    	
    	
    	
    </tbody>
  </table>
  
  <button type="submit" class="btn-style-one">修整</button>
  <c:if test="${ savingsAccount.getAutoSavingBool() == 'N' }">
	  <input type="button" value="予約振り込み設定" class="btn-style-one" data-toggle="modal" data-target="#myModal">
  </c:if>
  <c:if test="${ savingsAccount.getAutoSavingBool() == 'Y' }">
	  <input type="button" value="予約振り込み解約" class="btn-style-one" data-toggle="modal" data-target="#myModal2">
  </c:if>
  
</form>         
</div>
 <br>  <br> 

<!-- 예약이체 등록 modal -->
<div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">予約振り込みを設定しますか?</h4>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
         	 毎月の &nbsp; ${ savingsAccount.getSavingDay()}日に登録していただいた口座から振り込みが予約されます。
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn-style-one" data-dismiss="modal">キャンセル</button>
          <button type="button" class="btn-style-one" onclick="doAutoTransfer()">確認</button>
        </div>
        
      </div>
    </div>
  </div>

<!-- 예약이체 해지 modal -->
<div class="modal fade" id="myModal2">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">予約振り込みを解約しますか</h4>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
         	  등록된 출금계좌에서 예약이체가 해지됩니다.
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn-style-one" data-dismiss="modal">キャンセル</button>
          <button type="button" class="btn-style-one" onclick="deleteAutoTransfer()">確認</button>
        </div>
        
      </div>
    </div>
  </div>

<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />
</body>
</html>