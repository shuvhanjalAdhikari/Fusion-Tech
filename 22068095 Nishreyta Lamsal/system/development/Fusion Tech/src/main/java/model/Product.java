package model;

import java.io.File;

import javax.servlet.http.Part;

import resources.myConstants;

public class Product {
	private int productId;
	private String productName;
	private int categoryId;
	private int price;
	private int stock;
	private double rating;
	private String imageUrl;

	public Product(int productId, String productName, int categoryId, int price, int stock, Part image) {
		this.productId = productId;
		this.productName = productName;
		this.categoryId = categoryId;
		this.price = price;
		this.stock = stock;
		this.setRating(0);
		this.imageUrl = this.getImageUrl(image);
	}



	public Product() {
	}

	public Product(String productName, int categoryId, int price, int stock, Part image) {
		super();
		this.productName = productName;
		this.categoryId = categoryId;
		this.price = price;
		this.stock = stock;
		this.setRating(0);
		this.imageUrl = this.getImageUrl(image);
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	private String getImageUrl(Part image) {
		String savePath = myConstants.IMAGE_DIR_SAVE_PATH;
		File fileSaveDir = new File(savePath);
		String imageUrlFromPart = null;
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		String contentDisp = image.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				imageUrlFromPart = s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		if(imageUrlFromPart == null || imageUrlFromPart.isEmpty()) {
			imageUrlFromPart= "download.png";
		}
		return imageUrlFromPart;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(Part image) {
		this.imageUrl = this.getImageUrl(image);
	}



	public double getRating() {
		return rating;
	}



	public void setRating(double rating) {
		this.rating = rating;
	}
}