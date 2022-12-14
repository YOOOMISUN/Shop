<%@page import="java.util.Map"%>
<%@page import="Service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
NoticeService noticeService = new NoticeService();
Map<String, Object> map = noticeService.getNoticeOne(noticeNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Notice One</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<!-- Header -->
	<%@ include file="/inc/Header.jsp"%>


	<br>

	<div class="container">
		<div style="text-align: center;">
			<h2 style="font-weight: bold;">공지사항 상세페이지</h2>
			<br> <br>


			<table style="margin-left: auto; margin-right: auto;" class="table-bordered">
				<tr>
					<td style="font-weight: bold; padding: 20px 20px 20px 20px;">번호</td>
					<td style="padding: 1em;"><%=map.get("noticeNo")%></td>
				</tr>
				<tr>
					<td style="font-weight: bold; padding: 20px 20px 20px 20px;">생성 날짜</td>
					<td style="padding: 1em;"><%=map.get("createDate")%></td>
				</tr>
				<tr>
					<td style="font-weight: bold; padding: 20px 20px 20px 20px;">수정 날짜</td>
					<td style="padding: 1em;"><%=map.get("updateDate")%></td>
				</tr>
				<tr>
					<td style="font-weight: bold; padding: 10px 10px 10px 10px;">제목</td>
					<td style="size: 50; maxlength: 100; padding: 1em;"><%=map.get("noticeTitle")%></td>
				</tr>
				<tr>
					<td style="font-weight: bold; padding: 10px 10px 10px 10px;">내용</td>
					<td style="size: 50; maxlength: 100; padding: 10em;"><%=map.get("noticeContent")%></td>
				</tr>
			</table>

			<br>
			
			<a href="<%=request.getContextPath()%>/customerNoticeList.jsp"
				type="button" class="btn btn-dark" style="float: right;">공지사항목록</a>

		</div>
	</div>


		<!-- Footer -->
		<%@ include file="/inc/Footer.jsp"%>
</body>
</html>