package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	public static SessionFactory factory;

	public static SessionFactory getFactory() {
		if (factory == null) {
			Configuration configure = new Configuration();
			configure.configure("hibernate.cfg.xml");
			factory = configure.buildSessionFactory();
		}
		return factory;
	}

	public static void closeFactory() {
		if (factory.isOpen()) {
			factory.close();
		}
	}
}
