package Controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.google.gson.Gson;

import Modelo.SaleDTO;
import Modelo.SaleOP_DAO;

/**
 * Servlet implementation class Sale
 */
@MultipartConfig
@WebServlet("/Sale")
public class Sale extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Sale() {
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
		JOptionPane.showMessageDialog(null, request.getParameter("detalle"));
		PrintWriter salida = response.getWriter();
		Gson datos = new Gson();
		if (request.getParameter("method").equals("createSale")) {
			for(int i=0;i<)
			 request.getParameter("detalle");
			Long cedulaCliente= Long.parseLong(request.getParameter("cedulaCliente"));
			Long cedulaUsuario= Long.parseLong(request.getParameter("cedulaUsuario"));
			Long ivaVenta=Long.parseLong(request.getParameter("ivaVenta"));
			Long totalVenta=Long.parseLong(request.getParameter("totalVenta"));
			Long valorVenta=Long.parseLong(request.getParameter("valorVenta"));
			
			SaleOP_DAO op = new SaleOP_DAO();
			SaleDTO sale = new SaleDTO();
			sale.setCode(1);
			sale.setCustomer_id(serialVersionUID)
			
			salida.println(datos.toJson(request.getParameter("detalle")));
		}
	}

}
