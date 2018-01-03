package com.simple.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.simple.model.Admin;
import com.simple.service.AdminService;
import com.simple.service.impl.AdminServiceImpl;

@WebServlet("/AddNewAdminController")
public class AddNewAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Admin admin = new Admin();
	AdminService adminService = new AdminServiceImpl();

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
		Admin admin1 = adminService.findById(id);
		admin1.setStatus("D");
		adminService.update(admin1);
		response.sendRedirect("admin/addnewadmin.jsp");
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Long id = Long.parseLong(request.getParameter("id"));
		Admin admin1 = adminService.findById(id);
		Gson gson = new Gson();
		String ad = gson.toJson(admin1);
		request.getSession().setAttribute("ad", admin1);
		System.out.println(ad);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(ad);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Admin admin1 = (Admin) request.getSession().getAttribute("admin");
		if (admin1 != null) {
			Admin admin2 = (Admin) request.getSession().getAttribute("ad");
			if (admin2 != null) {
				admin2.setFirstName(request.getParameter("firstName"));
				admin2.setLastName(request.getParameter("lastName"));
				admin2.setEmail(request.getParameter("email"));
				admin2.setPassword(request.getParameter("password"));
				admin2.setContact(request.getParameter("digits"));
				request.getSession().removeAttribute("ad");
				adminService.update(admin2);
			} else {
				admin.setFirstName(request.getParameter("firstName"));
				admin.setLastName(request.getParameter("lastName"));
				admin.setEmail(request.getParameter("email"));
				admin.setPassword(request.getParameter("password"));
				admin.setContact(request.getParameter("digits"));
				adminService.insert(admin);
			}
			response.sendRedirect("admin/addnewadmin.jsp");
		} else {
			response.sendRedirect("admin/login.jsp");
		}

	}

}
