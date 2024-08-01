package controller.servlets.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.databaseConnection.DatabaseConnect;
import resources.myConstants;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("email");
		String pwd = request.getParameter("password");
	
		
		DatabaseConnect connection = new DatabaseConnect();
		
		Boolean isUserRegistered = connection.isUserRegistered(myConstants.CHECK_LOGIN_INFO, user, pwd);
		System.out.println(isUserRegistered);
		if(isUserRegistered != null && isUserRegistered){
			System.out.println("Logged in");
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			//setting session to expiry in 30 mins
			session.setMaxInactiveInterval(30*60);

			Cookie userName = new Cookie("user", user);
			userName.setMaxAge(30*60);
			response.addCookie(userName);
			if(connection.isAdmin(user)==1) response.sendRedirect(request.getContextPath()+"/pages/admin.jsp");
			else response.sendRedirect(request.getContextPath()+"/pages/userindex.jsp");
		}else{
			// set error message
			System.out.println("Invalid");
		    request.setAttribute("errorMessage", "Invalid username or password");
		    // forward request to login page
		    request.getRequestDispatcher("pages/login.jsp").forward(request, response);
		}
	}

}