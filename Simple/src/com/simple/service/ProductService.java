package com.simple.service;

import java.util.List;

import com.simple.model.Product;

public interface ProductService {
	void insert(Product product);

	void update(Product product);

	Product findById(Long id);

	List<Product> findAll();
}
