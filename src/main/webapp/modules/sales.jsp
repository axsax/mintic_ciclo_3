<script language="JavaScript">
	var cantidad = 1;
	function agregarProducto() {
		document.getElementById("tablaVenta").insertRow(+1).innerHTML = "<tr><td>"
				+ cantidad
				+ "</td><td><input type='number' min='1' pattern='^[0-9]+' class='form-control' id='product"+cantidad+"'></td><td><button type='button' onclick='getProduct(product"
				+ cantidad
				+ ","
				+ cantidad
				+ ")' class='btn btn-info'>Consultar</button></td><td><input type='text' class='form-control' placeholder='Nombre' id='nameProduct"+cantidad+"' readonly></td><td><input type='number' value='1' min='1' pattern='^[0-9]+' onchange='cambiarValor("
				+ cantidad
				+ ")' class='form-control' id='cantidad"
				+ cantidad
				+ "'></td><td><input type='number' step='any' id='valorUnitario"+cantidad+"' class='form-control' id='' readonly></td><td><input step='any' type='number' id='valorProduct"+cantidad+"' class='form-control' id='' readonly></td> <td><input step='any' type='number' style='display:none;' id='ivaProduct"+cantidad+"' class='form-control' id='' readonly></td></tr>";
		cantidad++;
	}

	function eliminarFila() {
		var table = document.getElementById("tablaVenta");
		var rowCount = table.rows.length;
		//console.log(rowCount);

		if (rowCount <= 5)
			alert('No se puede eliminar mas');
		else
			table.deleteRow(rowCount - 4);
	}

	function getCustomer() {
		var parametros = {
			"identification" : document.getElementById("cedulaPersona").value,
			"method" : "getCustomer",
		};
		$.ajax({
			type : "POST",
			url : "../Customer",
			data : parametros,
			dataType : 'json',
			success : function(data) {
				document.getElementById("nameCustomer").value = data.name;
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
	function getProduct(id, fila) {
		var parametros = {
			"idProduct" : id.value,
			"method" : "getProduct",
		};
		$
				.ajax({
					type : "POST",
					url : "../Product",
					data : parametros,
					dataType : 'json',
					success : function(data) {
						if (!data.code == "0") {

							document.getElementById("nameProduct" + fila).value = data.product_name;
							document.getElementById("ivaProduct" + fila).value = data.iva;
							var valorUnitario = data.sale_price;
							var cantidadProducto = document
									.getElementById("cantidad" + fila).value;
							var valorProducto = valorUnitario
									* cantidadProducto;

							var totalVentaParcial = parseFloat(document
									.getElementById("totalVenta").value);
							var totalIvaParcial = parseFloat(document
									.getElementById("totalIva").value);
							var totalConIvaParcial = parseFloat(document
									.getElementById("totalConIva").value);

							var totalVenta = valorProducto + totalVentaParcial;
							document.getElementById("totalVenta").value = totalVenta;
							var totalIva = ((valorProducto * data.iva) / 100)
									+ totalIvaParcial;
							document.getElementById("totalIva").value = totalIva;
							var totalConIva = totalIva + totalVenta;
							document.getElementById("totalConIva").value = totalConIva;
							document.getElementById("valorUnitario" + fila).value = valorUnitario;
							document.getElementById("valorProduct" + fila).value = valorProducto;
						}

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

	function cambiarValor(fila) {
		var totalIvaParcial = parseFloat(document.getElementById("totalIva").value);
		var totalConIvaParcial = parseFloat(document
				.getElementById("totalConIva").value);
		var valorUnitario = parseFloat(document.getElementById("valorUnitario"
				+ fila).value);
		var cantidadProducto = parseFloat(document.getElementById("cantidad"
				+ fila).value);
		var ivaProducto = parseFloat(document.getElementById("ivaProduct"
				+ fila).value);
		var valorProducto = parseFloat(valorUnitario)
				* parseFloat(cantidadProducto);

		var valorProductoParcial = parseFloat(document
				.getElementById("valorProduct" + fila).value);
		var valorIvaProductoParcial = ((valorProductoParcial * ivaProducto) / 100);
		var totalConIvaParcial = totalConIvaParcial
				- (((valorProductoParcial * ivaProducto) / 100) + valorProductoParcial);

		var totalVentaParcial = parseFloat(document
				.getElementById("totalVenta").value)
				- valorProductoParcial;
		var totalIva = totalIvaParcial - valorIvaProductoParcial;

		var valorIvaProduct = ((valorProducto * ivaProducto) / 100);

		var totalConIvaParcial = parseFloat(document
				.getElementById("totalConIva").value);

		var totalVenta = parseFloat(totalVentaParcial) + valorProducto;
		document.getElementById("totalVenta").value = totalVenta;
		document.getElementById("valorProduct" + fila).value = valorProducto;
		document.getElementById("totalIva").value = totalIva + valorIvaProduct;
		document.getElementById("totalConIva").value = totalVenta + totalIva
				+ valorIvaProduct;
	}

	function registrarVenta() {
		var nombreCliente = document.getElementById("nameCustomer").value;
		var cedulaPersona = document.getElementById("cedulaPersona").value;
		if ((nombreCliente == "") || (nombreCliente == "undefined")
				|| (cedulaPersona == "")) {
			Swal.fire({
				icon : 'error',
				title : 'Oops...',
				text : 'Traiga el cliente para generar venta!',
			})

		} else {
			var totalConIva = document.getElementById("totalConIva").value;
			if (totalConIva == "0") {
				Swal
						.fire({
							icon : 'error',
							title : 'Oops...',
							text : 'Registre almenos un producto para generar la compra!',
						})
			} else {
				var table = document.getElementById("tablaVenta");
				var rowCount = table.rows.length;
				var detalleCompraGeneral = new Array();

				for (var i = 1; i <= rowCount; i++) {
					var product = document.getElementById("product" + i);

					if (product != null) {
						var detalleCompra = new Array();
						var product = product.value;
						var cantidad = document.getElementById("cantidad" + i).value;
						var valorTotalProducto = document
								.getElementById("valorProduct" + i).value;
						var valorVenta = document.getElementById("totalConIva").value;
						var ivaProducto = document.getElementById("ivaProduct"
								+ i).value;
						detalleCompra
								.push(
										product,
										cantidad,
										parseFloat(valorTotalProducto)
												+ parseFloat((valorTotalProducto * ivaProducto) / 100),
										valorVenta, ivaProducto);
						detalleCompraGeneral.push(detalleCompra);
					}

				}

				var formData = new FormData();
				formData.append("method", "createSale");
				formData.append("detalle", detalleCompraGeneral);
				formData.append("cedulaCliente", cedulaPersona);
				formData.append("cedulaUsuario", '1');
				formData.append("ivaVenta", '19');
				formData.append("totalVenta", document
						.getElementById("totalVenta").value);
				formData.append("valorVenta", document
						.getElementById("totalConIva").value);

				$.ajax({
					url : "../Sale",
					type : "post",
					dataType : "html",
					data : formData,
					cache : false,
					contentType : false,
					processData : false
				}).done(function(data) {
					var o = JSON.parse(data);
					if (o['respuesta']=='exitoso') {
						var mensaje = 'Venta realizada con exito';
						var boton = 'success';
					} else {
						var boton = 'error';
						var mensaje = 'No se pudo realizar la venta, algo salio muy mal';
					}
					Swal.fire(mensaje, '', boton)
					if (o['respuesta']=='exitoso') {
						let botonRegistrar= document.getElementById('regVenta');
						botonRegistrar.disabled =true;
					}
				});
			}
		}
	}
</script>

<div class="container align-items-center">

	<form class="m-3">
		<div class="form-row">
			<div class="form-group col-md-1">
				<label for="inputEmail4">Cédula</label>
			</div>
			<div class="form-group col-md-3">
				<input type="number" class="form-control" id="cedulaPersona">
			</div>
			<div class="form-group col-md-2">
				<button type="button" class="btn btn-primary"
					onclick="getCustomer()">Traer Cliente</button>
			</div>
			<div class="form-group col-md-3">
				<input type="text" class="form-control" id="nameCustomer"
					placeholder="Nombre del cliente" readonly>
			</div>
		</div>
	</form>

	<table class="table" id="tablaVenta">
		<thead>
			<tr class="table-primary">
				<th scope="col">#</th>
				<th scope="col">Código producto</th>
				<th scope="col">Acción</th>
				<th scope="col">Nombre producto</th>
				<th scope="col">Cantidad</th>
				<th scope="col">Valor Unitario</th>
				<th scope="col">Valor total</th>
			</tr>
		</thead>
		<tbody>

			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>Total Venta</td>
				<td><input type='number' class='form-control' id='totalVenta'
					value='0' readonly></td>
			</tr>
			<tr class="table-borderless">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>Total Iva</td>
				<td><input type='number' step='any' class='form-control'
					id='totalIva' value='0' readonly></td>
			</tr>
			<tr class="table-borderless">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>Total con Iva</td>
				<td><input type='number' step='any' class='form-control'
					id='totalConIva' value='0' readonly></td>
			</tr>

		</tbody>
	</table>
	<div class="form-group">
		<button type="button" class="btn btn-primary mr-2"
			onclick="agregarProducto()">Agregar Producto</button>
		<button type="button" style="display: none;" class="btn btn-danger"
			onclick="eliminarFila()">Eliminar Fila</button>
	</div>
	<button type="button" class="btn btn-success btn-lg btn-block"
		onclick="registrarVenta()" id="regVenta">Registrar venta</button>
</div>

