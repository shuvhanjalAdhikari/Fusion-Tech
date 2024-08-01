package controller.databaseConnection;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.management.InstanceNotFoundException;

import model.PasswordEncryptionWithAes;
import model.User;
import model.Product;
import resources.myConstants;

public class DatabaseConnect {
	public static Connection getConnection(){
		try {
			Class.forName(myConstants.DRIVER_NAME);
			Connection connection = DriverManager.getConnection(
					myConstants.DB_URL,
					myConstants.DB_USER_NAME,
					myConstants.DB_USER_PASSWORD);
			return connection;
		}catch(SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	//	Start region Read operation
	public List<User> getAllData(String query) {
        List<User> dataList = new ArrayList<User>();
		Connection dbConnection = getConnection();
		if(dbConnection != null) {
			try {
	            Statement stmt = dbConnection.createStatement();
	            ResultSet rs = stmt.executeQuery(query);
	            while (rs.next()) {
	            	User data = new User();
	                data.setUsername(rs.getString("username"));
	                data.setEmail(rs.getString("email"));
	                dataList.add(data);
	            }
	            rs.close();
	            stmt.close();
	            dbConnection.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		}
        return dataList;
	}
	
	public ResultSet selectWhereQuery(String query, String id) {
		Connection dbConnection = getConnection();
		if(dbConnection != null) {
			try {
				PreparedStatement statement = dbConnection.prepareStatement(query);
				statement.setString(1, id);
				ResultSet result = statement.executeQuery();
				return result;
			} catch (SQLException e) {
				return null;
			}
		}else {
			return null;
		}
	}
	
	public ResultSet selectUserByEmail(String email) {
		Connection dbConnection = getConnection();
		if(dbConnection!=null) {
			try {
				PreparedStatement statement = dbConnection.prepareStatement(myConstants.GET_ALL_INFO_BY_EMAIL);
				statement.setString(1, email);
				ResultSet result = statement.executeQuery();
				return result;
			} catch(SQLException e) {
				return null;
			}
		} else {
			return null;
		}
	}
	
	public Boolean createCart(int userId) {
		try {
			Connection dbConnection = getConnection();
			PreparedStatement statement = dbConnection.prepareStatement(myConstants.CREATE_CART);
			statement.setInt(1, userId);
			int result = statement.executeUpdate();
			if (result < 0) return false;
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	public Boolean checkIfCartExists(int userId) {
		try {
			Connection dbConnection = getConnection();
			PreparedStatement statement = dbConnection.prepareStatement(myConstants.CHECK_IF_CART_EXIST);
			statement.setInt(1, userId);
			ResultSet set = statement.executeQuery();
			int count = 0;
			while (set.next()) {
				count = set.getInt(1);
				System.out.println("Count: " + 0);
			}
			if (count == 0) return false;
			return true;
		} catch(Exception e) {
			return false;
		}
	}
	
	public int getCartId(int userId) throws InstanceNotFoundException{
		try {
			Connection dbConnection = getConnection();
			PreparedStatement statement = dbConnection.prepareStatement(myConstants.GET_CART_ID_BY_USER_ID);
			statement.setInt(1, userId);
			ResultSet set = statement.executeQuery();
			
			while (set.next()) {
				System.out.println(set.getInt(1));
				return set.getInt(1);
			}
			throw new InstanceNotFoundException("Cart not found");
		} catch (Exception e) {
		throw new InstanceNotFoundException("Cart not found");
		}
	}
	
	public Boolean addToCart(int productId, int userId) {
		try {
			Connection dbConnection = getConnection();
			if (dbConnection == null) return false;
			if (!this.checkIfCartExists(userId)) this.createCart(userId);
			int cartId = this.getCartId(userId);
			System.out.println(cartId);
			
			PreparedStatement statement = dbConnection.prepareStatement(myConstants.ADD_TO_CART);
			statement.setInt(1, cartId);
			statement.setInt(2, productId);
			
			var result = statement.executeUpdate();
			if (result < 0) return false;
			
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public Boolean isUserAlreadyRegistered(String username) {
		Connection dbConnection = getConnection();
		if(dbConnection != null) {
			try {
				PreparedStatement statement = dbConnection.prepareStatement(myConstants.CHECK_LOGIN_INFO);
				statement.setString(1, username);
				System.out.print(statement);
				ResultSet result = statement.executeQuery();
				System.out.println(result);
				if(result.next()) {
					return true;		
				}
				else 
					return false;
			} 
			catch (SQLException e) { 
				return null; 
			}
		}
		else { 
			return null; 
		}
						
	}
	
	public Boolean checkoutCart(String userEmail) {
		try {
			Connection dbConnection = getConnection();
			if (dbConnection == null) return false;
			
			PreparedStatement statement = dbConnection.prepareStatement(myConstants.GET_USER_ID_BY_EMAIL);
			statement.setString(1, userEmail);
			
			ResultSet set = statement.executeQuery();
			while (set.next()) {
				int userId = set.getInt(1);
				int cartId = this.getCartId(userId);
				PreparedStatement insertStatement = dbConnection.prepareStatement(myConstants.INSERT_CART_DETAIL);
				insertStatement.setInt(1, cartId);
				int result = insertStatement.executeUpdate();
				if (result < 0) return false;
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	
	public Boolean isUserRegistered(String query, String username, String password) {
		Connection dbConnection = getConnection();
		System.out.println(dbConnection);
		if(dbConnection != null) {
			try {
				PreparedStatement statement = dbConnection.prepareStatement(query);
				statement.setString(1, username);
				ResultSet result = statement.executeQuery();
				if(result.next()) {
					String userDb = result.getString("email");
					String passwordDb  = result.getString("password");
					String decryptedPwd = PasswordEncryptionWithAes.decrypt(passwordDb, username);
					System.out.println(decryptedPwd);
					if(decryptedPwd!=null && userDb.equals(username) && decryptedPwd.equals(password)) 
						return true;
					else 
						return false;
				}
				else 
					return false;
			} 
			catch (SQLException e) { 
				System.out.println(e.getMessage());
				return null; 
			}
		}
		else { 
			return null; 
		}
	}
	
	public Boolean deleteProduct(int productId) {
		try {
			Connection dbConnection = getConnection();
			if (dbConnection == null) return false;
			PreparedStatement statement = dbConnection.prepareStatement(myConstants.DELETE_PRODUCT);
			statement.setInt(1, productId);
			int result = statement.executeUpdate();
			if (result < 0) return false;
			return true;
		} catch (SQLException e) {
			return false;
		}
	}
		
	public int isAdmin(String username) {
		Connection dbConnection = getConnection();
		if(dbConnection != null) {
			try {
				PreparedStatement statement = dbConnection.prepareStatement(myConstants.IS_USER);
				statement.setString(1, username);
				ResultSet result = statement.executeQuery();
				if(result.next()) {
					String role = result.getString("role");
					if(role.toLowerCase().equals(myConstants.ADMIN)) return 1;
					else return 0;
				}
				else return -1;
			} 
			catch (SQLException e) { 
				return -2; 
			}
		}
		else { 
			return -3; 
		}
	}
	//	End region Read operation

	//	Start region Create operation
	public int registerUser(String query, User userModel) {
		Connection dbConnection = getConnection();
		System.out.println(dbConnection);
		if(dbConnection != null) {
			try {
				System.out.println("connected");
				if(isUserAlreadyRegistered(userModel.getUsername())) return -1;
				System.out.println(userModel);
				PreparedStatement statement = dbConnection.prepareStatement(query);
				statement.setString(1, userModel.getFullName());
				statement.setString(2, userModel.getUsername());
				statement.setString(3, userModel.getEmail());
				statement.setString(5, userModel.getAddress());
				statement.setString(6, userModel.getRole());
				statement.setString(7, userModel.getImageUrlFromPart());
				statement.setString(4, PasswordEncryptionWithAes.encrypt(
						userModel.getEmail(), userModel.getPassword()));
				
				System.out.println(statement);

				int result = statement.executeUpdate();
				System.out.println(result);
				if(result>=0) 
					return 1;
				else 
					return 0;
			} 
			catch (Exception e) { 
				System.out.println("exception");
				System.out.println(e);
				return -2; 
			}
		}
		else { 
			System.out.println("no conn");
			return -3; 
		}
	}
	//	End region Create operation
	
	//	Start region Update operation
	public Boolean updateUser(String query, String username) {
		Connection dbConnection = getConnection();
		if(dbConnection != null) {
			try {
				PreparedStatement statement = dbConnection.prepareStatement(query);
				statement.setString(1, username);
				int result = statement.executeUpdate();
				
				if(result>=0)
					return true;
				else
					return false;
			} 
			catch (SQLException e) { 
				return null; 
				}
		}
		else { 
			return null; 
			}
	}
	//	End region Update operation
	
	//	Start region Delete operation
	public Boolean deleteUser(String query, String username) {
		Connection dbConnection = getConnection();
		if(dbConnection != null) {
			try {
				PreparedStatement statement = dbConnection.prepareStatement(query);
				statement.setString(1, username);
				int result = statement.executeUpdate();
				if(result>=0)
					return true;
				else 
					return false;
			} 
			catch (SQLException e) { 
				return null; 
			}
		}
		else { 
			return null; 
		}
	}
	//	End region Delete operation
	
	public Boolean isProductAlreadyAdded(String productName) {
		Connection dbConnection = getConnection();
		if(dbConnection != null) {
			try {
				PreparedStatement statement = dbConnection.prepareStatement(myConstants.CHECK_LOGIN_INFO);
				statement.setString(1, productName);
				System.out.print(statement);
				ResultSet result = statement.executeQuery();
				System.out.println(result);
				if(result.next()) {
					return true;		
				}
				else 
					return false;
			} 
			catch (SQLException e) { 
				return null; 
			}
		}
		else { 
			return null; 
		}
						
	}
	
	public Boolean updateUser(User user) {
		Connection dbConnection = getConnection();
		if (dbConnection == null) return false;
		try {
			System.out.println("Connected");
			PreparedStatement statement = dbConnection.prepareStatement(myConstants.UPDATE_USER_INFO);
			
			// set user identifier
			statement.setString(4, user.getEmail());
			
			// set updated details
			statement.setString(1, user.getFullName());
			statement.setString(2, user.getUsername());
			statement.setString(3, user.getPassword());
			
			int result = statement.executeUpdate();
			if (result < 0) return false;
			System.out.println("Success");
			return true;
		} catch(Exception e) {
			return false;
		}
		
	}
	
	public int addProduct(String query, Product productModel) {
		Connection dbConnection = getConnection();
		System.out.println(dbConnection);
		if(dbConnection != null) {
			try {
				System.out.println("connected");
				if(isProductAlreadyAdded(productModel.getProductName())) return -1;
				System.out.println(productModel);
				PreparedStatement statement = dbConnection.prepareStatement(query);
				statement.setString(1, productModel.getProductName());
				statement.setInt(2, productModel.getCategoryId());
				statement.setInt(3, productModel.getPrice());
				statement.setInt(4, productModel.getStock());
				statement.setDouble(5, productModel.getRating());
				statement.setString(6, productModel.getImageUrl());
				
				System.out.println(statement);

				int result = statement.executeUpdate();
				System.out.println(result);
				if(result>=0) 
					return 1;
				else 
					return 0;
			} 
			catch (Exception e) { 
				System.out.println("exception");
				System.out.println(e);
				return -2; 
			}
		}
		else { 
			System.out.println("no conn");
			return -3; 
		}
	}
	public int updateProductInfo(Product productModel) {
        try (Connection con = getConnection()) {
            PreparedStatement pstmt = con.prepareStatement(myConstants.UPDATE_PRODUCT);
            pstmt.setString(1, productModel.getProductName());
            pstmt.setInt(2, productModel.getPrice());
            pstmt.setInt(3, productModel.getCategoryId());
            pstmt.setInt(4, productModel.getStock());
            pstmt.setString(5, productModel.getImageUrl());
            int result = pstmt.executeUpdate();
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1; // Return -1 to indicate an error
        }
    }
	
}