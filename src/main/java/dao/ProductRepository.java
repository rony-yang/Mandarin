package dao;

import java.util.ArrayList;
import dto.Product;

public class ProductRepository {

	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();

	public static ProductRepository getInstance(){
		return instance;
	} 

	// 이미지 비율 4:3으로 맞추기
	public ProductRepository() {
		Product banana = new Product("P1234", "바나나", 5480);
		banana.setDescription("필리핀의 고산지대에서 재배되어 부드러우면서도 찰진 식감을 자랑하는 바나나입니다.");
		banana.setUnitsInStock(100);
		banana.setCondition("정상 제품");
		banana.setFilename("P1234.png");

		Product tomato = new Product("P1235", "토마토", 7980);
		tomato.setDescription("과즙이 많고 아삭아삭 씹는 맛이 좋은 봄/여름철 계절 별미인 찰토마토입니다.");
		tomato.setUnitsInStock(1300);
		tomato.setCondition("할인 제품");
		tomato.setFilename("P1235.png");

		Product strawberry = new Product("P1236", "딸기", 19900);
		strawberry.setDescription("과즙이 많고 상쾌하고 시원한 식감이 특징인 우리나라 딸기입니다.");
		strawberry.setUnitsInStock(2000);
		strawberry.setCondition("정상 제품");
		strawberry.setFilename("P1236.png");

		listOfProducts.add(banana);
		listOfProducts.add(tomato);
		listOfProducts.add(strawberry);
	}
	
//	Product kiwi = new Product("P1237", "키위", 15800);
//	strawberry.setDescription("제주도의 따스한 햇살과 상쾌한 바람을 맞고 자란 국내산 제주 골드 키위입니다.");
//	strawberry.setUnitsInStock(500);
//	strawberry.setCondition("할인 제품");
//	strawberry.setFilename("P1237.png");
	
//	Product blueberry = new Product("P1238", "블루베리", 6980);
//	strawberry.setDescription("한 입 베어 물면 톡 터지며 새콤달콤한 과즙을 자랑하는 생블루베리입니다.");
//	strawberry.setUnitsInStock(400);
//	strawberry.setCondition("정상 제품");
//	strawberry.setFilename("P1238.png");	
	
//	Product lemon = new Product("P1239", "레몬", 11980);
//	strawberry.setDescription("갓 따온 것처럼 신선하고, 좋은 품질을 자랑하는 미국산 레몬입니다.");
//	strawberry.setUnitsInStock(200);
//	strawberry.setCondition("정상 제품");
//	strawberry.setFilename("P1239.png");	
	

	public ArrayList<Product> getAllProducts() {	// 상품 목록을 가져오는 메소드
		return listOfProducts;
	}
	
	public Product getProductById(String productId) {	// 상품 상세정보를 가져오는 메소드
		Product productById = null;
		for (int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if (product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}
	
	public void addProduct(Product product) {	// 신규 상품 데이터를 저장하는 메소드
		listOfProducts.add(product);
	}
}
