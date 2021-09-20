package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.swing.JOptionPane;

public class Conexion {

	private static final String url = "jdbc:mysql://localhost:3306/tiendagenerica";
	private static final String usuario = "root";
	private static final String password = "";
	private static Connection con = null;

	public static Connection conectar() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, usuario, password);
			if (con != null) {
				//JOptionPane.showMessageDialog(null, "Conectadito");
				// System.out.println("Conectadito");
			}
		} catch (Exception e) {
			//JOptionPane.showMessageDialog(null, "Paila " + e);
			System.out.println("Paila " + e);
		}
		return con;
	}
}
