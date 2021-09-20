package Modelo;

import java.util.ArrayList;

public interface UserDAO {
	Boolean login(UserDTO c);

	Boolean crear(UserDTO c);

	Boolean eliminar(UserDTO c);

	Boolean actualizar(UserDTO c);

	ArrayList<UserDTO> listar();

	UserDTO consultar(String id);
}
