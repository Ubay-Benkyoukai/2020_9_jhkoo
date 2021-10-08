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

	function goInsertEvent(){
		location.href = "${ pageContext.request.contextPath }/createEvent";
	}
	
	function goModifyEvent(param){
		location.href = "${ pageContext.request.contextPath }/event/contents/" + param;
	}

</script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" />

<br>
<br>

<div class="section-title text-center">
<h3>イベント管理</h3>
<br>
<br>
</div>

<!-- currentEventList : 現在のイベントリスト -->
<div class="container table-wrapper">
	<h2>&nbsp;</h2>
	<p>
	現在のイベントリスト
	<input type="button" value="新登録" class="btn-style-one" onclick="goInsertEvent()" style="float: right;">
	</p>
	<hr>
	
	<table class="table table-hover fl-table">
		<thead>
			<tr>
				<th>EventNo.</th>
				<th>タイトル</th>
				<th>登録日</th>
				<th>締日</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ currentEventList }" var="current">
			<tr>
				<td>${ current.getEventNo() }</td>
				<td>
				 <a href="javascript:goModifyEvent('${ current.getEventNo() }')">
				 ${ current.getEventTitle() }
				 </a></td>
				<td>${ current.getRegDate() }</td>
				<td>${ current.getEndDate() }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>

</div>

<!-- pastEventList : 過去のイベントリスト -->

<div class="container table-wrapper">
	<h2>&nbsp;</h2>
	<p>過去のイベントリスト</p>
	<hr>
	<table class="table table-hover fl-table">
		<thead>
			<tr>
				<th>EventNo.</th>
				<th>タイトル</th>
				<th>登録日</th>
				<th>締日</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ pastEventList }" var="past">
			<tr>
				<td>${ past.getEventNo() }</td>
				<td>
				<a href="javascript:goModifyEvent('${ past.getEventNo() }')">
				${ past.getEventTitle() }
				</a></td>
				<td>${ past.getRegDate() }</td>
				<td>${ past.getEndDate() }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>

</div>

<!-- eventUserList : イベント景品とユーザの内訳 -->

<div class="container table-wrapper">
	<h2>&nbsp;</h2>
	<p>イベント景品の内訳</p>
	<hr>
	<table class="table table-hover fl-table">
		<thead>
			<tr>
				<th>No.</th>
				<th>EventNo.</th>
				<th>ユーザID</th>
				<th>景品</th>
				<th>受け取り</th>
				<th>受け取り日</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ eventUserList }" var="list">
			<tr>
				<td>${ list.getNo() }</td>
				<td>${ list.getEventNo() }</td>
				<td>${ list.getId() }</td>
				<td>
				<!--<c:if test="${ list.getLuckyBoxKey().equals(\"1\") }"></c:if>
				이거는 아직 eventUserList를 Insert하는 구문이 없어서 잘 모르겠음
				아마 DB 통째로 바뀔 것 같음-->
				${ list.getLuckyBoxKey() }
				</td>
				<td>
				<c:if test="${ list.getReceiptStatus() eq '1' }">
				完了
				</c:if>
				<c:if test="${ list.getReceiptStatus() ne '1' }">
				<b><span style="color:red">未完了</span></b>
				</c:if>
				</td>
				<td>${ list.getReceiptDate() }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>

</div>


<br>
<br>

<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />

</body>
</html>