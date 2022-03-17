<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='https://www.gstatic.com/charts/loader.js'></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {

      var data = google.visualization.arrayToDataTable([
        ['', '',],
        ${ str }
      ]);

      var options = {
        title: '支出 比較 状況',
        chartArea: {width: '50%'},
        hAxis: {
          minValue: 0
        }
      };

      var chart = new google.visualization.BarChart(document.getElementById('chart_div'));

      chart.draw(data, options);
    }
</script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" />

<!-- 
<br>
<br>
 <div id="chart_div"></div>
<br>
<br>
 -->
<!-- 도전 공유 挑戦共有------------------------------------------------------------------------------------->
<section class="service-section bg-gray section">
    <div class="container">
        <div class="section-title text-center">
            <h3>友達
                <span>の共有された挑戦</span>
            </h3>
            <p>${ month }月に共有された友達の挑戦リストです。<br>
           	   <span style="color:red">目標は共有するほど達成する確率が高いです。
           	       もっとたくさんの友達と挑戦を共有してください！</span>
            </p>
        </div>
        
        <div class="row items-container clearfix">
        
        <c:forEach items="${ challengeList }" var="challenge">
            <div class="item">
                <div class="inner-box">
                    <div class="img_holder">
                            <img src="${pageContext.request.contextPath }/resources/assets/images/친구.jpg" alt="images" class="img-responsive">                     
                    </div>
                    <div class="image-content text-center">
                        <span>${ challenge.challengeName }に挑戦中</span>
                        <h6>${ challenge.id }님</h6>
                        <p>
                        	目標金額は ${ String.format("%,d", challenge.targetAmount) }で,<br>
                                                        現在までの支出金額は ${ String.format("%,d", challenge.nowBalanceByType) }です。<br>
 						    <div class="progress">
			 					<div class="progress-bar " style="width:${(challenge.nowBalanceByType/challenge.targetAmount)*100}%">${Math.round((challenge.nowBalanceByType/challenge.targetAmount)*100)}%</div>
						    </div>                                                       
                            <c:if test="${ challenge.challengeFail == true }">
                            	<span style="color:red; font-weight:bold">今度友達との約束を必ず守ってください!</span>
							</c:if>
							<c:if test="${ challenge.challengeFail == false }">
                            	<span style="color:red; font-weight:bold">挑戦進行中です。 </span>
							</c:if>
                        </p>
                    </div>
                </div>
            </div>
        </c:forEach>        
                        
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />
</body>
</html>












