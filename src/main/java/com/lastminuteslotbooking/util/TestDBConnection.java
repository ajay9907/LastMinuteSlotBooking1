package com.lastminuteslotbooking.util;

import java.sql.Connection;
import java.sql.SQLException;

public class TestDBConnection {

	public static void main(String[] args) {

		Connection connection = null;
		try {
			connection = DBConnection.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (connection != null) {
			System.out.println("Database connection successful!");
		} else {
			System.out.println("Database connection failed!");
		}
	}
}