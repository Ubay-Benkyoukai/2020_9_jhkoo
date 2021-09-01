<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function goJoin(){
		location.href = "${pageContext.request.contextPath }/product/savingsJoin/" + "1"; 
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
        <h3>ハナワンキュウ積金 加入する</h3>
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
			                        この預金の加入者が以下の項目を満たした場合、最大で年1.80%の優遇金利を満期時に提供します。 （ただし、中途解約の場合は未提供）<br>
						1. 商品·サービスマーケティング同意優待（年1.0%）:この預金加入前（株）ハナ銀行商品·サービスマーケティング同意項目すべてに同意した場合<br>
						2. ハナオープンバンキング登録優待(年0.3%):ハナオープンバンキングサービスを利用に同意し、出金口座に登録した場合<br>
						3. ハナオープンバンキング振込優待(年0.5%):ハナオープンバンキングサービスを通じて他の銀行口座から出金振込でこの預金に6回以上振り込んだ場合(月1回のみ認定)。<br>
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
			                        住宅請約総合貯金を新規加入した日、たった一日加入できる特別な積立金！ <br>
			                        積金満期時、住宅請約総合貯蓄を保有しているなら金利が2倍になる積金！      
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false"
                            aria-controls="collapseTwo">
                            	加入対象
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
                            	マイホーム購入のダブルアップ積金加入事例
                        </a>
                    </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                    <div class="panel-body">
                        1. 住宅請約総合貯金に今日加入しました！<br>
                        2. 住宅請約総合貯蓄にまだ加入していません！<br>
                        3. 住宅請約総合貯蓄を昨日すでに加入しました！（不可）<br>
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