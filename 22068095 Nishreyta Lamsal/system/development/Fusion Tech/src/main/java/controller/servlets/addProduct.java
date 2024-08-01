package controller.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.databaseConnection.DatabaseConnect;
import model.Product;
import resources.myConstants;

@WebServlet(asyncSupported = true, urlPatterns = { "/Product" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
	maxFileSize = 1024 * 1024 * 10, // 10MB
	maxRequestSize = 1024 * 1024 * 50)
public class addProduct extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Add Products to the database
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productName = request.getParameter("product-name");
		String categoryIdStr = request.getParameter("product-category");
		int categoryId = Integer.parseInt(categoryIdStr);
		String priceStr = request.getParameter("product-price");
		int price = Integer.parseInt(priceStr);
		String stockStr = request.getParameter("Stock");
		int stock = Integer.parseInt(stockStr);
		Part image = request.getPart("product-image");
		Product productModel = new Product(productName, categoryId, price, stock, image);
		
		String savePath = myConstants.IMAGE_DIR_SAVE_PATH;
	    String fileName = productModel.getImageUrl();
	    System.out.println(savePath + fileName);
	     if(!fileName.isEmpty() && fileName != null)
	    	 image.write(savePath + fileName);
	     
	     DatabaseConnect con = new DatabaseConnect();
			int result = con.addProduct(myConstants.ADD_PRODUCT, productModel);
			if(result == 1) {
				System.out.println("Success");
				request.setAttribute("addMessage", "Successfully Added");
				response.sendRedirect("pages/admin.jsp");
			}else if(result == -1) {
				System.out.println("Product exists.");
				request.setAttribute("addMessage", "Product Already Exists");
				request.getRequestDispatcher("/fusiontech/pages/addproduct.jsp").forward(request, response);
			}else {
				System.out.println("fail");
				request.getRequestDispatcher("/fusiontech/pages/addproduct.jsp").forward(request, response);
			}
	}
	

	
}