<%@page import="com.simple.model.Product"%>
<%@page import="com.simple.service.impl.ProductServiceImpl"%>
<%@page import="com.simple.service.ProductService"%>
<%@page import="com.simple.model.SubCategory"%>
<%@page import="com.simple.service.impl.SubCategoryServiceImpl"%>
<%@page import="com.simple.service.SubCategoryService"%>
<%@page import="com.simple.service.impl.CategoryServiceImpl"%>
<%@page import="com.simple.service.CategoryService"%>
<%@page import="com.simple.model.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Category</title>
<jsp:include page="controls/css.jsp"></jsp:include>
<script type="text/javascript">
	function loadSubCategory() {
		var cid = $('select#category').val();
		$.get('../ManageProductController?flag=loadSubCategory', {
			cid : cid
		}, function(response) {
			$('#subCategory').html('');
			var appendSubCategory = '';
			$.each(response, function(i, val) {
				appendSubCategory += '<option value = ' + val.id + ' selected>' + val.title + '</option>';
			});

			$('#subCategory').append(appendSubCategory);
		});
	}

	function editSubCategory(id) {
		$.get('../ManageSubCategoryController?flag=edit', {
			id : id
		}, function(response) {
			var data1 = response[0];
			var data2 = response[1];
			$('#title').val(data1.title);
			$('#desc').val(data1.description);
			$('#btn').val("Update");
			var cid = data1.category.id;
			$('#category').html('');
			var appendCategory = '';
			$.each(data2, function(i, val) {
				if (cid === val.id) {
					appendCategory += '<option value = ' + val.id + ' selected>' + val.title + '</option>';
				} else {
					appendCategory += '<option value = ' + val.id + '>' + val.title + '</option>';
				}
			});

			$('#category').append(appendCategory);
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
					<h2>Categories</h2>
				</div>
				<div class="col-md-6">
					<ul class="list-page-breadcrumb">
						<li><a href="home.jsp">Home <i
								class="zmdi zmdi-chevron-right"></i></a></li>
						<li class="active-page"><a href="subcategory.jsp">Add Sub
								Category <i class="zmdi zmdi-chevron-right"></i>
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
							<form action="../ManageProductController"
								enctype="multipart/form-data" method="post" class="j-forms"
								id="j-forms-validation" novalidate>

								<div class="form-content">

									<div class="w-section-header">
										<h3>Sub Category</h3>
									</div>
									<%
										CategoryService categoryService = new CategoryServiceImpl();
										List<Category> categories = categoryService.findAll();
									%>
									<div class="row">
										<div class="col-md-4 unit">
											<label class="label">Category</label>
											<div class="input">

												<select class="form-control" name="category" id="category"
													onchange="loadSubCategory()">
													<option value="">Default select</option>
													<%
														for (Category category : categories) {
													%>
													<option value="<%=category.getId()%>"><%=category.getTitle()%></option>
													<%
														}
													%>
												</select>
											</div>
										</div>
										<div class="col-md-4 unit">
											<label class="label">Sub Category</label>
											<div class="input">
												<select class="form-control" name="subCategory"
													id="subCategory">
													<option value="">Default select</option>
												</select>
											</div>
										</div>
										<div class="col-md-4 unit">
											<label class="label"> Product</label>
											<div class="input">
												<label class="icon-right" for="text"> <i
													class="fa fa-edit"></i>
												</label> <input class="form-control" type="text"
													placeholder="required category name" id="title"
													name="title">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-4 unit">
											<label class="label">Price</label>
											<div class="input">
												<label class="icon-right" for="text"> <i
													class="fa fa-edit"></i>
												</label> <input class="form-control" type="text"
													placeholder="required price" id="price" name="price">
											</div>
										</div>
										<div class="col-md-4 unit">
											<label class="label"> Stock</label>
											<div class="input">
												<label class="icon-right" for="text"> <i
													class="fa fa-edit"></i>
												</label> <input class="form-control" type="text"
													placeholder="required Stock" id="stock" name="stock">
											</div>
										</div>
										<div class="col-md-4 unit">
											<label class="label">Description</label>
											<div class="input">
												<label class="icon-right" for="text"> <i
													class="fa fa-edit"></i>
												</label>
												<textarea class="form-control"
													placeholder="required Description" id="desc" name="desc"></textarea>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6 unit">
											<label class="label"> Image</label>
											<div class="input">
												<label class="icon-right" for="text"> <i
													class="fa fa-edit"></i>
												</label> <input class="form-control" type="file"
													placeholder="required file" id="stock" name="file">
											</div>
										</div>
									</div>
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
										<th>Category</th>
										<th>SubCategory</th>
										<th>Product</th>
										<th>Price</th>
										<th>Stock</th>
										<th>Image</th>
										<th>Status</th>
										<th class="td-center">Action</th>
									</tr>
								</thead>
								<tbody>
									<%
										ProductService productService = new ProductServiceImpl();
										List<Product> products = productService.findAll();
										for (Product product : products) {
									%>
									<tr>
										<td><%=product.getSubCategory().getCategory().getTitle()%></td>
										<td><%=product.getSubCategory().getTitle()%></td>
										<td><%=product.getTitle()%></td>
										<td><%=product.getPrice()%></td>
										<td><%=product.getStock()%></td>
										<td><a href="#" class="td-profile-thumb"><img
												src="<%=product.getImage()%>" alt="user"></a></td>
										<td>
											<%
												if (product.getStatus().equals("A")) {
											%><label class="label label-warning">Active</label> <%
 	} else {
 %> <label class="label label-warning">DeActive</label> <%
 	}
 %>
										</td>
										<td class="td-center">
											<div class="btn-toolbar" role="toolbar">
												<div class="btn-group" role="group">
													<button onclick="editSubCategory(<%=product.getId()%>)"
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