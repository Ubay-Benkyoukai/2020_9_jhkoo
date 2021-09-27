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
<body>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" />


<div class="card" style="width: 20rem;">
  <img src="${pageContext.request.contextPath }/resources/assets/images/card0.png" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card1</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="${ pageContext.request.contextPath }/myCard/cardDetail0" class="btn btn-primary">Go cardDetail0</a>
  </div>
</div>

<br><br><br>

<div class="card" style="width: 20rem;">
  <img src="${pageContext.request.contextPath }/resources/assets/images/card1.png" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card2</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="${ pageContext.request.contextPath }/myCard/cardDetail1" class="btn btn-primary">Go cardDetail1</a>
  </div>
</div>




<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />
</body>
</html>
