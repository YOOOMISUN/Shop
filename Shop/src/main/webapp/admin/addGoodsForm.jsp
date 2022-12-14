<%@page import="Service.GoodsService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<% 
		// 로그인 안되어 있거나 user가 Employee가 아니면 로그인 폼으로...
		if(session.getAttribute("id") == null || (!(session.getAttribute("user").equals("Employee"))) ){
			response.sendRedirect(request.getContextPath() + "/loginForm.jsp");
			return;
		} 
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>▶관리자◀ Add Goods Form</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

	<!-- Header -->
	<%@ include file="/inc/Header.jsp" %>
	
	<div class="container">
	<!-- 목록 -->
	<div>
		<br>
		<table style="margin-left:auto; margin-right:auto; text-align:center;" class="table table-bordered" >
			<tr>
				<td><a href="<%=request.getContextPath()%>/admin/adminCustomerList.jsp">고객관리</a></td>
				<td><a href="<%=request.getContextPath()%>/admin/employeeList.jsp">사원관리</a></td>
				<td><a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp">상품	관리</a></td>	<!-- 상품목록/등록/수정/삭제(장바구니,주문이 없는 경우=> 품절처리) -->
				<td><a href="<%=request.getContextPath()%>/admin/adminOrdersList.jsp">주문관리</a></td><!-- 주문목록/수정 -->
				<td><a href="<%=request.getContextPath()%>/admin/adminNoticeList.jsp">공지관리(게시판)</a></td><!-- 공지 CRUD -->
			</tr>
		</table>
	</div>
	
	<br>
	<br>

	<div style="text-align:center;">
		<h2 style="font-weight :bold;">상품 추가</h2>
		<br>
		<br>
			<form action="<%=request.getContextPath()%>/admin/addGoodsAction.jsp" method="post" enctype="multipart/form-data" id="insertForm">
				<table style=" margin-left:auto; margin-right:auto; text-align: center;" class="table table-bordered" >
					<tr>
						<td>Goods Name</td>
						<td><input type="text" class="form-control" name="name" id="name"></td>
					</tr>
					<tr>
						<td>Goods Price</td>
						<td><input type="text" class="form-control" name="price" id="price"></td>
					</tr>
					<tr>
						<td>Goods Img</td>
						<td><input type="file" id="file" name="file" ></td>
					
					<%
						if(request.getParameter("errorMsg") != null) {
					%>
						<td><span style="color:red;"><%=request.getParameter("errorMsg")%></span></td>
					<%		
						}
					%>
					</tr>		
				</table>
			
			<br>
			<br>
			
				<%
					if(session.getAttribute("user").equals("Employee") && session.getAttribute("active").equals("Y") ){ %>
					<button type="button" id="insertBtn" class="btn btn-info">추가하기</button> 	<!-- 관리자 'Y' 인 사람만 추가 가능하게... -->
				<%
					}		
				%>
				<a href="javascript:history.go(-1)" class="btn btn-danger" title="뒤로">돌아가기</a>
			</form>
		</div>
	</div>
	
	<!-- Footer -->
	<%@ include file="/inc/Footer.jsp" %>
	
	
	
</body>
<script>	// 유효성 검사
	$('#insertBtn').click(function(){			
		if($('#name').val().length < 1){
			alert('이름을 입력해주세요');
		} else if($('#price').val().length < 1){
			alert('가격을 입력해주세요');
		}else if($('#file').val().length < 1){
			alert('파일을 첨부해주세요');
		}else{
			insertForm.submit();
		}
	});
</script>

</html>