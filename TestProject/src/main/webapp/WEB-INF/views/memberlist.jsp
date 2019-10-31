<%@page import="com.test.imsi.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>

var id;

function admincg(id) {
	
/*  	alert(id.id);
	alert(id.name);
 	 */
	var userid = id.id;
	var useradmin = id.name;
	
	var userData = { userid: userid, useradmin: useradmin };	
 	
	$.ajax ({
		data : JSON.stringify(userData),
		dataType : "json",
		type : "post",
		url : "admin",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			if(data.rs == 2) {
				alert("권한을 해제할 수 없습니다");
			} else if (data.rs == 0) {
				alert("관리자 권한이 해제되었습니다.");
				window.location.reload()
			} else if (data.rs == 1) {
				alert("관리자 권한이 부여되었습니다.");
				window.location.reload()
			}
		},
	
		   error : function(request,error,xhr1 , status)
	         {
	            alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			
		}
		
	}); 
	
}


</script>
</head>
<body>


	<h2>회원명단출력</h2>
	
	
	
	<table border=2>
	
	<tr><th>이름</th> <th>아이디</th> <th>주소</th> <th>연락처</th> <th>이메일</th> <th>관리자 권한</th> <th>관리자 권한여부 수정</th></tr>

	<form name="up" method="get">

	
	<c:forEach var="imsi" items="${mlist}">	

	<tr>

	<td> <input type="text" name="name" value="${imsi.name}" readonly>  </td>
	<td><input type="text" name="id" value="${imsi.id }" readonly> </td>
	<td><input type="text" name="ad" value="${imsi.ad }" readonly></td>
	<td><input type="text" name="hp" value="${imsi.hp1}-${imsi.hp2}-${imsi.hp3}" readonly></td>
	<td><input type="text" name="email" value="${imsi.email}" readonly> </td>
	<td><input type="text" name="admin" value="${imsi.admin}" readonly> </td>
	<c:if test="${imsi.id != 'adm'}">
		<td><input type="button" value="권한변경" id="${imsi.id }" name="${imsi.admin}" onclick="admincg(${imsi.id})"></td>
  	</c:if>
    </tr>	
	

	</c:forEach>
	</form>
	
	</table>


</body>
</html>