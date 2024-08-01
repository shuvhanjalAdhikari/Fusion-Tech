package controller.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.databaseConnection.DatabaseConnect;

@WebServlet("/DeleteProduct")
public class DeleteProduct extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null) {
            // handle the case where the "id" parameter is missing
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing product ID");
            return;
        }
        int productId = Integer.parseInt(idParam);

        // call a method to delete the product with the given ID
        DatabaseConnect con = new DatabaseConnect();
        Boolean result = con.deleteProduct(productId);

        // redirect the user back to the product list page
        response.sendRedirect(request.getContextPath() + "/pages/admin.jsp");
    }
}