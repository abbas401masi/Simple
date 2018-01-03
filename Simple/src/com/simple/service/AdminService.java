package com.simple.service;

import java.util.List;

import com.simple.model.Admin;

public interface AdminService {
	public void insert(Admin admin);

	public void update(Admin admin);

	public List<Admin> findAll();

	public Admin findById(Long id);

	public Admin findByEmail(String email);
}
