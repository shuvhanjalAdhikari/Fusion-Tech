package controller.filters.login;

import java.io.IOException;
//import java.nio.file.DirectoryStream.Filter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.databaseConnection.DatabaseConnect;

@WebFilter("/authenticationfilter")
public class AuthenticationFilter implements Filter 
{
private ServletContext context;
	
	public void init(FilterConfig filterConfig) throws ServletException {
		this.context = filterConfig.getServletContext();
		this.context.log("AuthenticationFilter initialized");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		DatabaseConnect conn = new DatabaseConnect();
	
        // Check if the request is a login or logout request
        String uri = req.getRequestURI();
		boolean isLoginJsp = uri.toLowerCase().endsWith("login.jsp");
		boolean isPublicIndex = uri.toLowerCase().endsWith("index.jsp");
		boolean isLoginServlet = uri.endsWith("LoginServlet");
		boolean isLogoutServlet = uri.endsWith("LogoutServlet");
		boolean isRegisterJsp = uri.endsWith("register.jsp");
		boolean isUserRegisterServlet = uri.endsWith("UserRegister");


		HttpSession session = req.getSession(false);
        boolean loggedIn = session != null && session.getAttribute("user") != null;
        String userHomepage;
        if (session != null) userHomepage = conn.isAdmin((String) session.getAttribute("user")) == 1 ? "/pages/userindex.jsp" : "/pages/admin.jsp";
        else userHomepage = "/pages/index.html";
        
        if(!loggedIn && !(isLoginJsp || isUserRegisterServlet || isLoginServlet || isRegisterJsp || isPublicIndex) && !uri.contains("css") && !uri.toLowerCase().contains("image") && !uri.toLowerCase().contains("error")){
            res.sendRedirect(req.getContextPath()+"/pages/register.jsp");
        }else if (loggedIn && (isRegisterJsp)) {
		    res.sendRedirect(req.getContextPath() + userHomepage);
	    }else if(loggedIn && !(!isLoginJsp || isLogoutServlet)) {
			res.sendRedirect(req.getContextPath() + userHomepage);
		}else{
			chain.doFilter(request, response);
		}		
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

	//@Override
	public boolean accept(Object entry) throws IOException {
		// TODO Auto-generated method stub
		return false;
	}

}