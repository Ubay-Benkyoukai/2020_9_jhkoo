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

	function goUpdateGoods(){
		location.href="${pageContext.request.contextPath }/updateGoods";
	}

	function goDelete(num){
		
		let f = document.gform;
		
		f.method="post";
		f.action="${pageContext.request.contextPath }/deleteGoods/" + num;
		f.submit();

	}
	
</script>
</head>
<body>

<br>
<br>

<h3>景品修正</h3>
<br>
<br>

<form:form commandName="luckyBoxVO" method="post" name="gform"
	action="${ pageContext.request.contextPath }/updateGoods">
<!-- 창 크기 줄일때 자동 flex 안되는 문제 해결할 수 있으면 하기! -->
<div class="col-md-6 col-sm-12 col-xs-12" style="margin-left:200px;">
<table class="table table-hover fl-table">
<thead>
<tr>
	<th></th>
	<th>景品番号</th>
	<th>景品名（goods）</th>
	<th>数</th>
	<th>残り</th>
	<th>削除</th>
</tr>
</thead>
<tbody>

<c:forEach items="${ getLuckyBox }" var="box" varStatus="status">
<c:set var="i" value="${i+1 }"/>
<tr>
	<td><input type="hidden" name="boxList[${i-1 }].eventNo" value="${ box.getEventNo() }" />
	</td>
	<td><input type="text" name="boxList[${i-1 }].goodsKey" value="${ box.getGoodsKey() }" readonly="readonly" />
	</td>
	<td><input type="text" name="boxList[${i-1 }].goods" value="${ box.getGoods() }" />
	</td>
	<td><input type="text" name="boxList[${i-1 }].amount" value="${ box.getAmount() }" />
	</td><!-- 残りの修正は直接データベースでするようにしました。 -->
	<td><input type="text" name="boxList[${i-1 }].amountRemainder" value="${ box.getAmountRemainder() }" readonly="readonly"/>
	</td>
	<td><button type="button" class="btn btn-danger" onclick="goDelete('${i-1 }')">削除</button>
	</td>
</tr>
</c:forEach>

</tbody>
</table>

<button type="submit" class="btn-style-one" onclick="goUpdateGoods()" style="margin-left:180px;">修正する</button>

</div>
</form:form>




</body>
</html>
