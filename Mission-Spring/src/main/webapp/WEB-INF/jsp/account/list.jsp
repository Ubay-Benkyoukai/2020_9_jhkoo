<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js" ></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/table.css"> 
<script>

	/* 관리 管理 */
	function goCashManage(){
		location.href = "${ pageContext.request.contextPath }/cashManage";
	}

	function doDepositManage(param){
		location.href = "${ pageContext.request.contextPath }/depositManage/" + param;
	}
	
	function doSavingsManage(param){
		location.href = "${ pageContext.request.contextPath }/savingsManage/" + param;
	}

	
	/* 내역 内訳 */
	function goDepositDetail(accountNumber){
		 location.href = "${ pageContext.request.contextPath}/depositDetail/" + accountNumber;
	}
	
	function goSavingsDetail(accountNumber){
		location.href = "${ pageContext.request.contextPath}/savingsDetail/" + accountNumber;
	}
	
	
	/* 추천 推薦 */
	function goDepositRecommend(){
		if( ${ageGroupDepositAccountBankBook} == "0" ){
			location.href = "${ pageContext.request.contextPath }/product/depositFreeChoose";
		}else{
			location.href = "${ pageContext.request.contextPath }/product/depositFreeExplain" + ${ageGroupDepositAccountBankBook};	
		}
	}
	
	function goSavingsRecommend(){
		if( ${ jobSavingsAccountBankBook } == "0" ){
			location.href = "${ pageContext.request.contextPath }/product/savingsChoose";
		}else{
			location.href = "${ pageContext.request.contextPath }/product/savingsExplain" + ${jobSavingsAccountBankBook};	
		}
	}
	
	function goChallenge(){
		location.href = "${ pageContext.request.contextPath }/challengeChoose";
	}
	
	
	/* 잦은 지출 상세 내역 頻繁な支出詳細の内訳 */
	$(document).ready(function(){
		$('.frequentDetailBtn').click(function(){
			let btn = this;
			let elements = $(this).attr('id').split('.');
			let str = '';
			
			$.ajax({
				url : '${ pageContext.request.contextPath }/frequentDetail',
				type : 'get',
				data : {
					accountNumber : elements[0],
					toName : elements[1]
				},
				success : function(data){
					
					$('#modalDiv').empty();
					let list = JSON.parse(data);
					
					$(list).each(function(){
						
					
						str += '<hr>';
						str += '<div>';
						str += '<strong>' + this.logDate + '</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
						str += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ' + this.amount + '원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
						str += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + this.toName + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
						str += '</div>';
					})
					
					$("#modalDiv").append(str);
					$("#frequentModal").modal('show');

				}
			})
			
		})
	})
	
</script>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/include/header.jsp" />



<br>
<br>
<br>

	<div class="section-title text-center">
         <h3>${ loginVO.getName() }様の ${month}月<br>
            <span> 純資産は ${ String.format("%,d", totalBalance) }￥です。 </span><br>
            
         </h3>
         <c:if test="${ totalBalanceChange < 0 }">
        	 <h4 style="color:red">先月比総資産が ${ String.format("%,d", totalBalanceChange) }￥　減少しました。 </h4>
         </c:if>
         <c:if test="${ totalBalanceChange > 0 }">
        	 <h4 style="color:red">先月比総資産が ${ String.format("%,d", totalBalanceChange) }￥ 増加しました。</h4>
         </c:if>
    </div>

<br>


<!-- 입출금 자유 入出金自由----------------------------------------------------------------------------------------------------------->

<div class="container table-wrapper">
  <h2>&nbsp;</h2>
  <p>入出金口座の総額  &nbsp; : &nbsp; <span style="color:red">${ String.format("%,d", depositTotalBalance) }</span> &nbsp; ￥</p> 
  <hr>           
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
       	<input type="button" value="詳細を見る" class="btn-style-one" onclick="goDepositDetail('${account.getAccountNumber()}')">
       </td>
       
       </tr>
     </c:forEach>

    </tbody>
  </table>
</div>



<!-- 적금 積金------------------------------------------------------------------------------------------------------------------>

<div class="container table-wrapper">
  <h2>&nbsp;</h2>
  <p>積金口座総額  &nbsp; : &nbsp; <span style="color:red">${ String.format("%,d", savingsTotalBalance) }</span> &nbsp; ￥</p>  
  <hr>          
  <table class="table table-hover fl-table">
    <thead>
      <tr>
        <th>積金名</th>
        <th>内容</th>
        <th>出金口座</th>
        <th>残額</th>
        <th>詳細の内訳</th>
      </tr>
    </thead>
    <tbody>
    
     <c:forEach items="${ savingsAccountList }" var="account">
      <tr>
      	
       <td>
         <a href="javascript:doSavingsManage('${ account.getAccountNumber() }')">
      	   ${ account.getBankBookKey() } 
         </a>
       </td>
      
       <td>${ account.getNickName() }</td>
       
       <td>${ account.getAutoSaving()}</td>
       

       <td>${ String.format("%,d", account.getBalance()) }￥</td>
       
       <td>
       	<input type="button" value="詳細を見る" class="btn-style-one" onclick="goSavingsDetail('${account.getAccountNumber()}')">
       </td>
       
       
      </tr>
     </c:forEach>

    </tbody>
  </table>
</div>

<br>
<br>

<!--현금 現金 ------------------------------------------------------------------------------------------------------------------->

<div class="container ">

	<table class="table table-hover ">
    <tbody>
      <tr>
       <td id="myCash">保有現金  &nbsp; : &nbsp; <span style="color:red" >${ String.format("%,d", cash) }</span> &nbsp; ￥ </td> 
       <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
       <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
       <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
       <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
       
       <td><input type="button" value="内訳管理" class="btn-style-one" onclick="goCashManage()"></td>
    </tbody>
    </table>
</div>


<!----------------------------------------------------------------------------------------------------------------->
<section class="service-section bg-gray section" style="height:420px">
    <div class="container">
        <div class="section-title text-center">
            <h3>${ loginVO.name }様
                <span>にお勧めします。</span>
            </h3>
        </div>
        <div class="row items-container clearfix">
        
        
       
        	<div class="item">
                <div class="inner-box">
                    
                    <div class="image-content text-center">
                        <h6>お客様が<br>進行中の挑戦を管理してください！ </h6><br>
                        <input type="button" value="見に行く" class="btn-style-one" onclick="goChallenge()">
                    </div>
                </div>
            </div>
        
        	<div class="item">
                <div class="inner-box">
                    
                    <div class="image-content text-center">
                        <h6>'${ loginVO.ageGroup }' Pick <br>
                                                         入出金自由預金商品は<br>
                            <c:if test="${ ageGroupDepositAccountBankBook.equals(\"0\") }">
                        	まだありません。<br>
                        	全体賞品を見に行きましょう。
                        	</c:if>
                            <c:if test="${ ageGroupDepositAccountBankBook.equals(\"1\") }">'ハナプラス通帳'です。</c:if>
                            <c:if test="${ ageGroupDepositAccountBankBook.equals(\"2\") }">'ヤングハナプラス通帳'です。</c:if>
                            <c:if test="${ ageGroupDepositAccountBankBook.equals(\"3\") }">'主力ハナ通帳'です。</c:if>
                        </h6>
                        <input type="button" value="見に行く" class="btn-style-one" onclick="goDepositRecommend()">
                    
                    </div>
                </div>
            </div>

			<div class="item">
                <div class="inner-box">
                    
                    <div class="image-content text-center">
                    <!-- //내 직업과 같은 사람들이 가장 많이든 적금 계좌 -->
                        <h6>'${ loginVO.jobKey }' Pick <br>
                        	  定期積金賞品は<br>
                        	<c:if test="${ jobSavingsAccountBankBook.equals(\"0\") }">
                        	まだありません。<br>
                        	全体賞品を見に行きましょう。
                        	</c:if>
                        	<c:if test="${ jobSavingsAccountBankBook.equals(\"1\") }">'ハナワンキュウ積金'です。</c:if>
                            <c:if test="${ jobSavingsAccountBankBook.equals(\"2\") }">'マイホームを購入する積金'です。</c:if>
                            <c:if test="${ jobSavingsAccountBankBook.equals(\"3\") }">'夢ハナ積金'です。</c:if>
                         </h6>
                        <input type="button" value="見に行く" class="btn-style-one" onclick="goSavingsRecommend()">
                    </div>
                </div>
            </div>

           
        </div>
    </div>
</section>


<!-- 잦은 거래 頻繁な取引 --------------------------------------------------------------------------------- -->

<section class="service-section bg-gray section" style="height:420px">
    <div class="container">
        <div class="section-title text-center">
            <h3>${ month }月
                <span>頻繁な支出リストです。</span>
            </h3>
        </div>
        <div class="row items-container clearfix">       
        
       	  <c:forEach items="${ frequentExpenditureList}" var="account">
       	  <c:if test='${ !account.toName.equals(loginVO.name) && account.count >=3 }'>
        	<div class="item">
                <div class="inner-box">
                    
                    <div class="image-content text-center">
                        <h6>${ account.toName }
                             <br> 総 ${ account.count }番 支出</h6><br>
                        <input type="button" value="内訳を見る" class="frequentDetailBtn btn-style-one" id="${ account.accountNumber }.${ account.toName }">
                    </div>
                </div>
            </div>
         </c:if>   
         </c:forEach>
        	  
        </div>
    </div>
</section>


<!-- 지출 Top3  --------------------------------------------------------------------------------- -->

<section class="service-section bg-gray section" style="height:420px">
    <div class="container">
        <div class="section-title text-center">
            <h3>${ month }月
                <span>支出Top3です。</span>
            </h3>
        </div>
        <div class="row items-container clearfix">       
        
       	  <c:forEach items="${ expenditureTop3List}" var="account">
        	<div class="item">
                <div class="inner-box">
                    
                    <div class="image-content text-center">
                        <h6>${ account.toName } 
                             <br> ${ String.format("%,d", account.amount) }￥ 支出
                             <br>${ account.logDate }</h6><br>
                    </div>
                </div>
            </div>
         </c:forEach>
        	  
        </div>
    </div>
</section>



<br>
<br>
<!-- 모달-----------------------------------------------------  -->
<div class="modal fade" id="frequentModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">頻繁な支出内訳を見る</h4>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" id= "modalDiv">
         	
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn-style-one" data-dismiss="modal">確認</button>
        </div>
        
      </div>
    </div>
  </div>



<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />

</body>
</html>