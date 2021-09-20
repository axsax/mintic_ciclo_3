package Modelo;


import java.util.ArrayList;

public interface CustomerDAO {
    
	Boolean crear(CustomerDTO c);

	Boolean eliminar(CustomerDTO c);

	Boolean actualizar(CustomerDTO c);

	ArrayList<CustomerDTO> listar();

	CustomerDTO consultar(String id);
}
