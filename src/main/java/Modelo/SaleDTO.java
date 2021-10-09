package Modelo;

public class SaleDTO {

	private long code;
	private long customer_id;
	private long user_id;
	private double iva;
	private double total_sale;
	private double sale_value;

	public SaleDTO(Sale s) {
		this.code = s.code;
		this.customer_id = s.customer_id;
		this.user_id = s.user_id;
		this.iva = s.iva;
		this.total_sale = s.total_sale;
		this.sale_value = s.sale_value;
	}
	public SaleDTO() {
		
	}

	public long getCode() {
		return code;
	}

	public void setCode(long code) {
		this.code = code;
	}

	public long getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(long customer_id) {
		this.customer_id = customer_id;
	}

	public long getUser_id() {
		return user_id;
	}

	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}

	public double getIva() {
		return iva;
	}

	public void setIva(double iva) {
		this.iva = iva;
	}

	public double getTotal_sale() {
		return total_sale;
	}

	public void setTotal_sale(double total_sale) {
		this.total_sale = total_sale;
	}

	public double getSale_value() {
		return sale_value;
	}

	public void setSale_value(double sale_value) {
		this.sale_value = sale_value;
	}

}
