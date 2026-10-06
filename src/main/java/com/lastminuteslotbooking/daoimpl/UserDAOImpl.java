package com.lastminuteslotbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.lastminuteslotbooking.dao.UserDAO;
import com.lastminuteslotbooking.model.User;
import com.lastminuteslotbooking.util.DBConnection;

public class UserDAOImpl implements UserDAO {

	@Override
	public boolean registerUser(User user) {

		String sql = "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)";

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement ps = connection.prepareStatement(sql)) {

			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getRole());

			int rows = ps.executeUpdate();

			return rows > 0;

		} catch (SQLException e) {

			System.out.println("========== REGISTRATION DATABASE ERROR ==========");
			e.printStackTrace();
			System.out.println("=================================================");

			return false;
		}
	}

	@Override
	public User loginUser(String email, String password) {

		String sql = "SELECT * FROM users WHERE email = ? AND password = ?";

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement ps = connection.prepareStatement(sql)) {

			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				User user = new User();

				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setRole(rs.getString("role"));

				return user;
			}

		} catch (SQLException e) {

			System.out.println("========== LOGIN DATABASE ERROR ==========");
			e.printStackTrace();
			System.out.println("==========================================");

		}

		return null;
	}

	@Override
	public User getUserById(int id) {

		String sql = "SELECT * FROM users WHERE id = ?";

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement ps = connection.prepareStatement(sql)) {

			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				User user = new User();

				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setRole(rs.getString("role"));

				return user;
			}

		} catch (SQLException e) {

			System.out.println("========== GET USER DATABASE ERROR ==========");
			e.printStackTrace();
			System.out.println("=============================================");

		}

		return null;
	}
}