package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import Conexion.Conexion;

public class Sale_DetailOP_DAO implements Sale_DetailDAO {
	private Connection con = null;
	private Statement stm = null;
	private ResultSet rs = null;

	@Override
	public Boolean crear(Sale_DetailDTO c) {
		String sql = "INSERT INTO tiendagenerica.detalle_ventas (codigo_detalle_venta, cantidad_producto, codigo_producto, codigo_venta, valor_total, valor_venta, valor_iva)"
				+ " values ('" + c.getSale_detail_code() + "','" + c.getQuantity() + "','" + c.getProduct_id() + "','"
				+ c.getSale_id() + "','" + c.getTotal_sale() + "','" + c.getSale_value() + "','" + c.getIva_value()
				+ "');";
		try {
			this.con = Conexion.conectar();
			this.stm = this.con.createStatement();
			this.stm.execute(sql);
			this.stm.close();
			this.con.close();
		} catch (SQLException e) {
			System.out.println(e);
			return false;
		}
		return true;
	}

	@Override
	public Boolean eliminar(Sale_DetailDTO c) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean actualizar(Sale_DetailDTO c) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Sale_DetailDTO> listar() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Sale_DetailDTO consultar(String id) {
		// TODO Auto-generated method stub
		return null;
	}


}
