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

<script language="JavaScript">
	function validate() {
		var inputField = document.getElementById('inputFile');
		if (inputField.files.length == 0) {
			Swal.fire({
				icon : 'error',
				title : 'Oops...',
				text : 'El documento es requerido!',
			})
			inputField.focus();
			return false;
		}

	}

	$(function() {
		$("#formuploadajax")
				.on(
						"submit",
						function(e) {
							e.preventDefault();
							var f = $(this);
							var texto;
							var time = 1000;
							var formData = new FormData(document
									.getElementById("formuploadajax"));
							formData.append("method", "createProducts");
							//formData.append(f.attr("name"), $(this)[0].files[0]);
							$
									.ajax({
										url : "../Product",
										type : "post",
										dataType : "html",
										data : formData,
										cache : false,
										contentType : false,
										processData : false
									})
									.done(
											function(res) {
												var o = JSON.parse(res);
												if (o['respuesta'] == 'success') {
													texto = "Productos cargados exitosamente";
													time = 1500;
												} else {
													res = 'error';
													texto = "Error subiendo productos, por favor revise el CSV";
													time = 3000;
												}
												Swal.fire({
													position : 'top-end',
													icon : o['respuesta'],
													title : texto,
													showConfirmButton : false,
													timer : time
												})
											});
						});
	});
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
	<table class="table table-hover">
		<thead class="thead-dark">
			<tr>
				<th class="text-center" scope="col">#</th>
				<th class="text-center" scope="col">Código Producto</th>
				<th class="text-center" scope="col">Iva</th>
				<th class="text-center" scope="col" class="text-center">NIT</th>
				<th class="text-center" scope="col">Producto</th>
				<th class="text-center" scope="col">Precio venta</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (int i = 0; i < arrProduct.size(); i++) {
			%>
			<tr class="al">
				<th class="text-center" scope="row"><%=i + 1%></th>
				<td class="numero text-center"><%=arrProduct.get(i).getCode()%></td>
				<td class="text-center"><%=arrProduct.get(i).getIva()%></td>
				<td class="text-center"><%=arrProduct.get(i).getNit()%></td>
				<td class="text-center"><%=arrProduct.get(i).getProduct_name()%></td>
				<td class="text-center"><%=arrProduct.get(i).getSale_price()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<%
	} else if (p.equals("create")) {
	%>

	<form enctype="multipart/form-data" id="formuploadajax" method="post"
		class="form-inline justify-content-center mb-2" onsubmit="validate()">

		<div class="form-group mb-2">
			<label for="inputEmail3" class="col-form-label">Escoja el
				archivo CSV</label>
		</div>
		<div class="form-group mx-sm-3 mb-2">
			<input type="file" accept=".csv" name="file"
				class="form-control-file" id="inputFile">
		</div>
		<button type="submit" class="btn btn-primary btn-lg btn-block">Subir
			archivos</button>

	</form>


	<%
	}
	%>

</div>



