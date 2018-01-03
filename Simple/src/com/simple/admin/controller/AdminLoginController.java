package com.simple.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.simple.model.Admin;
import com.simple.service.AdminService;
import com.simple.service.impl.AdminServiceImpl;

@WebServlet("/AdminLoginController")
public class AdminLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	AdminService adminService = new AdminServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().removeAttribute("admin");
		request.getSession().invalidate();
		response.sendRedirect("admin/login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("login");
		String password = request.getParameter("password");
		Admin admin = adminService.findByEmail(email);
		if (admin != null && admin.getPassword().equals(password)) {
			request.getSession().setAttribute("admin", admin);
			request.getSession().removeAttribute("error");
			response.sendRedirect("admin/home.jsp");
		} else {
			request.getSession().setAttribute("error", "Email Or Password are Wrong !!!");
			response.sendRedirect("admin/login.jsp");
		}
	}

}
