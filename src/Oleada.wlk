class Oleada {
	var property cantidadDeMinions
	var plus
	
	method danio() = cantidadDeMinions + plus
	
	method esAtacadaPor(unCampeon) {
		unCampeon.recibirDanio(self.danio())
	}
	

	
}