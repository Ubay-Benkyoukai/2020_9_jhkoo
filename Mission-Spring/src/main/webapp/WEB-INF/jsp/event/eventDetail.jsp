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

	function goEventList(){
		location.href = "${ pageContext.request.contextPath }/event";
	}

	function goRandom(param){
		location.href = "${ pageContext.request.contextPath }/random/" + param;
		//alert("hi");
		// 랜덤 추첨 기능
		// 모든 경품이 없으면, 경품이 소진되었습니다. 뜨기
		
		// lucky_box 갯수amount 하나 감소
		// lucky_user db에 추첨 히스토리 저장

	}


</script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" />
<br>
<br>

<div class="section-title text-center">
<h3></h3>
<h4>${getEvent.getRegDate() } ~ ${getEvent.getEndDate() }</h4>
<h5>&nbsp;</h5>
<h3>${getEvent.getEventTitle() }</h3>
<br>

<div class="container table-wrapper">
	<br>
	<table class="table fl-table">
		<thead>
			<tr>
			<c:forEach items="${ getLuckyBox }" var="box">
				<th>${ box.getGoods() }</th>
			</c:forEach>
			</tr>
		</thead>
		<tbody>
			<tr>
			<c:forEach items="${ getLuckyBox }" var="box">
				<td>${ box.getAmount() }人</td>
			</c:forEach>
			</tr>
		</tbody>
	</table>
</div>
</div>

<div class="section-title text-center">
<input type="button" value="イベントリストに戻る" class="btn-style-one" onclick="goEventList()" style="width: 200px;"/>
<input type="button" value="くじ引き" class="btn-style-one" onclick="goRandom(${getEvent.getEventNo() })" style="width: 200px;"/>
<p>くじ引きは一人一回のみ参加できます。</p>
</div>



<br>
<br>

<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />

</body>
</html>