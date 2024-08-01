package controller.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
//import java.io.IOException;
//import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.databaseConnection.DatabaseConnect;
import model.User;
import resources.myConstants;


@WebServlet(asyncSupported = true, urlPatterns = { "/UserRegister" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
	maxFileSize = 1024 * 1024 * 10, // 10MB
	maxRequestSize = 1024 * 1024 * 50)
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullName = request.getParameter("fullName");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String address = request.getParameter("address");		
		String role = request.getParameter("role");
		Part imagePart = request.getPart("image");	
		User userModel = new User(fullName, username, email, password, address, role, imagePart);
		
	    String savePath = myConstants.IMAGE_DIR_SAVE_PATH;
	    String fileName = userModel.getImageUrlFromPart();
	    System.out.println(savePath + fileName);
	     if(!fileName.isEmpty() && fileName != null)
    		 imagePart.write(savePath + fileName);
		
		DatabaseConnect con = new DatabaseConnect();
		int result = con.registerUser(myConstants.USER_REGISTER, userModel);
		if(result == 1) {
			System.out.println("Success");
			request.setAttribute("registerMessage", "Successfully Registered");
			request.getRequestDispatcher("/pages/index.jsp").forward(request, response);
		}else if(result == -1) {
			System.out.println("User exists");
			request.setAttribute("registerMessage", "User Already Exists");
			request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
		}else {
			System.out.println("fail");
			request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
		}
		
	}

}