package Modelo;

public class Sale_DetailDTO {

	private long sale_detail_code;
	private int quantity;
	private long product_id;
	private long sale_id;
	private double total_sale;
	private double sale_value;
	private double iva_value;

	public Sale_DetailDTO(Sale_Detail sd) {
		this.sale_detail_code = sd.sale_detail_code;
		this.quantity = sd.quantity;
		this.product_id = sd.product_id;
		this.sale_id = sd.sale_id;
		this.total_sale = sd.total_sale;
		this.sale_value = sd.sale_value;
		this.iva_value = sd.iva_value;
	}
	
	public Sale_DetailDTO() {
		
	}

	public long getSale_detail_code() {
		return sale_detail_code;
	}

	public void setSale_detail_code(long sale_detail_code) {
		this.sale_detail_code = sale_detail_code;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public long getProduct_id() {
		return product_id;
	}

	public void setProduct_id(long product_id) {
		this.product_id = product_id;
	}

	public long getSale_id() {
		return sale_id;
	}

	public void setSale_id(long sale_id) {
		this.sale_id = sale_id;
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

	public double getIva_value() {
		return iva_value;
	}

	public void setIva_value(double iva_value) {
		this.iva_value = iva_value;
	}
}
