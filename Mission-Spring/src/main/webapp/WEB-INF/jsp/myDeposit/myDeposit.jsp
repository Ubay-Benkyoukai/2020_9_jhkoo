<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myDeposit JSP</title>

<script src="http://code.jquery.com/jquery-3.5.1.min.js" ></script>
<script>
	function getMyDepositList(){
		
		$.ajax({
			url : '${ pageContext.request.contextPath }/myDeposit/{accountNumber}',
			type : 'get',
			success : function(data){
				
				$('#myDepositList').empty();
				
				let list = JSON.parse(data);
				
				$(list).each(function(){
					let str = '';
					str += '<tr>'
					str +=  '<td>' + this.logPk + '</td>'
					str +=  '<td>' + this.content + '</td>'
					str +=  '<td>' + this.depositMoney + '￥</td>'
					str += '</tr>'
										
					
					$('#myDepositList').append(str); 
				})
			},
			error : function(){
				alert('fail1')
			}
		})
	}
	
	$(document).ready(function(){
		$('#myDepositAddBtn').click(function(){
			
			let myDeposit = document.rform.myDeposit.value;
			let content = document.rform.content.value;
			let id = document.rform.id.value;
			
			$.ajax({
				url : '${pageContext.request.contextPath}/myDeposit/{accountNumber}',
				type : 'post',
				data : {
					// 계좌번호, 내용, 입금할 금액 입력 후 보냄 update // ID、内容、現金の状態を送って insert
					accountNumber : accountNumber,
					content : content,
					depositMoney : depositMoney
				},
				success : function(){
					// update 이후, 입금 내역 리스트 호출. 現金内訳リスト呼び出し
					getmyDepositList();	
				},
				error : function(){
					alert('fail2');
				},
				complete : function(){
					// 입력창 비워주기
					document.rform.content.value = '';
					document.rform.cash.value ='';
				}
			})
			
		})
	})
	
	
	$(document).ready(function(){
		// 화면 실행과 동시에 입금내역 리스트 호출
		getmyDepositList();
	})

</script>

</head>
<body>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" /> 

<!-- Contact Section -->
<section class="blog-section section style-three pb-0">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-6 col-xs-12">
                <div class="contact-area style-two">
                    <div class="section-title">
                        <h3>入金する金額をを入力してください。</h3>
                    </div>
                    <form name="rform" class="default-form contact-form">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                            
                                <input type="hidden" name="id" value="${ loginVO.id }">
                                
                                <div class="form-group">
                                    <input type="text" name="myDepositMoney" placeholder="数字だけ入力してください。">
                                </div>
                                                           
                            </div>
                            
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <textarea name="content" placeholder="memo" ></textarea>
                                </div>
                                <div class="form-group text-center">
                                    <button type="submit" class="btn-style-one" id="myDepositAddBtn">入金する</button>
                                    
                                </div>                            
                            </div>
                        </div>
                    </form>
                </div>                      
            </div>
            <div class="col-md-12 col-sm-6 col-xs-12">
                <br><br><br>
              <!--   <div id = "myDepositLogList"></div>   --> 
                 
                <div class="container">
                 <table class="table table-hover" style="width:80%">
                  <thead>
                  	<tr>
                  		<th>入金時間</th>
                  		<th>memo</th>
						<th>&nbsp;</th>
						<th>&nbsp;</th>
                  		<th>入金した金額</th>

                  	</tr>
                  </thead>
                  
                  <tbody id="myDepositList">
                   
                  </tbody>
                 
                 </table>
                </div>                  
                                   
            </div>
        </div>                    
    </div>
</section>
<!-- End Contact Section --> 
 
 <br>
 
 <div align="center">
 <button type="submit" class="btn-style-one" 
         onclick="location.href='${ pageContext.request.contextPath }/myDepositChoose '"
         >戻る</button>
 </div>
	
<br>
<br>
<br>
<br>

 	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" /> 
	<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" /> 
</body>
</html>







