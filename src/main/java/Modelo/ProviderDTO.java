package Modelo;

public class ProviderDTO {
	private long nit;
	private String city;
	private String direction;
	private String name;
	private String phone;

	public ProviderDTO(Provider p) {
		this.nit = p.nit;
		this.city = p.city;
		this.direction = p.direction;
		this.name = p.name;
		this.phone = p.phone;
	}

	public long getNit() {
		return nit;
	}

	public void setNit(long nit) {
		this.nit = nit;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
}
