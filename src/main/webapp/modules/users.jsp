
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.UserDTO"%>
<%@page import="Modelo.UserOP_DAO"%>
<%
String p = request.getParameter("action");
String titulo = "";
if (p.equals("list")) {
	titulo = "Listado de usuarios";
} else if (p.equals("create")) {
	titulo = "Creación de usuarios";
}
%>



<div class="container">
	<h2>
		<%=titulo%>
	</h2>

	<%
	if (p.equals("list")) {
		UserOP_DAO listUser = new UserOP_DAO();
		UserDTO user = new UserDTO();
		ArrayList<UserDTO> arrUsers = new ArrayList<>();
		arrUsers = listUser.listar();
	%>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">Cédula</th>
				<th scope="col">Correo electrónico</th>
				<th scope="col">Nombre</th>
				<th scope="col">Usuario</th>
				<th scope="col">Acciónes</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (int i = 0; i < arrUsers.size(); i++) {
			%>
			<tr>
				<th scope="row"><%=i + 1%></th>
				<td style="text-align: center"><%=arrUsers.get(i).getIdentification()%></td>
				<td style="text-align: center"><%=arrUsers.get(i).getEmail()%></td>
				<td style="text-align: center"><%=arrUsers.get(i).getName()%></td>
				<td style="text-align: center"><%=arrUsers.get(i).getUser()%></td>
				<td style="text-align: center"><button>
						<a
							href="home.jsp?page=users&action=list&type=edit&id=<%=arrUsers.get(i).getIdentification()%>#modalEdicion">Editar</a>
					</button>
					<button>
						<a
							href="home.jsp?page=users&action=list&type=delete&id=<%=arrUsers.get(i).getIdentification()%>#modalEliminar">Eliminar</a>
					</button></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<%
	} else if (p.equals("create")) {
	%>
	<form action="../User" method="post">
		<div class="">
			<label>Cédula</label> <input class="" type="text"
				name="identification" placeholder="">
		</div>

		<div class="">
			<label>Usuario</label> <input class="" type="text" name="user"
				placeholder="">
		</div>
		<div class="">
			<label>Nombre Completo</label> <input class="" type="text"
				name="name" placeholder="">
		</div>
		<div class="">
			<label>Contraseña</label> <input class="" type="password"
				name="password" placeholder="">
		</div>
		<div class="">
			<label>Correo Electrónico</label> <input class="" type="email"
				name="email" placeholder="">
		</div>
		<input type="submit" name="createUser" value="Crear">
	</form>
	<%
	}
	String type = "";
	String user_identification = "";
	type = (request.getParameter("type") == null) ? "" : request.getParameter("type");
	user_identification = (request.getParameter("id") == null) ? "" : request.getParameter("id");

	if (type.equals("edit")) {
	if (!user_identification.isEmpty()) {
		UserOP_DAO editUser = new UserOP_DAO();
		UserDTO user = new UserDTO();
		user = editUser.consultar(user_identification);
	%>
	<!-- INICIO MODAL EDICION DE USUARIO -->
	<div id="modalEdicion" class="modal">
		<div class="modal-contenido">
			<a href="#">X</a>
			<form action="../User" method="post">
				<div class="">
					<label>Cédula</label> <input class="" type="text"
						name="identification" value="<%=user.getIdentification()%>"
						placeholder="" readonly>
				</div>

				<div class="">
					<label>Usuario</label> <input class="" type="text" name="user"
						placeholder="" value="<%=user.getName()%>">
				</div>
				<div class="">
					<label>Nombre Completo</label> <input class="" type="text"
						name="name" placeholder="" value="<%=user.getUser()%>">
				</div>
				<div class="">
					<label>Correo Electrónico</label> <input class="" type="email"
						name="email" placeholder="" value="<%=user.getEmail()%>">
				</div>
				<input type="submit" name="editUser" value="Editar">
			</form>
		</div>
	</div>
	<!-- FIN MODAL EDICION DE USUARIO -->
	<%
	}
	} else if (type.equals("delete")) {
	if (!user_identification.isEmpty()) {
	%>
	<div id="modalEliminar" class="modal">
		<div class="modal-contenido">
			<a href="#">X</a>
			<form action="../User" method="post">
				<p>¿Está seguro que desea eliminar el usuario?</p>
				<div class="">
					<label>Cédula</label> <input class="" type="text"
						name="identification" value="<%=user_identification%>"
						placeholder="" readonly>
				</div>
				<input type="submit" name="deleteUser" value="SI"></a> <a
					href="#">NO</a>

			</form>

		</div>
	</div>
	<%
	}
	}
	%>
</div>