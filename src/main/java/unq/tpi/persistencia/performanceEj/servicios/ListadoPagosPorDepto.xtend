package unq.tpi.persistencia.performanceEj.servicios

import unq.tpi.persistencia.performanceEj.daos.DepartmentDAO

class ListadoPagosPorDepto extends AbstractListado {

	String num

	new(String fileName, String num) {
		super(fileName)
		this.num = num
	}

	override def doListado() throws Exception {
		val salaries = new DepartmentDAO().getSalariesByDepartment(this.num)
		
		newLine()
		val total = salaries.map[it.get(1) as Double].reduce[p1, p2| p1 + p2];
		addColumn("Total").addColumn(total).newLine()
		newLine()
		addColumn("Nombre").addColumn("Titulo").addColumn("Monto").newLine()
		salaries.forEach[
			addColumn(it.get(0) as String) //nombre
			addColumn(it.get(2) as String) //titulo
			addColumn(it.get(1) as Double) //monto
			newLine()
		]
	}
	
}
