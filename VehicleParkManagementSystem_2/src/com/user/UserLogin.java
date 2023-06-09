package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String uname = request.getParameter("username");
		String pass = request.getParameter("password");
		try {
			HttpSession hs = request.getSession();
			String tokens = UUID.randomUUID().toString();
			Connection con = DatabaseConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet resultset = st.executeQuery("select * from tbluser where uname='" + uname + "' AND password='" + pass + "'");
			if (resultset.next()) {
				String fullName=resultset.getString(2);
				hs.setAttribute("uname", uname);
				hs.setAttribute("fullName", fullName);
				hs.setAttribute("mobileNo", resultset.getString(3));
				response.sendRedirect("user-dashboard.jsp?_tokens='" + tokens + "'");
			} else {
				String message = "Invalid username or password!!!";
				hs.setAttribute("message", message);
				response.sendRedirect("user-login.jsp");
			}
		} catch (Exception e) {

			e.printStackTrace();
		}

	}

}
