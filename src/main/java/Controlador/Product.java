package Controlador;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.swing.JOptionPane;

import org.apache.jasper.tagplugins.jstl.core.If;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import Modelo.CustomerDTO;
import Modelo.CustomerOP_DAO;
import Modelo.ProductDTO;
import Modelo.ProductOP_DAO;
import Modelo.ProviderDTO;
import Modelo.ProviderOP_DAO;
import Modelo.UserDTO;
import Modelo.UserOP_DAO;

/**
 * Servlet implementation class Product
 */
@MultipartConfig
@WebServlet("/Product")
public class Product extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int BUFFER_SIZE = 2048;
		// TODO Auto-generated method stub
		PrintWriter salida = response.getWriter();
		Gson datos = new Gson();
		if (request.getParameter("method").equals("createProducts")) {

			Part requestFile = request.getPart("file");
			String fileName = Paths.get(requestFile.getSubmittedFileName()).getFileName().toString();

			BufferedReader reader = new BufferedReader(new InputStreamReader(requestFile.getInputStream(), "UTF-8"));
			StringBuilder value = new StringBuilder();
			char[] buffer = new char[BUFFER_SIZE];
			for (int length = 0; (length = reader.read(buffer)) > 0;) {
				value.append(buffer, 0, length);
			}
			String[] exploded = value.toString().split("\n");
			Boolean buenArchivo = true;
			ProductOP_DAO op = new ProductOP_DAO();
			ArrayList<ProductDTO> arrProductDTO = new ArrayList<>();
			for (int i = 0; i < exploded.length; i++) {
				String[] exploded2 = exploded[i].split(";");
				if (exploded2.length != 6) {
					buenArchivo = false;
					break;
				} else {
					ProductDTO product = new ProductDTO();
					product.setCode(Long.parseLong(exploded2[0]));
					product.setIva(Double.parseDouble(exploded2[1]));
					product.setNit(Long.parseLong(exploded2[2]));
					product.setProduct_name(exploded2[3]);
					product.setPurchase_price(Double.parseDouble(exploded2[4]));
					product.setSale_price(Double.parseDouble(exploded2[5]));
					arrProductDTO.add(product);
				}
			}
			String sal = "";
			if (buenArchivo) {
				sal = (op.creaMasivo(arrProductDTO)) ? "success" : "error";
			} else {
				sal = "error";
			}
			JsonObject json = new JsonObject();
			json.addProperty("respuesta", sal);
			salida.println(json);
		} else if (request.getParameter("method").equals("getProduct")) {
			String requestProduct = request.getParameter("idProduct");
			ProductOP_DAO op = new ProductOP_DAO();
			ProductDTO product = new ProductDTO();
			product = op.consultar(requestProduct);
			salida.println(datos.toJson(product));
		} else if (request.getParameter("method").equals("editProduct")) {

			String requestId = request.getParameter("id");
			String requestName = request.getParameter("name");
			String requestPriceSale = request.getParameter("priceSale");

			ProductOP_DAO op = new ProductOP_DAO();
			ProductDTO product = new ProductDTO();
			product.setCode(Long.parseLong(requestId));
			product.setProduct_name(requestName);
			product.setSale_price(Double.parseDouble(requestPriceSale));

			String sal = (op.actualizar(product)) ? "exitoso" : "fallido";
			salida.println(datos.toJson(sal));
			// response.sendRedirect("principal/home.jsp?page=customers&action=list&state="
			// +
			// sal);
		}
	}

}
