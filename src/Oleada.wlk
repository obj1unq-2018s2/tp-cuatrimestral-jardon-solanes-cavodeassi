class Oleada {
	var property cantidadDeMinions
	var property plus
		
	method danio() = cantidadDeMinions + plus
	
	method esAtacadaPor(unCampeon) {
		unCampeon.recibirDanio(self.danio())
	}
		
}