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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
var certificationNumber = '';

$(document).ready(function(){
	$('#certCheck').click(function(){
		
		$.ajax({
			type:'get',
			url:'${ pageContext.request.contextPath }/certificate',
			success : function(data){
				
				$("#sendEmailModal").modal('show');
				certificationNumber = data;
				
			},
			error : function(){
				alert("fail")
			}
		
		})
	})
})



$(document).ready(function(){
	
	$('#certConfirm').click(function(){
		let certification = $('#certification').val();
		certificationNumber = certificationNumber.substring(1,7);
		
		console.log(certification);
		console.log(certificationNumber);
		if(certificationNumber == certification){
			$("#completeEmailModal").modal('show');
		} else{
			alert("fail")
		}
		
	})
})


</script>
<style>
	.error {
		color:red;
	}
</style>
</head>
<body>


<jsp:include page="/WEB-INF/jsp/include/header.jsp" /> 

      
<section class="appoinment-section section">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="accordion-section">
    <div class="section-title">
        <h3>ハナワンキュウ積金商品情報</h3>
    </div>
    <div class="accordion-holder">
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            	加入期間
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                         1年、2年、3年
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false"
                            aria-controls="collapseTwo">
                            	加入金額
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">
                      3万円以下
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingThree">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false"
                            aria-controls="collapseThree">
                            		利子至急方法
                        </a>
                    </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                    <div class="panel-body">
                        	満期一時支払式
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
            </div>
            
            <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="contact-area">
    


<!-- form 태그 -->
<form:form commandName="savingsAccountVO" method="post">
        <div class="row">
            
            
            
            <div class="col-md-12 col-sm-12 col-xs-12">
                
                <form:hidden path="id" value="${ loginVO.id }"  /> 	
                <form:hidden path="bankBookKey" value="1"  />
                <form:hidden path="rate" value="2.5"  /> 
                

                <div class="form-group">
                	<label>パスワード &nbsp;</label> <form:errors path="accountPassword" class="error" /> 
                    <form:password path="accountPassword" class="form-control" placeholder="パスワード 4桁を設定してください。"/>
                    
                </div>
                
                <div class="form-group">
                	<label>新規加入金額 &nbsp;</label> <form:errors path="balance" class="error" />
                	<form:input path="balance" class="form-control" />
                	
                </div>
                
                      
                <div class="form-group">
                	<label>加入期間</label> 
                	<form:select path="savingMonth">
                		<form:option value="12">1年</form:option>
                      	<form:option value="24">2年</form:option>
                      	<form:option value="36">3年</form:option>
                	</form:select>
                </div>
                
                <div class="form-group">
                	<label>納付日</label> 
                	<form:select path="savingDay" class="form-control">
                      	<form:option value="1">毎月1日</form:option>
                      	<form:option value="15">毎月15日</form:option>
                      	<form:option value="25">毎月28日</form:option>
                    </form:select>
                </div>
                
                <div class="form-group">
                	<label>利子至急方法</label> 
                    <form:input path="" class="form-control" value="満期一時支払式" readonly="true"/> 
                </div>
                
                
                <div class="form-group">
                	<label>積金ニックネーム &nbsp;</label> <form:errors path="nickName" class="error" />
                    <form:input path="nickName" class="form-control" placeholder="ニックネームを入力してください。"/> 
                    
                </div>
                
                
                <div class="form-group">
                	<label>出金口座</label> 
                	<form:select path="autoSaving" class="form-control"> 
                   	  <form:options items="${ depositAccountNumList }" ></form:options>                      	
                   </form:select>
                </div>
                
                <div class="form-group">
                	<label>認証番号 &nbsp;</label>
                	<button type="button" class="btn btn-style-one" id="certCheck">
						認証番号 発送する</button>	
					<div style="width:385px; float:left;">
						<form:input id = "certification" path="certification" class="form-control"  placeholder="メールで送信された認証番号を入力してください。"/>				
                	</div>
                	<div style="width:100px; float:left;">
                	<button type="button" class="btn btn-style-one" id="certConfirm" >
						確認</button>
                	</div>
                </div>
                
                <br>
                <br>
                <br>
                
                <div class="form-group text-center">
                    <button type="submit" class="btn-style-one">商品加入</button>
                </div>

            </div>
            
            
        </div>
    </form:form>
</div>                        
            </div>
        </div>                    
    </div>
</section>
<!-- End Contact Section -->

<!--모달  ---------------------------------------------------------------------->
<div class="modal fade" id="sendEmailModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">メールが送信されました。</h4>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
         	 メールで送られた認証番号6桁の値を入力してください。
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn-style-one" data-dismiss="modal">確認</button>          
        </div>
        
      </div>
    </div>
  </div>

<div class="modal fade" id="completeEmailModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">認証完了</h4>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
         	 メール認証が完了しました。
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