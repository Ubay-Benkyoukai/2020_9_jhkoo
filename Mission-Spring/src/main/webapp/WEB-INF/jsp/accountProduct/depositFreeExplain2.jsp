<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function depositFreeJoin(){
		location.href = "${ pageContext.request.contextPath}/product/depositFreeJoin/" + "2";
	}
</script>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/include/header.jsp" />


<!-- Contact Section -->



<section class="appoinment-section section">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="accordion-section">
    <div class="section-title">
        <h3>ヤングハナプラス通帳 加入する</h3>
    </div>
    
    
    
    <div class="accordion-holder">
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            	ヤングハナプラス通帳特徴
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        1. 最近はスマートな通帳一つで生活費を管理してるみたい！ だれでも加入する通帳<br>
                        2. 最近は振込実績一つで手数料優遇してるみたい！ 手数料優待無制限<br>
                        3. 最近は振込実績一つで手数料優遇してるみたい！ 手数料優待無制限 + 手数料優待月10回<br>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false"
                            aria-controls="collapseTwo">
                            	ヤングハナプラス通帳情報
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">
                         	加入対象   :  実名の個人または個人事業者（1人1口座）<br>
                         	預金種類  :  貯蓄預金<br>
                         	転換可否   :  低出預金に限り同商品に転換可能<br>
                         	(但し、既存の手数料免除通帳で転換時の手数料免除回数は転換月は既存商品の残余回数を適用し
                         	、来月からは同商品の実績に応じて手数料免除回数を適用)
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false"
                            aria-controls="collapseTwo">
                            	転換可否
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">
                       	貯蓄預金に限り、同商品に転換可能<br>
							(但し、既存の手数料免除通帳で転換時の手数料免除回数は転換月は既存商品の残余回数を適用し
                         	、来月からは同商品の実績に応じて手数料免除回数を適用)
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingThree">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false"
                            aria-controls="collapseThree">
                            	留意事項
                        </a>
                    </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                    <div class="panel-body">
                        	手数料優待サービスは、この通帳による取引にのみ適用され、毎月要件を満たしているかどうかを確認し、翌月に手数料優待サービスを提供します。<br>
                      	           優待サービス内容及び対象要件は変更可能で、変更時に再考します。
                    </div>
                </div>
            </div>
            
            
            
        </div>
    </div>
    
    		
            	<div class="col-md-12 col-sm-12 col-xs-12">         
            	    <div class="form-group text-center">
                    	<button onclick="depositFreeJoin()" class="btn-style-one">加入する</button>
             	   </div>
            	</div>
            
			</div>
            
            </div>
        </div>                    
    </div>
</section>
<!-- End Contact Section -->


<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />

</body>
</html>