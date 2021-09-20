package Modelo;

public class Provider {
	protected long nit;
	protected String city;
	protected String direction;
	protected String name;
	protected String phone;

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
