package controller.servlets;

import java.io.IOException;
import java.sql.Connection;

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

/**
 * Servlet implementation class ProductUpdate
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ProductUpdate" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class ProductUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        System.out.println("Updating");
        String productName = request.getParameter("product-name");
        String categoryIdStr = request.getParameter("product-category");
        int categoryId = 0; // Default value if parameter is null
        if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
            categoryId = Integer.parseInt(categoryIdStr);
        }

        String priceStr = request.getParameter("product-price");
        int price = 0; // Default value if parameter is null
        if (priceStr != null && !priceStr.isEmpty()) {
            price = Integer.parseInt(priceStr);
        }

        String stockStr = request.getParameter("Stock");
        int stock = 0; // Default value if parameter is null
        if (stockStr != null && !stockStr.isEmpty()) {
            stock = Integer.parseInt(stockStr);
        }
        
        Part image = request.getPart("product-image");
        Product productModel = new Product(productName, categoryId, price, stock, image);
        
        productModel.setProductName(productName);
        productModel.setPrice(price);
        productModel.setCategoryId(categoryId);
        productModel.setStock(stock);
        productModel.setImageUrl(image);
        
        DatabaseConnect con = new DatabaseConnect();
        int result = con.updateProductInfo(productModel);
        response.sendRedirect(request.getContextPath() + "/pages/updateproduct.jsp");
    }

}
