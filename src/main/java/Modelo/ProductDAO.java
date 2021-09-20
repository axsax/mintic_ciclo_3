package Modelo;

import java.util.ArrayList;

public interface ProductDAO {
	Boolean crear(ProductDTO c);

	Boolean eliminar(ProductDTO c);

	Boolean actualizar(ProductDTO c);

	ArrayList<ProductDTO> listar();

	ProductDTO consultar(String id);
}
