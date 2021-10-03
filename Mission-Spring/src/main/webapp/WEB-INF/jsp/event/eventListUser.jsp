<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- bannerの数が6個までしかありませんので、解決が必要です。 -->
<!-- 1. 진행중 이벤트 개수를 6개로 한정한다. -->
<!-- 2. 배너를 반복해서 받을 수 있게 한다. -->
<!-- 이벤트 시작일이 현재보다 미래면 나오지 않게 한다. -->
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js" ></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/table.css"> 
<script>

	function banner_info(){
		
		var num = document.getElementById("numbering").value;
		if(num == ""){
			var num = 1;
		}else{
			var num = parseInt(num);
		}
		
		num = num % 6;
		if( num == 0 ){
			num = 6;
		}

		var img_src = "${pageContext.request.contextPath }/resources/assets/images/eventbanner/" + num + ".png";
		
		num++;
		document.getElementById("numbering").value = num;
		document.getElementById("banner").src = img_src;
		return img_src;
	}
	
//	$(document).ready(function(){
//		document.getElementById('banner').src=banner_info();
//	});

	function goDetailEvent(param){
		location.href = "${ pageContext.request.contextPath }/event/" + param;
	}

</script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" />

<br>
<br>

<div class="section-title text-center">
<h3>進行中イベント</h3>
<br>
<br>
</div>

<div class="container">
<div class="row">
<div class="col-md-12">
<c:forEach items="${ currentEventList }" var="current">
<c:set var="i" value="${i+1 }"/>
<input type="hidden" id="numbering">
	<div class="col-md-6 col-sm-6" style="position: relative;"
         onclick="goDetailEvent(${ current.getEventNo() })">
        <div class="team-person text-center" id="inner">

            <!-- <img id="banner" src="" -->
            <img id="banner" src="${pageContext.request.contextPath }/resources/assets/images/eventbanner/${i }.png"
            	style=" width: 540px; height: 200px;" alt="team">
            	<!-- <script>document.getElementById('banner').src=banner_info()</script> -->
            <div style="left: 60px; width: 450px; bottom: 130px; font-size: 3em; font-weight: bold; position: absolute;">
            ${ current.getEventTitle() }
            </div><br><br>
            <div style="left: 60px; width: 450px; bottom: 65px; font-size: 1em; font-weight: bold; position: absolute;">
            ${ current.getRegDate() } ~ ${ current.getEndDate() }
            </div>
        </div>
    </div>
</c:forEach>


</div>
</div>
</div>


<!-- image source -->
<div>
 <a href="https://kor.pngtree.com/free-backgrounds">무료 배경 사진 Pngtree.com</a>
</div>


<!-- currentEventList : 現在のイベントリスト -->
<!-- 
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
				 <a href="javascript:goInsertGoods('${ current.getEventNo() }')">
				 ${ current.getEventTitle() }
				 </a>
				</td>
				<td>${ current.getRegDate() }</td>
				<td>${ current.getEndDate() }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>

</div>
 -->
 
 
<br>
<br>

<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />

</body>
</html>