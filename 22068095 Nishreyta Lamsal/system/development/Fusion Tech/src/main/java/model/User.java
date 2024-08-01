package model;

import java.io.File;

import javax.servlet.http.Part;

import resources.myConstants;

public class User{
	private String fullName, username, email, password, address, role, imageUrlFromPart;
	
	
	public User(String fullName, String username, String email, String password, String address, String role, Part image) {
		this.fullName = fullName;
		this.username = username;
		this.email = email;
		this.password = password;
		this.address = address;
		this.role = role;
		this.imageUrlFromPart = this.getImageUrl(image);
	}
	
	public User(String fullName, String username, String email, String password, String address, String role, String image) {
		this.fullName = fullName;
		this.username = username;
		this.email = email;
		this.password = password;
		this.address = address;
		this.role = role;
		this.imageUrlFromPart = image;
	}
	
	public User() {
		
	}

	


	public User(String fullName, String username, String email, String password) {
		super();
		this.fullName = fullName;
		this.username = username;
		this.email = email;
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	
	public String getUsername() {
		return username;
	}
	public void setImageUrlFromPart(Part part) {
		this.imageUrlFromPart = getImageUrl(part);
	}
	
	public String getImageUrlFromPart() {
		return imageUrlFromPart;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password1) {
		this.password = password1;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	private String getImageUrl(Part part) {
		String savePath = myConstants.IMAGE_DIR_SAVE_PATH;
		File fileSaveDir = new File(savePath);
		String imageUrlFromPart = null;
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				imageUrlFromPart = s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		if(imageUrlFromPart == null || imageUrlFromPart.isEmpty()) {
			imageUrlFromPart= "download.png";
		}
		return imageUrlFromPart;
	}
}