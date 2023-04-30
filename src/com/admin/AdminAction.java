package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AdminAction
 */
@WebServlet("/AdminAction")
public class AdminAction extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession();
		try {
			Connection connection = DatabaseConnection.getConnection();
			Statement statement = connection.createStatement();
			String fullname = request.getParameter("fullname");
			String mobile = request.getParameter("mobile");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			if(request.getParameter("typeAction").equals("delete")) {
				int id = (int) hs.getAttribute("id");
				int excute = statement.executeUpdate("delete from tbluser where id = " + id);
			}
			else if(request.getParameter("typeAction").equals("add")) {
				statement.executeUpdate("insert into tbluser(fullname,mobile,email,address,uname,password)values('"
						+ fullname + "','" + mobile + "','" + email + "','" + address + "','" + username
						+ "','" + password + "')");
			}
			else if(request.getParameter("typeAction").equals("modify")) {
				int id = (int) hs.getAttribute("id");
				statement.executeUpdate("update tbluser set fullname='" + fullname +"', mobile='" + mobile + 
						"', email='" + email + "', address='" + address + "', uname='" + username +
						"', password='" + password + "' where id=" + id);
			}
			response.sendRedirect("user-membership.jsp");
//			int addVehicle = statement.executeUpdate("");
//			if (addVehicle > 0) {
//				String message = "User register successfully, Please login.";
//				hs.setAttribute("message", message);
//				response.sendRedirect("user-register.jsp");
//			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
