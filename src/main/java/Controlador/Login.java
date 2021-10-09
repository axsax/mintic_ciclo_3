package Controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.google.gson.Gson;

import Modelo.UserDTO;
import Modelo.UserOP_DAO;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("login") != null) {
			String requestName = request.getParameter("user");
			String requestPassword = request.getParameter("password");
			UserOP_DAO op = new UserOP_DAO();
			UserDTO user = new UserDTO();
			user.setUser(requestName);
			user.setPassword(requestPassword);
			String rol = op.login(user);
			if (!rol.equals("")) {
				HttpSession session = request.getSession();
				session.setAttribute("rol", rol);
				response.sendRedirect("principal/home.jsp?page=blank");
			} else {
				response.sendRedirect("login.jsp");
			}
		} else if (request.getParameter("method").equals("logout")) {
			PrintWriter salida = response.getWriter();
			Gson datos = new Gson();
			HttpSession session = request.getSession();
			session.removeAttribute("rol");
			salida.println(datos.toJson("pafuera"));
		}

	}

}
