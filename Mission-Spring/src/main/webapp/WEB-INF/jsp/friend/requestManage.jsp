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

	/* 받은 요청 승인 受けた要請承認　ajax-------------------------------------------------*/
	$(document).ready(function(){
		$('.agreeRequestBtn').click(function(){
			let btn = this;
			let elements = $(this).attr('id').split('.');
			
			$.ajax({
				url : '${ pageContext.request.contextPath }/friend/agreeRequest',
				type : 'get',
				data : {
					id : elements[0],
					friendId : elements[1]
				},
				success : function(){
					
					//모달 창 띄우기
					$("#agreeModal").modal('show')
					
					$(btn).attr('disabled', true)
					$(btn).val("承認 完了")
					$('#disAgreeModal').remove
				},
				error : function(){
					alrt('fail')
				}
			})
		})
	})
	
	
	/* 받은 요청 거절 受けた要請拒絶ajax---------------------------------------------------*/
	$(document).ready(function(){
		$('.disAgreeRequestBtn').click(function(){
			let btn = this;
			let elements = $(this).attr('id').split('.');
			
			$.ajax({
				url : '${ pageContext.request.contextPath }/friend/disAgreeRequest',
				type : 'get',
				data : {
					id : elements[0],
					friendId : elements[1]
				},
				success : function(){
					$(btn).attr('disabled', true)
					$(btn).val("拒絶 完了")
				},
				error : function(){
					alrt('fail')
				}
			})
		})
	})	

</script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" />

<section class="team-section section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title text-center">
                    <h3>${ loginVO.name }様,
                        <span>挑戦共有要請を管理してください。</span>
                    </h3>
                    <p>自分が送った要請状態を確認し、
                        <br>友達から受けた要請を承認/保留してください。</p>
                </div>
                <!-- Nav tabs -->
                <div class="tabs">
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active">
                            <a href="#doctor" data-toggle="tab">送った要請</a>
                        </li>
                        <li role="presentation">
                            <a href="#event-planning" data-toggle="tab">受けた要請</a>
                        </li>
                    </ul>
                </div>
                <div class="tab-content">
                    <!--Start single tab content-->
                    <div class="team-members tab-pane fade in active row" id="doctor">
                        
                      <c:forEach items="${requestList }" var="request">
                        <div class="col-md-4 col-sm-6">
                            <div class="team-person text-center">
                                <img src="${pageContext.request.contextPath }/resources/assets/images/친구.jpg" class="img-responsive" alt="team">
                                	<h6>${ request.friendName }様に送った要請</h6>
                                	<p>${ request.content }<br> ${ request.regDate }</p>
                                	<c:if test='${ request.agreeFlag.equals("0") }'>
                                		<input type="button" value="承認待機中" class="btn-style-one" disabled="disabled">
                                	</c:if>
                                	<c:if test='${ request.agreeFlag.equals("1") }'>
                                		<input type="button" value="承認 完了" class="btn-style-one" disabled="disabled">
                                	</c:if>
                            </div>
                        </div>
                      </c:forEach>
                             
                    </div>
                    <!--End single tab content-->

                    <!--Start single tab content-->
                    <div class="team-members tab-pane fade in row" id="event-planning">
                        
                        <c:forEach items="${requestedList }" var="requested">
                        <div class="col-md-4 col-sm-6">
                            <div class="team-person text-center">
                                <img src="${pageContext.request.contextPath }/resources/assets/images/친구.jpg" class="img-responsive" alt="team">
                                	<h6>${ requested.friendName }様から貰った要請</h6>
                                	<p>${ requested.content }<br> ${ requested.regDate }</p>
                                	
                                	<c:if test='${ requested.agreeFlag.equals("0") }'>
                                		<input type="button" value="承認する" class="agreeRequestBtn btn-style-one" id="${ requested.id }.${ requested.friendId }">
                                		<input type="button" value="断る" class="disAgreeRequestBtn btn-style-one" id="${ requested.id }.${ requested.friendId }">
                                	</c:if>
                                	
                                	<c:if test='${ requested.agreeFlag.equals("1") }'>
                                		<input type="button" value="承認 完了" class="btn-style-one" disabled="disabled">
                                	</c:if>
                            </div>
                        </div>
                      </c:forEach>
                      
                    </div>
                    <!--End single tab content-->

  
                </div>
            </div>
        </div>
    </div>
</section>



<!--승인할 때 정보 공유 동의 받는 모달 ●承認する際、情報共有の同意を受けるモーダル----------------------------------------------------------------------------------------------- -->
		<div class="modal fade" id="agreeModal">
		    <div class="modal-dialog modal-dialog-centered">
		      <div class="modal-content">
  	          <!-- Modal Header -->
			  <div class="modal-header"><h4 class="modal-title">情報提供同意書</h4></div>
			  <!-- Modal body -->
				<div class="modal-body">あなたの挑戦情報が相手に見せられます。<br>
										同意の際、互いの挑戦情報を共有し、フィードバックを交わすことができます。<br>
										同意されますか</div>
				<!-- Modal footer -->
				<div class="modal-footer">
				<button type="button" class="btn-style-one" data-dismiss="modal">同意</button>
				</div>
			</div>
		</div>
	</div>
<!-- ----------------------------------------------------------------------------------------------------------------------- -->

<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" />
</body>
</html>