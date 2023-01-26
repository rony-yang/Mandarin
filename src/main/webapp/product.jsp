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
		<div class="col-md-5">
			<img alt="상품 사진" style="width:100%" src="./resources/images/<%=product.getFilename()%>">
		</div>
		<div class="col-md-6">
			<h3><%= product.getPname() %></h3>
			<p><%= product.getDescription() %></p>
			<table>
				<tr>
					<td><b>상품 코드</b></td>
					<td><td>
					<td><span class="badge badge-danger"><%= product.getProductId() %></span></td>
				</tr>
				<tr>
					<td><b>재고</b></td>
					<td>&ensp;<td>
					<td><fmt:formatNumber value="<%= product.getUnitsInStock() %>" pattern="#,###"/></td>
				</tr>
				<tr>
					<td><b>상태</b></td>
					<td>&ensp;<td>
					<td><%= product.getCondition() %></td>
				</tr>
			</tbody>
			</table>
			<br>
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