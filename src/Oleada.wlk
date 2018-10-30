class Oleada {
	var property cantidadDeMinions
	var plus
		
	method danio()	 	= cantidadDeMinions + plus
	method estaMuerto() = cantidadDeMinions == 0
	
	method minionsAEliminar	(unCampeon) = unCampeon.ataque().min(cantidadDeMinions) 
	
	method seDefiende		(unCampeon) {  
											if(not self.estaMuerto()) 
												unCampeon.recibirAtaque(self.danio())
												unCampeon.recibirDinero(self.minionsAEliminar(unCampeon))
												cantidadDeMinions -= self.minionsAEliminar(unCampeon)	
										}
}