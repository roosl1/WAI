<%@page import="com.test.imsi.BoardDAO"%>
<%@page import="com.test.imsi.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시 게시판</title>
</head>
<body>
	<table border="2">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>아이디</th>
			<th>DATE</th>
			<th>HIT</th>
		</tr>

		<c:forEach var="imsi" items="${list1 }">
			<tr>
				<td>${imsi.bno }</td>
				<td>${imsi.bsubject }</td>
				<td>${imsi.bcontents }</td>
				<td>${imsi.bid }</td>
				<td>${imsi.bdate }</td>
				<td>${imsi.hit }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>