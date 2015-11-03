package unq.tpi.persistencia.performanceEj.daos

import java.util.List
import unq.tpi.persistencia.performanceEj.model.Employee
import unq.tpi.persistencia.util.SessionManager

class EmployeeDAO {

	def getByName(String name, String lastName) {
		val session = SessionManager.getSession()
		session.createQuery("from Employee where firstName = :name and lastName = :lastName")
				.setParameter("name", name)
				.setParameter("lastName", lastName)
				.uniqueResult() as Employee
	}

	def getAll() {
		val session = SessionManager.getSession()
		session.createCriteria(Employee).list() as List<Employee>
	}

	def getByCode(int id) {
		val session = SessionManager.getSession()
		session.load(Employee, id) as Employee
	}
	
	def getPrimerosDiez() {
		val session = SessionManager.session
		session.createQuery("select s.employee from Salary as s where s.to = '9999-01-01' order by s.amount desc").setMaxResults(10).list() as List<Employee>
	}

}
