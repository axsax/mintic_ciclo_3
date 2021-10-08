
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.ProviderDTO"%>
<%@page import="Modelo.ProviderOP_DAO"%>
<%
String p = request.getParameter("action");
String titulo = "";
if (p.equals("list")) {
	titulo = "Listado de proveedores";
} else if (p.equals("create")) {
	titulo = "Creación de proveedores";
}
%>


<div class="container">
	<h2>
		<p class="text-center m-3"><%=titulo%></p>

	</h2>


	<script language="JavaScript">

    function getProvider(id) {
    	var parametros = {
   	         "nit":id,
   	         "method":"getProvider",
   	        };
      $.ajax({
        type: "POST",
        url:"../Provider",
        data:parametros,
        dataType: 'json',
        success: function(data) {
        	document.getElementById("editNit").value=data.nit;
        	document.getElementById("editCity").value=data.city;
        	document.getElementById("editName").value=data.name;
        	document.getElementById("editAddress").value=data.direction;
        	document.getElementById("editPhone").value=data.phone;
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
    
    function areYouSure(id){
    	Swal.fire({
  		  title: '¿Está seguro que desea eliminar el Proveedor?',
  		  text: "Este cambio no se puede restaurar!",
  		  icon: 'warning',
  		  showCancelButton: true,
  		  confirmButtonColor: '#3085d6',
  		  cancelButtonColor: '#d33',
  		  confirmButtonText: 'Sí!'
  		}).then((result) => {
  		  if (result.isConfirmed) {
  			deleteProvider(id);
  		  }
  		})
    }
    
    function createProvider(){
    	
    		
    	var parametros = {
    			"nit":document.getElementById("createNit").value,
            	"city":document.getElementById("createCity").value,
    	"name":document.getElementById("createName").value,
    	"address":document.getElementById("createAddress").value,
    	"phone":document.getElementById("createPhone").value,
    	"method":"createProvider",
      	        };
         $.ajax({
           type: "POST",
           url:"../Provider",
           data:parametros,
           dataType: 'json',
           success: function(data) {
        	   if(data=='exitoso'){
        		   var mensaje= 'Proveedor Creado';
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
    

    
  </script>
	<%
	if (p.equals("list")) {
		ProviderOP_DAO listProviders = new ProviderOP_DAO();
		ProviderDTO provider = new ProviderDTO();
		ArrayList<ProviderDTO> arrProviders = new ArrayList<>();
		arrProviders = listProviders.listar();
	%>

	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">#</th>
				<th scope="col">NIT</th>
				<th scope="col">Ciudad</th>
				<th scope="col">Nombre</th>
				<th scope="col">Dirección</th>
				<th scope="col">Telefono</th>
				<th scope="col">Acciónes</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (int i = 0; i < arrProviders.size(); i++) {
			%>
			<tr class="al">
				<th scope="row"><%=i + 1%></th>
				<td class="numero"><%=arrProviders.get(i).getNit()%></td>
				<td><%=arrProviders.get(i).getCity()%></td>
				<td><%=arrProviders.get(i).getName()%></td>
				<td><%=arrProviders.get(i).getDirection()%></td>
				<td><%=arrProviders.get(i).getPhone()%></td>
				<td><button type="button" id="editarBoton"
						onclick="getProvider(<%=arrProviders.get(i).getNit()%>)"
						class="btn btn-warning" data-toggle="modal"
						data-target="#modalEdicion">Editar</button>
					<button type="button" id="eliminarBoton" class="btn btn-danger"
						data-toggle="modal"
						onclick="areYouSure(<%=arrProviders.get(i).getNit()%>)"
						data-target="#modalEliminar">Eliminar</button></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<%
	} else if (p.equals("create")) {
	%>
	<form>
		<div class="form-group">
			<label for="exampleFormControlInput1">Nit</label> <input type="number"
				class="form-control" id="createNit" placeholder="">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Ciudad</label> <input
				type="text" class="form-control" id="createCity" placeholder="">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Nombre</label> <input
				type="text" class="form-control" id="createName" placeholder="">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Dirección</label> <input
				type="email" class="form-control" id="createAddress" placeholder="">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Telefono</label> <input
				type="number" class="form-control" id="createPhone" placeholder="">
		</div>
		<div class="modal-footer">
			<button onclick="createProvider()" type="button"
				class="btn btn-primary" id="crearBoton">Crear usuario</button>
		</div>
	</form>
	<%
	}
	%>

	<div class="modal fade" id="modalEdicion" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Edición de
						Proveedor</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form>
						<div class="form-group">
							<label for="exampleFormControlInput1">Nit</label> <input
								type="number" class="form-control" id="editNit" placeholder=""
								readonly>
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1">Ciudad</label> <input
								type="text" class="form-control" id="editCity" placeholder="">
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1">Nombre</label> <input
								type="text" class="form-control" id="editName" placeholder="">
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1">Dirección</label> <input
								type="email" class="form-control" id="editAddress"
								placeholder="">
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1">Telefono</label> <input
								type="number" class="form-control" id="editPhone" placeholder="">
						</div>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						onclick="editProvider()">Editar Proveedor</button>
				</div>
			</div>
		</div>
	</div>


</div>

<script language="JavaScript">
function editProvider(){
	var parametros = {
			"nit":document.getElementById("editNit").value,
        	"city":document.getElementById("editCity").value,
	"name":document.getElementById("editName").value,
	"address":document.getElementById("editAddress").value,
	"phone":document.getElementById("editPhone").value,
	"method":"editProvider",
  	        };
     $.ajax({
       type: "POST",
       url:"../Provider",
       data:parametros,
       dataType: 'json',
       success: function(data) {
    	   if(data=='exitoso'){
    		   var mensaje= 'Proveedor Editado';
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

function deleteProvider(id){
	var parametros = {
			"nit":id,
			"method":"deleteProvider",
  	        };
     $.ajax({
       type: "POST",
       url:"../Provider",
       data:parametros,
       dataType: 'json',
       success: function(data) {
    	   if(data=='exitoso'){
    		   var mensaje= 'Proveedor eliminado';
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




</script>
