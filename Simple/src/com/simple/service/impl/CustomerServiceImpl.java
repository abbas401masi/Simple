package com.simple.service.impl;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.simple.config.HibernateConfig;
import com.simple.model.Customer;
import com.simple.service.CustomerService;

public class CustomerServiceImpl implements CustomerService {

	@Override
	public void insert(Customer customer) {
		Session session = HibernateConfig.getFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.save(customer);
		transaction.commit();
		session.close();
	}

	@Override
	public void update(Customer customer) {
		Session session = HibernateConfig.getFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.update(customer);
		transaction.commit();
		session.close();
	}

	@Override
	public Customer findById(Long id) {
		Session session = HibernateConfig.getFactory().openSession();
		Transaction transaction = session.beginTransaction();
		Customer customer = session.get(Customer.class, id);
		transaction.commit();
		session.close();
		return customer;
	}

	@Override
	public Customer findByEmail(String email) {
		Session session = HibernateConfig.getFactory().openSession();
		Transaction transaction = session.beginTransaction();
		Customer customer = (Customer) session.createQuery("From Customer where email='" + email + "'").uniqueResult();
		transaction.commit();
		session.close();
		return customer;
	}

}
