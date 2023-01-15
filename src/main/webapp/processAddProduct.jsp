<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dto.Product" %>
<%@ page import = "dao.ProductRepository" %>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.util.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	String filename = "";
	String realFolder = "C:\\eclipse\\eclipse_web_work\\ShoppingMall\\src\\main\\webapp\\images"; // 이미지 절대 경로
	int MaxSize = 5 * 1024 * 1024; // 최대 업로드 파일 크기 5MB
	String encType = "UTF-8"; // 인코딩 유형

	MultipartRequest multi = new MultipartRequest(request, realFolder, MaxSize, encType, new DefaultFileRenamePolicy());
	
	// 내가 입력한 값을 받는 거라 String으로 선언
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitInStock = multi.getParameter("unitInStock");
	String condition = multi.getParameter("condition");
	
	Integer price;
	
	if (unitPrice.isEmpty()) {
		price = 0;
	} else {
		price = Integer.valueOf(unitPrice);
	}
	
	long stock;
	
	if (unitInStock.isEmpty()) {
		stock = 0;
	} else {
		stock = Long.valueOf(unitInStock);
	}
	
	Enumeration files = multi.getFileNames(); // 이미지 넣기 위해 사용
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	ProductRepository dao = ProductRepository.getInstance();
	
	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	newProduct.setFilename(filename);
	
	dao.addProduct(newProduct);
	response.sendRedirect("products.jsp");

%>