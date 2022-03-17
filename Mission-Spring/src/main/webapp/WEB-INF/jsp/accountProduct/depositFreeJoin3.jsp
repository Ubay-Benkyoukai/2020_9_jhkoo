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
        <h3>商品情報</h3>
    </div>
    <div class="accordion-holder">
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            	主力ハナ通帳 <span>優待事項</span>
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                       	  主力ハナ 優待    :   この通帳に主な取引振替実績1項目を満たす<br>
                       主力銀行プラス 優待 :   この通帳に「主な取引振替実績」2項目以上を満たす<br>
                       	 ハナメンバーズ 優待    :   ハナ金融グループのハナメンバーズ会員
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false"
                            aria-controls="collapseTwo">
                            	提供条件
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">
                     	給与入金:他人から件別50万ウォン以上の給与適用*含み入金または給与指定日前後1営業日以内入金<br>
                      	年金入金: 4大公的年金(国民、公務員、軍人、私学)、基礎(老齢)年金、報勲年金、労災保険給与、KEBハナ銀行が加入した個人年金(住宅年金、年金信託、年金保険、年金ファンド)、その他の年金(顧客指定年金受給日前後1営業日に大量振替方式で1件当たり20万ウォン以上入金され、適正に「年金」または「保険会社名」が記載された年金)<br>          
                    	カード加盟店代金入金:ハナカード/BCカード加盟店代金<br>
          			         マンション管理費の出金:自動振替方式で振替されるマンション管理費
          				カード決済代金:ハナカード/現代カードの決済代金で月5万ウォン以上(信用、チェック合算)
          				住宅請約総合貯蓄の納入:KEBハナ銀行の本人名義の住宅請約総合貯蓄に納入(青年優待型住宅請約総合貯蓄を含む)  
          				公共料金2件の出金:都市ガス料金、電気料金、通信料金、保険料等、ジロ/CMS/ファームバンキングへ振り込み
                    	
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingThree">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false"
                            aria-controls="collapseThree">
                            	優待手数料の内容
                        </a>
                    </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                    <div class="panel-body">
                        	当銀行のATMによる締め切り後、現金引き出し手数料免除<br>
                        	当銀行のATMを通じた他行振込手数料免除<br>
                        	インターネットバンキング、携帯バンキング（ARS）、スマートフォンバンキングによる他行振込手数料免除<br>
                        	納付者の自動振替及び他行自動振替手数料免除<br>
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
	<form:form commandName="depositAccountVO" method="post">
        <div class="row">
            
  
            <div class="col-md-12 col-sm-12 col-xs-12">
               
                <form:hidden path="id" value="${ loginVO.id }"  /> 	
                <form:hidden path="bankBookKey" value="3"  />
  

                <div class="form-group">
                	<label>パスワード &nbsp;</label> <form:errors path="accountPassword" class="error" /> 
                    <form:password path="accountPassword" class="form-control" placeholder="パスワード 4桁を設定してください。"/>
                    
                </div>
                
               
                <div class="form-group">
                	<label>入出金自由預金口座のニックネーム &nbsp;</label> <form:errors path="nickName" class="error" />
                    <form:input path="nickName" class="form-control" placeholder="ニックネームを入力してください。"/> 
                    
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