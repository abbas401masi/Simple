package com.simple.service;

import java.util.List;

import com.simple.model.SubCategory;

public interface SubCategoryService {
	public void insert(SubCategory subCategory);

	public void update(SubCategory subCategory);

	public SubCategory findById(Long id);

	public List<SubCategory> findAll();

	public List<SubCategory> findByCategoryId(Long id);
}
