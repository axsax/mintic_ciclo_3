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

function getProduct(id) {
	var parametros = {
	         "idProduct":id,
	         "method":"getProduct",
	        };
  $.ajax({
    type: "POST",
    url:"../Product",
    data:parametros,
    dataType: 'json',
    success: function(data) {
    	document.getElementById("editCodProduct").value=data.code;
    	document.getElementById("editName").value=data.product_name;
    	document.getElementById("editSale").value=data.sale_price;
    },
    error: function (jqXHR, exception) {
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


function editProduct(){
	var parametros = {
			"id":document.getElementById("editCodProduct").value,
        	"name":document.getElementById("editName").value,
	"priceSale":document.getElementById("editSale").value,
	"method":"editProduct",
  	        };
     $.ajax({
       type: "POST",
       url:"../Product",
       data:parametros,
       dataType: 'json',
       success: function(data) {
    	   if(data=='exitoso'){
    		   var mensaje= 'Producto Editado';
        	   var boton = 'success';
    	   }else{
    		   var boton = 'error';
    	   }
    	   Swal.fire(
    			   mensaje,
    			   '',
    			   boton
    			 )
       },
       error: function (jqXHR, exception) {
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
    	   Swal.fire(
    			   msg,
    			   '',
    			   'error'
    			 )
         }
     });
}


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
				<th class="text-center" scope="col">Acciónes</th>
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
				<td class="text-center"><button type="button" id="editarBoton"
						onclick="getProduct(<%=arrProduct.get(i).getCode()%>)"
						class="btn btn-warning" data-toggle="modal"
						data-target="#modalEdicion">Editar</button></td>
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


<div class="modal fade" id="modalEdicion" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Edición de
					Producto</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

				<form>
					<div class="form-group">
						<label for="exampleFormControlInput1">Código del producto</label>
						<input type="text" class="form-control" id="editCodProduct"
							placeholder="" readonly>
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">Nombre del producto</label>
						<input type="text" class="form-control" id="editName"
							placeholder="">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">Precio de venta</label> <input
							type="number" step="any" class="form-control" id="editSale"
							placeholder="">
					</div>
				</form>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary"
					onclick="editProduct()">Editar producto</button>
			</div>
		</div>
	</div>
</div>





