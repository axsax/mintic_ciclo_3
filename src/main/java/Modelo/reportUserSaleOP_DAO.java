package Modelo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Conexion.Conexion;

public class reportUserSaleOP_DAO implements reportUserSaleDAO {
	private Connection con = null;
	private Statement stm = null;
	private ResultSet rs = null;

	@Override
	public ArrayList<reportUserSaleDTO> listarVentasCliente() {
		ArrayList<reportUserSaleDTO> arrReportUserSaleDTO = new ArrayList<>();
		String select = "select c.nombre_cliente, c.cedula_cliente,sum(v.valor_venta) as ventas_totales from ventas as v  inner join clientes as c on c.cedula_cliente=v.cedula_cliente group by v.cedula_cliente;";
		try {
			this.con = Conexion.conectar();
			this.stm = this.con.createStatement();
			this.rs = this.stm.executeQuery(select);
			while (this.rs.next()) {
				arrReportUserSaleDTO.add(this.getCompleteReport());
			}
			this.stm.close();
			this.rs.close();
			this.con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}

		return arrReportUserSaleDTO;
	}

	private reportUserSaleDTO getCompleteReport() {
		reportUserSaleDTO u = new reportUserSaleDTO();
		try {
			u.setName(this.rs.getString(1));
			u.setId(this.rs.getLong(2));
			u.setTotal_price(this.rs.getDouble(3));

		} catch (SQLException e) {
			System.out.println(e);
		}
		return u;
	}

}
