<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 --%><%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.connection.DatabaseConnection" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Doanh thu theo loại xe</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    // Load the Visualization API and the piechart package.
    <%
		Map<String,Float> map = new HashMap<>();
		Connection connection;
		try {
			connection = DatabaseConnection.getConnection();
			Statement stmt = connection.createStatement();
			ResultSet rs=	stmt.executeQuery("SELECT distinct OwnerName, count(OwnerName) \n"
					+ "FROM vpmsdb.tblvehicle \n"
					+ "GROUP BY OwnerName \n"
					+ "order by count(OwnerName)desc \n"
					+ "limit 3;");
			while(rs.next())
			{
				String vehicle = rs.getString(1);
				String sum = rs.getString(2);
				float sum_int = Float.parseFloat(sum);
				map.put(vehicle, sum_int);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Loi cau truy van doanh thu");
	}
	%>
    google.charts.load('current', {'packages':['corechart']});
    
    // Set a callback to run when the Google Visualization API is loaded.
    google.charts.setOnLoadCallback(drawChart);
    
    // Callback that creates and populates a data table,
    // instantiates the pie chart, passes in the data and
    // draws it.
    function drawChart() {
        // Create the data table.
        //var data = new google.visualization.DataTable();
        //data.addColumn('string', 'Topping');
        //data.addColumn('number', 'Slices');
        /*data.addRows([
                    <c:forEach items="${pieDataMap}" var="entry">
                        [ '${entry.key}', ${entry.value} ],
                    </c:forEach>
                    ]);*/
        var data = google.visualization.arrayToDataTable([
        	['Tên khách', 'Số xe'],
        	<% if(map.size()!=0){
    			for(Map.Entry<String,Float> entry : map.entrySet()){
    		%>	          
    		['<%=entry.getKey()%>',     <%out.print(entry.getValue());%>],
              <%}
        	}%>
        ]);
                    
        // Set chart options
        var options = {
            'title' : 'Top khách hàng gửi nhiều xe nhất', //title which will be shown right above the Google Pie Chart
            is3D : true, //render Google Pie Chart as 3D
            pieSliceText: 'label', //on mouse hover show label or name of the Country
            tooltip :  {showColorCode: true}, // whether to display color code for a Country on mouse hover
            'width' : 900, //width of the Google Pie Chart
            'height' : 500 //height of the Google Pie Chart
        };
        
        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
        
        chart.draw(data, options);
    }
    
   
<%
Map<String,Float> map3 = new HashMap<>();
Connection connection3;
try {
	connection3 = DatabaseConnection.getConnection();
	Statement stmt = connection3.createStatement();
	ResultSet rs=	stmt.executeQuery("SELECT distinct OwnerName, sum(parkingcharge) \n"
			+ "FROM vpmsdb.tblvehicle \n"  
			+ "GROUP BY OwnerName \n"
			+ "order by sum(parkingcharge) desc \n"
			+ "limit 5;");
	while(rs.next())
	{
		String name = rs.getString(1);
		String sum = rs.getString(2);
		float sum_int = Float.parseFloat(sum);
		map3.put(name, sum_int);
	}
	connection3.close();
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	System.out.println("Loi cau truy van doanh thu");
}
%>
google.charts.load('current', {'packages':['corechart']});

//Set a callback to run when the Google Visualization API is loaded.
google.charts.setOnLoadCallback(drawBarChart);

//Callback that creates and populates a data table,
//instantiates the pie chart, passes in the data and
//draws it.
function drawBarChart() {
 // Create the data table.
 //var data = new google.visualization.DataTable();
 //data.addColumn('string', 'Topping');
 //data.addColumn('number', 'Slices');
 /*data.addRows([
             <c:forEach items="${pieDataMap}" var="entry">
                 [ '${entry.key}', ${entry.value} ],
             </c:forEach>
             ]);*/
 var data2 = google.visualization.arrayToDataTable([
 	['Tên khách', 'Số tiền'],
 	<% if(map3.size()!=0){
			for(Map.Entry<String,Float> entry : map3.entrySet()){
		%>	          
		['<%=entry.getKey()%>',     <%out.print(entry.getValue());%>],
       <%}
 	}%>
 ]);
             
 // Set chart options
 var options2 = {
     'title' : 'Top khách hàng chi tiêu nhiều nhất', //title which will be shown right above the Google Pie Chart
     chartArea: {width: '50%'},
     colors: ['#03a9f3', 'white'],
     hAxis: {
       title: 'Số tiền',
       minValue: 0
     },
     vAxis: {
       title: 'Tên khách'
     },
     'width' : 900, //width of the Google Pie Chart
     'height' : 500 //height of the Google Pie Chart
 };
 
 // Instantiate and draw our chart, passing in some options.
 var barChart = new google.visualization.BarChart(document.getElementById('bar_chart_div'));
 
 barChart.draw(data2, options2);
}
</script>
<title>Quản lý xe vào</title>


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
	
	<jsp:include page="includes/sidebar.jsp"></jsp:include>

	<jsp:include page="includes/header.jsp"></jsp:include>
    <div style="width: 50%; float:left;">
        <div id="chart_div"></div>
    </div>
    <div style="width: 50%; float:right;">
        <div id="bar_chart_div"></div>
    </div>
    
    
    
    
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
    
</body>
</html>