<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js" ></script>
<script>

function doIdCheck(){
	let id = document.lform.id.value;
	
	$.ajax({
		url : '${pageContext.request.contextPath}/idCheck/' + id,
		type : 'get',
		
		success : function(data){

			let idCheckBool = JSON.parse(data); 
			let str = '';
			var pattern = /^[a-z0-9]{4,20}$/;
			if(idCheckBool == true){
				if(!pattern.test(id)){
					str = "4字以上、20字以下の『小文字』の英語と数字で入力してください。"
				} else {
					str = "使用可能です。"	
				}
			} else {
				str = "重複です。" //중복
			}
			
			$('#idCheck').text(str);
		}
	})
}

function doJoin(){
	let idCheck = document.getElementById("idCheck");

	if(idCheck.innerHTML == "It's duplicate."){
		alert("IDが重複しているため、会員登録はできません。")	//아이디가 중복되어 회원가입이 불가능합니다
		return false;
	}
	return true;
}



</script>
<style>
	.error {
		color:red;
	}
</style>
<script src="${pageContext.request.contextPath }/resources/assets/js/checkData.js"></script>

</head>
<body>



<jsp:include page="/WEB-INF/jsp/include/header.jsp" /> 



<section class="appoinment-section section">
    <div class="container">
        <div class="row">
            

	    <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="contact-area">
                
	    <div class="section-title">
	        <h3>会員登録
	            <span>してください。</span>
	        </h3>
	    </div>


	<!-- 회원가입 form -->    <!-- join form -->
	<!-- Spring form태그 이용. -->
	<!-- 보안적인 측면에서 유효성 검사란 올바르지 않은 데이터가 서버로 전송되거나, DB에 저장되지 않도록 하는 것 -->
    <form:form commandName="memberVO" class="default-form contact-form"  method="post" name="lform">
        
        <div class="row">
			<div class="col-md-6 col-sm-12 col-xs-12">
                <div class="form-group">
                    <form:input type="text" path="id" placeholder="ID" />
                    
                </div>    
                                     
               	<div class="form-group">
                    <form:input type="password" name="password" path="password" placeholder="パスワード" />
                    <form:errors path="password"  class="error" />
                </div>
            </div>
            
            
           
            <div class="col-md-6 col-sm-12 col-xs-12">
               	<div class="form-group text-center">
                    <button type="button" class="btn-style-one" onclick="doIdCheck()">重複確認</button> <!-- 중복확인 -->
					<span id="idCheck" style="color:red"></span>
                </div>
               	<div class="form-group">
                    <form:input type="text" path="name" placeholder="名前" />
                </div>
            </div>
            
            
            
            
            <div class="col-md-12 col-sm-12 col-xs-12">
            	<div class="form-group">
                    <form:input type="text" path="phone" placeholder="電話番号   ex)010-0000-0000" />
                    <form:errors path="phone"  class="error" />
                </div>
                <div class="form-group">
                    <form:input type="text" path="email" placeholder="メール   ex)xxx@domain.com" />
                    <form:errors path="email"  class="error" />
                </div>
                <div class="form-group">
                    <form:input type="text" path="address" placeholder="住所   ex)東京都中央区日本橋 " />
                
                </div>
            </div>
            
            
            <div class="col-md-6 col-sm-12 col-xs-12">
               	<div class="form-group">
                    <form:select path="ageGroup">
                    	<option value="">年代</option>
                    	<option value="10代">10代</option>
                    	<option value="20代">20代</option>
                    	<option value="30代">30代</option>
                    	<option value="40代">40代</option>
                    	<option value="50代">50代</option>
                    	<option value="60代">60代</option>
                    	<option value="70代">70代</option>
                    	<option value="80代">80代</option>
                    	<option value="90代">90代</option>
                    </form:select>
                    <form:errors path="ageGroup"  class="error" />
                </div>
            </div>
            <div class="col-md-6 col-sm-12 col-xs-12">
               	<div class="form-group">
                    <form:select path="gender">
                    	<option value="">性別</option>
                    	<option value="M">男性</option>
                    	<option value="F">女性</option>
                    </form:select>
                    <form:errors path="gender"  class="error" />
                </div>
            </div>
            
            <div class="col-md-6 col-sm-12 col-xs-12">
            	<div class="form-group">
                    <form:select path="propertyStatus" >                    
                        <option value="">保有財産の状況</option> 	<!-- 보유 재산 상황 -->
                        <option value="五百万円未満">五百万円未満</option>
                        <option value="千万円未満">千万円未満</option>
                        <option value="五千万円未満">五千万円未満</option>
                        <option value="一億円未満">一億円未満</option>
                        <option value="一億円以上">一億円以上</option>
                    </form:select>
                    <form:errors path="propertyStatus"  class="error" />
                </div>
            </div>
            
            <div class="col-md-6 col-sm-12 col-xs-12">
            	<div class="form-group">
                    <form:select path="jobKey" >                    
                        <option value="">職業分類</option> <!-- 직업분류 -->
                        <option value="1">IT職</option>
                        <option value="2">主婦</option> <!-- 주부 -->
                        <option value="3">自営業</option> <!-- 자영업자 -->
                        <option value="4">金融職</option>		<!-- 금융직 -->
                        <option value="5">販売職</option> 	<!-- 판매직 -->
                    </form:select>
                    <form:errors path="jobKey"  class="error" />
                </div>
            </div>
             
            <div class="col-md-12 col-sm-12 col-xs-12">         
                <div class="form-group text-center">
                    <button type="submit" class="btn-style-one">会員加入</button>
                </div>
            </div>
        </div>
    </form:form>

   </div>                        
  </div>
            
      <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="accordion-section">
    <div class="section-title">
        <h3>歓迎致します!</h3>
    </div>
    <br>
    <br>
    <img src="${pageContext.request.contextPath }/resources/assets/images/회원가입.jpg">
</div>
            </div>      
            
            
        </div>                    
    </div>
</section>


<jsp:include page="/WEB-INF/jsp/include/footer.jsp" /> 
<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" /> 







</body>
</html>