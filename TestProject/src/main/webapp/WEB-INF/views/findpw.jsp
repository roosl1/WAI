<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 찾기</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>

function dofind() {
	
/* 	alert("비밀번호 찾기");
	alert(form.id.value);
	alert(form.name.value); */
	
	
	var regexp = /^[가-힣\s]+$/ 		

		if( !regexp.test(form.name.value) ) {
			alert("올바른 한글이름을 입력해주세요.");
			return false;
		}
	
	var regexp =  /^[A-Za-z+]{1,}[0-9+]{1,}$/	

		if( !regexp.test(form.id.value) ) {

			alert("아이디는 영문+숫자 조합형태여야 합니다.");
			signup.id.value = "";
			return false;
		}

 	var id = form.id.value;
 	var name = form.name.value;
 	
 	var data = { id: id, name: name };


	$.ajax ({
		data : JSON.stringify(data),
		dataType : "json",
		type : "post",
		url : "dofindpw",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			if(id =="") {
				alert("아이디를 입력해주세요.");	
			} else if (name == "") {
				alert("이름을 입력해주세요.");
			} else if (data.rs!=null) {
				document.getElementById('pw').innerHTML="찾으시는 비밀번호는 "+data.rs+"입니다."
			} else  {
				alert("해당 정보가 없습니다.");
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

<form name="form" method="post">

<h3>비밀번호 찾기</h3>

<input type="text" name="name" placeholder="이름을 입력하세요.">
<input type="text" name="id" placeholder="아이디를 입력하세요.">

<input type="button" value="비밀번호 찾기" onclick="dofind()">
<p id="pw"></p>

<a href="gologin"><input type="button" value="로그인하러가기"></a>

</form>

</body>
</html>