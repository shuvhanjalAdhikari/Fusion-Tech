package controller.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.databaseConnection.DatabaseConnect;
import resources.myConstants;

@WebServlet("/Checkout")
public class Checkout extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession(false);
            String userEmail = (String) session.getAttribute("user");

            DatabaseConnect con = new DatabaseConnect();
            Boolean isSuccess = con.checkoutCart(userEmail);

            if (isSuccess==true) {
                // Remove all items from the session cart after successful checkout
                session.removeAttribute("cart_items");
                response.sendRedirect(request.getContextPath() + "/pages/userindex.jsp");
            } else {
                request.getRequestDispatcher("/fusiontech/" + myConstants.FALLBACK_PAGE).forward(request, response);
            }
        } catch (Exception e) {
            request.getRequestDispatcher("/fusiontech/" + myConstants.FALLBACK_PAGE).forward(request, response);
        }
    }
}

