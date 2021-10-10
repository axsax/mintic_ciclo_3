package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import Conexion.Conexion;

public class SaleOP_DAO implements SaleDAO {
	private Connection con = null;
	private Statement stm = null;
	private ResultSet rs = null;

	@Override
	public String crear(SaleDTO c) {
		this.con = Conexion.conectar();
		String generatedKey = "";
		String sql = "INSERT INTO ventas (cedula_cliente, cedula_usuario, iva_venta, total_venta, valor_venta) values ('"
				+ c.getCustomer_id() + "','" + c.getUser_id() + "','" + c.getIva() + "','" + c.getTotal_sale() + "','"
				+ c.getSale_value() + "');";
		try {
			PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.executeUpdate();

			rs = ps.getGeneratedKeys();
			if (rs.next()) {
				generatedKey = rs.getString(1);
			}

			this.con.close();
			return generatedKey;
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, e.getMessage());
			System.out.println(e);
			return "";
		}
	}

	@Override
	public Boolean eliminar(SaleDTO c) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean actualizar(SaleDTO c) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<SaleDTO> listar() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SaleDTO consultar(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
