package Modelo;

public class UserDTO {
	private String password;
	private String user;
	protected long identification;
	protected String email;
	protected String name;

	public UserDTO() {
		
	}
	public UserDTO(User u) {
		this.password = u.password;
		this.user = u.user;
		this.identification = u.identification;
		this.email = u.email;
		this.name = u.name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public long getIdentification() {
		return identification;
	}

	public void setIdentification(long identification) {
		this.identification = identification;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
