<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%
	String pseats = request.getParameter("pseats");
	try {
		Connection connection = DatabaseConnection.getConnection();
		Statement statement = connection.createStatement();
		int updateinfo = statement.executeUpdate("update tblParkingSeatCapacity set parking_seat='" + pseats + "'");
		if (updateinfo > 0) {
			response.sendRedirect("parking-seat.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>