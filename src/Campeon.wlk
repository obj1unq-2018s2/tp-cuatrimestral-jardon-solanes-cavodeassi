class Campeon {
	var property puntosDeVida = 0
	var puntosDeAtaque = 0
	var puntosDeDanio = 0
	var inventario = []
	var cantidadDeBloqueos = 10
	
	//stats
	method vida() = puntosDeVida  
	method ataque() = puntosDeAtaque
	
	//ataque y recibida de daño
	
	method recibirDanio(alguien) {
		if(cantidadDeBloqueos > 0) {
			cantidadDeBloqueos -= 1
		}
		else {
		puntosDeDanio += alguien.danio()
		}
	}
	
	method atacarA(alguien) {
		self.recibirDanio(alguien)
	     if(puntosDeDanio >= self.vida()) {
	    	self.error("el campeon está muerto")
          }
	}
	
   //items	
	method agregarAInventario(unItem) {
		inventario.add(unItem)
	}
	
	method quitarDelInventario(unItem) {
		inventario.remove(unItem)
	}
	
	method equiparItem(unItem) {
		unItem.efectoDeEquipado(self)
	}
	
	method desequiparItem(unItem) {
	   	unItem.efectoDeDesequipado(self)
	}
	
	
	
	
}