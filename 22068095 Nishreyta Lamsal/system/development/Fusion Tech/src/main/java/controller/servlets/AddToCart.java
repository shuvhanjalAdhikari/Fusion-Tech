package controller.servlets;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.databaseConnection.DatabaseConnect;
import resources.myConstants;

@WebServlet("/addToCart")
public class AddToCart extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Adds an item to the cart
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productIdString = request.getParameter("productId");
		int productId = Integer.parseInt(productIdString);

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("user");

		DatabaseConnect con = new DatabaseConnect();
		ResultSet set = con.selectUserByEmail(email);

		try {
			int userId;
			while (set.next()) {
				userId = set.getInt("id");
				Boolean result = con.addToCart(productId, userId);
				if (!result) response.sendRedirect(myConstants.FALLBACK_PAGE);
			}
			response.sendRedirect("pages/yourproducts.jsp");
		} catch (Exception e) {
			response.sendRedirect(myConstants.FALLBACK_PAGE);
		}

	}

}