<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login</title>
<link type="text/css" rel="stylesheet" href="css/font-awesome.css">
<link type="text/css" rel="stylesheet"
	href="css/material-design-iconic-font.css">
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/animate.css">
<link type="text/css" rel="stylesheet" href="css/layout.css">
<link type="text/css" rel="stylesheet" href="css/components.css">
<link type="text/css" rel="stylesheet" href="css/widgets.css">
<link type="text/css" rel="stylesheet" href="css/plugins.css">
<link type="text/css" rel="stylesheet" href="css/pages.css">
<link type="text/css" rel="stylesheet" href="css/bootstrap-extend.css">
<link type="text/css" rel="stylesheet" href="css/common.css">
<link type="text/css" rel="stylesheet" href="css/responsive.css">
</head>
<body class="login-page">
	<!--Page Container Start Here-->
	<section class="login-container boxed-login">
	<div class="container">
		<div class="col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4">
			<div class="login-form-container">
				<form action="../AdminLoginController" method="post" class="j-forms"
					novalidate>

					<div class="login-form-header">
						<div class="logo">
							<a href="index.html" title="Admin Template"><img
								src="images/logo-dark.png" alt="logo"></a>
						</div>
					</div>
					<div class="login-form-content">



						<!-- start login -->
						<div class="unit">
							<div class="input login-input">
								<label class="icon-left" for="login" style="padding-top: 15px;">
									<i class="zmdi zmdi-account"></i>
								</label> <input class="form-control login-frm-input" type="text"
									id="login" name="login" placeholder=" Email">
							</div>
						</div>
						<!-- end login -->

						<!-- start password -->
						<div class="unit">
							<div class="input login-input">
								<label class="icon-left" for="password"
									style="padding-top: 15px;"> <i class="zmdi zmdi-key"></i>
								</label> <input class="form-control login-frm-input" type="password"
									id="password" name="password" placeholder="Password"> <span
									class="hint"> <a href="#" class="link">Forgot
										password?</a>
								</span>
							</div>
						</div>
						<!-- end password -->


						<!-- start keep logged -->
						<div class="unit">
							<label class="checkbox"> <%
 	String err = (String) session.getAttribute("error");
 	if (err != null) {
 		out.print(err);
 	}
 %>
							</label>
						</div>
						<!-- end keep logged -->

					</div>
					<div class="login-form-footer">
						<button type="submit" class="btn-block btn btn-primary">Sign
							in</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	<!--Footer Start Here --> <footer class="login-page-footer">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4">
				<div class="footer-content">
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
	<script src="js/lib/jRespond.js"></script>
	<script src="js/lib/hammerjs.js"></script>
	<script src="js/lib/jquery.hammer.js"></script>
	<script src="js/lib/smoothscroll.js"></script>
	<script src="js/lib/smart-resize.js"></script>

	<script src="js/lib/jquery.validate.js"></script>
	<script src="js/lib/jquery.form.js"></script>
	<script src="js/lib/j-forms.js"></script>
	<script src="js/lib/login-validation.js"></script>
</body>

</html>