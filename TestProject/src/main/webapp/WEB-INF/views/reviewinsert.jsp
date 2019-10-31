<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.raty.js"></script>
<script type="text/javascript">
        $(function() {
            $('div#star').raty({
                score: 3
                ,path : "${pageContext.request.contextPath}/resources/img"
                ,width : 200
                ,click: function(score, evt) {
                    $("#starRating").val(score);
                    $("#displayStarRating").html(score);
                }
            });
        });
        
   function go()
   {
/*       document.gogo.len.value = $("#displayStarRating").text();
   
      gogo.submit();   */
      
         document.review.star1.value = $("#displayStarRating").text();
      
      review.submit();  
   }
</script>
</head>
<body>
	<form action="goreview" name="review" method="post" enctype="multipart/form-data">
		 <table border=0>
        <tr>
           <td width="350"><div id="star"></div></td>
           <td>
             <span id="displayStarRating"></span>
           </td>
        </tr>
       </table> 
		<table>
			<tr>
				<td>이름입력:<input type="text" name="name"></td>
			</tr>
			<tr>
				<td>제목입력:<input type="text" name="title"></td>
			</tr>
			<tr>
				<td>내용입력:<input type="text" name="naeyong"></td>
			</tr>
			<tr>
				<td>사진업로드:<input type="file" name="file"></td>
			</tr>
			<tr>
				<td><input type="button" onclick="go();" value="리뷰작성"></td>
				
			</tr>
		</table>
		<input type="hidden" name="star1" value="">
		<input type="hidden" name="r_sangpum" value="${productcode }">
	</form>
	
	<!-- <form action="upload" method="post" enctype="multipart/form-data">
	<input type="file" name="file">
	<input type="text" name="test">
	<input type="submit" value="전송">
	</form> -->
</body>
</html>
