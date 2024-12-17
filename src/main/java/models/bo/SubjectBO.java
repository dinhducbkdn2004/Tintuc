package models.bo;

import java.sql.SQLException;
import java.util.List;
import models.bean.Subject;
import models.dao.SubjectDAO;

public class SubjectBO {
	private SubjectDAO subjectDAO;

	public SubjectBO() {
		subjectDAO = new SubjectDAO();
	}

	public List<Subject> getSubjects() throws ClassCastException, SQLException {
		return subjectDAO.getSubjects();
	}

	public Subject getSubjectById(String id) throws ClassCastException, SQLException {
		return subjectDAO.getSubjectById(id);
	}
}