<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/theme_1/js/jquery-1.4.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/theme_1/js/wai_jquery.js"></script>
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_sidebar.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_search.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_paging.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_writepost.css" rel="stylesheet">
</head>
<script>
	function qnainst()
	{
		qnains.submit();
	}
	
</script>
<body>
<div id="all-container">
<div id="user-header">
<ul>
<li><a href="#">로그인</a></li>
<li><a href="#">회원가입</a></li>
<li><a href="#">공지사항</a></li>
<li><a href="#">1:1문의</a></li>
</ul>
</div>
<div id="user-sidebar">
<h1 style="font-size:50px;text-align:center;cursor:pointer;text-decoration:none"><a href="#">WAI</a></h1>
<ul>
<li class="menu" style="cursor:pointer;"><a>MAN</a>
<ul>
<li><a href="#">상의</a></li>
<li><a href="#">하의</a></li>
<li><a href="#">가방</a></li>
<li><a href="#">신발</a></li>
<li><a href="#">액세서리</a></li>
</ul>
</li>
</ul>
<hr>
<ul>
<li class="menu" style="cursor:pointer;"><a>WOMAN</a>
<ul>
<li><a href="#">상의</a></li>
<li><a href="#">하의</a></li>
<li><a href="#">가방</a></li>
<li><a href="#">신발</a></li>
<li><a href="#">액세서리</a></li>
</ul>
</li>
</ul>
<hr>

<div id="all-search">
<input type="text" placeholder="상품명 입력"><button>검색</button>
</div>
<br>
(주)WAI<br><br>
1000-1000<br><br>
wai@email.com<br><br>
<a href="goaboutcompany">회사 소개</a><br>
</div>

<div id="all-content">
	<h1>Q&A 작성</h1>
	
	<form name="qnains" action="qnains">
		<table id="qnaintab" align="center">
			<tr>
				<td><input type="radio" name="kind" checked="checked" value="상품">상품</td>
				<td><input type="radio" name="kind" value="주문">주문</td>
				<td><input type="radio" name="kind" value="배송">배송</td>
				<td><input type="radio" name="kind" value="반품">반품</td>
				<td><input type="radio" name="kind" value="기타">기타</td>
			</tr>
		</table>
		<br>
		<br>
		<div id="all-writepost">
		<input type="text" class="textborder1" name="qnasubject" placeholder="제목을 입력해주세요">
		<br>
		<hr>
		<br> 
		<textarea class="textborder2"  name="qnacontents" placeholder="내용을 입력해주세요">상품/색상/사이즈</textarea> 
		</div>
		<table style="width:750px;" align="center">
			<tr>
				<td align="left"><input type="checkbox" name="qnalock" value=1>비공개</td>
				<td align="right"><input class="button" type="button" value="등록" onclick="qnainst();">
				<input class="button" type="button" value="취소" onclick="location.href='goqnaboard'"></td>
			</tr>
		</table>
		<input type="hidden" name="productcode" value="${productcode }">
	</form>
	</div>
	</div>
</body>
</html>