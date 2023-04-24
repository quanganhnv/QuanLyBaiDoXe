<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!doctype html>
<html class="no-js" lang="">
<head>
<title>Chi tiết phương tiện ra</title>
<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
<link rel="stylesheet" href="assets/css/style.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>

</head>
<body>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<!-- Left Panel -->

	<jsp:include page="includes/sidebar.jsp"></jsp:include>

	<jsp:include page="includes/header.jsp"></jsp:include>
	<div class="breadcrumbs">
		<div class="breadcrumbs-inner">
			<div class="row m-0">
				<div class="col-sm-4">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>Trang chủ</h1>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="page-header float-right">
						<div class="page-title">
							<ol class="breadcrumb text-right">
								<li><a href="dashboard.jsp">Trang chủ</a></li>
								<li><a href="manage-outgoingvehicle.jsp">Chi tiết phương tiện</a></li>
								<li class="active">Phương tiện ra</li>
							</ol>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="content">
		<div class="animated fadeIn">
			<div class="row">



				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">Chi tiết phương tiện ra</strong>
						</div>
						<div class="card-body">
							<%
								int cid = Integer.parseInt(request.getParameter("viewid"));
									session.setAttribute("cid", cid);
									Connection con = DatabaseConnection.getConnection();
									Statement statement = con.createStatement();
									ResultSet resultset = statement.executeQuery("select * from tblvehicle where ID='" + cid + "'");
									while (resultset.next()) {
							%>
							<table border="1" class="table table-bordered mg-b-0">

								<tr>
									<th>Số bãi đỗ xe</th>
									<td><%=resultset.getString(2)%></td>
								</tr>
								<tr>
									<th>Loại xe</th>
									<td><%=resultset.getString(3)%></td>
								</tr>
								<tr>
									<th>Tên thương hiệu</th>
									<td><%=resultset.getString(4)%></td>
								</tr>
								<tr>
									<th>Số đăng ký</th>
									<td><%=resultset.getString(5)%></td>
								</tr>
								<tr>
									<th>Tên chủ xe</th>
									<td><%=resultset.getString(6)%></td>
								</tr>
								<tr>
									<th>Số điện thoại chủ xe</th>
									<td><%=resultset.getString(7)%></td>
								</tr>
								<tr>
									<th>Thời gian vào</th>
									<td><%=resultset.getString(8)%></td>
								</tr>
								<tr>
									<th>Thời gian ra</th>
									<td><%=resultset.getString(9)%></td>
								</tr>
								<tr>
									<th>Nhận xét</th>
									<td><%=resultset.getString(11)%></td>
								</tr>
								<tr>
									<th>Trạng thái</th>
									<td><%=resultset.getString(12)%></td>
								</tr>
								<tr>
									<th>Phí gửi xe</th>
									<td><%=resultset.getString(10)%></td>
								</tr>
							</table>
						</div>
					</div>

					<%
						}
					%>
				</div>
			</div>
		</div>
		<!-- .animated -->
	</div>
	<!-- .content -->

	<div class="clearfix"></div>

	<jsp:include page="includes/footer.jsp"></jsp:include>

	</div>
	<!-- /#right-panel -->

	<!-- Right Panel -->

	<!-- Scripts -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="assets/js/main.js"></script>

	<%
		} else {
			response.sendRedirect("admin-login.jsp");
		}
	%>
</body>
</html>
