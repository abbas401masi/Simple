package com.simple.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.simple.model.Admin;
import com.simple.model.Category;
import com.simple.service.CategoryService;
import com.simple.service.impl.CategoryServiceImpl;

@WebServlet("/ManageCategoryController")
public class ManageCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Category category = new Category();
	CategoryService categoryService = new CategoryServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String f = request.getParameter("flag");
		if (f.equals("edit")) {
			edit(request, response);
		}
		if (f.equals("delete")) {
			delete(request, response);
		}
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Long id = Long.parseLong(request.getParameter("id"));
		Category category1 = categoryService.findById(id);
		category1.setStatus("D");
		categoryService.update(category1);
		response.sendRedirect("admin/category.jsp");
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Long id = Long.parseLong(request.getParameter("id"));
		Category category1 = categoryService.findById(id);
		request.getSession().setAttribute("cat", category1);
		Gson gson = new Gson();
		String string = gson.toJson(category1);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(string);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin != null) {
			Category category1 = (Category) request.getSession().getAttribute("cat");
			if (category1 != null) {
				category1.setTitle(request.getParameter("title"));
				category1.setDescription(request.getParameter("desc"));
				categoryService.update(category1);
				request.getSession().removeAttribute("cat");
			} else {
				category.setTitle(request.getParameter("title"));
				category.setDescription(request.getParameter("desc"));
				categoryService.insert(category);
			}
			response.sendRedirect("admin/category.jsp");
		} else {
			response.sendRedirect("admin/login.jsp");
		}
	}

}
