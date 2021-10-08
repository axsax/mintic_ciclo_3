<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.CustomerDTO"%>
<%@page import="Modelo.CustomerOP_DAO"%>
<%
String p = request.getParameter("action");
String titulo = "";
if (p.equals("list")) {
	titulo = "Listado de clientes";
} else if (p.equals("create")) {
	titulo = "Creación de clientes";
}
%>


<div class="container">
	<h2>
		<p class="text-center m-3"><%=titulo%></p>

	</h2>



	<script language="JavaScript">

    function getCustomer(id) {
    	var parametros = {
   	         "identification":id,
   	         "method":"getCustomer",
   	        };
      $.ajax({
        type: "POST",
        url:"../Customer",
        data:parametros,
        dataType: 'json',
        success: function(data) {
        	document.getElementById("editIdentification").value=data.identification;
        	document.getElementById("editPhoneNumber").value=data.phone_number;
        	document.getElementById("editName").value=data.name;
        	document.getElementById("editAddress").value=data.address;
        	document.getElementById("editEmail").value=data.email;
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
  		  title: '¿Está seguro que desea eliminar el cliente?',
  		  text: "Este cambio no se puede restaurar!",
  		  icon: 'warning',
  		  showCancelButton: true,
  		  confirmButtonColor: '#3085d6',
  		  cancelButtonColor: '#d33',
  		  confirmButtonText: 'Sí!'
  		}).then((result) => {
  		  if (result.isConfirmed) {
  			deleteCustomer(id);
  		  }
  		})
    }
    
    function createCustomer(){
    	
    		
    	var parametros = {
    			"identification":document.getElementById("createIdentification").value,
            	"phoneNumber":document.getElementById("createPhoneNumber").value,
    	"name":document.getElementById("createName").value,
    	"address":document.getElementById("createAddress").value,
    	"email":document.getElementById("createEmail").value,
    	"method":"createCustomer",
      	        };
         $.ajax({
           type: "POST",
           url:"../Customer",
           data:parametros,
           dataType: 'json',
           success: function(data) {
        	   if(data=='exitoso'){
        		   var mensaje= 'Cliente Creado';
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
				<th scope="col">Acciónes</th>
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
				<td><button type="button" id="editarBoton"
						onclick="getCustomer(<%=arrCustomers.get(i).getIdentification()%>)"
						class="btn btn-warning" data-toggle="modal"
						data-target="#modalEdicion">Editar</button>
					<button type="button" id="eliminarBoton" class="btn btn-danger"
						data-toggle="modal"
						onclick="areYouSure(<%=arrCustomers.get(i).getIdentification()%>)">Eliminar</button></td>
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
			<label for="exampleFormControlInput1">Cédula</label> <input
				type="number" class="form-control" id="createIdentification"
				placeholder="">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Nombre completo</label> <input
				type="text" class="form-control" id="createName" placeholder="">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Número de celular</label> <input
				type="number" class="form-control" id="createPhoneNumber"
				placeholder="">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Dirección</label> <input
				type="text" class="form-control" id="createAddress" placeholder="">
		</div>

		<div class="form-group">
			<label for="exampleFormControlInput1">Correo electronico</label> <input
				type="email" class="form-control" id="createEmail" placeholder="">
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-primary"
				onclick="createCustomer()">Crear cliente</button>
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
						Cliente</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form>
						<div class="form-group">
							<label for="exampleFormControlInput1">Cédula</label> <input
								type="text" class="form-control" id="editIdentification"
								placeholder="" readonly>
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1">Nombre completo</label> <input
								type="text" class="form-control" id="editName" placeholder="">
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1">Número de celular</label> <input
								type="number" class="form-control" id="editPhoneNumber"
								placeholder="">
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1">Dirección</label> <input
								type="text" class="form-control" id="editAddress" placeholder="">
						</div>

						<div class="form-group">
							<label for="exampleFormControlInput1">Correo electronico</label>
							<input type="email" class="form-control" id="editEmail"
								placeholder="">
						</div>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						onclick="editCustomer()">Editar cliente</button>
				</div>
			</div>
		</div>
	</div>


</div>





<script language="JavaScript">
function editCustomer(){
	var parametros = {
			"identification":document.getElementById("editIdentification").value,
        	"phoneNumber":document.getElementById("editPhoneNumber").value,
	"name":document.getElementById("editName").value,
	"address":document.getElementById("editAddress").value,
	"email":document.getElementById("editEmail").value,
	"method":"editCustomer",
  	        };
     $.ajax({
       type: "POST",
       url:"../Customer",
       data:parametros,
       dataType: 'json',
       success: function(data) {
    	   if(data=='exitoso'){
    		   var mensaje= 'Cliente Editado';
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

function deleteCustomer(id){
	var parametros = {
			"identification":id,
			"method":"deleteCustomer",
  	        };
     $.ajax({
       type: "POST",
       url:"../Customer",
       data:parametros,
       dataType: 'json',
       success: function(data) {
    	   if(data=='exitoso'){
    		   var mensaje= 'Cliente eliminado';
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
