package com.simple.service;

import java.util.List;

import com.simple.model.Category;

public interface CategoryService {
	public void insert(Category category);

	public void update(Category category);

	public Category findById(Long id);

	public List<Category> findAll();
}
