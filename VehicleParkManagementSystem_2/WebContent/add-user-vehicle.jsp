<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!doctype html>
<html class="no-js" lang="">
<head>
<title>Thêm phương tiện</title>
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

<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>
<body>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="includes/user-sidebar.jsp"></jsp:include>

	<jsp:include page="includes/user-header.jsp"></jsp:include>

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
								<li><a href="user-dashboard.jsp">Trang chủ</a></li>
								<li><a href="add-user-vehicle.jsp">Phương tiện</a></li>
								<li class="active">Thêm phương tiện</li>
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
				<div class="col-lg-6">
					<div class="card"></div>
					<!-- .card -->

				</div>
				<!--/.col-->
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							<strong>Thêm phương tiện </strong> 
						</div>
							<p>
								<%
									String message = (String) session.getAttribute("message");
										if (message != null) {
											session.removeAttribute("message");
								%>
							
							<h6><center>Chỗ để xe đã đầy, vui lòng thử lại sau. </center></h6>
							<%
								}
							%>
							</p>
							<div class="card-body card-block">
							<form action="AddOwnVehicle" method="post">
								<p style="font-size: 16px; color: red" align="center">
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="select" class=" form-control-label">Loại xe</label>
									</div>
									<div class="col-12 col-md-9">
										<select name="catename" id="catename" class="form-control">
											<option value="0">Chọn loại xe</option>
											<%
												Connection con = DatabaseConnection.getConnection();
													Statement statement = con.createStatement();
													ResultSet resultset = statement.executeQuery("select * from tblcategory");
													while (resultset.next()) {
											%>
											<option value="<%=resultset.getString(2)%>"><%=resultset.getString(2)%></option>
											<%
												}
											%>
										</select>
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="text-input" class=" form-control-label">Nhãn hiệu xe</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="vehcomp" name="vehcomp"
											class="form-control" placeholder="Nhãn hiệu xe"
											required="true">
									</div>
								</div>

								<div class="row form-group">
									<div class="col col-md-3">
										<label for="text-input" class=" form-control-label">Biển số xe</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="vehreno" name="vehreno"
											class="form-control" placeholder="Biển số xe"
											required="true">
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="text-input" class=" form-control-label">Tên chủ xe</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="ownername" name="ownername"
											class="form-control" placeholder="Tên chủ xe"
											value="<%=session.getAttribute("fullName")%>" required="true"
											readonly>
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="text-input" class=" form-control-label">Số điện thoại chủ xe</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="ownercontno" name="ownercontno"
											class="form-control" placeholder="Số điện thoại chủ xe"
											required="true" maxlength="10" value="<%=session.getAttribute("mobileNo")%>" readonly>
									</div>
								</div>
								<p style="text-align: center;">
									<button type="submit" class="btn btn-primary btn-sm"
										name="submit">Thêm</button>
								</p>
							</form>
						</div>

					</div>

				</div>
				<div class="col-lg-6"></div>
			</div>
		</div>
		<!-- .animated -->
	</div>
	<!-- .content -->

	<div class="clearfix"></div>

	<jsp:include page="includes/footer.jsp"></jsp:include>

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
			response.sendRedirect("user-login.jsp");
		}
	%>
</body>
</html>
