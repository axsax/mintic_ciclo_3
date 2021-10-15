<!-- Image and text -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="home.jsp?page=blank"> <img
		src="../assets/shop.png" width="30" height="30"
		class="d-inline-block align-top" alt=""> Tienda Generica
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse justify-content-end"
		id="navbarNavDropdown">
		<ul class="navbar-nav">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Usuarios </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="home.jsp?page=users&action=list">Listar</a>
					<%
					String rol = (String) session.getAttribute("rol");

					if (rol != null && rol.equals("su")) {
					%>
					<a class="dropdown-item" href="home.jsp?page=users&action=create">Crear</a>
					<%
					}
					%>
				</div></li>


			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Clientes </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="home.jsp?page=customers&action=list">Listar</a>
					<a class="dropdown-item"
						href="home.jsp?page=customers&action=create">Crear</a>
				</div></li>

			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Proveedores </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="home.jsp?page=providers&action=list">Listar</a>
					<a class="dropdown-item"
						href="home.jsp?page=providers&action=create">Crear</a>
				</div></li>

			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Productos </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="home.jsp?page=products&action=list">Listar</a>
					<a class="dropdown-item"
						href="home.jsp?page=products&action=create">Crear</a>
				</div></li>

			<li class="nav-itemn"><a class="nav-link "
				href="home.jsp?page=sales" role="button" aria-haspopup="true"
				aria-expanded="false"> Ventas </a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Reportes </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item"
						href="home.jsp?page=reports&action=SaleByClient">Ventas por
						Cliente</a>
						<a class="dropdown-item"
						href="home.jsp?page=reports&action=listClients">Clientes</a>
						<a class="dropdown-item"
						href="home.jsp?page=reports&action=listUsers">Usuarios</a>
				</div></li>
			<div class="nav-item form-inline">
				<div class="btn-group dropleft">
					<button type="button" class="btn btn-secondary rounded-circle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-user"></i>
					</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<a class="dropdown-item" onclick="logout()">Cerrar sesión</a>
					</div>
				</div>
			</div>
		</ul>
</nav>

<script language="JavaScript">
	function logout() {
		var parametros = {
			"method" : "logout",
		};
		$.ajax({
			type : "POST",
			url : "../Login",
			data : parametros,
			dataType : 'json',
			success : function(data) {
				location.href = "/proyecto";
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
</script>