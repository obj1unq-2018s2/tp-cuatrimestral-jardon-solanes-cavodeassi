class Oleada {
	var cantidadDeMinions
	var plus
		
	method danio() = cantidadDeMinions + plus
	method seDefiende(unCampeon) {  unCampeon.recibirAtaque(self.danio())  }
}