package com.simple.service.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.simple.config.HibernateConfig;
import com.simple.model.Admin;
import com.simple.service.AdminService;

public class AdminServiceImpl implements AdminService {

	@Override
	public void insert(Admin admin) {
		Session session = HibernateConfig.getFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.save(admin);
		transaction.commit();
		session.close();
	}

	@Override
	public void update(Admin admin) {
		Session session = HibernateConfig.getFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.update(admin);
		transaction.commit();
		session.close();
	}

	@Override
	public List<Admin> findAll() {
		Session session = HibernateConfig.getFactory().openSession();
		Transaction transaction = session.beginTransaction();
		List<Admin> admins = session.createQuery("From Admin where status='A'").list();
		transaction.commit();
		session.close();
		return admins;
	}

	@Override
	public Admin findById(Long id) {
		Session session = HibernateConfig.getFactory().openSession();
		Transaction transaction = session.beginTransaction();
		Admin admin = (Admin) session.createQuery("From Admin where id = " + id + "").uniqueResult();
		transaction.commit();
		session.close();
		return admin;
	}

	@Override
	public Admin findByEmail(String email) {
		Session session = HibernateConfig.getFactory().openSession();
		Transaction transaction = session.beginTransaction();
		Admin admin = (Admin) session.createQuery("From Admin where email = '" + email + "' AND status = 'A'")
				.uniqueResult();
		transaction.commit();
		session.close();
		return admin;
	}

}
