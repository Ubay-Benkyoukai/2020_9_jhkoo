<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js" ></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/table.css"> 
<script>

	function goEvent(){
		location.href = "${ pageContext.request.contextPath }/event";
	}
	
	function goEventMap(){
		location.href = "${ pageContext.request.contextPath }/eventMap";
	}

</script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" />

<br>
<br>

<div class="section-title text-center">
<h3>イベントMain</h3>
<br>
<br>
</div>

<section class="appoinment-section section">
    <div class="container">
            
	    <div class="col-md-12 col-sm-12 col-xs-12">
        	<div class="contact-area">
		    <div class="section-title">
		        <h4>User/Customer</h4><br>
				<h3><button type="button" class="btn-style-one" onclick="goEvent()">イベントページへ</button></h3>
				<p>イベントに参加するページです。</p>
				<br><br>
				<h4>Admin</h4><br>
				<h3><button type="button" class="btn-style-one" onclick="goEventMap()">イベント管理ページへ</button></h3>
				<p>イベントを管理するページです。<br>
					イベントの生成、景品登録と修正、景品とイベントのヒストリーを管理します。
				</p>
		    </div>
			</div>
		</div>
	</div>
</section>

<br>
<br>

<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />

</body>
</html>