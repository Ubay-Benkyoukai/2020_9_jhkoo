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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/table.css"> 
<body>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" />

<br><br><br>

<div class="section-title text-center"> <h3>Card</h3></div>

<hr style="border: solid 0.7px #7FCFCD;">

<div class="card" style="width: 20rem;">
  <img src="${pageContext.request.contextPath }/resources/assets/images/card0.png" class="card-img-top" alt="..." width="275" height="160">
  <div class="card-body">
    <h4 class="card-title">Card1</h4>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="${ pageContext.request.contextPath }/card0Register" class="btn btn-primary">GoRegister</a>
  </div>
</div>

<br><br><br>

<div class="card" style="width: 20rem;">
  <img src="${pageContext.request.contextPath }/resources/assets/images/card1.png" class="card-img-top" alt="..." width="275" height="160">
  <div class="card-body">
    <h4 class="card-title">Card2</h4>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="${ pageContext.request.contextPath }/card1Register" class="btn btn-primary">GoRegister</a>
  </div>
</div>




<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />
</body>
</html>