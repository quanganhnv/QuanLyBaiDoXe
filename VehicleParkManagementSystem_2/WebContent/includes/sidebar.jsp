<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<aside id="left-panel" class="left-panel">
	<nav class="navbar navbar-expand-sm navbar-default">
		<div id="main-menu" class="main-menu collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="dashboard.jsp"><i
						class="menu-icon fa fa-laptop"></i>Trang chủ </a></li>


				<li class="menu-item-has-children dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="menu-icon fa fa-table"></i>Loại xe
				</a>
					<ul class="sub-menu children dropdown-menu">
						<li><i class="fa fa-table"></i><a href="add-category.jsp">Thêm loại xe</a></li>
						<li><i class="fa fa-table"></i><a href="manage-category.jsp">Quản lý loại xe</a></li>
					</ul></li>
				<li><a href="add-vehicle.jsp"> <i
						class="menu-icon ti-email"></i>Thêm phương tiện
				</a></li>
				<li class="menu-item-has-children dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Quản lý phương tiện
				</a>
					<ul class="sub-menu children dropdown-menu">
						<li><i class="menu-icon fa fa-th"></i><a
							href="manage-incomingvehicle.jsp">Quản lý xe vào</a></li>
						<li><i class="menu-icon fa fa-th"></i><a
							href="manage-outgoingvehicle.jsp">Quản lý xe ra</a></li>

					</ul></li>
				<li class="menu-item-has-children dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Báo cáo thống kê
				</a>
					<ul class="sub-menu children dropdown-menu">
						<li><i class="menu-icon fa fa-th"></i><a
							href="bwdates-report-ds.jsp">Báo cáo theo khoảng thời gian</a></li>
						<li><i class="menu-icon fa fa-th"></i><a
							href="chart.jsp">Báo cáo theo loại xe</a></li>
					</ul>
					
					</li>
				<li><a href="search-vehicle.jsp"> <i
						class="menu-icon ti-search"></i>Tìm kiếm phương tiện
				</a></li>
				<li><a href="parking-seat.jsp"> <i
						class="menu-icon fa fa-car"></i>Số chỗ đỗ xe
				</a></li>
				<li><a href="user-membership.jsp"><i
						class="menu-icon fa fa-group"></i>Quản lý thành viên </a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</nav>
</aside>