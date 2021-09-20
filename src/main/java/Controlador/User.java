package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

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
		// TODO Auto-generated method stub
		if (request.getParameter("createUser") != null) {
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

			String salida = (op.crear(user)) ? "exitoso" : "fallido";

			response.sendRedirect("principal/home.jsp?page=users&action=create&state=" + salida);
		} else if (request.getParameter("editUser") != null) {

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
			String salida = (op.actualizar(user)) ? "exitoso" : "fallido";

			response.sendRedirect("principal/home.jsp?page=users&action=list&state=" + salida);
		} else if (request.getParameter("deleteUser") != null) {
			String requestIdentification = request.getParameter("identification");
			UserOP_DAO op = new UserOP_DAO();
			UserDTO user = new UserDTO();
			user.setIdentification(Long.parseLong(requestIdentification));
			String salida = (op.eliminar(user)) ? "exitoso" : "fallido";

			response.sendRedirect("principal/home.jsp?page=users&action=list&state=" + salida);
		}
	}

}
