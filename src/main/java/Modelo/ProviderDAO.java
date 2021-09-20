package Modelo;

import java.util.ArrayList;

public interface ProviderDAO {
	Boolean crear(ProviderDTO c);

	Boolean eliminar(ProviderDTO c);

	Boolean actualizar(ProviderDTO c);

	ArrayList<ProviderDTO> listar();

	ProviderDTO consultar(String id);
}
