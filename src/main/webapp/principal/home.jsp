<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!--<link href="../styles/styles.css" rel="stylesheet" type="text/css" /> -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style type="text/css">
table, thead, tr, th {
	text-align: center;
}
</style>
</head>
<body>
	<%
	String rol = "";
	rol = (String) session.getAttribute("rol");
	if (rol != null) {
	%>
	<jsp:include page="../shared/nav.jsp" />




	<!-- <script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
		
		<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
		-->
		
		<script src="../styles/jquery-3.6.0.min.js"></script>
		<script src="../styles/popper.min.js"></script>
	
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>

	<!-- INICIO MODULOS  -->
	<%
	String p = request.getParameter("page");
	String pagePath = "../modules/" + p + ".jsp";
	%>

	<jsp:include page="<%=pagePath%>"></jsp:include>
	<!-- FIN MODULOS  -->
	<%
	} else {
	%>
	<h1>USTED NO TIENE ACCESO A ESTA PAGINA</h1>

	<%
	}
	%>
</body>
</html>