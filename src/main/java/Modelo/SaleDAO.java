package Modelo;

import java.util.ArrayList;

public interface SaleDAO {
	Long crear(SaleDTO c);

	Boolean eliminar(SaleDTO c);

	Boolean actualizar(SaleDTO c);

	ArrayList<SaleDTO> listar();

	SaleDTO consultar(String id);
}
