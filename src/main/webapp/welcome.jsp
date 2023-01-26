<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
	  rel="stylesheet" 
	  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
	  crossorigin="anonymous">
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
		String greeting2 = "Mandarin Shopping Mall";%>
	
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
<!-- 				메인사진 캐러셀으로 삽입 -->
			<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="./resources/images/main1.jpg" class="d-block w-100" alt="메인1">
			    </div>
			    <div class="carousel-item">
			      <img src="./resources/images/main2.jpg" class="d-block w-100" alt="메인2">
			    </div>
			    <div class="carousel-item">
			      <img src="./resources/images/main3.jpg" class="d-block w-100" alt="메인3">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
		
			<%
				response.setIntHeader("Refresh", 20); // 20초마다 자동 새로고침

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
			<p>이 페이지는 20초마다 자동 새로고침 됩니다.</p>
			</div>
		<hr>
		</div>
	</main>
	
	<%@ include file="footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
			crossorigin="anonymous">
	</script>
</body>
</html>