package Modelo;

public class reportUserSaleDTO {
	protected String name;
	protected Long id;
	protected Double total_price;

	public reportUserSaleDTO(String name, Long id, Double total_price) {
		this.name = name;
		this.id = id;
		this.total_price = total_price;
	}

	public reportUserSaleDTO() {

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Double getTotal_price() {
		return total_price;
	}

	public void setTotal_price(Double total_price) {
		this.total_price = total_price;
	}
}
