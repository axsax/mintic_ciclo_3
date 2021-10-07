package Modelo;

public class CustomerDTO {
	private String address;
	private String phone_number;
	protected long identification;
	protected String email;
	protected String name;

	public CustomerDTO(Customer c) {
		this.address = c.address;
		this.phone_number = c.phone_number;
		this.identification = c.identification;
		this.email = c.email;
		this.name = c.name;
	}
	
	public CustomerDTO() {
		
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
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
