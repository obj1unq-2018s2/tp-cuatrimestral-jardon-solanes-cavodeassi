class Oleada {
	var property cantidadDeMinions
	var property plus
		
	method danio			()	 		= cantidadDeMinions + plus
	method estaMuerto		() 			= cantidadDeMinions == 0
	
	method minionsAEliminar	(unCampeon) = unCampeon.ataque().min(cantidadDeMinions) 
	
	method seDefiende		(unCampeon) {  
											if(not self.estaMuerto()) 
												unCampeon.recibirAtaque(self.danio())
												unCampeon.recibirDinero(self.minionsAEliminar(unCampeon))
												cantidadDeMinions -= self.minionsAEliminar(unCampeon)	
										}
}
/*parte individual del ejercito de minions */
class Ejercito  {
	var property oleadas = #{}
	
	method agregarAOleada(unaOleada) {
		oleadas.add(unaOleada)
	}
    	
	 method minionsAEliminar(unCampeon) = oleadas.forEach({oleada 
		                                        =>unCampeon.ataque().min(oleada.cantidadDeMinions())})
										
	 method danio()	= oleadas.sum({oleada => oleada.cantidadDeMinions() })
	
    method estanMuertos() = oleadas.all({oleada => oleada.cantidadDeMinions() == 0})


}