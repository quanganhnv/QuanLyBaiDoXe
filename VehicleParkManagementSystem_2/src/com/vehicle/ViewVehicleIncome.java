package com.vehicle;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;


/**
 * Servlet implementation class ViewVehicleIncome
 */
@WebServlet("/ViewVehicleIncome")
public class ViewVehicleIncome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewVehicleIncome() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		Map<String,String> map = new HashMap<>();
		Connection connection;
		try {
			connection = DatabaseConnection.getConnection();
			Statement stmt = connection.createStatement();
			ResultSet rs=	stmt.executeQuery("SELECT VehicleCategory, SUM(parkingcharge)\r\n"
					+ "FROM vpmsdb.tblvehicle \r\n"
					+ "GROUP BY VehicleCategory;");
			while(rs.next())
			{
				String vehicle = rs.getString(1);
				String sum = rs.getString(2);
				map.put(vehicle, sum);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Loi cau truy van doanh thu");
		}
//		for (String name: map.keySet()) {
//		    String key = name.toString();
//		    String value = map.get(name).toString();
//		    System.out.println(key + " " + value);
//		}
		request.setAttribute("incomeMap", map);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/chart.jsp");
        requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
