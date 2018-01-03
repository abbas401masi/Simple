package com.simple.service.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.simple.config.HibernateConfig;
import com.simple.model.SubCategory;
import com.simple.service.SubCategoryService;

public class SubCategoryServiceImpl implements SubCategoryService {

	@Override
	public void insert(SubCategory subCategory) {
		Session session = HibernateConfig.getFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.save(subCategory);
		transaction.commit();
		session.close();
	}

	@Override
	public void update(SubCategory subCategory) {
		Session session = HibernateConfig.getFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.update(subCategory);
		transaction.commit();
		session.close();
	}

	@Override
	public SubCategory findById(Long id) {
		Session session = HibernateConfig.getFactory().openSession();
		Transaction transaction = session.beginTransaction();
		SubCategory category = session.get(SubCategory.class, id);
		transaction.commit();
		session.close();
		return category;
	}

	@Override
	public List<SubCategory> findAll() {
		Session session = HibernateConfig.getFactory().openSession();
		Transaction transaction = session.beginTransaction();
		List<SubCategory> category = session.createQuery("From SubCategory").list();
		transaction.commit();
		session.close();
		return category;
	}

	@Override
	public List<SubCategory> findByCategoryId(Long id) {
		Session session = HibernateConfig.getFactory().openSession();
		Transaction transaction = session.beginTransaction();
		List<SubCategory> category = session.createQuery("From SubCategory where category.id =" + id + "").list();
		transaction.commit();
		session.close();
		return category;
	}

}
