package Modelo;

import java.sql.SQLException;
import java.util.ArrayList;

import Conexion.Conexion;

public class SaleOP_DAO implements SaleDAO {

	@Override
	public Long crear(SaleDTO c) {
		String sql = "INSERT INTO clientes (cedula_cliente, email_cliente, nombre_cliente,telefono_cliente,direccion_cliente) values ('"
				+ c.getIdentification() + "','" + c.getEmail() + "','" + c.getName() + "','" + c.getPhone_number()
				+ "','" + c.getAddress() + "');";
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
