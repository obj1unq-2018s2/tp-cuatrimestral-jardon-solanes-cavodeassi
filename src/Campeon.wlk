class Campeon {
	const puntosDeVida		= 0
	const property puntosDeAtaque	= 0
	var	  puntosDeDanio		= 0
	var   cantidadDeBloq	= 0
	var   inventario		= []
	var   cantidadDinero	= 0
	
	//stats
	method vida() 			= puntosDeVida 	 + inventario.sum{	item => item.ptsVida(self)	} 
	method ataque() 		= puntosDeAtaque + inventario.sum{	item => item.ptsAtaque(self)}
	method puntosDeDanio()	= puntosDeDanio
	method estaMuerto()		= self.vida()<=self.puntosDeDanio()
	method bloqueos()		= cantidadDeBloq
	method tieneBloqueos()  = self.bloqueos()>0
	method ganaNBloq(n)		{	cantidadDeBloq += n	}
	method pierdeNBloq(n)	{	cantidadDeBloq -= n	}
	method dinero()			= cantidadDinero
	
	//sistema de ataque & defensa REVISARLO.
	method recibirAtaque(danio) {
		if(self.tieneBloqueos()) {
			self.pierdeNBloq(1)
		}
		else {
			self.recibirDanio(danio)
		}
	}
	method recibirDanio(danio) {	puntosDeDanio += danio	}
	method recuperarDanio(danio) {  puntosDeDanio -= danio  }
	method recibirDinero(unDinero) {	cantidadDinero += unDinero	}
	method atacarA(oleada) {
		oleada.seDefiende(self)
	}
	
   //items	
	method equiparItem		(unItem) {	inventario.add(unItem); unItem.equipItem(self)		}
	method desequiparItem	(unItem) {	inventario.remove(unItem); unItem.unequipItem(self)	}
	
}
//