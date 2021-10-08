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

	function uploadFile() {
		var parametros = {
			"method" : "createProducts",
		};
		let formData = new FormData();
		formData.append("file", inputFile.files[0]);
		form.submit();
		form.submit(function() {
			$.ajax({
				type : 'Post',
				url : '../Product',
				body : formData,
				data : parametros,
				enctype : 'multipart/form-data',
			});
		});

	}

	function uploadFile2() {
		var parametros = {
			"method" : "createProducts",
			"file" : inputFile.files[0]
		};
		$.ajax({
			type : "POST",
			url : "../Product",
			body : formData,
			data : parametros,
			enctype : 'multipart/form-data',
			success : function(data) {
				console.log("entra");
			},
			error : function(jqXHR, exception) {
				var msg = '';
				if (jqXHR.status === 0) {
					msg = 'Not connect.\n Verify Network.';
				} else if (jqXHR.status == 404) {
					msg = 'Requested page not found. [404]';
				} else if (jqXHR.status == 500) {
					msg = 'Internal Server Error [500].';
				} else if (exception === 'parsererror') {
					msg = 'Requested JSON parse failed.';
				} else if (exception === 'timeout') {
					msg = 'Time out error.';
				} else if (exception === 'abort') {
					msg = 'Ajax request aborted.';
				} else {
					msg = 'Uncaught Error.\n' + jqXHR.responseText;
				}
				alert(msg);
			}
		});
	}

	$(function() {
		$("#formuploadajax").on(
				"submit",
				function(e) {
					e.preventDefault();
					var f = $(this);
					var formData = new FormData(document
							.getElementById("formuploadajax"));
					formData.append("method", "createProducts");
					//formData.append(f.attr("name"), $(this)[0].files[0]);
					$.ajax({
						url : "../Product",
						type : "post",
						dataType : "html",
						data : formData,
						cache : false,
						contentType : false,
						processData : false
					}).done(function(res) {
						$("#mensaje").html("Respuesta: " + res);
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
	<div id="mensaje"></div>

	<form enctype="multipart/form-data" id="formuploadajax" method="post"
		class="form-inline justify-content-center mb-2">

		<div class="form-group mb-2">
			<label for="inputEmail3" class="col-form-label">Escoja el
				archivo CSV</label>
		</div>
		<div class="form-group mx-sm-3 mb-2">
			<input type="file" accept=".csv" name="file"
				class="form-control-file" id="inputFile">
		</div>
		<input type="submit" value="Subir archivos" />

	</form>


	<%
	}
	%>

</div>



