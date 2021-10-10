package Modelo;

import java.util.ArrayList;

public interface Sale_DetailDAO {
	Boolean crear(Sale_DetailDTO c);

	Boolean eliminar(Sale_DetailDTO c);

	Boolean actualizar(Sale_DetailDTO c);

	ArrayList<Sale_DetailDTO> listar();
	

	Sale_DetailDTO consultar(String id);
}
