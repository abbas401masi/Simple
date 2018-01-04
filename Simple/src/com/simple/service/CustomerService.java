package com.simple.service;

import com.simple.model.Customer;

public interface CustomerService {
	public void insert(Customer customer);

	void update(Customer customer);

	Customer findById(Long id);

	Customer findByEmail(String email);

}
