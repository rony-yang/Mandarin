<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dto.Product" %>
<%@ page import = "dao.ProductRepository" %>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.util.*" %>
<%@ page import ="java.io.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	String filename = "";
	String realFolder = "C:\\eclipse\\eclipse_web_work\\Mandarin\\src\\main\\webapp\\images"; // 이미지 절대 경로 - 이미지 업로드하면 이 폴더로 저장됨
// 	String realFolder = "C:\\upload"; // 이미지 절대 경로
	int MaxSize = 5 * 1024 * 1024; // 최대 업로드 파일 크기 5MB
	String encType = "UTF-8"; // 인코딩 유형

	// 폼에서 전달한 업로드 파일을 request 형식으로 받은 후, 실제 주소인 realFolder안에 넣어주는 작업
	// MultipartRequest를 사용하면 multi.getParameter();을 통해서만 값을 받아와야 한다
	// DefaultFileRenamePolicy() : 똑같은 이름을 가진 파일이 존재한다면 파일명(default)에 1, 2, 3 으로 붙게 해주는 클래스
	MultipartRequest multi = new MultipartRequest(request, realFolder, MaxSize, encType, new DefaultFileRenamePolicy());
	
	// 내가 입력한 값을 받는 거라 String으로 선언
	// request가 아닌 multi로 값을 받는다 - 폼에서 전송한 파라미터의 이름을 인자로 받아서 그 값을 반환
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
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
	
	// 구 버전 : Enumeration 을 Iterator로 변경 권장
	Enumeration<?> files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
			
	ProductRepository dao = ProductRepository.getInstance();
	
	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	//이미지 저장 부분
	newProduct.setFilename(filename);
	
	//Arraylist에 새상품을 추가
	dao.addProduct(newProduct);
	//페이지 이동
	response.sendRedirect("products.jsp");

%>