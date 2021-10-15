
<%@page import="Modelo.CustomerDTO"%>
<%@page import="Modelo.CustomerOP_DAO"%>
<%@page import="Modelo.UserDTO"%>
<%@page import="Modelo.UserOP_DAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.reportUserSaleDTO"%>
<%@page import="Modelo.reportUserSaleOP_DAO"%>
<%
String p = request.getParameter("action");
String titulo = "";
if (p.equals("users")) {
	titulo = "Listado de usuarios";
} else if (p.equals("customers")) {
	titulo = "Creación de usuarios";
} else if (p.equals("SaleByClient")) {
	titulo = "Ventas por clientes";
}
%>

<div class="container">
	<h2>
		<p class="text-center m-3"><%=titulo%></p>

	</h2>

	<%
	if (p.equals("SaleByClient")) {
		reportUserSaleOP_DAO listReportSales = new reportUserSaleOP_DAO();
		reportUserSaleDTO user = new reportUserSaleDTO();
		ArrayList<reportUserSaleDTO> arrListReportSales = new ArrayList<>();
		arrListReportSales = listReportSales.listarVentasCliente();
	%>


	<table class="table table-hover">
		<thead class="thead-dark">
			<tr>
				<th scope="col">#</th>
				<th scope="col">Nombre cliente</th>
				<th scope="col">Cédula cliente</th>
				<th scope="col">Ventas totales</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (int i = 0; i < arrListReportSales.size(); i++) {
			%>
			<tr class="al">
				<th scope="row"><%=i + 1%></th>
				<td class="numero"><%=arrListReportSales.get(i).getName()%></td>
				<td><%=arrListReportSales.get(i).getId()%></td>
				<td><%=arrListReportSales.get(i).getTotal_price()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<%
	}else
	if (p.equals("listUsers")) {
		UserOP_DAO listUser = new UserOP_DAO();
		UserDTO user = new UserDTO();
		ArrayList<UserDTO> arrUsers = new ArrayList<>();
		arrUsers = listUser.listar();
	%>
	
	<table class="table table-hover">
		<thead class="thead-dark">
			<tr>
				<th scope="col">#</th>
				<th scope="col">Cédula</th>
				<th scope="col">Correo electrónico</th>
				<th scope="col">Nombre</th>
				<th scope="col">Usuario</th>

			</tr>
		</thead>
		<tbody>
			<%
			for (int i = 0; i < arrUsers.size(); i++) {
			%>
			<tr class="al">
				<th scope="row"><%=i + 1%></th>
				<td class="numero"><%=arrUsers.get(i).getIdentification()%></td>
				<td><%=arrUsers.get(i).getEmail()%></td>
				<td><%=arrUsers.get(i).getName()%></td>
				<td><%=arrUsers.get(i).getUser()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<%
	} else if (p.equals("listClients")) {
		CustomerOP_DAO listCustomer = new CustomerOP_DAO();
		CustomerDTO customer = new CustomerDTO();
		ArrayList<CustomerDTO> arrCustomers = new ArrayList<>();
		arrCustomers = listCustomer.listar();
	%>
	<table class="table table-hover">
		<thead class="thead-dark">
			<tr>
				<th scope="col">#</th>
				<th scope="col">Cédula</th>
				<th scope="col">Correo electrónico</th>
				<th scope="col">Nombre</th>
				<th scope="col">Telefono</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (int i = 0; i < arrCustomers.size(); i++) {
			%>
			<tr class="al">
				<th scope="row"><%=i + 1%></th>
				<td class="numero"><%=arrCustomers.get(i).getIdentification()%></td>
				<td><%=arrCustomers.get(i).getEmail()%></td>
				<td><%=arrCustomers.get(i).getName()%></td>
				<td><%=arrCustomers.get(i).getPhone_number()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<%
	} 
	%>
</div>