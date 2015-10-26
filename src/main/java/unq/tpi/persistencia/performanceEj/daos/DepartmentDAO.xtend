package unq.tpi.persistencia.performanceEj.daos

import java.util.List
import unq.tpi.persistencia.performanceEj.model.Department
import unq.tpi.persistencia.util.SessionManager

class DepartmentDAO {

	def getByName(String name) {
		val session = SessionManager.getSession()
		session.createQuery("from Department where name = :name")
				.setParameter("name", name).uniqueResult() as Department
	}

	def getByCode(String num) {
		val session = SessionManager.getSession()
		session.get(Department, num) as Department
	}
	
	def getAll() {
		val session = SessionManager.getSession()
		session.createCriteria(Department).list() as List<Department>
	}
	
	def getSalariesByDepartment(String number) {
		val session = SessionManager.getSession()
		session.createQuery("select concat(employees.firstName, ' ', employees.lastName), 
							 salary.amount, 
							 titles from Department as department 
							 join department.employees as employees 
							 join employees.salaries as salary 
							 join employees.titles as titles 
							 where department.code = :number and salary.to = '9999-01-01'")
				.setParameter("number", number).list() as List<Object[]>;
	}

}
