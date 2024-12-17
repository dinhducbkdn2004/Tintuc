package models.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import models.bean.Subject;
import utils.ConnectDB;

public class SubjectDAO {

	public List<Subject> getSubjects() throws SQLException {
		List<Subject> subjects = new ArrayList<Subject>();

		try (Connection conn = ConnectDB.getConnection()) {
			String sql = "SELECT * FROM subject";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Subject subject = new Subject();
				subject.setId(rs.getString("id"));
				subject.setName(rs.getString("name"));
				subjects.add(subject);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return subjects;
	}

	public Subject getSubjectById(String id) throws SQLException {
		Subject subject = new Subject();

		try (Connection conn = ConnectDB.getConnection()) {
			String sql = "SELECT * FROM subject WHERE id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				subject.setId(rs.getString("id"));
				subject.setName(rs.getString("name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return subject;
	}
}