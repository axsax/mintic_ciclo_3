<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="../styles/styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<jsp:include page="../shared/nav.jsp" />

	<!-- INICIO MODULOS  -->
	<%
	String p = request.getParameter("page");
	String pagePath = "../modules/" + p + ".jsp";
	%>

	<jsp:include page="<%=pagePath%>"></jsp:include>
	<!-- FIN MODULOS  -->
	<jsp:include page="../shared/footer.jsp" />
</body>
</html>