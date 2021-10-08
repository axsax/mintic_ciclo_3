package Controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Modelo.ProviderDTO;
import Modelo.ProviderOP_DAO;

/**
 * Servlet implementation class Provider
 */
@WebServlet("/Provider")
public class Provider extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Provider() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter salida = response.getWriter();
		Gson datos = new Gson();
		// TODO Auto-generated method stub
		if (request.getParameter("method").equals("createProvider")) {
			String requestNit = request.getParameter("nit");
			String requestCity = request.getParameter("city");
			String requestname = request.getParameter("name");
			String requestAddress = request.getParameter("address");
			String requestPhone = request.getParameter("phone");
			
			ProviderOP_DAO op = new ProviderOP_DAO();
			ProviderDTO provider = new ProviderDTO();
			provider.setNit(Long.parseLong(requestNit));
			provider.setCity(requestCity);
			provider.setName(requestname);
			provider.setDirection(requestAddress);
			provider.setPhone(requestPhone);

			String sal = (op.crear(provider)) ? "exitoso" : "fallido";
			salida.println(datos.toJson(sal));
			// response.sendRedirect("principal/home.jsp?page=customers&action=create&state="
			// + sal);
		} else if (request.getParameter("method").equals("editProvider")) {

			String requestNit = request.getParameter("nit");
			String requestCity = request.getParameter("city");
			String requestname = request.getParameter("name");
			String requestAddress = request.getParameter("address");
			String requestPhone = request.getParameter("phone");

			ProviderOP_DAO op = new ProviderOP_DAO();
			ProviderDTO provider = new ProviderDTO();
			provider.setNit(Long.parseLong(requestNit));
			provider.setCity(requestCity);
			provider.setName(requestname);
			provider.setDirection(requestAddress);
			provider.setPhone(requestPhone);
			String sal = (op.actualizar(provider)) ? "exitoso" : "fallido";
			salida.println(datos.toJson(sal));
			// response.sendRedirect("principal/home.jsp?page=customers&action=list&state="
			// +
			// sal);
		} else if (request.getParameter("method").equals("deleteProvider")) {
			String requestNit = request.getParameter("nit");
			ProviderOP_DAO op = new ProviderOP_DAO();
			ProviderDTO provider = new ProviderDTO();
			provider.setNit(Long.parseLong(requestNit));
			String sal = (op.eliminar(provider)) ? "exitoso" : "fallido";
			salida.println(datos.toJson(sal));
			// response.sendRedirect("principal/home.jsp?page=customers&action=list&state="
			// +
			// sal);
		} else if (request.getParameter("method").equals("getProvider")) {
			String requestNit = request.getParameter("nit");
			ProviderOP_DAO op = new ProviderOP_DAO();
			ProviderDTO provider = new ProviderDTO();
			provider = op.consultar(requestNit);
			salida.println(datos.toJson(provider));
		}
	}

}
