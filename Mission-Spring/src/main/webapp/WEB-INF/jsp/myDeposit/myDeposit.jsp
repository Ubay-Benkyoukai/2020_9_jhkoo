<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js" ></script>
<script>


/* 20row : Number() string을 int로 해주는 jquery 함수 */
/*
	$(document).ready(function(){
		
		$('.addbalanceBtn').click(function(){
			let btn = this;
			let addbalance = Number( $(this).attr('id') ) ;
			let originBalance = Number( $('#depositMoney').val() );
			
			$('#depositMoney').val(addbalance + originBalance);
		})
	})
*/
	
	
</script>
</head>
<body>


<jsp:include page="/WEB-INF/jsp/include/header.jsp" /> 


      
<section class="appoinment-section section">
    <div class="container">
        <div class="row">

            
<div class="col-md-6 col-sm-12 col-xs-12">
    <div class="contact-area">
    
	


	<!-- form 태그. 백엔드 체크. 중요 정보인 상대 계좌 번호르 모달 띄워 상기 시킴 -->
	<form:form commandName="myDepositVO" method="post">
	        <div class="row">
	            
	            <div class="section-title">
	   				 <h3>${ depositAccount.getBankBookKey() }</h3>
	   				 <p>&nbsp;&nbsp;&nbsp;ハナ銀行口座 ${ depositAccount.getAccountNumber() }  
	   				 &nbsp;&nbsp;&nbsp;残額 :  ${ String.format("%,d", depositAccount.getBalance()) }￥</p>
					 
				</div>
	            
	            
	            <div class="col-md-12 col-sm-12 col-xs-12">
	            	<!-- 계좌번호와, 타입(이체)는 입력받지 않으므로 hidden으로 넘김 -->
	            	<form:input path="accountNumber" value="${ depositAccount.getAccountNumber() }"/>	

	                <div class="form-group">
	                	<label>balance &nbsp;</label>
	                	<form:input path="balance" class="form-control" value="${ depositAccount.getBalance() }"/>
	                </div>  
	                
	                    
					<div class="form-group">
						<label>content &nbsp;</label> 
						<form:input path="content" class="form-control"  placeholder="... "/>
					</div>
					
					<div class="form-group">
	                	<label>入金金額 &nbsp;</label> <form:errors path="depositMoney" class="error" />
	                	<form:input path="depositMoney" class="form-control"  placeholder="0円 "/>
	                </div>  
	                
	                <div class="form-group text-center">
	                    <button type="submit" class="btn-style-one" >入金</button>
	                </div>   
	
	            </div>
	            
	            
	        </div>
	    </form:form>
	</div>                        
</div>

        </div>                    
    </div>
</section>


<!-- Modal -->
<!-- 
  <div class="modal fade" id="confirm">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        Modal Header
        <div class="modal-header">
          <h4 class="modal-title">이체 내용 확인하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        Modal body
        <div class="modal-body">
          
        </div>
        
        Modal footer
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>

 -->





	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" /> 
	<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" /> 


</body>
</html>