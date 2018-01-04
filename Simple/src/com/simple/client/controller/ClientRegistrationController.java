package com.simple.client.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.simple.config.RandomNumber;
import com.simple.model.Customer;
import com.simple.service.CustomerService;
import com.simple.service.impl.CustomerServiceImpl;

@WebServlet("/ClientRegistrationController")
public class ClientRegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Customer customer = new Customer();
	CustomerService customerService = new CustomerServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		customer.setFirstName(request.getParameter("firstName"));
		customer.setLastName(request.getParameter("lastName"));
		customer.setEmail(request.getParameter("email"));
		customer.setContact(request.getParameter("contact"));
		customer.setPassword(request.getParameter("password"));
		Customer customer2 = customerService.findByEmail(customer.getEmail());
		if (customer2 != null) {
			response.sendRedirect("registration.jsp");
		} else {
			final String email = "abbasali@innovatewebtec.com";
			final String password = "abbas592mukhi";
			int rnd = RandomNumber.randomNumber(00000, 99999);
			Properties props = new Properties();
			request.getSession().setAttribute("email", customer.getEmail());
			request.getSession().setAttribute("rnd", rnd);
			props.put("mail.smtp.auth", "true"); // enable authentication
			props.put("mail.smtp.starttls.enable", "true"); // enable STARTTLS
			props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP Host
			props.put("mail.smtp.port", "587"); // TLS Port

			Session session = Session.getDefaultInstance(props, new Authenticator() {

				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(email, password);
				}
			});

			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(email));
				message.addRecipient(Message.RecipientType.TO,
						new InternetAddress(request.getParameter(customer.getEmail())));
				message.setSubject("Verification Code");
				message.setText("hi... Your verification code is...   " + rnd);

				// send the message
				Transport.send(message);
				response.sendRedirect("codeverification.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
