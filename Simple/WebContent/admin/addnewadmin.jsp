<%@page import="com.simple.model.Admin"%>
<%@page import="java.util.List"%>
<%@page import="com.simple.service.impl.AdminServiceImpl"%>
<%@page import="com.simple.service.AdminService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Admin</title>
<jsp:include page="controls/css.jsp"></jsp:include>
<script type="text/javascript">
	function editAdmin(id){
		$.get('../AddNewAdminController?flag=edit',{id:id},function(response){
			$('#firstName').val(response.firstName);
			$('#lastName').val(response.lastName);
			$('#email').val(response.email);
			$('#password').val(response.password);
			$('#digits').val(response.contact);
			$('#btn').val("Update");
		});
	}
</script>
</head>
<body class="leftbar-view">
	<jsp:include page="controls/header.jsp"></jsp:include>
	<jsp:include page="controls/sidebar.jsp"></jsp:include>
	<!--Page Container Start Here-->
	<section class="main-container">
	<div class="container-fluid">
		<div class="page-header filled full-block light">
			<div class="row">
				<div class="col-md-6">
					<h2>Admins</h2>
				</div>
				<div class="col-md-6">
					<ul class="list-page-breadcrumb">
						<li><a href="home.jsp">Home <i
								class="zmdi zmdi-chevron-right"></i></a></li>
						<li class="active-page"><a href="addnewadmin.jsp">Add
								Admin <i class="zmdi zmdi-chevron-right"></i>
						</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="widget-wrap">

					<div class="widget-container margin-top-0 clearfix">
						<div class="widget-content">
							<form action="../AddNewAdminController" method="post"
								class="j-forms" id="j-forms-validation" novalidate>

								<div class="form-content">

									<div class="w-section-header">
										<h3>Admin</h3>
									</div>
									<div class="row">
										<div class="col-md-6 unit">
											<label class="label">First Name</label>
											<div class="input">
												<label class="icon-right" for="text"> <i
													class="fa fa-edit"></i>
												</label> <input class="form-control" type="text"
													placeholder="required first name" id="firstName"
													name="firstName">
											</div>
										</div>
										<div class="col-md-6 unit">
											<label class="label">Last Name</label>
											<div class="input">
												<label class="icon-right" for="text"> <i
													class="fa fa-edit"></i>
												</label> <input class="form-control" type="text"
													placeholder="required last name" id="lastName"
													name="lastName">
											</div>
										</div>
									</div>
									<!-- start email url -->
									<div class="row">
										<div class="col-md-6 unit">
											<label class="label">Email</label>
											<div class="input">
												<label class="icon-right" for="email"> <i
													class="fa fa-envelope-o"></i>
												</label> <input class="form-control" type="email"
													placeholder="email@example.com" name="email" id="email">
											</div>
										</div>
										<div class="col-md-6 unit">
											<label class="label">Contact</label>
											<div class="input">
												<label class="icon-right" for="digits"> <i
													class="fa fa-check"></i>
												</label> <input class="form-control" type="text" name="digits"
													id="digits" placeholder="contact">
											</div>
										</div>
									</div>
									<!-- end email url -->

									<div class="w-section-header">
										<h3>Password</h3>
									</div>

									<!-- start password, confirm password -->
									<div class="row">
										<div class="col-md-6 unit">
											<div class="input">
												<label class="icon-right" for="password"> <i
													class="fa fa-lock"></i>
												</label> <input class="form-control" type="password" id="password"
													name="password" placeholder="password">
											</div>
											<label class="checkbox"> <input type="checkbox"
												id="show-pass"> <i></i> Show password
											</label>
										</div>
										<div class="col-md-6 unit">
											<div class="input">
												<label class="icon-right" for="confirm-password"> <i
													class="fa fa-unlock"></i>
												</label> <input class="form-control" type="password"
													id="confirm-password" name="confirm_password"
													placeholder="confirm password">
											</div>
											<label class="checkbox"> <input type="checkbox"
												id="show-conf-pass"> <i></i> Show password
											</label>
										</div>
									</div>
									<!-- end password, confirm password -->

								</div>
								<!-- end /.content -->

								<div class="form-footer">
									<input type="submit" class="btn btn-success primary-btn"
										value="Submit" id="btn">
								</div>
								<!-- end /.footer -->

							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="widget-wrap  material-table-widget">
					<div class="widget-container margin-top-0">
						<div class="widget-content">
							<div class="data-action-bar">
								<div class="row">
									<div class="col-md-6">
										<div class="widget-header">
											<h3>User table</h3>
											<p>A table example with profile thumbnail</p>
										</div>
									</div>

								</div>
							</div>
							<table class="table table-striped data-tbl">
								<thead>
									<tr>
										<th>Name</th>
										<th>Email</th>
										<th>Contact</th>
										<th>Status</th>
										<th class="td-center">Action</th>
									</tr>
								</thead>
								<tbody>
									<%
										AdminService adminService = new AdminServiceImpl();
										List<Admin> admins = adminService.findAll();
										for (Admin admin1 : admins) {
									%>
									<tr>
										<td><%=admin1.getFirstName()%>&nbsp;<%=admin1.getLastName()%></td>
										<td><%=admin1.getEmail()%></td>
										<td><%=admin1.getContact()%></td>
										<td>
											<%
												if (admin1.getStatus().equals("A")) {
											%><label class="label label-warning">Active</label> <%
 	} else {
 %> <label class="label label-warning">DeActive</label> <%
 	}
 %>
										</td>
										<td class="td-center">
											<div class="btn-toolbar" role="toolbar">
												<div class="btn-group" role="group">
													<button onclick="editAdmin(<%=admin1.getId()%>)"
														class="btn btn-default btn-sm m-user-edit">
														<i class="zmdi zmdi-edit"></i>
													</button>
													<button class="btn btn-default btn-sm m-user-delete">
														<i class="zmdi zmdi-close"></i>
													</button>
												</div>
											</div>
										</td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!--Footer Start Here --> <footer class="footer-container">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-sm-6">
				<div class="footer-left">
					<span>© 2015 <a href="http://themeforest.net/user/westilian">westilian</a></span>
				</div>
			</div>
			<div class="col-md-6 col-sm-6">
				<div class="footer-right">
					<span class="footer-meta">Crafted with&nbsp;<i
						class="fa fa-heart"></i>&nbsp;by&nbsp;<a
						href="http://themeforest.net/user/westilian">westilian</a></span>
				</div>
			</div>
		</div>
	</div>
	</footer> <!--Footer End Here --> </section>
	<!--Page Container End Here-->
	<script src="js/lib/jquery.js"></script>
	<script src="js/lib/jquery-migrate.js"></script>
	<script src="js/lib/bootstrap.js"></script>
	<script src="js/lib/jquery.ui.js"></script>
	<script src="js/lib/jRespond.js"></script>
	<script src="js/lib/nav.accordion.js"></script>
	<script src="js/lib/hover.intent.js"></script>
	<script src="js/lib/hammerjs.js"></script>
	<script src="js/lib/jquery.hammer.js"></script>
	<script src="js/lib/jquery.fitvids.js"></script>
	<script src="js/lib/scrollup.js"></script>
	<script src="js/lib/smoothscroll.js"></script>
	<script src="js/lib/jquery.slimscroll.js"></script>
	<script src="js/lib/jquery.syntaxhighlighter.js"></script>
	<script src="js/lib/velocity.js"></script>
	<script src="js/lib/smart-resize.js"></script>
	<!--Data Tables-->
	<script src="js/lib/jquery.dataTables.js"></script>
	<script src="js/lib/dataTables.responsive.js"></script>
	<script src="js/lib/dataTables.tableTools.js"></script>
	<script src="js/lib/dataTables.bootstrap.js"></script>
	<!--Forms-->
	<script src="js/lib/jquery.maskedinput.js"></script>
	<script src="js/lib/jquery.validate.js"></script>
	<script src="js/lib/jquery.form.js"></script>
	<script src="js/lib/additional-methods.js"></script>
	<script src="js/lib/j-forms.js"></script>
	<script src="js/lib/j-forms-validations.js"></script>
	<script src="js/lib/select2.full.js"></script>

	<!--Forms Plugins-->
	<script src="js/lib/jquery.tagsinput.js"></script>
	<script src="js/lib/jquery.mask.js"></script>
	<script src="js/lib/jquery.bootstrap-touchspin.js"></script>
	<script src="js/lib/bootstrap-filestyle.js"></script>
	<script src="js/lib/selectize.js"></script>
	<script src="js/lib/bootstrap-datepicker.js"></script>
	<script src="js/lib/moment.js"></script>
	<script src="js/lib/daterangepicker.js"></script>
	<script src="js/lib/colorpicker.js"></script>
	<script src="js/lib/colors.js"></script>
	<script src="js/lib/jqColorPicker.js"></script>
	<script src="js/apps.js"></script>
</body>
</html>