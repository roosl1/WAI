<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WAI MAIN</title>
	<style>
		.container{
			display: flex;
			flex-direction: column;
		}
		header{
			background-color: lightgray;
			border_bottom: 1px solid gray;
			display: flex;
			flex-direction: row;
			flex-basis: 150px;
			color: white;
		}
		nav{
			border_bottom: 1px solid black;
		}
		a{
			color: white;
			text-decoration: none;
		}
		li{
			list-style: none;
		}
		.content{
			flex-direction: column;
		}
		.item{
			background-color: black;
			border: 1px solid white;
			flex-grow: 1;
			text-align: center;
		}
		.item:nth-child(2){
			padding-top:20px;
		}
		.item:nth-child(3){
			padding-top:80px;
		}
		.item:nth-child(4){
			padding-top:80px;
		}
		.item:nth-child(5){
			padding-top:80px;
		}
		
	</style>
	<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<header>
				<div class="item">
					<li><a href="gohome">main</a></li>
					<br>
					<li><font size="5px"><a href="#">Gold<br>홍길동님
					</a></font></li>
					<br>
					<li><a href="logout">로그아웃</a>|<a href="#">내 정보 보기</a></li>
				</div>
				<div class="item">
					<img src="https://image.flaticon.com/icons/svg/138/138281.svg" width="60px" height="70px">
					<br>
					<a href="myPoint">적립금</a>
				</div>
				<div class="item">
					<a href="myOrder">주문 내역 조회</a>
				</div>
				<div class="item">
					<a href="myreview">내가 등록한 상품 후기</a>
				</div>
				<div class="item">
					<a href="myQnA">내가 등록한 Q&A</a>
				</div>
		</header>
		<section class="content">
			<nav>
				<h3 style="text-align: left">주문 내역</h3>
				<p style="text-align: right;">
					<a href="#">전체 보기 ></a>
				</p>
				<hr>
			</nav>
			<article> 
				<table border="1" style="table-layout: auto; margin: auto; width: 80%; text-align: center;">
					<tr style="background-color: #d3d3d3">
						<th>상품 정보</th>
						<th>주문일자</th>
						<th>주문 수량</th>
						<th>사이즈</th>
						<th>주문 금액</th>
						<th>주문 상태</th>
					</tr>
					<tr>
						<td><img src="https://image.shutterstock.com/image-photo/shirt-design-people-concept-closeup-600w-606875534.jpg" width="70" height="70"></td>
						<td>2019-10-30</td>
						<td>2</td>
						<td>M</td>
						<td>40000</td>
						<td>상품 준비 중</td>
					</tr>
				</table>
			</article>
		</section>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>