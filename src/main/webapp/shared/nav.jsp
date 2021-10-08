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
					
					if (rol!= null && rol.equals("su")) {
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
				
					<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Ventas </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="">Listar</a>
					<a class="dropdown-item"
						href="">Crear</a>
				</div></li>
					<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Reportes </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="">Listar</a>
					<a class="dropdown-item"
						href="">Crear</a>
				</div></li>
		</ul>
	</div>
</nav>