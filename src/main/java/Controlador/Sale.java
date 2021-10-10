package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import Modelo.SaleDTO;
import Modelo.SaleOP_DAO;
import Modelo.Sale_DetailDTO;
import Modelo.Sale_DetailOP_DAO;

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

		PrintWriter salida = response.getWriter();
		Gson datos = new Gson();
		if (request.getParameter("method").equals("createSale")) {
			Boolean genial = true;
			String idSale = "";

			String[] outerArray = request.getParameterValues("detalle");
			try {

				for (int i = 0; i < outerArray.length; i++) {
					String[] innerArray = outerArray[i].split(",");
					if (innerArray.length % 5 != 0) {
						genial = false;
						break;
					}

				}
			} catch (Exception e) {
				JOptionPane.showMessageDialog(null, e + " for 1");
			}

			if (genial) {
				Long cedulaCliente = Long.parseLong(request.getParameter("cedulaCliente"));
				Long cedulaUsuario = Long.parseLong(request.getParameter("cedulaUsuario"));
				double ivaVenta = Double.parseDouble(request.getParameter("ivaVenta"));
				double totalVenta = Double.parseDouble(request.getParameter("totalVenta"));
				double valorVenta = Double.parseDouble(request.getParameter("valorVenta"));
				SaleOP_DAO op = new SaleOP_DAO();
				SaleDTO sale = new SaleDTO();
				sale.setCustomer_id(cedulaCliente);
				sale.setIva(ivaVenta);
				sale.setSale_value(valorVenta);
				sale.setTotal_sale(totalVenta);
				sale.setUser_id(cedulaUsuario);

				idSale = op.crear(sale);

				Sale_DetailOP_DAO opDetail = new Sale_DetailOP_DAO();
				Sale_DetailDTO saleDetail = new Sale_DetailDTO();
				try {
					for (int i = 0; i < outerArray.length; i++) {
						String[] innerArray = outerArray[i].split(",");
						for (int j = 0; j < innerArray.length; j=j+5) {
							saleDetail.setProduct_id(Long.parseLong(innerArray[j]));
							saleDetail.setQuantity(Integer.parseInt(innerArray[j+1]));
							saleDetail.setSale_value(Double.parseDouble(innerArray[j+2]));
							saleDetail.setTotal_sale(Double.parseDouble(innerArray[j+3]));
							saleDetail.setIva_value(Double.parseDouble(innerArray[j+4]));
							saleDetail.setSale_id(Long.parseLong(idSale));
							opDetail.crear(saleDetail);
						}

					}
				} catch (Exception e) {
					JOptionPane.showMessageDialog(null, e + " for 2");
				}

			}
			 JsonObject json = new JsonObject();

			    // put some value pairs into the JSON object .
	

			String sal = (genial) ? "exitoso" : "fallido";
			json.addProperty("respuesta", sal);
			salida.println(datos.toJson(json));
		}
	}

}
