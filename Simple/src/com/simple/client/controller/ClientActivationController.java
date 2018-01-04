package com.simple.client.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.simple.model.Customer;
import com.simple.service.CustomerService;
import com.simple.service.impl.CustomerServiceImpl;

@WebServlet("/ClientActivationController")
public class ClientActivationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CustomerService customerService = new CustomerServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = (String) request.getSession().getAttribute("email");
		int rnd = (int) request.getSession().getAttribute("rnd");
		int txtRnd = Integer.parseInt(request.getParameter("code"));
		request.getSession().removeAttribute("rnd");
		request.getSession().removeAttribute("email");
		Customer customer = customerService.findByEmail(email);
		if (rnd == txtRnd) {
			customer.setStatus("A");
			customerService.update(customer);
			response.sendRedirect("login.jsp");
		} else {
			response.sendRedirect("codeverification.jsp");
		}
	}

}
