package projects.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import projects.exception.DbException;

public class DbConnection {

	private static final String HOST = "localhost";
	private static final String PASSWORD = "projects";
	private static final int PORT = 3306;
	private static final String SCHEMA = "projects";
	private static final String USER = "projects";
	
	
	public static Connection getConnection() {
		String url = String.format("jdbc:mysql://%s:%d/%s?user=%s&password=%s&userSSL=false", HOST, PORT, SCHEMA, USER, PASSWORD);
		
		try {
			Connection connection = DriverManager.getConnection(url);
			System.out.println("Connection to: " + SCHEMA + " " + url + " is successful.");
			return connection;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Failed to connect to: " + url);
			throw new DbException("Failed to connect to: " + url);
//			e.printStackTrace();
		}
	}

}
