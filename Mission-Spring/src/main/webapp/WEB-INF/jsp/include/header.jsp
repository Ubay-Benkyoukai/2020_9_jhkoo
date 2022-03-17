<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <!-- mobile responsive meta -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  
  <!-- Slick Carousel -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/slick/slick.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/slick/slick-theme.css">
  <!-- FancyBox -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/fancybox/jquery.fancybox.min.css">
  
  <!-- Stylesheets -->
  <link href="${pageContext.request.contextPath }/resources/assets/css/style.css" rel="stylesheet">
  
<script src="http://code.jquery.com/jquery-3.5.1.min.js" ></script>
</head>
<body>

<!--Main Header-->
<nav class="navbar navbar-default">

      <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                  <ul class="nav navbar-nav">
                        <li class="active">
                              <a href="${pageContext.request.contextPath }/">ホーム</a>
                        </li>
                        <!-- 
                        <li>
                              <a href="#">Q&A</a>
                        </li>
                         -->
                        <li>
                              <a href="${pageContext.request.contextPath }/account">口座管理</a>
                        </li>
                        <li>
                              <a href="${pageContext.request.contextPath }/transferChoose">振り込み</a> 
                        </li>
                        <li>
                              <a href="${pageContext.request.contextPath }/product">商品加入</a>
                        </li>
                        
                        <li>
                        	  <a href = "${pageContext.request.contextPath }/challengeChoose">挑戦</a> <!-- 도전 -->
                        </li>
                        
                        <li>
                        	  <a href = "${pageContext.request.contextPath }/friend">共有</a> <!-- 공유 -->
                        </li>
                        <li>
                        	  <a href = "${pageContext.request.contextPath }/eda">分析</a> <!-- 분석 -->
                        </li>
                   
						<%-- 
						<li class="dropdown" >
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                              		도전하기
                                    <span class="caret"></span>
                              </a>
                              <ul class="dropdown-menu" style="background-color:#917DE6;">
                              		<li><a href="${pageContext.request.contextPath }/challengeChoose">도전하기</a></li>
                                    <li><a href="#">출석체크</a></li>
                                    <li><a href="#">친구와 비교</a></li>
                                    <li><a href="#">반성문</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li>
                              			<a href="${pageContext.request.contextPath }/board">게시판</a>
                        			</li>
                        			<li>
                          			    <a href="${pageContext.request.contextPath }/board/write">새글등록</a>
                        			</li>
                              </ul>
                        </li>
						 --%>
                        <c:choose>
                        	<c:when test="${ empty loginVO }">
		                         <li><a href="${pageContext.request.contextPath }/login">ログイン</a></li>
		                                              		
                        	</c:when>
                        	<c:otherwise>
                        	<%-- 	<li><a>'${ loginVO.name }'님 환영합니다! </a></li> --%>
                        		<li><a href="${pageContext.request.contextPath }/logout">ログアウト</a><li>
                        	</c:otherwise>
                        </c:choose>
                        
                       
                        <li>
                        	<c:if test="${ empty loginVO }">
                              <a href="${pageContext.request.contextPath }/join">会員加入</a>                        	
                        	</c:if>
                        </li>
                        
                          
                        
                         
                        
                  </ul>
            </div>
            <!-- /.navbar-collapse -->
      </div>
      <!-- /.container-fluid -->
</nav>
<!--End Main Header -->
</body>
</html>