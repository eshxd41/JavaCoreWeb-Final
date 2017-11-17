package fr.tbr.iam.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class Login {
	
	@Size(min = 3, max = 50)
	@NotNull(message="{Login Name cannot be empty}")
	@NotEmpty
	private String username;
	
	@NotNull(message="{Password cannot be empty}")
	@NotEmpty
	private String password;

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username
	 *            the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 *            the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
}
