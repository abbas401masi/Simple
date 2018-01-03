package com.simple.service.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.simple.config.HibernateConfig;
import com.simple.model.Product;
import com.simple.service.ProductService;

public class ProductServiceImpl implements ProductService {

	@Override
	public void insert(Product product) {
		Session session = HibernateConfig.getFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.save(product);
		transaction.commit();
		session.close();
	}

	@Override
	public void update(Product product) {
		Session session = HibernateConfig.getFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.update(product);
		transaction.commit();
		session.close();
	}

	@Override
	public Product findById(Long id) {
		Session session = HibernateConfig.getFactory().openSession();
		Transaction transaction = session.beginTransaction();
		Product product = session.get(Product.class, id);
		transaction.commit();
		session.close();
		return product;
	}

	@Override
	public List<Product> findAll() {
		Session session = HibernateConfig.getFactory().openSession();
		Transaction transaction = session.beginTransaction();
		List<Product> products = session.createQuery("FROM Product").list();
		transaction.commit();
		session.close();
		return products;
	}

}
