package Modelo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Conexion.Conexion;

public class ProviderOP_DAO implements ProviderDAO {

	private final String login = "SELECT nombre_proveedor FROM proveedores ";
	private final String select = "SELECT nit_proveedor,ciudad_proveedor,direccion_proveedor,nombre_proveedor,telefono_proveedor FROM proveedores ";
	private Connection con = null;
	private Statement stm = null;
	private ResultSet rs = null;

	@Override
	public Boolean login(ProviderDTO c) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean crear(ProviderDTO u) {
		String sql = "INSERT INTO proveedores (nit_proveedor,ciudad_proveedor,direccion_proveedor,nombre_proveedor,telefono_proveedor) values ('"
				+ u.getNit() + "','" + u.getCity() + "','" + u.getDirection() + "','" + u.getName() + "','"
				+ u.getPhone() + "');";
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
	public Boolean eliminar(ProviderDTO c) {
		String sql = "DELETE FROM proveedores WHERE nit_proveedor='" + c.getNit() + "';";
		try {
			this.con = Conexion.conectar();
			this.stm = this.con.createStatement();
			this.stm.execute(sql);

		} catch (SQLException e) {
			System.out.println(e);
			return false;
		}
		return true;
	}

	@Override
	public Boolean actualizar(ProviderDTO c) {
		String sql = "UPDATE proveedores SET ciudad_proveedor='" + c.getCity() + "', direccion_proveedor='"
				+ c.getDirection() + "', telefono_proveedor='" + c.getPhone() + "', nombre_proveedor='" + c.getName()
				+ "' WHERE nit_proveedor='" + c.getNit() + "';";
		try {
			this.con = Conexion.conectar();
			this.stm = this.con.createStatement();
			this.stm.execute(sql);
		} catch (SQLException e) {
			System.out.println(e);
			return false;
		}
		return true;
	}

	@Override
	public ArrayList<ProviderDTO> listar() {
		ArrayList<ProviderDTO> arrPoviderDTO = new ArrayList<>();

		try {
			this.con = Conexion.conectar();
			this.stm = this.con.createStatement();
			this.rs = this.stm.executeQuery(this.select);
			while (this.rs.next()) {
				arrPoviderDTO.add(this.getCompleteUser());
			}
			this.stm.close();
			this.rs.close();
			this.con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}

		return arrPoviderDTO;
	}

	@Override
	public ProviderDTO consultar(String id) {
		ProviderDTO provider = new ProviderDTO();

		String sql = select + " where nit_proveedor='" + id + "';";

		try {
			this.con = Conexion.conectar();
			this.stm = this.con.createStatement();
			this.rs = this.stm.executeQuery(sql);
			while (this.rs.next()) {
				provider = this.getCompleteUser();
			}
			this.stm.close();
			this.rs.close();
			this.con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}

		return provider;
	}

	private ProviderDTO getCompleteUser() {
		ProviderDTO u = new ProviderDTO();
		try {
			u.setNit(this.rs.getLong(1));
			u.setCity(this.rs.getString(2));
			u.setDirection(this.rs.getString(3));
			u.setName(this.rs.getString(4));
			u.setPhone(this.rs.getString(5));

		} catch (SQLException e) {
			System.out.println(e);
		}
		return u;
	}
}
