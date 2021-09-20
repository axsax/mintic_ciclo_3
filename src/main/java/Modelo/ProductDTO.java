package Modelo;

public class ProductDTO {

	private long code;
	private double iva;
	private long nit;
	private String product_name;
	private double purchase_price;
	private double sale_price;

	public ProductDTO(Product pro) {
		this.code = pro.code;
		this.iva = pro.iva;
		this.nit = pro.nit;
		this.product_name = pro.product_name;
		this.purchase_price = pro.purchase_price;
		this.sale_price = pro.sale_price;
	}

	public long getCode() {
		return code;
	}

	public void setCode(long code) {
		this.code = code;
	}

	public double getIva() {
		return iva;
	}

	public void setIva(double iva) {
		this.iva = iva;
	}

	public long getNit() {
		return nit;
	}

	public void setNit(long nit) {
		this.nit = nit;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public double getPurchase_price() {
		return purchase_price;
	}

	public void setPurchase_price(double purchase_price) {
		this.purchase_price = purchase_price;
	}

	public double getSale_price() {
		return sale_price;
	}

	public void setSale_price(double sale_price) {
		this.sale_price = sale_price;
	}
}
