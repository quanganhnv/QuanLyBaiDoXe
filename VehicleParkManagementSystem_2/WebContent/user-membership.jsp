<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!doctype html>

<html class="no-js" lang="">
<head>

<title>Quản lý thành viên</title>


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
	<style>
		#addPopup {
			display: none;
			position: absolute;
			z-index: 9999;
			background-color: #fff;
			width: 600px;
			margin: 0 auto;
			padding: 10px 20px;
			left: 0; 
  			right: 0; 
  			margin-left: auto; 
  			margin-right: auto; 
		}
	</style>

</head>
<body>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<!-- Left Panel -->

	<jsp:include page="includes/sidebar.jsp"></jsp:include>

	<jsp:include page="includes/header.jsp"></jsp:include>
	<div id="addPopup">
		<form action="AdminAction" method="post">
						<div class="form-group">
							<label>Họ và Tên</label> <input class="form-control" type="text"
								placeholder="" required="true" name="fullname">
						</div>
						<div class="form-group">
							<label>Số điện thoại</label> <input class="form-control" type="text"
								placeholder="" required="true" name="mobile">
						</div>
						<div class="form-group">
							<label>Email</label> <input class="form-control" type="text"
								placeholder="" required="true" name="email">
						</div>
						<div class="form-group">
							<label>Địa chỉ</label>
							<textarea class="form-control" placeholder="Hà Nội"
								required="true" name="address"></textarea>
						</div>
						<div class="form-group">
							<label>Tên đăng nhập</label> <input class="form-control" type="text"
								placeholder="" required="true" name="username">
						</div>
						<div class="form-group">
							<label>Mật khẩu</label> <input type="password"
								class="form-control" name="password" placeholder=""
								required="true">
						</div>
						<button type="submit" id="typeAdd" style="display: none;"
							class="btn btn-warning btn-flat m-b-30 m-t-30" name="typeAction" value="add">Thêm</button>
						<button type="submit" id="typeModify" style="display: none;"
							class="btn btn-warning btn-flat m-b-30 m-t-30" name="typeAction" value="modify">Lưu</button>
						<button class="btn btn-warning" onclick="return closePopup();">Đóng</button>
					</form>
	</div>
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
								<li class="active">Thành viên</li>
							</ol>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<button style="margin: 10px 0 0 30px" class="btn btn-warning" onclick="return showAddPopup();">Thêm</button>
	<div class="content">
		<div class="animated fadeIn">
			<div class="row">



				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">Thành viên</strong>
						</div>
						<div class="card-body">
							<table class="table">
								<thead>
									<tr>
										<th>STT</th>
										<th>Tên</th>
										<th>Số điện thoại</th>
										<th>Email</th>
										<th>Địa chỉ</th>
									</tr>
								</thead>
								<%
									String status = null;
										Connection con = DatabaseConnection.getConnection();
										Statement statement = con.createStatement();
										ResultSet resultset = statement.executeQuery("select * from  tbluser");
										while (resultset.next()) {
								%>
								<tr>
									<form action="AdminAction" method="post">
										<td><%=resultset.getInt(1)%></td>
										<td><%=resultset.getString(2)%></td>
										<td><%=resultset.getString(3)%></td>
										<td><%=resultset.getString(4)%></td>
										<td><%=resultset.getString(5)%></td>
										<% session.setAttribute("id", resultset.getInt(1)); %>
										<td><button class="btn btn-warning" type="submit" name="typeAction" value="delete">Xóa</button></td>
									</form>
									<td><button class="btn btn-warning" onclick="showModifyPopup();">Sửa</button></td>
								</tr>
								<%
									}
								%>
							</table>

						</div>
					</div>
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
	<script>
		function showAddPopup() {
			document.getElementById('addPopup').style.display = 'block';
			document.getElementById('typeAdd').style.display = 'inline-block';
		}
		function showModifyPopup() {
			document.getElementById('addPopup').style.display = 'block';
			document.getElementById('typeModify').style.display = 'inline-block';
		}
		function closePopup() {
			document.getElementById('addPopup').style.display = 'none';
		}
	</script>
	<%
		} else {
			response.sendRedirect("admin-login.jsp");
		}
	%>

</body>
</html>
