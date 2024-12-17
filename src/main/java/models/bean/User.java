package models.bean;

public class User {
	private String username;
	private String password;
	private String name;
	private Role userRole;

	public enum Role {
		user, admin
	}

	public User() {
	}

	public User(String username, String password, String name) {
		this.username = username;
		this.password = password;
		this.name = name;
		this.userRole = Role.user;
	}

	public User(String username, String password, String name, Role userRole) {
		this.username = username;
		this.password = password;
		this.name = name;
		this.userRole = userRole;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public String getName() {
		return name;
	}

	public Role getUserRole() {
		return userRole;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setUserRole(Role userRole) {
		this.userRole = userRole;
	}
}