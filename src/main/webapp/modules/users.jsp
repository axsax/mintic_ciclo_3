
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.UserDTO"%>
<%@page import="Modelo.UserOP_DAO"%>
<%
String rol = (String) session.getAttribute("rol");
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
		<p class="text-center m-3"><%=titulo%></p>

	</h2>



	<script language="JavaScript">

    function getUser(id) {
    	var parametros = {
   	         "identification":id,
   	         "method":"getUser",
   	        };
      $.ajax({
        type: "POST",
        url:"../User",
        data:parametros,
        dataType: 'json',
        success: function(data) {
        	document.getElementById("editIdentification").value=data.identification;
        	document.getElementById("editUser").value=data.user;
        	document.getElementById("editName").value=data.name;
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
  		  title: '¿Está seguro que desea eliminar el usuario?',
  		  text: "Este cambio no se puede restaurar!",
  		  icon: 'warning',
  		  showCancelButton: true,
  		  confirmButtonColor: '#3085d6',
  		  cancelButtonColor: '#d33',
  		  confirmButtonText: 'Sí!'
  		}).then((result) => {
  		  if (result.isConfirmed) {
  			deleteUser(id);
  		  }
  		})
    }
    
    function createUser(){
    	
    		
    	var parametros = {
    			"identification":document.getElementById("createIdentification").value,
            	"user":document.getElementById("createUserName").value,
    	"name":document.getElementById("createName").value,
    	"email":document.getElementById("createEmail").value,
    	"password":document.getElementById("createPassword").value,
    	"method":"createUser",
      	        };
         $.ajax({
           type: "POST",
           url:"../User",
           data:parametros,
           dataType: 'json',
           success: function(data) {
        	   if(data=='exitoso'){
        		   var mensaje= 'Usuario Creado';
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
		UserOP_DAO listUser = new UserOP_DAO();
		UserDTO user = new UserDTO();
		ArrayList<UserDTO> arrUsers = new ArrayList<>();
		arrUsers = listUser.listar();
	%>

	<table class="table">
		<thead class="thead-dark">
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
			<tr class="al">
				<th scope="row"><%=i + 1%></th>
				<td class="numero"><%=arrUsers.get(i).getIdentification()%></td>
				<td><%=arrUsers.get(i).getEmail()%></td>
				<td><%=arrUsers.get(i).getName()%></td>
				<td><%=arrUsers.get(i).getUser()%></td>
				<td><button type="button" id="editarBoton"
						onclick="getUser(<%=arrUsers.get(i).getIdentification()%>)"
						class="btn btn-warning" data-toggle="modal"
						data-target="#modalEdicion">Editar</button>
					<button type="button" id="eliminarBoton" class="btn btn-danger"
						data-toggle="modal"
						onclick="areYouSure(<%=arrUsers.get(i).getIdentification()%>)"
						data-target="#modalEliminar">Eliminar</button></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<%
	} else if (p.equals("create") && rol.equals("su")) {
	%>
	<form>
		<div class="form-group">
			<label for="exampleFormControlInput1">Cédula</label> <input
				type="number" class="form-control" id="createIdentification"
				placeholder="">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Usuario</label> <input
				type="text" class="form-control" id="createUserName" placeholder="">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Nombre completo</label> <input
				type="text" class="form-control" id="createName" placeholder="">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Correo electronico</label> <input
				type="email" class="form-control" id="createEmail" placeholder="">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Contraseña</label> <input
				type="password" class="form-control" id="createPassword"
				placeholder="">
		</div>
		<div class="modal-footer">
			<button onclick="createUser()" type="button" class="btn btn-primary"
				id="crearBoton">Crear usuario</button>
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
						Usuario</h5>
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
							<label for="exampleFormControlInput1">Usuario</label> <input
								type="text" class="form-control" id="editUser" placeholder="">
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1">Nombre completo</label> <input
								type="text" class="form-control" id="editName" placeholder="">
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
					<button type="button" class="btn btn-primary" onclick="editUser()">Editar
						usuario</button>
				</div>
			</div>
		</div>
	</div>


</div>





<script language="JavaScript">
function editUser(){
	var parametros = {
			"identification":document.getElementById("editIdentification").value,
        	"user":document.getElementById("editUser").value,
	"name":document.getElementById("editName").value,
	"email":document.getElementById("editEmail").value,
	"method":"editUser",
  	        };
     $.ajax({
       type: "POST",
       url:"../User",
       data:parametros,
       dataType: 'json',
       success: function(data) {
    	   if(data=='exitoso'){
    		   var mensaje= 'Usuario Editado';
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

function deleteUser(id){
	var parametros = {
			"identification":id,
			"method":"deleteUser",
  	        };
     $.ajax({
       type: "POST",
       url:"../User",
       data:parametros,
       dataType: 'json',
       success: function(data) {
    	   if(data=='exitoso'){
    		   var mensaje= 'Usuario eliminado';
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
