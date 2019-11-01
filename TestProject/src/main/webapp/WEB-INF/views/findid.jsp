<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디 찾기</title>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>

function dofind() {
	
/* 	alert("아이디찾기");
	alert(form.name.value);
	alert(form.rnum1.value);
	alert(form.rnum2.value); */
	
	var regexp = /^[가-힣\s]+$/ 		

		if( !regexp.test(form.name.value) ) {
			alert("올바른 한글이름을 입력해주세요.");
			return false;
		}
	
	var regexp2 = /^[0-9]+$/	

		if( !regexp2.test(form.rnum1.value) || !regexp2.test(form.rnum2.value)) {

			alert("숫자만 입력할 수 있습니다.");
			return false;
		}
	
 	var name = form.name.value;
 	var rnum1 = form.rnum1.value;
 	var rnum2 = form.rnum2.value;
 	
 	var data = { name: name, rnum1: rnum1, rnum2: rnum2 };


	$.ajax ({
		data : JSON.stringify(data),
		dataType : "json",
		type : "post",
		url : "dofindid",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			if(name =="") {
				alert("이름을 입력해주세요.");	
			} else if (rnum1=="" || rnum2=="") {
				alert("주민번호를 입력해주세요.");
			} else if(rnum1.length<6 || rnum2.length<7) {
				alert("주민번호를 끝까지 입력해주세요.");
			}else if (data.rs!=null) {
				document.getElementById('id').innerHTML="찾으시는 아이디는 "+data.rs+"입니다."
			} else  {
				alert("해당 아이디가 없습니다.");
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

<h3>아이디 찾기</h3>

<input type="text" name="name" placeholder="이름을 입력하세요" >
<input type="text" name="rnum1" placeholder="주민번호 앞 6자리" maxlength="6">-<input type="password" name="rnum2" placeholder="주민번호 뒷 7자리" maxlength="7">


<input type="button" value="아이디 찾기" onclick="dofind()"> <br>

<p id="id"></p>

<a href="gologin"><input type="button" value="로그인 하러가기"></a>
<a href="gofindpw"><input type="button" value="비밀번호 찾기"></a>



</form >

</body>
</html>