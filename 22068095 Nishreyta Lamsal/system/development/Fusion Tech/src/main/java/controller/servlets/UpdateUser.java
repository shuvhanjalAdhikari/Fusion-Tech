package controller.servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.databaseConnection.DatabaseConnect;
import model.PasswordEncryptionWithAes;
import model.User;

@WebServlet(asyncSupported = true, urlPatterns = { "/UpdateUser" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
	maxFileSize = 1024 * 1024 * 10, // 10MB
	maxRequestSize = 1024 * 1024 * 50)
public class UpdateUser  extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email;
			HttpSession session = request.getSession(false);
		    if (session != null) {
		        email = (String) session.getAttribute("user");
		        // do something with the email
		    } else {
		        throw new IOException("User is not logged in");
		    }
			DatabaseConnect con = new DatabaseConnect();
			ResultSet result = con.selectUserByEmail(email);
			
	        User user = null;
	        while (result.next()) {
	            String name = result.getString("fullName");
	            String username = result.getString("username");
	            String address = result.getString("address");
	            String role = result.getString("role");
	            String imageUrl = result.getString("image");
	            String password = result.getString("password");
	            user = new User(name, username, email, password, address, role, imageUrl);
	            // There should be only one row returned, so we can break out of the loop here
	            break;
	        }

	        if (user == null) {
	            throw new IOException("User not found");
	        }
	        
	        System.out.println("Get from form");
	        
	        // From the form
			String fullName = request.getParameter("full-name");
			String username = request.getParameter("username");
			String password = request.getParameter("password");	
			
			System.out.println("Got everything from from");
			if(password == null || password == "") password = user.getPassword();
			else password = PasswordEncryptionWithAes.encrypt(
					user.getEmail(), password);
			System.out.println("Password set");
			User userModel = new User(fullName, username, email, password);
			Boolean updateResult = con.updateUser(userModel);
			if (updateResult) response.sendRedirect("pages/userindex.jsp");
			else response.sendRedirect("pages/userprofile.jsp");
			
		} catch(SQLException e) {
			// Error
			response.sendRedirect("pages/userprofile.jsp");
		}
		
		

	}
	
}