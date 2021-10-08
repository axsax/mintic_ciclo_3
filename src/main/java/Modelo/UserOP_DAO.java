package Modelo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Conexion.Conexion;

/*SE UTILIZA PARA LA TABLA DE BD USUARIOS*/
public class UserOP_DAO implements UserDAO {

	private final String login = "SELECT nombre_usuario,rol FROM usuarios ";
	private final String select = "SELECT cedula_usuario, email_usuario, nombre_usuario,usuario,rol FROM usuarios ";
	private Connection con = null;
	private Statement stm = null;
	private ResultSet rs = null;

	@Override
	public Boolean crear(UserDTO u) {
		String sql = "INSERT INTO usuarios (cedula_usuario,email_usuario,nombre_usuario,password,usuario,rol) values ('"
				+ u.getIdentification() + "','" + u.getEmail() + "','" + u.getName() + "','" + u.getPassword() + "','"
				+ u.getName()+ "','" + u.getRol() + "');";
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
	public Boolean eliminar(UserDTO c) {
		String sql = "DELETE FROM usuarios WHERE cedula_usuario='" + c.getIdentification() + "';";
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
	public Boolean actualizar(UserDTO user) {
		String sql = "UPDATE usuarios SET email_usuario='" + user.getEmail() + "', nombre_usuario='" + user.getName()
				+ "', usuario='" + user.getUser() + "' WHERE cedula_usuario='" + user.getIdentification() + "';";
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
	public ArrayList<UserDTO> listar() {
		ArrayList<UserDTO> arrUserDTO = new ArrayList<>();

		try {
			this.con = Conexion.conectar();
			this.stm = this.con.createStatement();
			this.rs = this.stm.executeQuery(this.select);
			while (this.rs.next()) {
				arrUserDTO.add(this.getCompleteUser());
			}
			this.stm.close();
			this.rs.close();
			this.con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}

		return arrUserDTO;
	}

	@Override
	public UserDTO consultar(String id) {
		UserDTO user = new UserDTO();

		String sql = select + " where cedula_usuario='" + id + "';";

		try {
			this.con = Conexion.conectar();
			this.stm = this.con.createStatement();
			this.rs = this.stm.executeQuery(sql);
			while (this.rs.next()) {
				user = this.getCompleteUser();
			}
			this.stm.close();
			this.rs.close();
			this.con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}

		return user;
	}

	@Override
	public String login(UserDTO u) {
		String sql = this.login + "where usuario='" + u.getUser() + "' and password= '" + u.getPassword()
				+ "' limit 1;";
		String name = "";
		String rol = "";
		try {
			this.con = Conexion.conectar();
			this.stm = this.con.createStatement();
			this.rs = this.stm.executeQuery(sql);
			while (this.rs.next()) {
				name = this.rs.getString(1);
				rol = this.rs.getString(2);
			}
			this.stm.close();
			this.rs.close();
			this.con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}

		return rol;
	}

	private UserDTO getCompleteUser() {
		UserDTO u = new UserDTO();
		try {
			u.setIdentification(this.rs.getLong(1));
			u.setEmail(this.rs.getString(2));
			u.setName(this.rs.getString(3));
			u.setUser(this.rs.getString(4));
			u.setRol(this.rs.getString(5));

		} catch (SQLException e) {
			System.out.println(e);
		}
		return u;
	}

}
