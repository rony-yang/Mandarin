<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<style>
@font-face {
    font-family: 'IBMPlexSansKR-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
<title>Welcome</title>
</head>
<body style="font-family: 'IBMPlexSansKR-Regular';">
	<%@ include file="menu.jsp" %>	
	<%! String greeting1 = "Welcome to";
		String greeting2 = "Mandarin Shopping Mall";
		String tagline = "이곳은 과일을 판매하는 쇼핑몰입니다";%>
	
	<div class="jumbotron">
		<div class="container">
			<h3 class="text-center">
				<%= greeting1 %>
			</h3>
			<h1 class="display-3" style="font-size:350%; text-align: center; font-weight: bold;">
				<%= greeting2 %>
			</h1>
		</div>
	</div>
		
	<main role="main">
		<div class="container">
			<div class="text-center">
			<br>
			<br>
				<h3>
					<%= tagline %>
					<br>
				</h3>
				<br>
				<br>
				<br>
				
				<%
					response.setIntHeader("Refresh", 5); // 5초마다 자동 새로고침

					Date today = new Date();
					SimpleDateFormat date = new SimpleDateFormat("yyyy년 M월 d일");
					SimpleDateFormat time = new SimpleDateFormat("a h시 m분 s초");
				%>
				<br>
				<%
					out.println(date.format(today));
				%>
				<br>
				<%	
					out.println(time.format(today));
				%>
				<br><br>
				<p>이 페이지는 5초마다 자동 새로고침 됩니다.</p>
			</div>
			<hr>
		</div>
	</main>
	<%@ include file="footer.jsp" %>
</body>
</html>