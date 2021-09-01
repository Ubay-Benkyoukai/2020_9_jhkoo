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
	
	$(document).ready(function(){
		// 돈 자동 추가 버튼		お金自動追加ボタン
		$('.addMoneyBtn').click(function(){
			let btn = this;
			let addAmount = Number( $(this).attr('id') ) ;	/* Number() string을 int로 해주는 jquery 함수 */
			let originAmount = Number( $('#toAmount').val() );
			
			$('#toAmount').val(addAmount + originAmount);
		})
		
		// 카테고리 선택 버튼 カテゴリ選択ボタン
		$('.categoryBtn').click(function(){
			let btn = this;
			let category = $(this).attr('id');
			
			$('#category').val(category);
		})
	})
	
</script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/include/cardHeader.jsp" /> 

<section class="appoinment-section section">
    <div class="container">
        <div class="row">
        
<div class="col-md-6 col-sm-12 col-xs-12">
   <div class="accordion-section">
    <div class="section-title">
        <br><br>
        <h3>カード読み取りスロット</h3>
    </div>
    <div class="accordion-holder">
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            	使用時の注意事項
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        	本人以外のサービス利用はご遠慮ください。
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false"
                            aria-controls="collapseTwo">
                            	カード読み取りスロット 説明
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">
                        	内容
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingThree">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false"
                            aria-controls="collapseThree">
                            	サービス詳細説明
                        </a>
                    </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                    <div class="panel-body">
                       	  内容
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
            
<div class="col-md-6 col-sm-12 col-xs-12">
    <div class="contact-area">
    
	


	<form:form commandName="transferVO" method="post">
	        <div class="row">
	            
	            <div class="section-title">
	   				 <h3></h3>
	   				 <p>&nbsp;&nbsp;&nbsp;</p>
					 
				</div>
	            
	            
	            <div class="col-md-12 col-sm-12 col-xs-12">
    
	                <div class="form-group">
	                	<label>顧客カード番号入力</label>
	                	<form:input path="cardNumber" class="form-control" value="1111-1111-1111-1111"/>
	                </div>
	                
	               
	                <!--금액--------------------------------------  -->
	       			<div class="form-group">
	       				<label>金額 &nbsp;</label>
	       				<div class="dropdown">
	  						<button class="btn btn-secondary dropdown-toggle btn-style-one" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	   							 簡便金額入力
	  						</button>
							  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							    <button type="button" class="btn btn-style-one addMoneyBtn" id="10000" >+10000￥</button>
			                	<button type="button" class="btn btn-style-one addMoneyBtn" id="7000" >+7000￥</button>	
			                	<button type="button" class="btn btn-style-one addMoneyBtn" id="5000" >+5000￥</button>
			                	<button type="button" class="btn btn-style-one addMoneyBtn" id="3000" >+3000￥</button>
			                	<button type="button" class="btn btn-style-one addMoneyBtn" id="1000" >+1000￥</button>		    
							  </div>
  						</div>
	                </div>                
	                
	                <div class="form-group">	                	 
	                	<form:input id = "toAmount" path="toAmount" class="form-control"  placeholder="0￥ "/>
	                </div> 
	                
	                <!--카테고리-------------------------------------------  -->
	                <form:hidden path="toType" id="category"/>
	                
	                <div class="form-group">
	       				<div class="dropdown">
	  						<button class="btn btn-secondary dropdown-toggle btn-style-one" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	   							 カテゴリ選択
	  						</button>
							  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							    <button type="button" class="btn btn-style-one categoryBtn" id="3" >食費</button>
			                	<button type="button" class="btn btn-style-one categoryBtn" id="4" >カフェ、おやつ</button>	
			                	<button type="button" class="btn btn-style-one categoryBtn" id="5" >コンビニ、スーパー</button>
			                	<button type="button" class="btn btn-style-one categoryBtn" id="6" >酒、遊び</button>
			                	<button type="button" class="btn btn-style-one categoryBtn" id="7" >ショッピング</button>
		    					<button type="button" class="btn btn-style-one categoryBtn" id="8" >趣味、余暇</button>
		    					<button type="button" class="btn btn-style-one categoryBtn" id="9" >美容</button>
							  </div>
  						</div>
	                </div>      

	                          
	                
	                <!--리더기 연결 계좌読み取りスロット 連結口座------------------------------------------->
	                <div class="form-group">
	                	<label>読み取りスロット 連結口座番号 </label> 
	                	<form:input path="toAccountNumber" class="form-control" placeholder="「-」を含めて入力してください。" value="1234-1234-1234-1234"/>
	                </div>	
	                
	                <!-- 등록 사업장명 -------------------------------------------->
	                <div class="form-group">
	                	<label>登録事業場名</label> 
	                	<form:input path="toName" class="form-control" value="mcdonald 渋谷支店"/>
	                </div>
	                
	                
	                    
					<div class="form-group">
						<label> &nbsp;</label> 
					</div>
	                
	                <div class="form-group text-center">
	                    <button type="submit" class="btn-style-one" data-toggle="modal" data-target="#myModal">決済する</button>
	                </div>   
	
	            </div>
	            
	            
	        </div>
	    </form:form>
	</div>                        
</div>

        </div>                    
    </div>
</section>


<!--modal---------------------------------------------------------  -->
<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">決済完了しました。</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
       	 
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn-style-one" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>


<jsp:include page="/WEB-INF/jsp/include/cardFooter.jsp" />
<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />  
</body>
</html>