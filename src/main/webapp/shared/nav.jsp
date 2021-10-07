<!-- Image and text -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="home.jsp?page=blank"> <img src="../assets/shop.png"
		width="30" height="30" class="d-inline-block align-top" alt="">
		Tienda Generica
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="#">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Features</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Pricing</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Clientes </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="home.jsp?page=customers&action=list">Listar</a> <a
						class="dropdown-item" href="home.jsp?page=customers&action=create">Crear</a> 
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Usuarios </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="home.jsp?page=users&action=list">Listar</a> <a
						class="dropdown-item" href="home.jsp?page=users&action=create">Crear</a> 
				</div></li>
		</ul>
	</div>
</nav>