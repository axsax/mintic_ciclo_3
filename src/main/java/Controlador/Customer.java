package Controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Modelo.CustomerDTO;
import Modelo.CustomerOP_DAO;

/**
 * Servlet implementation class Customer
 */
@WebServlet("/Customer")
public class Customer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Customer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter salida = response.getWriter();
		Gson datos = new Gson();
		// TODO Auto-generated method stub
		if (request.getParameter("method").equals("createCustomer")) {
			String requestIdentification = request.getParameter("identification");
			String requestPhoneNumber = request.getParameter("phoneNumber");
			String requestname = request.getParameter("name");
			String requestAddress = request.getParameter("address");
			String requestEmail = request.getParameter("email");;

			CustomerOP_DAO op = new CustomerOP_DAO();
			CustomerDTO customer = new CustomerDTO();
			customer.setIdentification(Long.parseLong(requestIdentification));
			customer.setPhone_number(requestPhoneNumber);
			customer.setName(requestname);
			customer.setAddress(requestAddress);
			customer.setEmail(requestEmail);

			String sal = (op.crear(customer)) ? "exitoso" : "fallido";
			salida.println(datos.toJson(sal));
			//response.sendRedirect("principal/home.jsp?page=customers&action=create&state=" + sal);
		} else if (request.getParameter("method").equals("editCustomer")) {

			String requestIdentification = request.getParameter("identification");
			String requestPhoneNumber = request.getParameter("phoneNumber");
			String requestname = request.getParameter("name");
			String requestAddress = request.getParameter("address");
			String requestEmail = request.getParameter("email");

			CustomerOP_DAO op = new CustomerOP_DAO();
			CustomerDTO customer = new CustomerDTO();
			customer.setIdentification(Long.parseLong(requestIdentification));
			customer.setPhone_number(requestPhoneNumber);
			customer.setName(requestname);
			customer.setAddress(requestAddress);
			customer.setEmail(requestEmail);
			String sal = (op.actualizar(customer)) ? "exitoso" : "fallido";
			salida.println(datos.toJson(sal));
			// response.sendRedirect("principal/home.jsp?page=customers&action=list&state=" +
			// sal);
		} else if (request.getParameter("method").equals("deleteCustomer")) {
			String requestIdentification = request.getParameter("identification");
			CustomerOP_DAO op = new CustomerOP_DAO();
			CustomerDTO customer = new CustomerDTO();
			customer.setIdentification(Long.parseLong(requestIdentification));
			String sal = (op.eliminar(customer)) ? "exitoso" : "fallido";
			salida.println(datos.toJson(sal));
			// response.sendRedirect("principal/home.jsp?page=customers&action=list&state=" +
			// sal);
		} else if (request.getParameter("method").equals("getCustomer")) {
			String requestIdentification = request.getParameter("identification");
			CustomerOP_DAO op = new CustomerOP_DAO();
			CustomerDTO customer = new CustomerDTO();
			customer = op.consultar(requestIdentification);
			salida.println(datos.toJson(customer));
		}
	}

}
