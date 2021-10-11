<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update details</title>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" /> 

<div align="center">
         <hr width="80%">
         <h2>UPDATE page</h2>
         <hr width="80%">
         <br>
       
         <form:form commandName="boardVO" method="post" action= "${pageContext.request.contextPath }/board/updateform/${data.no }">
             
             
             <table border="1" style="width: 80%;">
                <tr>
                   <th width="23%">題目</th>
                   <td>
                      <form:input path="title" value="${data.title }"/><form:errors path="title" class="error" />
                   </td>
                </tr>
              	 <tr>
                   <th>書き手</th>
                   <td>
                      <form:input path="writer" readonly="true" value="${data.writer }" /><form:errors path="writer" class="error" />
                   </td>
                </tr>
                <tr>
                   <th>内容</th>
                   <td>
                  <form:textarea path="content" rows="7" cols="50" /><form:errors path="content" class="error" />
                  <!--  <form:textarea path="content" rows="7" cols="50" />${data.content }<form:errors path="content" class="error" /> 
                  			testarea태그는 value 값을 태그 사이에 넣어야함. form 태그때문에 박스 밖에 값이 적히는 문제
                  -->
                  <!--  <textarea class="form-control" id="content">${data.content }</textarea> 등록 눌렀을시 500에러 --> 
                  
                   </td>
                </tr>
             </table>
             <button type="submit">登録</button>
         </form:form>
         
         
      </div>
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" /> 
	<jsp:include page="/WEB-INF/jsp/include/scroll.jsp" /> 

</body>
</html>