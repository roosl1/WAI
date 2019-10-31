<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 상품 목록 보기</title>
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_board.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_sidebar.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/theme_1/js/jquery-1.4.4.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/theme_1/js/wai_jquery.js"></script>
</head>
<script>
	function productdel(procode)
	{
		var con = confirm("정말로 삭제하시겠습니까?");
		
		if(con==true)
		{
			location.href="productdelete?productcode="+procode;
			alert("삭제되었습니다");
		}
	}
</script>
<body>
<div id="all-container">
<div id="user-header">
<ul>
<li><a href="#">로그아웃</a></li>
<li><a href="goadminpage">관리자 메인</a></li>
</ul>
</div>

<div id="user-sidebar">
<h1 style="font-size:50px;text-align:center;cursor:pointer;text-decoration:none"><a href="#">WAI</a></h1>
<ul>
<li class="menu" style="cursor:pointer;"><a>상품 관리</a>
<ul>
<li><a href="goproductlistpage?page=1">상품 목록</a></li>
<li><a href="goproductinsert">상품 등록</a></li>
</ul>
</li>
</ul>
<hr>
<ul>
<li class="menu" style="cursor:pointer;"><a>회원 관리</a>
<ul>
<li><a href="#">회원 목록</a></li>
<li><a href="#">회원 구매 요청</a></li>
<li><a href="#">회원 구매 확인</a></li>
</ul>
</li>
</ul>
<hr>
<ul>
<li class="menu" style="cursor:pointer;"><a>게시글 관리</a>
<ul>
<li><a href="goqnaboard?user=admin&page=1">회원 Q&A목록</a></li>
<li><a href="gonoticeboard?user=admin&page=1">공지사항</a></li>
</ul>
</li>
</ul>
</div>

<div id="all-content">
<h1>상품 목록</h1>
		<table class="table">
			<tr>
				<th>번호</th>
				<th>이미지</th>
				<th>상품명</th>
				<th>판매가</th>
				<th>옵션(기타)</th>
				<th>재고</th>
				<th>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;</th>
			</tr>
			<c:forEach var="imsi" items="${list1 }">
				<tr>
					<td>${imsi.productcode }</td>
					<c:if test="${imsi.original_fname != 'noFile'}">
						<td><img src="<spring:url value='/E:/upload/test/${imsi.stored_fname }'/>" width="150" height="150" /></td>
					</c:if>
					<c:if test="${imsi.original_fname == 'noFile'}">
						<td>이미지</td>
					</c:if>
					<td><a href="goproductdetail?productcode=${imsi.productcode }">${imsi.productsubject }</a></td>
					<td>${imsi.productprice }    원</td>
					<td>${imsi.productcolor } , ${imsi.productsize }</td>
					<td>${imsi.productstock }</td>
					<td><input class="button-mini" type="button" value="수정" onclick="location.href='goproductinsert?productcode=${imsi.productcode }'"><br><br><input class="button-mini" type="button" value="삭제" onclick="productdel('${imsi.productcode }');"></td>
				</tr>
			</c:forEach>
		</table>
		
		<c:forEach var="i" begin="1" end="${totalnum2 }" step="1">
           <li>
              <input type="button" value="${i }" onclick="location.href='goproductlistpage?page=${i }'">
           </li>
		</c:forEach>
		
		</div>
		</div>
</body>
</html>