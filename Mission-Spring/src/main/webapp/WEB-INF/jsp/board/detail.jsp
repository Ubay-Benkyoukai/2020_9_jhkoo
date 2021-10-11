<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js" ></script>
<script>
	function getReplyList(){
		//ajax를 통해서 해당 게시물의 댓글 리스트를 조회 => <div id="replyList"> 에다가 조회 데이터 업데이트 해야함
		$.ajax({
			url : '${ pageContext.request.contextPath }/reply/${ board.no}',
			type : 'get',         /* 조회이므로 get */
			success : function(data){ /* 날라오는 데이터 data로 받음. ResponseTest를 대신하기 때문에 문자열의 형태로 날라옴. 객체문자열을 json객체로 바꿔야함! */
				
				/* 조회할때 이미 있던거 지우기 위해 empty 한번 해줌. append 해줘서 계속 추가되는 구조이므로... */
				$('#replyList').empty();	
				
				let list = JSON.parse(data);

				$(list).each(function(){
					
					let str = '';
					str += '<hr>';
					str += '<div>'
					str += '<strong>' + this.content + '</strong>';
					str += '(' + this.writer + ')'
					str += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + this.regDate + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
					str += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + '<button class="delBtn" id='+ this.no +'> 削除 </button>'	/* 버튼이 여러개니 class로 해줌. */
					str += '</div>'
					
					$('#replyList').append(str);
				})
			},
			error : function(){
				alert('fail')
			}
		})
		
	}


	$(document).ready(function(){
		$('#replyAddBtn').click(function(){
			
			let content = document.rform.content.value;
			let writer = document.rform.writer.value;
			
			/* content, writer, boardNo 넘겨야함.어떤 게시글의 댓글인지... */
			
			/* /reply/insert?boardNo=12&content=aaa&writer=bbb */
			$.ajax({
				url : '${ pageContext.request.contextPath}/reply',
				type : 'post',
				data : {
					boardNo : ${ board.no}, 
					content : content,
					writer : writer
				}, 
				success : function(){
					getReplyList();	//댓글 insert이후, 댓글리스트 호출. 이렇게 해야 내가 쓴 글이 아래에 보임
				}, 
				error : function(){
					alert('fail');
				},
				complete : function(){
					document.rform.content.value = '';
					document.rform.writer.value ='';
				}
				
			})
			
		})
		
	})
	
	$(document).ready(function(){	/* 화면 실행되면 바로 댓글 리스트 호출 */
		getReplyList();		
	})
	
	
	
	/* 삭제 - 동적으로 만들어진 이벤트는 이벤트가 안붙음... => on 해야함!*/
	$(document).ready(function(){
		
		
		/* $('.delBtn').click(function(){
			alert('click...')
		}) */

		$(document).on('click', '.delBtn', function(){

			if(!confirm('コメントを削除しますか?')) return; /* 취소하면 그냥 다시 돌아옴 */
			
			let replyNo = $(this).attr('id');
				
			/* ajax 이후 또 ajax */
			/*
			 $.ajax({
				url : '${ pageContext.request.contextPath}/reply/' + replyNo,
				type: 'delete',	// put post get delete ,
				
				data : { boardNo : ${boardNo} },	// 첫 번째 방법 대신 boardNo를 db에서 가져오지않고 바로 보내주기!
				
				success :function(){
					getReplyList();	// 삭제 성공했을때 업데이트 해줘야하므로  호출! 
				},
				error : function(){
					alert('fail')
				}
			}) 
			*/
			
			/* 2번 방법 . 댓글 삭제시, 댓글 번호와, 댓글이 속한 게시글 번호도 보내줌!*/
			$.ajax({
				url : '${ pageContext.request.contextPath}/reply/' + replyNo + '/${board.no}',	
				type: 'delete',	/* put post get delete */	
				success :function(){
					getReplyList();	/* 삭제 성공했을때 업데이트 해줘야하므로  호출! */
				},
				error : function(){ 
					alert('fail')
				}
			})
			
			
		})
	})
	
//글 수정
	function updateContent(){
		location.href = "${ pageContext.request.contextPath }/board/updateform/${no};"
	}
	
	
	


    /** 게시판 - 삭제  3 */ //값을 넘기는 코드 작성 필요.
    function deleteContent(){
 		
		if(confirm("削除しますか?") == true){
			location.href = "${ pageContext.request.contextPath }/board/delete/${no}"
			console.log('success');
		}else{
			console.log('fail');  //여기서 데이터를 받는? 코드가 컨트롤러로 안이어지는..? 그래서 ajax이거 말고 그냥 컨트롤러에서 바로 작동하게 끔 만든게 빨간버튼이였어요
			return false;
        }        
    }
    
    //리스트 호출
 	function boardlist(){
    	location.href = "${ pageContext.request.contextPath }/board;"
   
    }
	
	

</script>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/include/header.jsp" /> 

	<section>
		<div align = "center">
			<hr>
				<h2>掲示板詳細ページ</h2>
			<hr>
			<br>
			<table border="1">
				<tr>
					<th width="25%">番号</th>
					<td>${ board.rno }</td>
				</tr>
				<tr>
					<th width="25%">タイトル</th>
					<td><c:out value="${ board.title }" /></td>
				</tr>
				<tr>
					<th width="25%">書き手</th>
					<td>${ board.writer }</td>
				</tr>
				<tr>
					<th width="25%">内容</th>
					<td>${ board.content }</td>
				</tr>
				<!-- 조회수
				<tr>
					<th width="25%">照会数</th>
					<td>${ board.viewCnt }</td>
				</tr> 
				<tr>
					<th width="25%">登録日</th>
					<td>${ board.regDate }</td>
				</tr>-->
			
				
				<!--<a href = "${ pageContext.request.contextPath }/board/${board.no}/update" role="button" class="btn btn-outline-info">수정</a>  -->
				

			</table>
			<br>
			<c:if test="${ loginVO.id eq board.writer }">
				
				<input type="button" value="修整" onclick="updateContent()">&nbsp;&nbsp; <!-- 수정 -->
				<input type="button" value="削除" onclick="deleteContent();">&nbsp;&nbsp; <!-- 삭제 -->
			</c:if>
			<input type="button" value="目録" onclick="boardlist()">&nbsp;&nbsp;  <!-- 목록 -->
			<br>
			<hr>
			<!-- 댓글 -->
			<form name="rform">	<!-- name주기 -->
				コメント : <input type="text" name="content" size="50">
				名前 : <input type="text" name="writer" size="10"> 
				<input type="button" value="コメント 追加" id="replyAddBtn">	<!-- 버튼에 id를 줘서, 버특 누르면 나 ~~할거야. 라고 표현! -->
			</form>
			
			<!-- ajax로 들어오는 div-->
			<div id="replyList"></div>
			
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" /> 
	<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" /> 	
</body>
</html>