<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function like_func(number1){
   
     var num = { number: number1 };
     
     $.ajax({
       url: "check_like",
       type: "POST",
       dataType: "json",
       data: JSON.stringify(num) ,
       contentType : "application/json; charset=UTF-8" ,
       success: function(data) {
         var msg = '';
         var like_img = '';
         msg += data.msg;
         alert(msg);
        
         if(data.like_check == 1){
           like_img = "<img src=<spring:url value='/E:/upload/test/positive-c.png'/> />";
         } else {
           like_img = "<img src=<spring:url value='/E:/upload/test/positive-b.png'/> />";
         }      

         $('#'+number1+'like_img').html(like_img);
         $('#'+number1+'like_cnt').html(data.like_cnt);
         $('#like_check').html(data.like_check);
       },
       error: function(request, status, error){
         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
     });
   }
   
function dislike_func(number1){
   
     var num = { number: number1 };
     
     $.ajax({
       url: "check_dislike",
       type: "POST",
       dataType: "json",
       data: JSON.stringify(num) ,
       contentType : "application/json; charset=UTF-8" ,
       success: function(data) {
         var msg = '';
         var dislike_img = '';
         msg += data.msg;
         alert(msg);
         if(data.like_check == -1){
           dislike_img = "<img src=<spring:url value='/E:/upload/test/negative-c.png'/> />";
         } else {
           dislike_img = "<img src=<spring:url value='/E:/upload/test/negative-b.png'/> />";
         }
         $('#'+number1+'dislike_img').html(dislike_img);
         $('#'+number1+'dislike_cnt').html(data.dislike_cnt);
         $('#like_check').html(data.like_check);
       },
       error: function(request, status, error){
         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
     });
   }
   
   
function reviewarray(page1, productcode1, user1 ,number1)
{      
   var num = {page:page1 , productcode : productcode1 , user : user1 ,  choice:number1};
   
   $.ajax(
   {   
      url : "reviewpage" ,   
      type : "POST" , 
      data :  JSON.stringify(num) ,   
      dataType : "json" , 
      contentType : "application/json; charset=UTF-8" ,
      success : function(Data)   
      {      
         listreview(Data);
      } ,
      error : function(request,error,xhr1 , status)
      {
         alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
      }
   });
}   
   

        
function pagingreview(page1 , productcode1 , user1, choice1)
{      
   var num = { page: page1 , productcode: productcode1 , user: user1, choice:choice1};
   
   $.ajax(
   {   
      url : "reviewpage" ,   
      type : "POST" , 
      data :  JSON.stringify(num) ,   
      dataType : "json" , 
      contentType : "application/json; charset=UTF-8" ,
      success : function(Data)   
      {      
         listreview(Data);
      } ,
      error : function(request,error,xhr1 , status)
      {
         alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
      }
   });
}



function listreview(Data)
{
   var ResultVO = [];
   var content = "";
   var productcode = "\""+Data.productcode+"\"";
   var user = "\""+Data.user+"\"";

   content += "<table border=2 id='main_review'>";
   for(i=0;i<Data.r_list.length;i++)
   {         
      ResultVO = Data.r_list[i];
      
      content += "<tr>";
      content += "<td>"+ResultVO.r_grade+"</td>";
      content += "<td>"+ResultVO.r_writer+"</td>";
      content += "<td>"+ResultVO.r_date+"</td>";
      content += "<td><div id=star data-score="+ResultVO.r_star+"></div></td>";
      if(ResultVO.r_writer != null && ResultVO.r_check == 1){
         content += "<td><a href='javascript: like_func("+ResultVO.r_num+");'>";
         content += "<div id="+ResultVO.r_num+"like_img><img src=<spring:url value='/E:/upload/test/positive-c.png'/> /></div></a>";
         content += "<div id="+ResultVO.r_num+"like_cnt>"+ResultVO.r_good+"</div></td>";
         content += "<td><a href='javascript: dislike_func("+ResultVO.r_num+");'>";
         content += "<div id="+ResultVO.r_num+"dislike_img><img src=<spring:url value='/E:/upload/test/negative-b.png'/> /></div></a>";
         content += "<div id="+ResultVO.r_num+"dislike_cnt>"+ResultVO.r_bad+"</div></td>";
      }
      else if(ResultVO.r_writer != null && ResultVO.r_check == -1){
         content += "<td><a href='javascript: like_func("+ResultVO.r_num+");'>";
         content += "<div id="+ResultVO.r_num+"like_img><img src=<spring:url value='/E:/upload/test/positive-b.png'/> /></div></a>";
         content += "<div id="+ResultVO.r_num+"like_cnt>"+ResultVO.r_good+"</div></td>";
         content += "<td><a href='javascript: dislike_func("+ResultVO.r_num+");'>";
         content += "<div id="+ResultVO.r_num+"dislike_img><img src=<spring:url value='/E:/upload/test/negative-c.png'/> /></div></a>";
         content += "<div id="+ResultVO.r_num+"dislike_cnt>"+ResultVO.r_bad+"</div></td>";
      }
      else if(ResultVO.r_writer != null && ResultVO.r_check == 0){
         content += "<td><a href='javascript: like_func("+ResultVO.r_num+");'>";
         content += "<div id="+ResultVO.r_num+"like_img><img src=<spring:url value='/E:/upload/test/positive-b.png'/> /></div></a>";
         content += "<div id="+ResultVO.r_num+"like_cnt>"+ResultVO.r_good+"</div></td>";
         content += "<td><a href='javascript: dislike_func("+ResultVO.r_num+");'>";
         content += "<div id="+ResultVO.r_num+"dislike_img><img src=<spring:url value='/E:/upload/test/negative-b.png'/> /></div></a>";
         content += "<div id="+ResultVO.r_num+"dislike_cnt>"+ResultVO.r_bad+"</div></td>";
      }
      else{
         content += "<td><a href='javascript: login_need();'><img src=\"<spring:url value='/E:/upload/test/positive-b.png'/>\" /></a>";
         content += ResultVO.r_good+"</td>";
         content += "<td><a href='javascript: login_need();'><img src=\"<spring:url value='/E:/upload/test/negative-b.png'/>\" /></a>";
         content += ResultVO.r_bad+"</td>";
      }
         
      content += "</tr><tr><td colspan=6>"+ResultVO.r_sangpum+"-"+ResultVO.r_size+"구매</td></tr>";
      content += "<tr><td colspan=6>"+ResultVO.r_title+"</td></tr>";
      content += "<tr><td colspan=6>"+ResultVO.r_text+"</td></tr>";
      if(ResultVO.original_fname != "noFile")
         content += "<tr><td colspan=6><img src='<spring:url value='/E:/upload/test/"+ResultVO.stored_fname+"'/>'/></td></tr>";
   }
   content += "</table>";
   content += "<div id= 'main_paging'>"
   for(i=1;i<=Data.totalnum2;i++){
      content += "<li><input type='button' value="+i+" onclick='pagingreview("+ i +" , "+ productcode +" , "+ user +", "+Data.choice+")'></li>"
   }
   content += "</div>"

   $("#main_review").remove();
   $("#main_paging").remove();
   $("#sub_review").append(content);
   
   
   $(function() 
           {
               $('div#star').raty(
               {
                score: function() 
                 {
                     return $(this).attr('data-score');
                 } ,
                   path : "${pageContext.request.contextPath}/resources/img" ,
                   width : 350 ,
                   readOnly  : true
               });
           });
}

$(function() 
        {
            $('div#star').raty(
            {
              score: function() 
              {
                  return $(this).attr('data-score');
              } ,
                path : "${pageContext.request.contextPath}/resources/img" ,
                width : 350 ,
                readOnly  : true
            });
        });


   </script>
   
</head>
<body>
   <table>
      <tr>
         <td rowspan=3>${avg }</td><td>5star - ${five }개</td>
      </tr>
      <tr>
         <td>4star - ${four }개</td>
      </tr>
      <tr>
         <td>3star - ${three }개</td>
      </tr>
      <tr>
         <td><div data-score="${avg }" id=star></div></td><td>2star - ${two }개</td>
      </tr>
      <tr>
         <td>${total }</td><td>1star - ${one }개</td>
      </tr>
   </table>

   <table>
      <tr>
         <td id="detail"><input type="button" value="최신순" onclick="reviewarray(${page } , '${productcode }' , '${user }', 0)"> 
                     <input type="button" value="인기순" onclick="reviewarray(${page } , '${productcode }' , '${user }', 1)"> 
                     <input type="button" value="평점높은순" onclick="reviewarray(${page } ,'${productcode }' , '${user }', 2)">
         </td>
      </tr>
   </table>
<table border="2" id="main_review">
      <c:forEach var="imsi" items="${r_list }">
      
         <tr>
         
            <td>${imsi.r_grade }</td>
            <td>${imsi.r_writer }</td>
            <td>${imsi.r_date }</td>
            <td><div id='imsi'><div data-score="${imsi.r_star }" id=star></div></div></td>
            <c:choose>
                 <c:when test="${imsi.r_writer ne null && imsi.r_check eq 1}">
                   <td>
                      <a href='javascript: like_func(${imsi.r_num});'>
                      <div id="${imsi.r_num}like_img"><img src="<spring:url value='/E:/upload/test/positive-c.png'/>"/></div></a>
                      <div id="${imsi.r_num}like_cnt">${imsi.r_good }</div>
                   </td>
                   <td>
                      <a href='javascript: dislike_func(${imsi.r_num});'>
                      <div id="${imsi.r_num}dislike_img"><img src="<spring:url value='/E:/upload/test/negative-b.png'/>"/></div></a>
                      <div id="${imsi.r_num}dislike_cnt">${imsi.r_bad }</div>
                   </td>
                </c:when>
                <c:when test="${imsi.r_writer ne null && imsi.r_check eq -1 }">
                   <td>
                      <a href='javascript: like_func(${imsi.r_num});'>
                      <div id="${imsi.r_num}like_img"><img src="<spring:url value='/E:/upload/test/positive-b.png'/>"/></div></a>
                      <div id="${imsi.r_num}like_cnt">${imsi.r_good }</div>
                   </td>
                   <td>
                      <a href='javascript: dislike_func(${imsi.r_num});'>
                      <div id="${imsi.r_num}dislike_img"><img src="<spring:url value='/E:/upload/test/negative-c.png'/>"/></div></a>
                      <div id="${imsi.r_num}dislike_cnt">${imsi.r_bad }</div>
                   </td>
                </c:when>
                <c:when test="${imsi.r_writer ne null && imsi.r_check eq 0 }">
                   <td>
                      <a href='javascript: like_func(${imsi.r_num});'>
                      <div id="${imsi.r_num}like_img"><img src="<spring:url value='/E:/upload/test/positive-b.png'/>"/></div></a>
                      <div id="${imsi.r_num}like_cnt">${imsi.r_good }</div>
                   </td>
                   <td>
                      <a href='javascript: dislike_func(${imsi.r_num});'>
                      <div id="${imsi.r_num}dislike_img"><img src="<spring:url value='/E:/upload/test/negative-b.png'/>"/></div></a>
                      <div id="${imsi.r_num}dislike_cnt">${imsi.r_bad }</div>
                   </td>
                </c:when>
                <c:otherwise>
                   <td>
                      <a href='javascript: login_need();'><img src="<spring:url value='/E:/upload/test/positive-b.png'/>" /></a>
                      ${imsi.r_good }
                   </td>
                   <td>
                      <a href='javascript: login_need();'><img src="<spring:url value='/E:/upload/test/negative-b.png'/>" /></a>
                      ${imsi.r_bad }
                   </td>
                </c:otherwise>
             </c:choose>
         </tr>
         <tr>
            <td colspan=6>${imsi.r_sangpum }-${imsi.r_size }구매</td>
         </tr>
         <tr>
            <td colspan=6>${imsi.r_title }</td>
         </tr>
         <tr>
            <td colspan=6>${imsi.r_text }</td>
         </tr>
         <c:if test="${imsi.original_fname != 'noFile'}">
            <td colspan=6><img src="<spring:url value='/E:/upload/test/${imsi.stored_fname }'/>"/></td>
         </c:if>
         
      </c:forEach>
   </table>
   <div id= "main_paging">
      <c:forEach var="i" begin="1" end="${totalnum2 }" step="1">
           <li>
              <input type="button" value="${i }" onclick="pagingreview(${i } , '${productcode }' , '${user }', ${choice })">
           </li>
      </c:forEach>
   </div>
   <div id = "sub_review">
   </div>
   
   <table style="width:20%;">
         <tr>
            <td colspan = 6 style="text-align:right;"><input type="button" value="작성하기" onclick="location.href='goreviewinsert?productcode=${productcode}'"></td>
         </tr>
   </table>
   
   

</body>
</html>