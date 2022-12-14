<%@page import="java.util.Map"%>
<%@page import="Service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 로그인 안되어 있거나 user가 Employee가 아니면 로그인 폼으로...
	if(session.getAttribute("id") == null || (!(session.getAttribute("user").equals("Employee"))) ){
		response.sendRedirect(request.getContextPath() + "/loginForm.jsp");
		return;
	} 
	
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	NoticeService noticeService = new NoticeService();
	Map<String,Object> map = noticeService.getNoticeOne(noticeNo);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>▶관리자◀ Notice One</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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
		<h2 style="font-weight :bold;">공지사항 상세페이지</h2>
		<br>
		<br>
		<form action="<%=request.getContextPath()%>/admin/updateNoticeForm.jsp?noticeNo=<%=map.get("noticeNo")%>" method="post">
		<table style=" margin-left:auto; margin-right:auto; text-align:center; " class="table-bordered" >
		 	<tr>
			    <td style="font-weight:bold; padding:20px 20px 20px 20px;">No</td>
			    <td style="padding:1em;"><%=map.get("noticeNo")%></td>
			</tr>
			<tr>
			    <td style="font-weight:bold; padding:20px 20px 20px 20px;">Create Date</td>
			    <td style="padding:1em;"><%=map.get("createDate")%></td>
			</tr>
			<tr>
			    <td style="font-weight:bold; padding:20px 20px 20px 20px;">Update Date</td>
			 	<td style="padding:1em;"><%=map.get("updateDate")%></td>
		    </tr> 
		    <tr>
			    <td style="font-weight:bold; padding:10px 10px 10px 10px; ">Title</td>
			    <td style="size:50; maxlength:100; padding:1em;"><%=map.get("noticeTitle")%></td>
		    </tr>
		    <tr>
			    <td style="font-weight:bold; padding:10px 10px 10px 10px;">Content</td>
			    <td style="size:50; maxlength:100; padding:10em;"><%=map.get("noticeContent")%></td>
		    </tr>
		 </table>
			<br>
			<%
				if(session.getAttribute("user").equals("Employee") && session.getAttribute("active").equals("Y") ){ %>
				<button type="submit" class="btn btn-warning" style="float: right;">수정하기</button>	<!-- 관리자 'Y' 인 사람만 수정 가능하게... -->
				<a href="<%=request.getContextPath()%>/admin/removeNoticeAction.jsp?noticeNo=<%=map.get("noticeNo")%>" class="btn btn-dark" style="float: right; margin-right :20px;">삭제하기</a>
			<%
				}
			%>
			<a href="<%=request.getContextPath()%>/admin/adminNoticeList.jsp" type="button" class="btn btn-dark" style="float: right; margin-right :20px;">공지사항목록</a>
		</form>
	</div>
</div>
	
	
	<!-- Footer -->
	<%@ include file="/inc/Footer.jsp" %>
	
 
	
	
</body>
</html>