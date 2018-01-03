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

@WebServlet("/AdminChangePasswordController")
public class AdminChangePasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	AdminService adminService = new AdminServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin != null) {
			String oldPass = request.getParameter("oldpassword");
			String newPass = request.getParameter("password");
			if (admin.getPassword().equals(oldPass)) {
				admin.setPassword(newPass);
				adminService.update(admin);
				request.getSession().removeAttribute("admin");
				request.getSession().removeAttribute("error");
				request.getSession().invalidate();
				response.sendRedirect("admin/login.jsp");
			} else {
				request.getSession().setAttribute("error", "Old Password is Wrong!!!!");
				response.sendRedirect("admin/changepassword.jsp");
			}
		} else {
			response.sendRedirect("admin/login.jsp");
		}

	}

}
