package Controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.google.gson.Gson;

import Modelo.UserDTO;
import Modelo.UserOP_DAO;

/**
 * Servlet implementation class User
 */
@WebServlet("/User")
public class User extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public User() {
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
		if (request.getParameter("method").equals("createUser")) {
			String requestIdentification = request.getParameter("identification");
			String requestUser = request.getParameter("user");
			String requestname = request.getParameter("name");
			String requestPassword = request.getParameter("password");
			String requestEmail = request.getParameter("email");

			UserOP_DAO op = new UserOP_DAO();
			UserDTO user = new UserDTO();
			user.setIdentification(Long.parseLong(requestIdentification));
			user.setUser(requestUser);
			user.setName(requestname);
			user.setPassword(requestPassword);
			user.setEmail(requestEmail);

			String sal = (op.crear(user)) ? "exitoso" : "fallido";
			salida.println(datos.toJson(sal));
			//response.sendRedirect("principal/home.jsp?page=users&action=create&state=" + sal);
		} else if (request.getParameter("method").equals("editUser")) {

			String requestIdentification = request.getParameter("identification");
			String requestUser = request.getParameter("user");
			String requestname = request.getParameter("name");
			String requestEmail = request.getParameter("email");

			UserOP_DAO op = new UserOP_DAO();
			UserDTO user = new UserDTO();
			user.setIdentification(Long.parseLong(requestIdentification));
			user.setUser(requestUser);
			user.setName(requestname);
			user.setEmail(requestEmail);
			String sal = (op.actualizar(user)) ? "exitoso" : "fallido";
			salida.println(datos.toJson(sal));
			// response.sendRedirect("principal/home.jsp?page=users&action=list&state=" +
			// sal);
		} else if (request.getParameter("method").equals("deleteUser")) {
			String requestIdentification = request.getParameter("identification");
			UserOP_DAO op = new UserOP_DAO();
			UserDTO user = new UserDTO();
			user.setIdentification(Long.parseLong(requestIdentification));
			String sal = (op.eliminar(user)) ? "exitoso" : "fallido";
			salida.println(datos.toJson(sal));
			// response.sendRedirect("principal/home.jsp?page=users&action=list&state=" +
			// sal);
		} else if (request.getParameter("method").equals("getUser")) {
			String requestIdentification = request.getParameter("identification");
			UserOP_DAO op = new UserOP_DAO();
			UserDTO user = new UserDTO();
			user = op.consultar(requestIdentification);
			salida.println(datos.toJson(user));
		}
	}

}
