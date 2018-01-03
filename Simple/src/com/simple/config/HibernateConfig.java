package com.simple.config;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateConfig {
	public static SessionFactory getFactory() {
		return new Configuration().configure().buildSessionFactory();
	}
}
