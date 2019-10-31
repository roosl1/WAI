<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script src="${pageContext.request.contextPath}/resources/theme_1/js/jquery-1.4.4.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/js/jquery.raty.js"></script>
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_search.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_sidebar.css" rel="stylesheet">

<script type="text/javascript">
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
        
        function move()
        {
            var offset = $("#detail").offset();

            $('html, body').animate({scrollTop : offset.top}, 400);        
        }
        
        function move2()
        {
            var offset = $("#hoogi").offset();

            $('html, body').animate({scrollTop : offset.top}, 400);      
        }
        
        function move3()
        {
            var offset = $("#qna").offset();

            $('html, body').animate({scrollTop : offset.top}, 400);   
        }
        
        function pm(number)
        {
           var num = Number($("#amount").val());
           
           if(num>=0)
           {
              num = num+number;
              if(num == -1)
              {
                 num = 0;   
              }
               $("#amount").val(num);
               
                $("#total").html(numberWithCommas(num*${pvo.productprice }));
           }
        }
        
        function numberWithCommas(x) 
        {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }
        
       $(document).ready(function()
      {
          $("#price").html(numberWithCommas(${pvo.productprice}));
      })
      
      function select()
      {
         var selectitem = $("#wansize").val();
         var changeitem ;
         
         

         if(selectitem == "S")
         {
            changeitem = [${colorS}];
         }
         else if(selectitem == "M")
         {
            changeitem = [${colorM}];
         }
         else if(selectitem == "L")
         {
            changeitem = [${colorL}];
         }
         else if(selectitem == "XL")
         {
            changeitem = [${colorXL}];
         }
         else if(selectitem == "210")
         {
            changeitem = [${color210}];
         }
         else if(selectitem == "220")
         {
            changeitem = [${color220}];
         }
         else if(selectitem == "230")
         {
            changeitem = [${color230}];
         }
         else if(selectitem == "240")
         {
            changeitem = [${color240}];
         }
         else if(selectitem == "250")
         {
            changeitem = [${color250}];
         }
         else if(selectitem == "260")
         {
            changeitem = [${color260}];
         }
         else if(selectitem == "270")
         {
            changeitem = [${color270}];
         }
         else if(selectitem == "280")
         {
            changeitem = [${color280}];
         }
         else
         {
            changeitem = 1;   
         }
      
         var size = changeitem.length;
         
         $('#wancolor').empty();
         $('#wancolor').append("<option>색상</option>");
      
         if(changeitem != 1)
         {
            for(var count = 0; count < size; count++)
            {
               var option = $("<option>" + changeitem[count] + "</option>");
               $('#wancolor').append(option);
            }
         }
      }
       
      
      function select2()
      {
         var a = "<input type='button' value='-' onclick='pm(-1);''><input type='text' id='amount' min='0' value='0' style='width:20px;' readOnly><input type='button' value='+' onclick='pm(1);'>";
         $('#selectall').html(a);
      }
      
      function cartins(productsubject1)
      {
         var test = $("#amount").val();
         
         if(test==null)
         {
            alert("사이즈와 색상 , 수량을 선택후 눌러");
            return false;
         }
         
         var sess = "<%=(String)session.getAttribute("loginid")%>";
               
         if(sess == "null")
         {
            alert("로그인 하고 이용해야지");
            var result = confirm("로그인 페이지로 이동하시겠습니까");
               
            if(result)
            {
               location.href='gologin';
            }
         }
         else
         {
            var cartdata = { productsubject: productsubject1 , wansize: $("#wansize").val() , wancolor: $("#wancolor").val() , amount: parseInt($("#amount").val()) };
            
            $.ajax(
            {   
               url : "cartinsert" ,  
               type : "POST" , 
               data :  JSON.stringify(cartdata) ,   
               dataType : "json" , 
               contentType : "application/json; charset=UTF-8" ,
               success : function(Data)
               {
                  alert("장바구니 담기 완료되었다");
                  var result = confirm("장바구니로 이동?");
                  
                  if(result)
                  {
                     /* location.href=''; */
                     alert("장바구니로 이동한 기분이 든다");
                  }
                  
               } ,
               error : function(request,error,xhr1 , status)
               {
                  alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
               }
            });
         }
      }
</script>
<body>
<div id="all-container">

<div id="user-header">
<ul>
<li><a href="loginwai">로그인</a></li>
<li><a href="check_member">회원가입</a></li>
<li><a href="gonoticeboard?user=UserA&page=1">공지사항</a></li>
<li><a href="#">1:1문의</a></li>
</ul>
</div>

<div id="user-sidebar">
<h1 style="font-size:50px;text-align:center;cursor:pointer;text-decoration:none"><a href="#">WAI</a></h1>
<ul>
<li class="menu" style="cursor:pointer;"><a>MAN</a>
<ul>
<li><a href="">상의</a></li>
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
<a href="goqnaboard1?user=admin&page=1">임시 admin Q&A게시판</a><br>
<a href="goqnaboard1?user=UserA&page=1">임시 user Q&A게시판</a><br>
<a href="goadminpage">임시 관리자 페이지</a>
</div>
<div id="all-content">
<br><br>
   <table>
      <tr>
         <td rowspan=8><img width="400" height="400" src="<spring:url value='/E:/upload/test/${pvo.stored_fname }'/>"/></td>
      </tr>
      <tr>
         <td>상품명</td>
         <td colspan=3>${pvo.productsubject }</td>
      </tr>
      <tr>
         <td>판매가</td>
         <td colspan=3><span id="price"></span> 원</td>
      </tr>
      <tr>
         <td>상품평</td>
         <td colspan=3><div data-score="${pvo.productstar }" id=star></div></td>
      </tr>
      <tr>
      <td colspan=2>사이즈
         <select name="wansize" id="wansize" onchange="select()">
            <option>사이즈</option>
            <c:forEach var="siz" items="${size }">
               <option value="${siz }">${siz }</option>
            </c:forEach>
         </select>
      </td>
      <td colspan=2>색상
         <select name="wancolor" id="wancolor" onchange="select2()">
            <option>색상</option>
         </select>
      </td>
      </tr>
      <tr>
         <td colspan=4><div id="selectall"></div></td>
      </tr>
      <tr>
         <td colspan=2>총 상품 금액</td>
         <td colspan=2><span id="total">0</span> 원</td>
      </tr>
      <tr>
         <td colspan=2><input class="button-long" type="button" value="바로 구매하기"></td>
         <td colspan=2><input class="button-long" type="button" value="장바구니에 담기" onclick="cartins('${pvo.productsubject }');"></td>
      </tr>
   </table>
   
   <table>
      <tr>
         <td id="detail"><input type="radio" onclick="move();"><label>상세정보</label><input type="radio" onclick="move2();"><label>상품후기</label><input type="radio" onclick="move3();"><label>Q&A</label></td>
		</tr>
		<tr>
			<td>${pvo.productcontents }<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br></td>
		</tr>
		<tr>
			<td id="hoogi"><input type="button" value="상세 정보" onclick="move();"> <input type="button" value="상품 후기" onclick="move2();"> <input type="button" value="Q&A" onclick="move3();"></td>
		</tr>
		<tr>
			<td>상품 후기 들어가는 곳<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br></td>
			<td><c:import url="/reviewboard"></c:import></td>
		</tr>
		<tr>
			<td id="qna"><input type="button" value="상세 정보" onclick="move();"> <input type="button" value="상품 후기" onclick="move2();"> <input type="button" value="Q&A" onclick="move3();"></td>
		</tr>
		<tr>
			<td>Q&A 들어가는 곳<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br></td>
			<td><c:import url="/goqnaboard?productcode=${pvo.productcode }"></c:import></td>
      </tr>
   </table>
   </div>
   </div>
   <script src="${pageContext.request.contextPath }/resources/theme_1/js/wai_jquery.js"></script>
</body>
</html>