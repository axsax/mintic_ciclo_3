<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link href="styles/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<form class="section-form" action="Login" method="post">
		<section class="form-register">
			<h4>Iniciar sesi�n</h4>
			<input class="controls" type="text" name="user" id="correo"
				placeholder="Ingrese su Correo"> <input class="controls"
				type="password" name="password" id="contrase�a"
				placeholder="Ingrese la contrase�a">
			<p>
				<a href="#">�Has olvidado tu contrase�a?</a>
			</p>
			<input class="botons" type="submit" name="login"
				value="Iniciar Sesi�n">

		</section>

	</form>
	<jsp:include page="shared/footer.jsp" />
</body>
</html>