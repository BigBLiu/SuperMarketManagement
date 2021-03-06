<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
	String userName = (String) session.getAttribute("name");
	if(userName == null) {
		response.sendRedirect("../login/index.html");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta charset="utf-8" />
	<title>商品列表</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<meta name="MobileOptimized" content="320">
	<!-- BEGIN GLOBAL MANDATORY STYLES -->          
	<link href="../assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="../assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="../assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN PAGE LEVEL PLUGIN STYLES --> 
	<link href="../assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" type="text/css"/>
	<link href="../assets/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
	<link href="../assets/plugins/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css"/>
	<link href="../assets/plugins/jqvmap/jqvmap/jqvmap.css" rel="stylesheet" type="text/css"/>
	<link href="../assets/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css"/>
	<!-- END PAGE LEVEL PLUGIN STYLES -->
	<!-- BEGIN THEME STYLES --> 
	<link href="../assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
	<link href="../assets/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="../assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
	<link href="../assets/css/plugins.css" rel="stylesheet" type="text/css"/>
	<link href="../assets/css/pages/tasks.css" rel="stylesheet" type="text/css"/>
	<link href="../assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
	<link href="../assets/css/custom.css" rel="stylesheet" type="text/css"/>
	<!-- END THEME STYLES -->
	<link rel="shortcut icon" href="favicon.ico" />
<style>input[id="sousuo"] {
	display: inline-block;
	background: #df1f26;
	color: #FFF;
	font-size: 15px;
	line-height: 29px;
	text-transform: uppercase;
	border: none;
	outline: none;
	transition: 0.2s;
	-webkit-transition: 0.2s;
	-moz-transition: 0.2s;
	-o-transition: 0.2s;
}

input[id="keyword"] {
	width:200px;
	color: #9198A3;
	font: 300 15px/25px Lato, 微软雅黑;
	background: #fff;
	outline: none;
	border: 1px solid;
}
</style>

	
<script type="text/javascript" src="../assets/scripts/jquery-1.11.1.min.js"></script>
 
	<script type="text/javascript">
	$(document).ready(function() {
				$.getJSON("../goodsQuery",function(jsonData) {
						var html="";
						for (var i = 0; i < jsonData.length; i++) {
						html+="<tr><td ><div align=\"center\">"+jsonData[i].productID+"</div></td>";
						html+="<td><div align=\"center\">"+jsonData[i].productname+"</div></td>";
						html+="<td><div align=\"center\">"+jsonData[i].price+"</div></td>";
						html+="<td><div align=\"center\">"+jsonData[i].danwei+"</div></td>";
						html+="<td><div align=\"center\">"+jsonData[i].fenlei+"</div></td>";
						html+="<td><div align=\"center\"><a href=\"modifyProduct.jsp?productID="
							+ jsonData[i].productID
							+ "\">修改 </a> </div></td>";
						
						html += "<td>"
							+ "<form role='form' id='del' action='../Staffdelete?id="
							+ jsonData[i].productID
							+ "' method='post'><input type='button' class='btn btn-danger' onclick='del("+jsonData[i].productID+")' value='删除' /></form>"
							+ "</td></tr>";}
						$("table").append(html);			
	});
				
	});
			</script>  	
			
   <script type="text/javascript">
   $(document).ready(function() {
		$("#sousuo").click(function() {
			$.getJSON("../searchgoods",{
				keyword : $("#keyword").val()},
				function(data) {
						$("table tr:gt(0)").remove();
								var html = "";
								for (var i = 0; i < data.length; i++) {
									html+="<tr><td ><div align=\"center\">"+data[i].productID+"</div></td>";
									html+="<td ><div align=\"center\">"+data[i].productname+"</div></td>";
									html+="<td><div align=\"center\">"+data[i].price+"</div></td>";
									html+="<td><div align=\"center\">"+data[i].danwei+"</div></td>";
									html+="<td><div align=\"center\">"+data[i].fenlei+"</div></td>";
									html+="<td><div align=\"center\"><a href=\"modifyProduct.jsp?productID="
										+ data[i].productID
										+ "\">修改 </a> </div></td>";
										
									html += "<td>"
										+ "<form role='form' id='del' action='../removeproduct?productID="
										+ data[i].productID
										+ "' method='post'><input type='button' class='btn btn-danger' onclick='del("+data[i].productID+")' value='删除' /></form>"
										+ "</td></tr>";}
									
									$("table").append(html);
								 });

						});

		   });
   function del(a) {
	   var del = document.getElementById("del");
		if(confirm("确认要删除吗?")){
			del.action="../removeproduct?productID="+a;
			del.submit();
		}else {
			del.action="";
		}
		
	}
	
</script>

</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
	<!-- BEGIN HEADER -->   
	<div class="header navbar navbar-inverse navbar-fixed-top">
		<!-- BEGIN TOP NAVIGATION BAR -->
		<div class="header-inner">
			<!-- BEGIN LOGO -->  
			<a class="navbar-brand" href="index.html">
			<img src="../assets/img/logo.png" alt="logo" class="img-responsive" />
			</a>
			<!-- END LOGO -->
			<!-- BEGIN RESPONSIVE MENU TOGGLER --> 
			<a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
			<img src="../assets/img/menu-toggler.png" alt="" />
			</a> 
			<span style="display:block;font-size:12px;width:600px;height:60px;
				float:left;color:#fff;text-align:center;line-height:60px;margin-left:130px;">
				Copyright © 2016 SMKT Incorporated. All rights reserved By ChenYubing.
			</span>
			<ul class="nav navbar-nav pull-right">
			
				<li class="dropdown user">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
					<img alt="" src="../assets/img/avatar1_small.jpg"/>
					<span class="username"><%=session.getAttribute("name") %></span>
					<i class="fa fa-angle-down"></i>
					</a>
					<ul class="dropdown-menu">
						<li><a href="employee_info.jsp"><i class="fa fa-user"></i>个人信息</a></li>
						
						<li class="divider"></li>
						<!-- <li><a href="javascript:;" id="trigger_fullscreen"><i class="fa fa-move"></i> 全屏</a></li>
						<li><a href="extra_lock.html"><i class="fa fa-lock"></i> 锁屏</a></li> -->
						<li><a href="../logout"><i class="fa fa-key"></i> 退出</a></li>
					</ul>
				</li>
				<!-- END USER LOGIN DROPDOWN -->
			</ul>
			<!-- END TOP NAVIGATION MENU -->
		</div>
		<!-- END TOP NAVIGATION BAR -->
	</div>
	<!-- END HEADER -->
	<div class="clearfix"></div>
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<div class="page-sidebar navbar-collapse collapse">
			<!-- BEGIN SIDEBAR MENU -->        
			<ul class="page-sidebar-menu">
				<li>
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					<!-- <div class="sidebar-toggler hidden-phone"></div> -->
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
				</li>
				<li>
					<!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
					<form class="sidebar-search" action="extra_search.html" method="POST">
						<div class="form-container">
							<!-- <div class="input-box">
								<a href="javascript:;" class="remove"></a>
								<input type="text" placeholder="搜索..."/>
								<input type="button" class="submit" value=" "/>
							</div> -->
						</div>
					</form>
					<!-- END RESPONSIVE QUICK SEARCH FORM -->
				
				
				</li>
				
				
				
				
				<li class=" ">
					<a href="index-employee.jsp">
					<i class="fa fa-home"></i> 
					<span class="title">首页</span>
					<span class="selected"></span>
					</a>
				</li>
				<li class="">
					<a href="n1.jsp">
					<i class="fa fa-table"></i> 
					<span class="title">公告栏</span>
					<span class="arrow "></span>
					</a>
				</li>
				
				<li class="">
					<a href="storage.jsp">
					<i class="fa fa-bookmark-o"></i> 
					<span class="title">库存管理</span>
					<span class="arrow "></span>
					</a>
					
				</li>
				
				<li class="start active">
					<a href="goods.jsp">
					<i class="fa fa-sitemap"></i> 
					<span class="title">商品管理</span>
					<span class="arrow "></span>
					</a>
					
				</li>
			
			</ul>
			<!-- END SIDEBAR MENU -->
		</div>
		<!-- END SIDEBAR -->
		<!-- BEGIN PAGE -->
		<div class="page-content">
			<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->               
		
			<!-- END BEGIN STYLE CUSTOMIZER -->  
			<!-- BEGIN PAGE HEADER-->
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3 class="page-title">
						SMKT超市<small>管理信息系统</small>
					</h3>
					<ul class="page-breadcrumb breadcrumb">
						<li>
							<i class="fa fa-home"></i>
							<a href="index-employee.jsp">主页</a> 
							<i class="fa fa-angle-right"></i>
						</li>
						<li class="pull-right">
							<div id="dashboard-report-range" class="dashboard-date-range tooltips" data-placement="top" data-original-title="Change dashboard date range">
								<i class="fa fa-calendar"></i>
								<span></span>
								<i class="fa fa-angle-down"></i>
							</div>
						</li>
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
                <div align="center"><h3>
                	<a href="addproduct.jsp" style="display:block;background:#e3e3e3;width:200px;height:40px;font-size:20px;text-align:center;line-height:40px;color:#000;text-decoration:none;">添加新商品</a></h3>
                </div>
                <div>
					<div class="row">
						<div class=" col-lg-12 col-xs-12"
							style="text-align: right; padding: 0 0 20px 0">
							<input placeholder="请输入IBSN码或商品名称" type="text" id="keyword" value=""
								onFocus="this.value = '';"
								onBlur="if (this.value == '') {this.value = '';}"> <input
								type="submit" id="sousuo" value="搜索" size="2px">&emsp;&emsp;&nbsp;
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
                <div>
                 <table class="table" width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#819BBC" bordercolorlight="#FFFFFF">
                  <tr>
                    <td height="28"><div align="center">商品编号</div></td>
                    <td><div align="center">商品名称</div></td>
                    <td><div align="center">单价(元)</div></td>
                    <td><div align="center">单位</div></td>
                    <td><div align="center">商品分类</div></td>
                    <td><div align="center">修改商品</div></td>
                    <td><div align="left">删除商品</div></td>
                  </tr>
                 
                </table>
                
                
				</div>
                
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN DASHBOARD STATS -->
			
			<!-- END DASHBOARD STATS -->
			
		</div>
		<!-- END PAGE -->
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<!-- <div class="footer">
		<div class="footer-inner">
			Design by Sandy
		</div>
		<div class="footer-tools">
			<span class="go-top">
			<i class="fa fa-angle-up"></i>
			</span>
		</div>
	</div> -->
	<!-- END FOOTER -->
	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<!-- BEGIN CORE PLUGINS -->   
	<!--[if lt IE 9]>
	<script src="plugins/respond.min.js"></script>
	<script src="plugins/excanvas.min.js"></script> 
	<![endif]-->   
	<script src="../assets/plugins/jquery-1.10.2.min.js"
			type="text/javascript"></script>
		<script src="../assets/plugins/jquery-migrate-1.2.1.min.js"
			type="text/javascript"></script>
		<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
		<script src="../assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js"
			type="text/javascript"></script>
		<script src="../assets/plugins/bootstrap/js/bootstrap.min.js"
			type="text/javascript"></script>
		<script
			src="../assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js"
			type="text/javascript"></script>
		<script
			src="../assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
			type="text/javascript"></script>
		<script src="../assets/plugins/jquery.blockui.min.js"
			type="text/javascript"></script>
		<script src="../assets/plugins/jquery.cookie.min.js"
			type="text/javascript"></script>
		<script src="../assets/plugins/uniform/jquery.uniform.min.js"
			type="text/javascript"></script>
		<!-- END CORE PLUGINS -->
		<!-- BEGIN PAGE LEVEL PLUGINS -->
		<script src="../assets/plugins/jqvmap/jqvmap/jquery.vmap.js"
			type="text/javascript"></script>
		<script src="../assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.russia.js"
			type="text/javascript"></script>
		<script src="../assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.world.js"
			type="text/javascript"></script>
		<script src="../assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.europe.js"
			type="text/javascript"></script>
		<script src="../assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.germany.js"
			type="text/javascript"></script>
		<script src="../assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.usa.js"
			type="text/javascript"></script>
		<script
			src="../assets/plugins/jqvmap/jqvmap/data/jquery.vmap.sampledata.js"
			type="text/javascript"></script>
		<script src="../assets/plugins/flot/jquery.flot.js"
			type="text/javascript"></script>
		<script src="../assets/plugins/flot/jquery.flot.resize.js"
			type="text/javascript"></script>
		<script src="../assets/plugins/jquery.pulsate.min.js"
			type="text/javascript"></script>
		<script src="../assets/plugins/bootstrap-daterangepicker/moment.min.js"
			type="text/javascript"></script>
		<script
			src="../assets/plugins/bootstrap-daterangepicker/daterangepicker.js"
			type="text/javascript"></script>
		<script src="../assets/plugins/gritter/js/jquery.gritter.js"
			type="text/javascript"></script>
		<!-- IMPORTANT! fullcalendar depends on jquery-ui-1.10.3.custom.min.js for drag & drop support -->
		<script
			src="../assets/plugins/fullcalendar/fullcalendar/fullcalendar.min.js"
			type="text/javascript"></script>
		<script
			src="../assets/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.js"
			type="text/javascript"></script>
		<script src="../assets/plugins/jquery.sparkline.min.js"
			type="text/javascript"></script>
		<!-- END PAGE LEVEL PLUGINS -->
		<!-- BEGIN PAGE LEVEL SCRIPTS -->
		<script src="../assets/scripts/app.js" type="text/javascript"></script>
		<script src="../assets/scripts/index.js" type="text/javascript"></script>
		<script src="../assets/scripts/tasks.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL SCRIPTS -->

	<!-- 

<script src="scripts/bootstrap.min.js"></script> END JAVASCRIPTS -->
	<script src="../assets/scripts/jquery-1.11.1.min.js"></script>    
	<!-- END PAGE LEVEL SCRIPTS -->  

	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>