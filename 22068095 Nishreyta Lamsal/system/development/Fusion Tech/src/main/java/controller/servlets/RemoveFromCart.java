package controller.servlets;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RemoveFromCart")
public class RemoveFromCart extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the product ID parameter from the form
        String productId = request.getParameter("productId");

        // Remove the product from the cart in the database
        removeProductFromCart(productId);

        // Redirect back to the cart page or any other page as needed
        response.sendRedirect(request.getContextPath() + "/pages/cart.jsp");
    }

    // Method to remove product from the cart in the database
    private void removeProductFromCart(String productId) {
        // Database connection details
        String url = "jdbc:mysql://localhost:3306/fusiontech";
        String user = "root";
        String password = ""; // Your database password

        // SQL query to remove the product from the cart
        String sql = "DELETE FROM cart_items WHERE product_id = ?";

        try (Connection conn = DriverManager.getConnection(url, user, password);
             PreparedStatement statement = conn.prepareStatement(sql)) {

            // Set the product ID parameter in the SQL query
            statement.setString(1, productId);

            // Execute the SQL update statement
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(); // Handle any SQL errors
        }
    }
}
