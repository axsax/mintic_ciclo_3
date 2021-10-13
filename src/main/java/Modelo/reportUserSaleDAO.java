package Modelo;

import java.util.ArrayList;

public interface reportUserSaleDAO {
	ArrayList<reportUserSaleDTO> listarVentasCliente();
	double totalSales();
}
