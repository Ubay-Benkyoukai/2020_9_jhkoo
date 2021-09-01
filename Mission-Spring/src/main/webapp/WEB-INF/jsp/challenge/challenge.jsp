<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
<script>
	// 도전 신청하러~ 挑戦の申し込み
	function goChallenge(param){
		location.href="${pageContext.request.contextPath }/challenge/" + param
	}

</script>

</head>
<body>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" /> 
	
<section class="team-section section">
    <div class="container">
    
        <div class="row">
            <div class="col-md-12">
            
                <div class="section-title text-center">
                    <h3>${ loginVO.getName() }様,
                        <span> ${month}月の 戦を応援します！ </span>
                    </h3>
                    <p style="color:red">目標支出を設定して管理してください。 毎月チャレンジは更新されます。</p>
                </div>
                
                <!-- Nav tabs -->
                <div class="tabs">
                    <ul class="nav nav-tabs" role="tablist">
                        
                        <li role="presentation">
                            <a href="#canSelectChallenge" data-toggle="tab">挑戦可能なリスト</a>
                        </li>
                         
                        <li role="presentation">
                            <a href="#myChallenge" data-toggle="tab">進行中の私の挑戦</a>
                        </li>
                        
                    </ul>
                </div>
                <div class="tab-content">
                    
                    <!--Start single tab content-->
                    <div class="team-members tab-pane fade in row" id="canSelectChallenge">
                        
                        <c:if test='${ !myChallengeNameList.contains("食費支出の削減") }'>
	                        <div class="col-md-4 col-sm-6"
	                             onclick="goChallenge('食費支出の削減')">
	                            <div class="team-person text-center">
	                                <img src="${pageContext.request.contextPath }/resources/assets/images/식비.png" class="img-responsive" alt="team">
	                                <h6>食費支出の削減</h6>
	                                <p>今月の食費支出を管理してください。</p>
	                            </div>
	                        </div>
	                    </c:if>
	                        

                        <c:if test='${ !myChallengeNameList.contains("カフェ、おやつの 支出を減らす") }'>
	                        <div class="col-md-4 col-sm-6"
	                             onclick="goChallenge('カフェ、おやつの 支出を減らす')">
	                            <div class="team-person text-center">
	                                <img src="${pageContext.request.contextPath }/resources/assets/images/카페,간식.jfif" class="img-responsive" alt="team">
	                                <h6>カフェ、おやつの 支出を減らす</h6>
	                                <p>今月のカフェ、おやつの支出を管理してください。</p>
	                            </div>
	                        </div>
	                    </c:if>
                        
                        
                        <c:if test='${ !myChallengeNameList.contains("コンビニ、スーパー支出を減らす") }'>
	                        <div class="col-md-4 col-sm-6"
	                             onclick="goChallenge('コンビニ、スーパー支出を減らす')">
	                            <div class="team-person text-center">
	                                <img src="${pageContext.request.contextPath }/resources/assets/images/편의점,마트.jpg" class="img-responsive" alt="team">
	                                <h6>コンビニ、スーパー支出を減らす</h6>
	                                <p>今月のコンビニ、スーパーの支出を管理してください。</p>
	                            </div>
	                        </div>
	                    </c:if>

                        <c:if test='${ !myChallengeNameList.contains("酒、遊ぶ支出を減らす") }'>
	                        <div class="col-md-4 col-sm-6"
	                             onclick="goChallenge('酒、遊ぶ支出を減らす')">
	                            <div class="team-person text-center">
	                                <img src="${pageContext.request.contextPath }/resources/assets/images/술,유흥.jpg" class="img-responsive" alt="team">
	                                <h6>酒、遊ぶ支出を減らす</h6>
	                                <p>今月の酒、遊ぶ支出を管理してください。</p>
	                            </div>
	                        </div>
	                    </c:if>
	                    
                        <c:if test='${ !myChallengeNameList.contains("ショッピング支出を減らす") }'>
	                        <div class="col-md-4 col-sm-6"
	                             onclick="goChallenge('ショッピング支出を減らす')">
	                            <div class="team-person text-center">
	                                <img src="${pageContext.request.contextPath }/resources/assets/images/쇼핑.png" class="img-responsive" alt="team">
	                                <h6>ショッピング支出を減らす</h6>
	                                <p>今月のショッピング支出を管理してください。</p>
	                            </div>
	                        </div>
	                    </c:if>

                        <c:if test='${ !myChallengeNameList.contains("美容支出を減らす") }'>
	                        <div class="col-md-4 col-sm-6"
	                             onclick="goChallenge('美容支出を減らす')">
	                            <div class="team-person text-center">
	                                <img src="${pageContext.request.contextPath }/resources/assets/images/미용.png" class="img-responsive" alt="team">
	                                <h6>美容支出を減らす</h6>
	                                <p>今月の美容支出を管理してください。</p>
	                            </div>
	                        </div>
	                    </c:if>  
                    </div>
                    <!--End single tab content-->
                    
                    
                    <!--Start single tab content-->
                    <div id="myChallenge">
                        
						<section class="service-section bg-gray section">
						    <div class="container">
						        <div class="section-title text-center">
						            <h3>挑戦の
						                <span>進行状況</span>
						            </h3>
						        </div>
						        <div class="row items-container clearfix">
						        
						        
						        <c:forEach items="${ myChallenge }" var="challenge">
						        	<div class="item">
						                <div class="inner-box">
						                    
						                    <div class="image-content text-center" style="background-color:#64BEC6">
						                        <h6 style="color:white">${ challenge.challengeName }</h6>
						                        
						                        <c:if test="${ challenge.challengeFail == true }">
						                        <p style="color:white">    挑戦目標 : ${ String.format("%,d", challenge.targetAmount) }￥ <br>
						                        	       今月の支出 : ${ String.format("%,d", challenge.nowBalanceByType) }￥ <br>
						                                                               挑戦締切日 : ${ challenge.challengeEndDate }
						                              <div class="progress">
													    <div class="progress-bar bg-danger" style="color:red; width:${(challenge.nowBalanceByType/challenge.targetAmount)*100}%">${Math.round((challenge.nowBalanceByType/challenge.targetAmount)*100)}%</div>
													  </div>
													 
							                    	   <span style="color:red; font-weight:bold">
							                    	       失敗した挑戦です。<br> 来月にまた挑戦してください！</span>
							                    	
						                         </p>
						                        
						                        </c:if>
						                        
						                        <c:if test="${ challenge.challengeFail == false }">
						                        <p style="color:white">   挑戦目標 : ${ String.format("%,d", challenge.targetAmount) }￥ <br>
						                        	       今月の支出 : ${ String.format("%,d", challenge.nowBalanceByType) }￥ <br>
						                                                               挑戦締切日 : ${ challenge.challengeEndDate }
						                               
						                                                               
						                                                               
						                              <div class="progress" style="color:red">
													    <div class="progress-bar" style="width:${(challenge.nowBalanceByType/challenge.targetAmount)*100}%">${Math.round((challenge.nowBalanceByType/challenge.targetAmount)*100)}%</div>
													  </div>
							                    	   <span style="color:white; font-weight:bold">
							                    	       一日平均 ${ String.format("%,d", challenge.expectedAmount) }￥ 未満使ったら、<br>
							                    	        挑戦に成功することができます！</span>
						                         </p>												
						                         </c:if>
						                    </div>
						                </div>
						            </div>
						        </c:forEach> 
  
						        </div>
						    </div>
						</section>                        

                   </div>
                   <!--End single tab content-->
                    
                </div>
            </div>
        </div>
    </div>
</section>	
	
 	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" /> 
	<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" /> 
</body>
</html>