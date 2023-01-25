<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
@font-face {
    font-family: 'IBMPlexSansKR-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>상품 등록</title>
</head>
<body style="font-family: 'IBMPlexSansKR-Regular';">
<%@ include file="menu.jsp" %>	
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">상품 등록</h1>
	</div>
</div>
<div class="container">
<!-- 	이미지 업로드를 위해 설정 -->
	<form name="newProduct" action="./processAddProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
		<div class="form-group row">
			<label class="col-sm-2">상품 코드</label>
			<div class="col-sm-3">
				<input type="text" name="productId" class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상품명</label>
			<div class="col-sm-3">
				<input type="text" name="name" class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">가격</label>
			<div class="col-sm-3">
				<input type="text" name="unitPrice" class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상세정보</label>
			<div class="col-sm-5">
				<textarea name="description" cols="50" rows="2" class="form-control"></textarea>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">재고 수</label>
			<div class="col-sm-3">
				<input type="text" name="unitInStock" class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상태</label>
			<div class="col-sm-5">
				<input type="radio" name="condition" value="신규 제품">&nbsp;정상 제품&emsp;
				<input type="radio" name="condition" value="재생 제품">&nbsp;할인 제품
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">이미지</label>
			<div class="col-sm-5">
				<input type="file" name="productImage" class="form-control">
				<br>*** 상품코드와 이미지 파일명을 동일하게 설정해 주세요.
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" class="btn btn-primary" value="등록" />
				<input type="reset" class="btn btn-danger" value="초기화" />
				<a href="./products.jsp" class="btn btn-secondary">목록</a>
			</div>
		</div>
	</form>
</div>
<hr>
<%@ include file="footer.jsp" %>
</body>
</html>