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

	function tmpTest(){

		var tmp = document.getElementById("tmpShow").value;
		tmp++;
		document.getElementById("tmpShow").value = tmp;
		
	}
	
	function addRow(){
		
		var num = document.getElementById("numbering").value;
		
		if(num == ""){
			var dot = 0;
		}else{
			var dot = parseInt(num);
		}

		var row;
		row = document.all["tbShow"].insertRow();
		
		// 景品番号
		var cell_GoodsKey = row.insertCell();
		cell_GoodsKey.innerHTML = 
			"<input type='text' name='boxList["+dot+"].goodsKey' value='" + (dot + 1) + "' class='form-control' readonly='readonly'/>";

		// イベント番号
		var cell_EventNo = row.insertCell();
		cell_EventNo.innerHTML = 
			"<input type='text' name='boxList["+dot+"].eventNo' class='form-control'/>";
		
		// 景品名（goods）
		var cell_Goods = row.insertCell();
		cell_Goods.innerHTML = 
			"<input type='text' name='boxList["+dot+"].goods' class='form-control'/>";
		
		// 数
		var cell_Amount = row.insertCell();
		cell_Amount.innerHTML = 
			"<input type='text' name='boxList["+dot+"].amount' class='form-control'/>";


		num++;
		document.getElementById("numbering").value = num;
	}
	
	
	

</script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" />

<br>
<br>

<button type="button" class="btn-style-one" onclick="tmpTest()">tmpTest</button>
<input type="text" id="tmpShow" >

<div class="container table-wrapper">
<form:form commandName="luckyBoxVO" method="post">
<!-- 창 크기 줄일때 자동 flex 안되는 문제 해결할 수 있으면 하기! -->
<div class="col-md-6 col-sm-12 col-xs-12" style="margin-left:250px;">
<button type="button" class="btn-style-one" onclick="addRow()">addrow</button>
<input type="hidden" id="numbering" >
<table>
<thead>
<tr>
	<th>景品番号</th>
	<th>イベント番号</th>
	<th>景品名（goods）</th>
	<th>数</th>
</tr>
</thead>
<tbody id="tbShow">
</tbody>
</table>
<button type="submit" class="btn-style-one">저장</button>

</div>
</form:form>
</div>

<br>
<br>

<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />

</body>
</html>
