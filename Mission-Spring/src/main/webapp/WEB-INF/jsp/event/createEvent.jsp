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
<script>

</script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" />

<br>
<br>

<div class="section-title text-center">
<h3>新イベント登録</h3>
<br>
<br>
</div>

<!-- 이벤트 생성 -->
<div class="container table-wrapper">
<form:form commandName="eventVO" method="post">
<!-- 창 크기 줄일때 자동 flex 안되는 문제 해결할 수 있으면 하기! -->
<div class="col-md-6 col-sm-12 col-xs-12" style="margin-left:250px;">
<div class="row">
	
	<div class="col-md-12 col-sm-12 col-xs-12">
	<div class="form-group">
		<br>
        <label>イベントタイトル &nbsp;</label> 
		<form:input path="eventTitle" class="form-control"/>
	</div>
	</div>
	
	<div class="col-md-6 col-sm-12 col-xs-12">
		<div class="form-group">
	        <label>登録日 &nbsp;</label> 
			<form:input type="Datetime-local" path="regDate" class="form-control"/>
		</div>
	</div>
	
	<div class="col-md-6 col-sm-12 col-xs-12">
		<div class="form-group">
	        <label>締日 &nbsp;</label> 
			<form:input type="Datetime-local" path="endDate" class="form-control"/>
		</div>
	</div>

	<div class="col-md-12 col-sm-12 col-xs-12">
	<br><div class="form-group text-center">
        <button type="submit" class="btn-style-one">イベント生成</button>
    </div><br>
    </div>

</div>
</div>
</form:form>

<br>
<br>

</div>
<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />

</body>
</html>
