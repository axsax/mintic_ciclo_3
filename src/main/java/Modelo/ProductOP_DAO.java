package Modelo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;

import javax.swing.JOptionPane;

import Conexion.Conexion;

public class ProductOP_DAO implements ProductDAO {
	private final String select = "SELECT codigo_producto,iva_compra, nit_proveedor,nombre_producto,precio_compra,precio_venta FROM productos ";
	private Connection con = null;
	private Statement stm = null;
	private ResultSet rs = null;

	@Override
	public Boolean crear(ProductDTO c) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean eliminar(ProductDTO c) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean actualizar(ProductDTO c) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<ProductDTO> listar() {
		ArrayList<ProductDTO> arrProductDTO = new ArrayList<>();
		try {
			this.con = Conexion.conectar();
			this.stm = this.con.createStatement();
			this.rs = this.stm.executeQuery(this.select);
			while (this.rs.next()) {
				arrProductDTO.add(this.getCompleteProduct());
			}
			this.stm.close();
			this.rs.close();
			this.con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		return arrProductDTO;

	}

	@Override
	public ProductDTO consultar(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	private ProductDTO getCompleteProduct() {
		ProductDTO u = new ProductDTO();
		try {
			u.setCode(this.rs.getLong(1));
			u.setIva(this.rs.getDouble(2));
			u.setNit(this.rs.getLong(3));
			u.setProduct_name(this.rs.getString(4));
			u.setPurchase_price(this.rs.getDouble(5));
			u.setSale_price(this.rs.getDouble(6));
		} catch (SQLException e) {
			System.out.println(e);
		}
		return u;
	}

	@Override
	public Boolean creaMasivo(ArrayList<ProductDTO> c) {
		Boolean paso = true;
		for (int i = 0; i < c.size(); i++) {
			String sql = "INSERT INTO productos (codigo_producto, iva_compra, nit_proveedor,nombre_producto,precio_compra, precio_venta) values ('"
					+ c.get(i).getCode() + "','" + c.get(i).getIva() + "','" + c.get(i).getNit() + "','"
					+ c.get(i).getProduct_name() + "','" + c.get(i).getPurchase_price() + "','"
					+ c.get(i).getSale_price() + "');";
			try {
				this.con = Conexion.conectar();
				this.stm = this.con.createStatement();
				this.stm.execute(sql);
				this.stm.close();
				this.con.close();
			} catch (SQLException e) {
				JOptionPane.showMessageDialog(null, e);
				paso = false;
			}
		}
		
		return paso;

	}

}
