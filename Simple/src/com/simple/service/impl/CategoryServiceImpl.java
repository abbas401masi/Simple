package com.simple.service.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.simple.config.HibernateConfig;
import com.simple.model.Category;
import com.simple.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {

	@Override
	public void insert(Category category) {
    Session session=HibernateConfig.getFactory().openSession();
    Transaction transaction=session.beginTransaction();
    session.save(category);
    transaction.commit();
    session.close();
	}

	@Override
	public void update(Category category) {
	Session session=HibernateConfig.getFactory().openSession();
	Transaction transaction=session.beginTransaction();
	session.update(category);
	transaction.commit();
	session.close();
	}

	@Override
	public Category findById(Long id) {
	Session session=HibernateConfig.getFactory().openSession();
	Transaction transaction=session.beginTransaction();
	Category category = session.get(Category.class, id);
	transaction.commit();
	session.close();
	return category;
	}

	@Override
	public List<Category> findAll() {
	Session session=HibernateConfig.getFactory().openSession();
	Transaction transaction=session.beginTransaction();
	List<Category> categories = session.createQuery("From Category ").list();
	transaction.commit();
	session.close();
	return categories;
	}

}
