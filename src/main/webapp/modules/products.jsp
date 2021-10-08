<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.ProductDTO"%>
<%@page import="Modelo.ProductOP_DAO"%>
<%
String rol = (String) session.getAttribute("rol");
String p = request.getParameter("action");
String titulo = "";
if (p.equals("list")) {
	titulo = "Listado de productos";
} else if (p.equals("create")) {
	titulo = "Creación de productos";
}
%>

<script type="text/javascript">
	function fileCsv() {
		var url = document.getElementById('inputFile').files[0].name;
		$.ajax({
			url : 'csv_data.csv',
			dataType : 'text',
		}).done(successFunction);
	}

	function successFunction(data) {
		var allRows = data.split(/r?n|r/);
		var table = '<table>';
		for (var singleRow = 0; singleRow < allRows.length; singleRow++) {
			if (singleRow === 0) {
				table += '<thead>';
				table += '<tr>';
			} else {
				table += '<tr>';
			}
			var rowCells = allRows[singleRow].split(',');
			for (var rowCell = 0; rowCell < rowCells.length; rowCell++) {
				if (singleRow === 0) {
					table += '<th>';
					table += rowCells[rowCell];
					table += '</th>';
				} else {
					table += '<td>';
					table += rowCells[rowCell];
					table += '</td>';
				}
			}
			if (singleRow === 0) {
				table += '</tr>';
				table += '</thead>';
				table += '<tbody>';
			} else {
				table += '</tr>';
			}
		}
		table += '</tbody>';
		table += '</table>';
		$('body').append(table);
	}
</script>

<div class="container">
	<h2>
		<p class="text-center m-3"><%=titulo%></p>

	</h2>

	<%
	if (p.equals("list")) {
		ProductOP_DAO listProduct = new ProductOP_DAO();
		ArrayList<ProductDTO> arrProduct = new ArrayList<>();
		arrProduct = listProduct.listar();
	%>
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">#</th>
				<th scope="col">Código Producto</th>
				<th scope="col">Iva</th>
				<th scope="col">NIT</th>
				<th scope="col">Producto</th>
				<th scope="col">Precio venta</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (int i = 0; i < arrProduct.size(); i++) {
			%>
			<tr class="al">
				<th scope="row"><%=i + 1%></th>
				<td class="numero"><%=arrProduct.get(i).getCode()%></td>
				<td><%=arrProduct.get(i).getIva()%></td>
				<td><%=arrProduct.get(i).getNit()%></td>
				<td><%=arrProduct.get(i).getProduct_name()%></td>
				<td><%=arrProduct.get(i).getSale_price()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<%
	} else if (p.equals("create")) {
	%>
	<form class="form-inline justify-content-center mb-2">

		<div class="form-group mb-2">
			<label for="inputEmail3" class="col-form-label">Escoja el
				archivo CSV</label>
		</div>
		<div class="form-group mx-sm-3 mb-2">
			<input type="file" accept=".csv" onchange="fileCsv()" class="form-control-file"
				id="inputFile">
		</div>

	</form>
	<button type="submit" class="btn btn-primary btn-lg btn-block">Confirm
		identity</button>

	<%
	}
	%>

</div>

