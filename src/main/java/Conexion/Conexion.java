package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.swing.JOptionPane;

public class Conexion {

//	private static final String url = "jdbc:mysql://localhost:3306/tiendagenerica";
	//private static final String usuario = "root";
	//private static final String password = "";
	//private static Connection con = null;

	//prestamosvf.czo3ixoe3xoe.us-east-1.rds.amazonaws.com
	//admin
	//Ciclo3_admi123
	//public static Connection conectar() {
	//	try {
	//		Class.forName("com.mysql.cj.jdbc.Driver");
	//		con = DriverManager.getConnection(url, usuario, password);
	//		if (con != null) {
	//			//JOptionPane.showMessageDialog(null, "Conectadito");
	//			// System.out.println("Conectadito");
	//		}
	//	} catch (Exception e) {
	//		//JOptionPane.showMessageDialog(null, "Paila " + e);
	//		System.out.println("Paila " + e);
	//	}
	//	return con;
	//}
	private static final String db="Grupo44_Equipo_5";
	private static final String url="jdbc:mariadb://prestamosvf.czo3ixoe3xoe.us-east-1.rds.amazonaws.com/"+db;
	private static final String user="admin";
	private static final String pass="Ciclo3_admi123";
	private static Connection con=null;
    
    public static Connection conectar() {
        
        try {
        Class.forName("org.mariadb.jdbc.Driver");
        con= DriverManager.getConnection(url,user,pass);
        //JOptionPane.showMessageDialog(null, "Conexion ok.....");
        }catch(Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la Conexion....."+e);
        }
        return con;
    }

}
