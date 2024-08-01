package resources;

import java.io.File;
//import java.io.IOException;
//import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class myConstants
 */
@WebServlet("/myConstants")
public class myConstants{
	//Database Configuration
	public static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
	public static final String DB_URL = "jdbc:mysql://localhost:3306/fusiontech";
	public static final String DB_USER_NAME = "root"; 		
	public static final String DB_USER_PASSWORD= ""; 
	
	public static final String ADMIN = "admin";
	public static final String USER = "user";
	
	public static final String IMAGE_DIR = "Users\\LENOVO\\eclipse-workspace\\22068095 Nishreyta Lamsal\\system\\development\\Fusion Tech\\src\\main\\webapp\\images";
	public static final String IMAGE_DIR_SAVE_PATH = "C:" + File.separator + IMAGE_DIR;
	// End Region: Database Configuration
	
	// Start Region: Select Query
	public static final String CHECK_LOGIN_INFO = "SELECT email, password FROM user_details WHERE email = ?";
	public static final String GET_ALL_INFO = "SELECT * FROM user_details";
	public static final String GET_ALL_INFO_BY_ID = "SELECT * FROM user_details WHERE id = ?";
	public static final String GET_ALL_INFO_BY_EMAIL = "SELECT * FROM user_details WHERE email = ?";
	public static final String IS_USER = "SELECT role FROM user_details WHERE email = ?";
	
	// Start Region: Insert Query
	public static final String USER_REGISTER = "INSERT INTO user_details"
			+ "(fullName, username, email, password, address, role, image)"
			+ " VALUES(?,?,?,?,?,?,?)";
	// End Region: Insert Query
	
	// Start Region: Update Query
	public static final String UPDATE_USER_INFO = "UPDATE user_details SET fullName=?, "
				+ "username=?, password=? WHERE email=?";
	// End Region: Update Query
		
	// Start Region: Delete Query
	public static final String DELETE_USER = "DELETE FROM user_details WHERE username=?";
	// End Region: Delete Query
	
	public static final String ADD_PRODUCT = "INSERT INTO product"
			+ "(product_name, category_id, price, stock, rating, product_img)"
			+ " VALUES(?,?,?,?,?,?)";
	
	public static final String DELETE_PRODUCT = "DELETE FROM product WHERE product_id=?";
	
	
	public static final String ADD_TO_CART = "insert into cart_items(cart_id, product_id) values (?,?)";
	
	public static final String CHECK_IF_CART_EXIST = "Select count(*) from cart where user_id=?";
	public static final String CREATE_CART = "insert into cart(user_id) values(?)";
	public static final String GET_CART_ID_BY_USER_ID = "SELECT cart_id from cart where user_id=?";
	public static final String FALLBACK_PAGE = "pages/error.jsp";
	public static final String GET_USER_ID_BY_EMAIL = "select id from user_details where email=?";
	public static final String INSERT_CART_DETAIL = "insert into order_list (cart_id) values (?)";
	public static final String UPDATE_PRODUCT = "UPDATE product SET product_name=?, category_id=?, price=?, stock=?, rating=?, product_img=? WHERE product_id=?";
}
