<!--Leftbar Start Here-->
<%@page import="com.simple.model.Admin"%>
<aside class="leftbar">
	<div class="left-aside-container">
		<div class="user-profile-container">
			<div class="user-profile clearfix">
				<div class="admin-user-thumb">
					<img src="images/avatar/jaman_01.jpg" alt="admin">
				</div>
				<div class="admin-user-info">
					<ul>
						<li><a href="#"> <%
 	Admin admin = (Admin) session.getAttribute("admin");
 	if (admin != null) {
 		out.print(admin.getFirstName());
 %>&nbsp;<%
 	out.print(admin.getLastName());
 	}
 %>
						</a></li>
						<li><a href="#"> <%
 	if (admin != null) {
 		out.print(admin.getEmail());

 	}
 %>
						</a></li>
					</ul>
				</div>
			</div>
			<div class="admin-bar">
				<ul>
					<li><a href="../AdminLoginController"><i
							class="zmdi zmdi-power"></i> </a></li>
					<li><a href="#"><i class="zmdi zmdi-account"></i> </a></li>
					<li><a href="changepassword.jsp"><i class="zmdi zmdi-key"></i>
					</a></li>
					<li><a href="#"><i class="zmdi zmdi-settings"></i> </a></li>
				</ul>
			</div>
		</div>
		<ul class="list-accordion tree-style">
			<li class="list-title">Layouts</li>
			<li><a href="addnewadmin.jsp"><i
					class="zmdi zmdi-view-dashboard"></i><span class="list-label">Admin
						Details</span></a></li>
			<li class="list-title">Service</li>
			<li><a href="#"><i class="zmdi zmdi-view-web"></i><span
					class="list-label">Services</span></a>
				<ul>
					<li><a href="category.jsp">Category</a></li>
					<li><a href="subcategory.jsp">SubCategory</a></li>
					<li><a href="products.jsp">Product</a></li>
				</ul></li>
			<li><a href="#"><i class="zmdi zmdi-check"></i><span
					class="list-label">From Validations</span></a>
				<ul>
					<li><a href="form-validation.html">Form Validation</a></li>
					<li><a href="form-booking.html">Booking Form</a></li>
					<li><a href="form-call-me.html">Call Me Form </a></li>
					<li><a href="form-call-me-captcha.html">Call Me Cptacha
							Form </a></li>
					<li><a href="form-checkout.html">Checkout Form </a></li>
					<li><a href="form-order-check-radio.html">Order Form </a></li>
					<li><a href="form-order-field.html">Order Form With
							Quantity </a></li>
				</ul></li>
			<li><a href="#"><i class="zmdi zmdi-swap"></i><span
					class="list-label">From Wizard</span></a>
				<ul>
					<li><a href="wizard-default-style.html">Default Style
							Wizard</a></li>
					<li><a href="wizard-tab-style.html">Tab Style Wizard</a></li>
					<li><a href="wizard-number-style.html">Number Style Wizard</a></li>
					<li><a href="wizard-checkout.html">Checkout Form Wizard</a></li>
				</ul></li>
			<li class="list-title">Tables</li>
			<li><a href="#"><i class="zmdi zmdi-grid"></i><span
					class="list-label">Table Styles</span></a>
				<ul>
					<li><a href="basic-tables.html">Basic Styles</a></li>
					<li><a href="foo-tables.html">Responsive FooTables </a></li>
					<li><a href="data-tables.html">Data Tables</a></li>
					<li><a href="exportable-data-tables.html">Exportable Data
							Tables</a></li>
				</ul></li>
			<li class="list-title">Charts</li>
			<li><a href="#"><i class="zmdi zmdi-chart"></i><span
					class="list-label">Charts & Graphs</span></a>
				<ul>
					<li><a href="chart-flot.html">Flot Chart</a></li>
					<li><a href="chart-sparkline.html">Sparkline Chart</a></li>
					<li><a href="chart-js.html">Chart Js</a></li>
					<li><a href="chart-nvd3.html">nvd3.js</a></li>
				</ul></li>
			<li class="list-title">Ui Kits</li>
			<li><a href="#"><i class="zmdi zmdi-apps"></i><span
					class="list-label">Ui Elements</span></a>
				<ul>
					<li><a href="header.html">Page Header</a></li>
					<li><a href="buttons-icons.html">Buttons &amp; Icons</a></li>
					<li><a href="noty.html">Noty</a></li>
					<li><a href="bootbox.html">Bootbox</a></li>
					<li><a href="sweet-alerts.html">SweetAlert</a></li>
					<li><a href="no-ui-slider.html">NoUI Slider</a></li>
					<li><a href="on-off-switch.html">On/Off Switch</a></li>
				</ul></li>
			<li><a href="ui-widgets.html"><i class="zmdi zmdi-widgets"></i><span
					class="list-label">Ui Widgtes</span></a></li>
			<li><a href="calendar.html"><i
					class="zmdi zmdi-calendar-alt"></i><span class="list-label">Calendar</span></a></li>
			<li><a href="typography.html"><i
					class="zmdi zmdi-format-size"></i><span class="list-label">Typography</span></a></li>
			<li><a href="grid.html"><i class="zmdi zmdi-border-all"></i><span
					class="list-label">Grid</span></a></li>
			<li class="list-title">Pages</li>
			<li><a href="#"><i class="zmdi zmdi-view-dashboard"></i><span
					class="list-label">Extra Pages</span></a>
				<ul>
					<li><a href="login.html">Login</a></li>
					<li><a href="login-boxed.html">Boxy Login</a></li>
					<li><a href="login-social.html">Social Login</a></li>
					<li><a href="404-error.html">404 Error Page</a></li>
				</ul></li>
		</ul>
	</div>
</aside>
<!--Leftbar End Here-->