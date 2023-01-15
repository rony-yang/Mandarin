<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dto.Product" %>
<%@ page import = "dao.ProductRepository" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>상품 상세 정보</title>
</head>
<body style="font-family: 'IBMPlexSansKR-Regular';">
<jsp:include page="menu.jsp" />
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">상품 정보</h1>
	</div>
</div>
<%
	String id = request.getParameter("id");
	ProductRepository dao = ProductRepository.getInstance();
	Product product = dao.getProductById(id);
%>
<div class="container">
	<div class="row">
		<div class="col-md-4">
			<img src="./images/<%= product.getFilename()%>" style="width:100%">
		</div>
		<div class="col-md-6">
			<h3><%= product.getPname() %></h3>
			<p><%= product.getDescription() %></p>
			<p><b>상품 코드 : </b><span class="badge badge-danger"><%= product.getProductId() %></span></p>
			<p><b>제조사 : </b><%= product.getManufacturer() %></p>
			<p><b>분류 : </b><%= product.getCategory() %></p>
			<p><b>재고 수 : </b><fmt:formatNumber value="<%= product.getUnitsInStock() %>" pattern="#,###"/></p>
			<h4><fmt:formatNumber value="<%= product.getUnitPrice() %>" pattern="#,###"/>원</h4>
			<br>
			<p><a href="#" class="btn btn-info">상품 주문 &raquo;</a>&emsp;<a href="./products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a></p>
		</div>
	</div>
	<hr>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>