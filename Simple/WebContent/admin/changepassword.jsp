<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home</title>
<jsp:include page="controls/css.jsp"></jsp:include>
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
					<h2>Change Password</h2>
				</div>
				<div class="col-md-6">
					<ul class="list-page-breadcrumb">
						<li><a href="home.jsp">Home <i
								class="zmdi zmdi-chevron-right"></i></a></li>
						<li class="active-page"><a href="changepassword.jsp">Change
								Password </a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="widget-wrap">

					<div class="widget-container margin-top-0 clearfix">
						<div class="widget-content">
							<form action="../AdminChangePasswordController" method="post" class="j-forms"
								id="j-forms-validation" novalidate>

								<div class="form-content">

									<div class="w-section-header">
										<h3>Change Password</h3>
									</div>


									<div class="w-section-header">
										<h3>Password</h3>
									</div>

									<!-- start password, confirm password -->
									<div class="row">
										<div class="col-md-4 unit">
											<div class="input">
												<label class="icon-right" for="oldpassword"> <i
													class="fa fa-lock"></i>
												</label> <input class="form-control" type="password" id="oldpassword"
													name="oldpassword" placeholder="old password">
											</div>
											<label class="checkbox"> <input type="checkbox"
												id="show-old-pass"> <i></i> Show password
											</label>
										</div>
										<div class="col-md-4 unit">
											<div class="input">
												<label class="icon-right" for="password"> <i
													class="fa fa-lock"></i>
												</label> <input class="form-control" type="password" id="password"
													name="password" placeholder="new password">
											</div>
											<label class="checkbox"> <input type="checkbox"
												id="show-pass"> <i></i> Show password
											</label>
										</div>
										<div class="col-md-4 unit">
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
									<button type="submit" class="btn btn-success primary-btn">Submit</button>
								</div>
								<!-- end /.footer -->

							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	</section>
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