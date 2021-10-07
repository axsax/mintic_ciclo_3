package Modelo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Conexion.Conexion;

public class CustomerOP_DAO implements CustomerDAO {

	private final String login = "SELECT nombre_cliente FROM clientes ";
	private final String select = "SELECT cedula_cliente, email_cliente, nombre_cliente,telefono_cliente,direccion_cliente FROM clientes ";
	private Connection con = null;
	private Statement stm = null;
	private ResultSet rs = null;

	@Override
	public Boolean login(CustomerDTO c) {
		return null;
	}

	@Override
	public Boolean crear(CustomerDTO c) {
		String sql = "INSERT INTO clientes (cedula_cliente, email_cliente, nombre_cliente,telefono_cliente,direccion_cliente) values ('"
				+ c.getIdentification() + "','" + c.getEmail() + "','" + c.getName() + "','" + c.getPhone_number() + "','"
				+ c.getAddress() + "');";
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
	public Boolean eliminar(CustomerDTO c) {
		String sql = "DELETE FROM clientes WHERE cedula_cliente='" + c.getIdentification() + "';";
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
	public Boolean actualizar(CustomerDTO c) {
		String sql = "UPDATE clientes SET email_cliente='" + c.getEmail() + "', nombre_cliente='" + c.getName()
				+ "', direccion_cliente='" + c.getAddress() + "', telefono_cliente='" + c.getPhone_number() + "' WHERE cedula_cliente='" + c.getIdentification() + "';";
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
	public ArrayList<CustomerDTO> listar() {
		ArrayList<CustomerDTO> arrCustomerDTO = new ArrayList<>();

		try {
			this.con = Conexion.conectar();
			this.stm = this.con.createStatement();
			this.rs = this.stm.executeQuery(this.select);
			while (this.rs.next()) {
				arrCustomerDTO.add(this.getCompleteUser());
			}
			this.stm.close();
			this.rs.close();
			this.con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}

		return arrCustomerDTO;
	}

	@Override
	public CustomerDTO consultar(String id) {
		CustomerDTO customer = new CustomerDTO();

		String sql = select + " where cedula_cliente='" + id + "';";

		try {
			this.con = Conexion.conectar();
			this.stm = this.con.createStatement();
			this.rs = this.stm.executeQuery(sql);
			while (this.rs.next()) {
				customer = this.getCompleteUser();
			}
			this.stm.close();
			this.rs.close();
			this.con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}

		return customer;
	}

	private CustomerDTO getCompleteUser() {
		//cedula_cliente, email_cliente, nombre_cliente,telefono_cliente,direccion_cliente 
		CustomerDTO u = new CustomerDTO();
		try {
			u.setIdentification(this.rs.getLong(1));
			u.setEmail(this.rs.getString(2));
			u.setName(this.rs.getString(3));
			u.setPhone_number(this.rs.getString(4));
			u.setAddress(this.rs.getString(5));
		} catch (SQLException e) {
			System.out.println(e);
		}
		return u;
	}

}
