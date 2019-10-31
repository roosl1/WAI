<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WAI MAIN</title>
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_sidebar.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_search.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_slide.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/theme_1/js/jquery-1.4.4.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/theme_1/js/wai_jquery.js"></script>
</head>
<body>
<div id="all-container">

<div id="user-header">
<ul>
<li><a href="#">로그아웃</a></li>
<li><a href="goproductlist">관리</a></li>
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
<a href="goqnaboard?user=admin&page=1">임시 admin Q&A게시판</a><br>
<a href="goqnaboard?user=UserA&page=1">임시 user Q&A게시판</a><br>
<a href="goadminpage">임시 관리자 페이지</a>
</div>

<div id="all-content">

<div id="all-slide">
		<div class="banner">
			<ul>
				<li><img src="https://cdn.pixabay.com/photo/2016/02/01/16/10/eye-1173863__340.jpg" width="1050px" height="400px"></li>
				<li><img src="https://cdn.pixabay.com/photo/2017/12/30/13/25/portrait-3050076__340.jpg" width="1050px" height="400px"></li>
				<li><img src="https://cdn.pixabay.com/photo/2015/07/09/22/45/tree-838667__340.jpg" width="1050px" height="400px"></li>
				<li><img src="https://cdn.pixabay.com/photo/2016/03/05/20/01/art-1238602__340.jpg" width="1050px" height="400px"></li>
				<li><img src="https://cdn.pixabay.com/photo/2015/07/31/15/01/guitar-869217__340.jpg" width="1050px" height="400px"></li>
			</ul>
		</div>
	</div>
	<br><br><br><br>
<!-- <img src="https://cdn.pixabay.com/photo/2015/07/09/22/45/tree-838667__340.jpg" width="245px" height="245px">
<img src="https://cdn.pixabay.com/photo/2015/07/09/22/45/tree-838667__340.jpg" width="245px" height="245px">
<img src="https://cdn.pixabay.com/photo/2015/07/09/22/45/tree-838667__340.jpg" width="245px" height="245px">
<img src="https://cdn.pixabay.com/photo/2015/07/09/22/45/tree-838667__340.jpg" width="245px" height="245px"> -->
</div>
</div>
</body>
</html>