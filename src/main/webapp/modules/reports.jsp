
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
	}
	%>
</div>