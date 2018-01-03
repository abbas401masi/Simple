package com.simple.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.simple.model.Admin;
import com.simple.model.Category;
import com.simple.model.SubCategory;
import com.simple.service.CategoryService;
import com.simple.service.SubCategoryService;
import com.simple.service.impl.CategoryServiceImpl;
import com.simple.service.impl.SubCategoryServiceImpl;

@WebServlet("/ManageSubCategoryController")
public class ManageSubCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	SubCategoryService subCategoryService = new SubCategoryServiceImpl();
	CategoryService categoryService = new CategoryServiceImpl();
	SubCategory subCategory = new SubCategory();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String f = request.getParameter("flag");
		if (f.equals("edit")) {
			edit(request, response);
		}
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Long id = Long.parseLong(request.getParameter("id"));
		SubCategory subCategory1 = subCategoryService.findById(id);
		request.getSession().setAttribute("sub", subCategory1);
		List<Category> categories = categoryService.findAll();
		Gson gson = new Gson();
		String sub = gson.toJson(subCategory1);
		String cat = gson.toJson(categories);
		String arr = "[" + sub + "," + cat + "]";
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(arr);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin != null) {
			SubCategory subCategory1 = (SubCategory) request.getSession().getAttribute("sub");
			if (subCategory1 != null) {
				subCategory1.setTitle(request.getParameter("title"));
				Category category = categoryService.findById(Long.parseLong(request.getParameter("category")));
				subCategory1.setCategory(category);
				subCategory1.setDescription(request.getParameter("desc"));
				subCategoryService.update(subCategory1);
				request.getSession().removeAttribute("sub");
			} else {
				subCategory.setTitle(request.getParameter("title"));
				Category category = categoryService.findById(Long.parseLong(request.getParameter("category")));
				subCategory.setCategory(category);
				subCategory.setDescription(request.getParameter("desc"));
				subCategoryService.insert(subCategory);
			}
			response.sendRedirect("admin/subcategory.jsp");
		} else {
			response.sendRedirect("admin/login.jsp");
		}
	}

}
