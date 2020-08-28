package com.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BDD {
	
	private static BDD INSTANCE;
	
	Connection conn = null;
	
	public BDD() throws SQLException, ClassNotFoundException {
		String url = "jdbc:mysql://localhost:3306/schoolmaster";
		String username = "root";
		String password = "";
		Class.forName("com.mysql.cj.jdbc.Driver");
		this.conn = DriverManager.getConnection(url,username,password);
	}
	
	public static BDD getInstance() throws SQLException, ClassNotFoundException {
		if(INSTANCE == null) {
			INSTANCE = new BDD();
		}
		return INSTANCE;
	}

	public Connection getConn() {
		return conn;
	}
	
	
}
