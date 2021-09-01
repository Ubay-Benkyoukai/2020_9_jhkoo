<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function goJoin(){
		location.href = "${pageContext.request.contextPath }/product/savingsJoin/" + "3"; 
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
        <h3>夢ハナ貯金 加入する</h3>
    </div>
    
    
    
    <div class="accordion-holder">
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            	最大の金利を受け取る方法
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
			                         以下の項目を満たす場合、最大で年0.8%の優遇金利を提供。<br>

						加入優待:この預金を最初に加入した場合、年0.2%<br>
						解約後再加入する場合、提供しない）<br>
						請約優待:加入日(または再預置日)に住宅請約総合貯蓄を保有した場合、年0.4%<br>
						自動振替優待:契約期間中(株)ハナ銀行の入出金通帳を通じて6回以上月自動振替で積み立てた場合、年0.2%<br>
						カード優待:この預金加入後(または再預置後)3ヶ月になる月の末日まで(株)ハナ銀行本人名義の入出金通帳から<br>
						ハナ（現代）カード会社のチェックカード決済実績を保有した場合、年0.2%<br>
					    児童手当優遇:加入後(または再預置後)満期前の前月末基準(株)ハナ銀行口座で児童手当法で定める児童手当を1回以上<br>
						受領した場合、年0.2%<br>
						(但し、保護者口座で受領する際、受給口座情報を満期(または再預金)の前日まで(株)ハナ銀行に提供した場合に限る)<br>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false"
                            aria-controls="collapseTwo">
                            	商品特徴
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">
			                        ハナ（現代）カード会社のチェックカード決済実績を保有した場合、年0.2%<br>
						 児童手当優遇:加入後(または再預置後)満期前の前月末基準(株)ハナ銀行口座で児童手当法で定める児童手当を1回以上<br>
						受領した場合、年0.2%<br>
						(但し、保護者口座で受領する際、受給口座情報を満期(または再預金)の前日まで(株)ハナ銀行に提供した場合に限る)<br>       
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false"
                            aria-controls="collapseTwo">
                            	商品特徴
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">
                       	この預金加入日に（株）ハナ銀行の住宅請約総合貯蓄を新規加入した実名の個人または個人事業者（1人1口座）
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingThree">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false"
                            aria-controls="collapseThree">
                            	特別金利
                        </a>
                    </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                    <div class="panel-body">
                     	   以下の要件を満たす場合、同一契約期間別最大年0.3%<br>
						- 出生後1年以内、満7歳、満13歳、満16歳になる当該契約期間別1年間または同一機関、学校など団体新規<br>
						10人以上加入した場合、加入後1年間、最大年0.3%（団体新規は同一営業店で確認し、新規の場合は提供）<br>
						
						希望大学入学祝い金利:満期前の1年間、年2.0%優遇（満14歳まで希望大学登録可能）<br>
						優待金利および特別金利は満期解約時に最終適用され、中途解約時は適用されません。<br>
                    </div>
                </div>
            </div>
            
            
            
        </div>
    </div>
    
    		
            	<div class="col-md-12 col-sm-12 col-xs-12">         
            	    <div class="form-group text-center">
                    	<button onclick="goJoin()" class="btn-style-one">加入する</button>
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